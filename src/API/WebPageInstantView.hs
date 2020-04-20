-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

--main = putStrLn "ok"

data WebPageInstantView = 
 WebPageInstantView { is_full :: Bool, is_rtl :: Bool, version :: Int, view_count :: Int, page_blocks :: [PageBlock.PageBlock] }  -- deriving (Show)

instance T.ToJSON WebPageInstantView where
 toJSON (WebPageInstantView { is_full = is_full, is_rtl = is_rtl, version = version, view_count = view_count, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "webPageInstantView", "is_full" A..= is_full, "is_rtl" A..= is_rtl, "version" A..= version, "view_count" A..= view_count, "page_blocks" A..= page_blocks ]
-- webPageInstantView WebPageInstantView  { is_full :: Bool, is_rtl :: Bool, version :: Int, view_count :: Int, page_blocks :: [PageBlock.PageBlock] } 

