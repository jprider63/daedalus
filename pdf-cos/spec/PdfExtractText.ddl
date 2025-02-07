import Stdlib

import GenPdfValue
import PdfValue
import PdfDecl
import PdfXRef

import PageTreeNode
import ResourceDict
import Unicode
import ContentStreamLight
-- TODO: gradually replace this with a more heavyweight parser/validator

-- TODO: indirect deps
import Page

-- entry point for text extraction
def ExtractRootUTF8Bytes r : [ uint 8] = utf8Bytes (ExtractRootText1 r)

def ExtractRootText r = Default [ ] {
  ExtractPageOrPagesText nothing r
}

def ExtractPageOrPagesText p c =
  (ExtractPageText p c) |
  (ExtractPagesText p c)

def ExtractPageText (p : maybe Ref) (r : Ref) =
{
    @v = ResolveValRef r;
    @dict = v is dict;
    CheckType "Page" dict;
    CheckParent p dict;
    ExtractContentsText dict
}

def ExtractPagesText (p : maybe Ref) (r : Ref) =
{
    @v = ResolveValRef r;
    @dict = v is dict;
    CheckType "Pages" dict;
    CheckParent p dict;
    -- Ignore count for now
    @kidsv = Lookup "Kids" dict;    -- XXX: can this be a ref?
    @kids  = kidsv is array;
    @pagesText = map (refv in kids) {
      @ref = refv is ref;
      ExtractPageOrPagesText (just r) ref
    };
    ^(concat pagesText)
}

def CheckParent (p : maybe Ref) (dict : [[uint 8] -> Value]) =
    { p is nothing;
      @v = Optional (LookupRef "Parent" dict);
      v is nothing;
    }
    <|
    { @pref = p is just;
      @dpref = LookupRef "Parent" dict;
      Guard (dpref == pref);
    }

-- Check that the (optional) contents point to a valid Content Stream
def ExtractContentsText d = Default [ ] {
  @s = Lookup "Contents" d ; -- try to find content stream
  @strm =
    { @arr = s is array;
      @strms = map (s in arr) {
        @strm = ResolveStream s;
        @strmBody = strm.body is ok;
        WithStream strmBody (Many UInt8)
      };
      ^ (arrayStream (concat strms))
    } <|
    { @strm = ResolveStream s ;
      strm.body is ok
    };
  WithStream strm (Only ContentStream) -- parse the content stream
}

--------------------------------------------------------------------------------

def KidsContentStreams (kids : [ PageNodeKid ]) : [ [ ContentStreamObj ] ] =
  concat (map (k in kids) (case (k : PageNodeKid) of {
    pageKid pk -> [ pk.contents ];
    treeKid tk -> PageNodeContentStreams tk;
  }))

def PageNodeContentStreams (pt: PageTreeNode) : [ [ ContentStreamObj ] ] =
  KidsContentStreams pt.kids

def PageTreeContentStreams pt = KidsContentStreams pt.kids

def ExtractRootText1 (r : Ref) = {
  @ptCs = PageTreeContentStreams (PageTreeP r);
  concat (map (cs in ptCs) (ExtractContentStreamText cs))
}

--------------------------------------------------------------------------------
-- Catalogue objects

-- The JS stuff will be take care of by the global safety check as
-- Names->JavaScript maps to JavaScript actions.

def ExtractCatalogText r = {
  @catv = ResolveValRef r;
  @cat   = catv is dict;
  CheckType "Catalog" cat;
  @pages = LookupRef "Pages" cat;
  ExtractRootUTF8Bytes pages;
}
