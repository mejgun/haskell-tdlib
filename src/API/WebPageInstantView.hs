-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

--main = putStrLn "ok"

data WebPageInstantView = 
 WebPageInstantView { is_full :: Bool, is_rtl :: Bool, version :: Int, view_count :: Int, page_blocks :: [PageBlock.PageBlock] }  deriving (Show)

instance T.ToJSON WebPageInstantView where
 toJSON (WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "webPageInstantView", "is_full" A..= is_full, "is_rtl" A..= is_rtl, "version" A..= version, "view_count" A..= view_count, "page_blocks" A..= page_blocks ]



instance T.FromJSON WebPageInstantView where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "webPageInstantView" -> parseWebPageInstantView v

   _ -> mempty ""
  where
   parseWebPageInstantView :: A.Value -> T.Parser WebPageInstantView
   parseWebPageInstantView = A.withObject "WebPageInstantView" $ \o -> do
    is_full <- o A..: "is_full"
    is_rtl <- o A..: "is_rtl"
    version <- o A..: "version"
    view_count <- o A..: "view_count"
    page_blocks <- o A..: "page_blocks"
    return $ WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }