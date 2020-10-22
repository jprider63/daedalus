{-# LANGUAGE GeneralizedNewtypeDeriving, OverloadedStrings, FlexibleInstances, MultiParamTypeClasses #-}
{-# LANGUAGE RecordWildCards #-} -- for dealing with TCDecl and existential k

module Daedalus.Specialise.Monad where

import MonadLib
import qualified Data.Text as T
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set

import Daedalus.PP
import Daedalus.Panic
import Daedalus.GUID

import Daedalus.Specialise.PartialApply
import Daedalus.Type.AST

-- INV: None of the below contain free TVs, and only variables in
-- instNewParams may appear free in instArgs
data Instantiation =
  Instantiation { instNewName   :: Name
                , instTys       :: [Type]
                , instNewParams :: [TCName Value]
                , instArgs      :: [Maybe (Arg SourceRange)]
                }

apInst :: Instantiation -> TCDecl SourceRange -> TCDecl SourceRange
apInst Instantiation {..} =
  partialApply instNewName instTys instNewParams instArgs

instance PP Instantiation where
  pp Instantiation {..} =
    text (show instNewName)
    <+> hsep (map pp instNewParams)
    <+> parens (hsep (map pp instTys ++ map ppA instArgs))
    where
      ppA Nothing = text "_"
      ppA (Just v) = pp v

data PApplyState =
  PApplyState { requestedSpecs :: Map Name [ Instantiation ]
              -- Subset of the above
              , pendingSpecs   :: Map Name [ Instantiation ]
              , otherSeenRules :: Set Name
              , nextNameGUID   :: !GUID
              }

emptyPApplyState :: GUID -> PApplyState
emptyPApplyState = PApplyState Map.empty Map.empty Set.empty 

newtype PApplyM a =
  PApplyM { getPApplyM :: StateT PApplyState (ExceptionT String Id) a }
  deriving (Functor, Applicative, Monad)


instance ExceptionM PApplyM [Char] where
  raise = PApplyM . raise

runPApplyM :: [Name] -> GUID ->  PApplyM a -> Either String (a, GUID)
runPApplyM roots guid m = fst <$> runM ((,) <$> getPApplyM m <*> (nextNameGUID <$> get)) s0
  where s0 = (emptyPApplyState guid) { otherSeenRules = Set.fromList roots }

-- clearSpecRequests :: Name -> PApplyM ()
-- clearSpecRequests nm =
--   -- Do we need pendingSpecs?  Maybe only for recursive calls.
--   PApplyM $ modify (\s -> s { pendingSpecs = Map.delete nm (pendingSpecs s) })


getPendingSpecs :: [Name] -> PApplyM (Map Name [Instantiation])
getPendingSpecs ns = PApplyM $ sets go
  where
    go s = let (ret, keep) = Map.partitionWithKey (\k _ -> k `elem` ns) (pendingSpecs s)
           in (ret, s { pendingSpecs = keep })

-- | Add a new instance of declaration to the work queue.
-- We know that we haven't seen the spec request before,
-- so add it and mark as pending
addSpecRequest :: ModuleName
               -> Name
               -> [Type]
               -> [TCName Value]
               -> [Maybe (Arg SourceRange)]
               -> PApplyM Name
addSpecRequest modName nm ts newPs args = PApplyM $ sets go
  where
    go s = let nm'  = freshDeclName (nextNameGUID s)
               inst = Instantiation nm' ts newPs args
           in (nm',  s { requestedSpecs = Map.insertWith (++) nm [inst] (requestedSpecs s)
                       , pendingSpecs   = Map.insertWith (++) nm [inst] (pendingSpecs s)
                       , nextNameGUID   = succGUID (nextNameGUID s)
                       } )

    freshDeclName guid  =
      nm { nameScopedIdent = case nameScopedIdent nm of
             ModScope _ n -> ModScope modName (n <> "__" <> T.pack (show (pp guid)))
             _            -> panic "Expected ModScope" []
         , nameID = guid
         }

lookupRequestedSpecs :: Name -> PApplyM (Maybe [Instantiation])
lookupRequestedSpecs nm = PApplyM $ (Map.lookup nm . requestedSpecs) <$> get

addSeenRule :: Name -> PApplyM ()
addSeenRule n = PApplyM $ sets_ go
  where
    go s = s { otherSeenRules = Set.insert n (otherSeenRules s) }

seenRule :: Name -> PApplyM Bool
seenRule n = PApplyM $ (Set.member n . otherSeenRules) <$> get
