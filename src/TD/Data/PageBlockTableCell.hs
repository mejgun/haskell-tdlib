module TD.Data.PageBlockTableCell
  (PageBlockTableCell(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RichText as RichText
import qualified TD.Data.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import qualified TD.Data.PageBlockVerticalAlignment as PageBlockVerticalAlignment

data PageBlockTableCell
  = PageBlockTableCell -- ^ Represents a cell of a table
    { text      :: Maybe RichText.RichText                                         -- ^ Cell text; may be null. If the text is null, then the cell must be invisible
    , is_header :: Maybe Bool                                                      -- ^ True, if it is a header cell
    , colspan   :: Maybe Int                                                       -- ^ The number of columns the cell spans
    , rowspan   :: Maybe Int                                                       -- ^ The number of rows the cell spans
    , align     :: Maybe PageBlockHorizontalAlignment.PageBlockHorizontalAlignment -- ^ Horizontal cell content alignment
    , valign    :: Maybe PageBlockVerticalAlignment.PageBlockVerticalAlignment     -- ^ Vertical cell content alignment
    }
  deriving (Eq, Show)

instance I.ShortShow PageBlockTableCell where
  shortShow PageBlockTableCell
    { text      = text_
    , is_header = is_header_
    , colspan   = colspan_
    , rowspan   = rowspan_
    , align     = align_
    , valign    = valign_
    }
      = "PageBlockTableCell"
        ++ I.cc
        [ "text"      `I.p` text_
        , "is_header" `I.p` is_header_
        , "colspan"   `I.p` colspan_
        , "rowspan"   `I.p` rowspan_
        , "align"     `I.p` align_
        , "valign"    `I.p` valign_
        ]

instance AT.FromJSON PageBlockTableCell where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockTableCell" -> parsePageBlockTableCell v
      _                    -> mempty
    
    where
      parsePageBlockTableCell :: A.Value -> AT.Parser PageBlockTableCell
      parsePageBlockTableCell = A.withObject "PageBlockTableCell" $ \o -> do
        text_      <- o A..:?  "text"
        is_header_ <- o A..:?  "is_header"
        colspan_   <- o A..:?  "colspan"
        rowspan_   <- o A..:?  "rowspan"
        align_     <- o A..:?  "align"
        valign_    <- o A..:?  "valign"
        pure $ PageBlockTableCell
          { text      = text_
          , is_header = is_header_
          , colspan   = colspan_
          , rowspan   = rowspan_
          , align     = align_
          , valign    = valign_
          }
  parseJSON _ = mempty

