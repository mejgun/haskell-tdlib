-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockTableCell where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlockVerticalAlignment as PageBlockVerticalAlignment
import {-# SOURCE #-} qualified API.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import {-# SOURCE #-} qualified API.RichText as RichText

-- |
-- 
-- Represents a cell of a table 
-- 
-- __text__ Cell text; may be null. If the text is null, then the cell should be invisible
-- 
-- __is_header__ True, if it is a header cell
-- 
-- __colspan__ The number of columns the cell should span
-- 
-- __rowspan__ The number of rows the cell should span
-- 
-- __align__ Horizontal cell content alignment
-- 
-- __valign__ Vertical cell content alignment
data PageBlockTableCell = 
 PageBlockTableCell { valign :: Maybe PageBlockVerticalAlignment.PageBlockVerticalAlignment, align :: Maybe PageBlockHorizontalAlignment.PageBlockHorizontalAlignment, rowspan :: Maybe Int, colspan :: Maybe Int, is_header :: Maybe Bool, text :: Maybe RichText.RichText }  deriving (Show, Eq)

instance T.ToJSON PageBlockTableCell where
 toJSON (PageBlockTableCell { valign = valign, align = align, rowspan = rowspan, colspan = colspan, is_header = is_header, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockTableCell", "valign" A..= valign, "align" A..= align, "rowspan" A..= rowspan, "colspan" A..= colspan, "is_header" A..= is_header, "text" A..= text ]

instance T.FromJSON PageBlockTableCell where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockTableCell" -> parsePageBlockTableCell v
   _ -> mempty
  where
   parsePageBlockTableCell :: A.Value -> T.Parser PageBlockTableCell
   parsePageBlockTableCell = A.withObject "PageBlockTableCell" $ \o -> do
    valign <- o A..:? "valign"
    align <- o A..:? "align"
    rowspan <- mconcat [ o A..:? "rowspan", readMaybe <$> (o A..: "rowspan" :: T.Parser String)] :: T.Parser (Maybe Int)
    colspan <- mconcat [ o A..:? "colspan", readMaybe <$> (o A..: "colspan" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_header <- o A..:? "is_header"
    text <- o A..:? "text"
    return $ PageBlockTableCell { valign = valign, align = align, rowspan = rowspan, colspan = colspan, is_header = is_header, text = text }