{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PageBlockTableCell where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import qualified TD.Data.PageBlockVerticalAlignment as PageBlockVerticalAlignment
import qualified TD.Data.RichText as RichText
import qualified Utils as U

data PageBlockTableCell = -- | Represents a cell of a table @text Cell text; may be null. If the text is null, then the cell must be invisible @is_header True, if it is a header cell
  PageBlockTableCell
  { -- |
    valign :: Maybe PageBlockVerticalAlignment.PageBlockVerticalAlignment,
    -- | Horizontal cell content alignment @valign Vertical cell content alignment
    align :: Maybe PageBlockHorizontalAlignment.PageBlockHorizontalAlignment,
    -- |
    rowspan :: Maybe Int,
    -- | The number of columns the cell spans @rowspan The number of rows the cell spans
    colspan :: Maybe Int,
    -- |
    is_header :: Maybe Bool,
    -- |
    text :: Maybe RichText.RichText
  }
  deriving (Eq)

instance Show PageBlockTableCell where
  show
    PageBlockTableCell
      { valign = valign_,
        align = align_,
        rowspan = rowspan_,
        colspan = colspan_,
        is_header = is_header_,
        text = text_
      } =
      "PageBlockTableCell"
        ++ U.cc
          [ U.p "valign" valign_,
            U.p "align" align_,
            U.p "rowspan" rowspan_,
            U.p "colspan" colspan_,
            U.p "is_header" is_header_,
            U.p "text" text_
          ]

instance T.FromJSON PageBlockTableCell where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockTableCell" -> parsePageBlockTableCell v
      _ -> mempty
    where
      parsePageBlockTableCell :: A.Value -> T.Parser PageBlockTableCell
      parsePageBlockTableCell = A.withObject "PageBlockTableCell" $ \o -> do
        valign_ <- o A..:? "valign"
        align_ <- o A..:? "align"
        rowspan_ <- mconcat [o A..:? "rowspan", U.rm <$> (o A..: "rowspan" :: T.Parser String)] :: T.Parser (Maybe Int)
        colspan_ <- mconcat [o A..:? "colspan", U.rm <$> (o A..: "colspan" :: T.Parser String)] :: T.Parser (Maybe Int)
        is_header_ <- o A..:? "is_header"
        text_ <- o A..:? "text"
        return $ PageBlockTableCell {valign = valign_, align = align_, rowspan = rowspan_, colspan = colspan_, is_header = is_header_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON PageBlockTableCell where
  toJSON
    PageBlockTableCell
      { valign = valign_,
        align = align_,
        rowspan = rowspan_,
        colspan = colspan_,
        is_header = is_header_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockTableCell",
          "valign" A..= valign_,
          "align" A..= align_,
          "rowspan" A..= rowspan_,
          "colspan" A..= colspan_,
          "is_header" A..= is_header_,
          "text" A..= text_
        ]
