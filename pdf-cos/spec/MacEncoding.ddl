import Map
import Stdlib

import Glyph

def MacEncodings = [
  MapEntry (octalTriple 1 0 1) (Glyph "A")
, MapEntry (octalTriple 2 5 6) (Glyph "AE")
, MapEntry (octalTriple 3 4 7) (Glyph "Aacute")
, MapEntry (octalTriple 3 4 5) (Glyph "Acircumflex")
, MapEntry (octalTriple 2 0 0) (Glyph "Adieresis")
, MapEntry (octalTriple 3 1 3) (Glyph "Agrave")
, MapEntry (octalTriple 2 0 1) (Glyph "Aring")
, MapEntry (octalTriple 3 1 4) (Glyph "Atilde")
, MapEntry (octalTriple 1 0 2) (Glyph "B")
, MapEntry (octalTriple 1 0 3) (Glyph "C")
, MapEntry (octalTriple 2 0 2) (Glyph "Ccedilla")
, MapEntry (octalTriple 1 0 4) (Glyph "D")
, MapEntry (octalTriple 1 0 5) (Glyph "E")
, MapEntry (octalTriple 2 0 3) (Glyph "Eacute")
, MapEntry (octalTriple 3 4 6) (Glyph "Ecircumflex")
, MapEntry (octalTriple 3 5 0) (Glyph "Edieresis")
, MapEntry (octalTriple 3 5 1) (Glyph "Egrave")
, MapEntry (octalTriple 1 0 6) (Glyph "F")
, MapEntry (octalTriple 1 0 7) (Glyph "G")
, MapEntry (octalTriple 1 1 0) (Glyph "H")
, MapEntry (octalTriple 1 1 1) (Glyph "I")
, MapEntry (octalTriple 3 5 2) (Glyph "Iacute")
, MapEntry (octalTriple 3 5 3) (Glyph "Icircumflex")
, MapEntry (octalTriple 3 5 4) (Glyph "Idieresis")
, MapEntry (octalTriple 3 5 5) (Glyph "Igrave")
, MapEntry (octalTriple 1 1 2) (Glyph "J")
, MapEntry (octalTriple 1 1 3) (Glyph "K")
, MapEntry (octalTriple 1 1 4) (Glyph "L")
, MapEntry (octalTriple 1 1 5) (Glyph "M")
, MapEntry (octalTriple 1 1 6) (Glyph "N")
, MapEntry (octalTriple 2 0 4) (Glyph "Ntilde")
, MapEntry (octalTriple 1 1 7) (Glyph "O")
, MapEntry (octalTriple 3 1 6) (Glyph "OE")
, MapEntry (octalTriple 3 5 6) (Glyph "Oacute")
, MapEntry (octalTriple 3 5 7) (Glyph "Ocircumflex")
, MapEntry (octalTriple 2 0 5) (Glyph "Odieresis")
, MapEntry (octalTriple 3 6 1) (Glyph "Ograve")
, MapEntry (octalTriple 2 5 7) (Glyph "Oslash")
, MapEntry (octalTriple 3 1 5) (Glyph "Otilde")
, MapEntry (octalTriple 1 2 0) (Glyph "P")
, MapEntry (octalTriple 1 2 1) (Glyph "Q")
, MapEntry (octalTriple 1 2 2) (Glyph "R")
, MapEntry (octalTriple 1 2 3) (Glyph "S")
, MapEntry (octalTriple 1 2 4) (Glyph "T")
, MapEntry (octalTriple 1 2 5) (Glyph "U")
, MapEntry (octalTriple 3 6 2) (Glyph "Uacute")
, MapEntry (octalTriple 3 6 3) (Glyph "Ucircumflex")
, MapEntry (octalTriple 2 0 6) (Glyph "Udieresis")
, MapEntry (octalTriple 3 6 4) (Glyph "Ugrave")
, MapEntry (octalTriple 1 2 6) (Glyph "V")
, MapEntry (octalTriple 1 2 7) (Glyph "W")
, MapEntry (octalTriple 1 3 0) (Glyph "X")
, MapEntry (octalTriple 1 3 1) (Glyph "Y")
, MapEntry (octalTriple 3 3 1) (Glyph "Ydieresis")
, MapEntry (octalTriple 1 3 2) (Glyph "Z")
, MapEntry (octalTriple 1 4 1) (Glyph "a")
, MapEntry (octalTriple 2 0 7) (Glyph "aacute")
, MapEntry (octalTriple 2 1 1) (Glyph "acircumflex")
, MapEntry (octalTriple 2 5 3) (Glyph "acute")
, MapEntry (octalTriple 2 1 2) (Glyph "adieresis")
, MapEntry (octalTriple 2 7 6) (Glyph "ae")
, MapEntry (octalTriple 2 1 0) (Glyph "agrave")
, MapEntry (octalTriple 0 4 6) (Glyph "ampersand")
, MapEntry (octalTriple 2 1 4) (Glyph "aring")
, MapEntry (octalTriple 1 3 6) (Glyph "asciicircum")
, MapEntry (octalTriple 1 7 6) (Glyph "asciitilde")
, MapEntry (octalTriple 0 5 2) (Glyph "asterisk")
, MapEntry (octalTriple 1 0 0) (Glyph "at")
, MapEntry (octalTriple 2 1 3) (Glyph "atilde")
, MapEntry (octalTriple 1 4 2) (Glyph "b")
, MapEntry (octalTriple 1 3 4) (Glyph "backslash")
, MapEntry (octalTriple 1 7 4) (Glyph "bar")
, MapEntry (octalTriple 1 7 3) (Glyph "braceleft")
, MapEntry (octalTriple 1 7 5) (Glyph "braceright")
, MapEntry (octalTriple 1 3 3) (Glyph "bracketleft")
, MapEntry (octalTriple 1 3 5) (Glyph "bracketright")
, MapEntry (octalTriple 3 7 1) (Glyph "breve")
, MapEntry (octalTriple 2 4 5) (Glyph "bullet")
, MapEntry (octalTriple 1 4 3) (Glyph "c")
, MapEntry (octalTriple 3 7 7) (Glyph "caron")
, MapEntry (octalTriple 2 1 5) (Glyph "ccedilla")
, MapEntry (octalTriple 3 7 4) (Glyph "cedilla")
, MapEntry (octalTriple 2 4 2) (Glyph "cent")
, MapEntry (octalTriple 3 6 6) (Glyph "circumflex")
, MapEntry (octalTriple 0 7 2) (Glyph "colon")
, MapEntry (octalTriple 0 5 4) (Glyph "comma")
, MapEntry (octalTriple 2 5 1) (Glyph "copyright")
, MapEntry (octalTriple 3 3 3) (Glyph "currency")
, MapEntry (octalTriple 1 4 4) (Glyph "d")
, MapEntry (octalTriple 2 4 0) (Glyph "dagger")
, MapEntry (octalTriple 3 4 0) (Glyph "daggerdbl")
, MapEntry (octalTriple 2 4 1) (Glyph "degree")
, MapEntry (octalTriple 2 5 4) (Glyph "dieresis")
, MapEntry (octalTriple 3 2 6) (Glyph "divide")
, MapEntry (octalTriple 0 4 4) (Glyph "dollar")
, MapEntry (octalTriple 3 7 2) (Glyph "dotaccent")
, MapEntry (octalTriple 3 6 5) (Glyph "dotlessi")
, MapEntry (octalTriple 1 4 5) (Glyph "e")
, MapEntry (octalTriple 2 1 6) (Glyph "eacute")
, MapEntry (octalTriple 2 2 0) (Glyph "ecircumflex")
, MapEntry (octalTriple 2 2 1) (Glyph "edieresis")
, MapEntry (octalTriple 2 1 7) (Glyph "egrave")
, MapEntry (octalTriple 0 7 0) (Glyph "eight")
, MapEntry (octalTriple 3 1 1) (Glyph "ellipsis")
, MapEntry (octalTriple 3 2 1) (Glyph "emdash")
, MapEntry (octalTriple 3 2 0) (Glyph "endash")
, MapEntry (octalTriple 0 7 5) (Glyph "equal")
, MapEntry (octalTriple 0 4 1) (Glyph "exclam")
, MapEntry (octalTriple 3 0 1) (Glyph "exclamdown")
, MapEntry (octalTriple 1 4 6) (Glyph "f")
, MapEntry (octalTriple 3 3 6) (Glyph "fi")
, MapEntry (octalTriple 0 6 5) (Glyph "five")
, MapEntry (octalTriple 3 3 7) (Glyph "fl")
, MapEntry (octalTriple 3 0 4) (Glyph "florin")
, MapEntry (octalTriple 0 6 4) (Glyph "four")
, MapEntry (octalTriple 3 3 2) (Glyph "fraction")
, MapEntry (octalTriple 1 4 7) (Glyph "g")
, MapEntry (octalTriple 2 4 7) (Glyph "germandbls")
, MapEntry (octalTriple 1 4 0) (Glyph "grave")
, MapEntry (octalTriple 0 7 6) (Glyph "greater")
, MapEntry (octalTriple 3 0 7) (Glyph "guillemotleft")
, MapEntry (octalTriple 3 1 0) (Glyph "guillemotright")
, MapEntry (octalTriple 3 3 4) (Glyph "guilsinglleft")
, MapEntry (octalTriple 3 3 5) (Glyph "guilsinglright")
, MapEntry (octalTriple 1 5 0) (Glyph "h")
, MapEntry (octalTriple 3 7 5) (Glyph "hungarumlaut")
, MapEntry (octalTriple 0 5 5) (Glyph "hyphen")
, MapEntry (octalTriple 1 5 1) (Glyph "i")
, MapEntry (octalTriple 2 2 2) (Glyph "iacute")
, MapEntry (octalTriple 2 2 4) (Glyph "icircumflex")
, MapEntry (octalTriple 2 2 5) (Glyph "idieresis")
, MapEntry (octalTriple 2 2 3) (Glyph "igrave")
, MapEntry (octalTriple 1 5 2) (Glyph "j")
, MapEntry (octalTriple 1 5 3) (Glyph "k")
, MapEntry (octalTriple 1 5 4) (Glyph "l")
, MapEntry (octalTriple 0 7 4) (Glyph "less")
, MapEntry (octalTriple 3 0 2) (Glyph "logicalnot")
, MapEntry (octalTriple 1 5 5) (Glyph "m")
, MapEntry (octalTriple 3 7 0) (Glyph "macron")
, MapEntry (octalTriple 2 6 5) (Glyph "mu")
, MapEntry (octalTriple 1 5 6) (Glyph "n")
, MapEntry (octalTriple 0 7 1) (Glyph "nine")
, MapEntry (octalTriple 2 2 6) (Glyph "ntilde")
, MapEntry (octalTriple 0 4 3) (Glyph "numbersign")
, MapEntry (octalTriple 1 5 7) (Glyph "o")
, MapEntry (octalTriple 2 2 7) (Glyph "oacute")
, MapEntry (octalTriple 2 3 1) (Glyph "ocircumflex")
, MapEntry (octalTriple 2 3 2) (Glyph "odieresis")
, MapEntry (octalTriple 3 1 7) (Glyph "oe")
, MapEntry (octalTriple 3 7 6) (Glyph "ogonek")
, MapEntry (octalTriple 2 3 0) (Glyph "ograve")
, MapEntry (octalTriple 0 6 1) (Glyph "one")
, MapEntry (octalTriple 2 7 3) (Glyph "ordfeminine")
, MapEntry (octalTriple 2 7 4) (Glyph "ordmasculine")
, MapEntry (octalTriple 2 7 7) (Glyph "oslash")
, MapEntry (octalTriple 2 3 3) (Glyph "otilde")
, MapEntry (octalTriple 1 6 0) (Glyph "p")
, MapEntry (octalTriple 2 4 6) (Glyph "paragraph")
, MapEntry (octalTriple 0 5 0) (Glyph "parenleft")
, MapEntry (octalTriple 0 5 1) (Glyph "parenright")
, MapEntry (octalTriple 0 4 5) (Glyph "percent")
, MapEntry (octalTriple 0 5 6) (Glyph "period")
, MapEntry (octalTriple 3 4 1) (Glyph "periodcentered")
, MapEntry (octalTriple 3 4 4) (Glyph "perthousand")
, MapEntry (octalTriple 0 5 3) (Glyph "plus")
, MapEntry (octalTriple 2 6 1) (Glyph "plusminus")
, MapEntry (octalTriple 1 6 1) (Glyph "q")
, MapEntry (octalTriple 0 7 7) (Glyph "question")
, MapEntry (octalTriple 3 0 0) (Glyph "questiondown")
, MapEntry (octalTriple 0 4 2) (Glyph "quotedbl")
, MapEntry (octalTriple 3 4 3) (Glyph "quotedblbase")
, MapEntry (octalTriple 3 2 2) (Glyph "quotedblleft")
, MapEntry (octalTriple 3 2 3) (Glyph "quotedblright")
, MapEntry (octalTriple 3 2 4) (Glyph "quoteleft")
, MapEntry (octalTriple 3 2 5) (Glyph "quoteright")
, MapEntry (octalTriple 3 4 2) (Glyph "quotesinglbase")
, MapEntry (octalTriple 0 4 7) (Glyph "quotesingle")
, MapEntry (octalTriple 1 6 2) (Glyph "r")
, MapEntry (octalTriple 2 5 0) (Glyph "registered")
, MapEntry (octalTriple 3 7 3) (Glyph "ring")
, MapEntry (octalTriple 1 6 3) (Glyph "s")
, MapEntry (octalTriple 2 4 4) (Glyph "section")
, MapEntry (octalTriple 0 7 3) (Glyph "semicolon")
, MapEntry (octalTriple 0 6 7) (Glyph "seven")
, MapEntry (octalTriple 0 6 6) (Glyph "six")
, MapEntry (octalTriple 0 5 7) (Glyph "slash")
, MapEntry (octalTriple 0 4 0) (Glyph "space")
, MapEntry (octalTriple 2 4 3) (Glyph "sterling")
, MapEntry (octalTriple 1 6 4) (Glyph "t")
, MapEntry (octalTriple 0 6 3) (Glyph "three")
, MapEntry (octalTriple 3 6 7) (Glyph "tilde")
, MapEntry (octalTriple 2 5 2) (Glyph "trademark")
, MapEntry (octalTriple 0 6 2) (Glyph "two")
, MapEntry (octalTriple 1 6 5) (Glyph "u")
, MapEntry (octalTriple 2 3 4) (Glyph "uacute")
, MapEntry (octalTriple 2 3 6) (Glyph "ucircumflex")
, MapEntry (octalTriple 2 3 7) (Glyph "udieresis")
, MapEntry (octalTriple 2 3 5) (Glyph "ugrave")
, MapEntry (octalTriple 1 3 7) (Glyph "underscore")
, MapEntry (octalTriple 1 6 6) (Glyph "v")
, MapEntry (octalTriple 1 6 7) (Glyph "w")
, MapEntry (octalTriple 1 7 0) (Glyph "x")
, MapEntry (octalTriple 1 7 1) (Glyph "y")
, MapEntry (octalTriple 3 3 0) (Glyph "ydieresis")
, MapEntry (octalTriple 2 6 4) (Glyph "yen")
, MapEntry (octalTriple 1 7 2) (Glyph "z")
, MapEntry (octalTriple 0 6 0) (Glyph "zero")
]

def MacEncoding : [ uint 8 -> Glyph ] = ListToMap MacEncodings
