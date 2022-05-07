{-# LANGUAGE OverloadedStrings #-}

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
      { valign = valign,
        align = align,
        rowspan = rowspan,
        colspan = colspan,
        is_header = is_header,
        text = text
      } =
      "PageBlockTableCell"
        ++ U.cc
          [ U.p "valign" valign,
            U.p "align" align,
            U.p "rowspan" rowspan,
            U.p "colspan" colspan,
            U.p "is_header" is_header,
            U.p "text" text
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
      { valign = valign,
        align = align,
        rowspan = rowspan,
        colspan = colspan,
        is_header = is_header,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "pageBlockTableCell",
          "valign" A..= valign,
          "align" A..= align,
          "rowspan" A..= rowspan,
          "colspan" A..= colspan,
          "is_header" A..= is_header,
          "text" A..= text
        ]
