-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPageInstantView where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

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
    is_full <- optional $ o A..: "is_full"
    is_rtl <- optional $ o A..: "is_rtl"
    version <- optional $ o A..: "version"
    view_count <- optional $ o A..: "view_count"
    page_blocks <- optional $ o A..: "page_blocks"
    return $ WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }