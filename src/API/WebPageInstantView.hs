-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPageInstantView where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

-- |
-- 
-- Describes an instant view page for a web page
-- 
-- __page_blocks__ Content of the web page
-- 
-- __view_count__ Number of the instant view views; 0 if unknown
-- 
-- __version__ Version of the instant view, currently can be 1 or 2
-- 
-- __is_rtl__ True, if the instant view must be shown from right to left
-- 
-- __is_full__ True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
data WebPageInstantView = 
 WebPageInstantView { is_full :: Maybe Bool, is_rtl :: Maybe Bool, version :: Maybe Int, view_count :: Maybe Int, page_blocks :: Maybe [PageBlock.PageBlock] }  deriving (Show, Eq)

instance T.ToJSON WebPageInstantView where
 toJSON (WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "webPageInstantView", "is_full" A..= is_full, "is_rtl" A..= is_rtl, "version" A..= version, "view_count" A..= view_count, "page_blocks" A..= page_blocks ]

instance T.FromJSON WebPageInstantView where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "webPageInstantView" -> parseWebPageInstantView v
   _ -> mempty
  where
   parseWebPageInstantView :: A.Value -> T.Parser WebPageInstantView
   parseWebPageInstantView = A.withObject "WebPageInstantView" $ \o -> do
    is_full <- o A..:? "is_full"
    is_rtl <- o A..:? "is_rtl"
    version <- mconcat [ o A..:? "version", readMaybe <$> (o A..: "version" :: T.Parser String)] :: T.Parser (Maybe Int)
    view_count <- mconcat [ o A..:? "view_count", readMaybe <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    page_blocks <- o A..:? "page_blocks"
    return $ WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }
