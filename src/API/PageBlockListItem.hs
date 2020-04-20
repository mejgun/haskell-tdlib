-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockListItem where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

--main = putStrLn "ok"

data PageBlockListItem = 
 PageBlockListItem { page_blocks :: [PageBlock.PageBlock], label :: String }  -- deriving (Show)

instance T.ToJSON PageBlockListItem where
 toJSON (PageBlockListItem { page_blocks = page_blocks, label = label }) =
  A.object [ "@type" A..= T.String "pageBlockListItem", "page_blocks" A..= page_blocks, "label" A..= label ]
-- pageBlockListItem PageBlockListItem  { page_blocks :: [PageBlock.PageBlock], label :: String } 

