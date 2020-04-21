-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockListItem where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

data PageBlockListItem = 
 PageBlockListItem { page_blocks :: [PageBlock.PageBlock], label :: String }  deriving (Show)

instance T.ToJSON PageBlockListItem where
 toJSON (PageBlockListItem { page_blocks = page_blocks, label = label }) =
  A.object [ "@type" A..= T.String "pageBlockListItem", "page_blocks" A..= page_blocks, "label" A..= label ]

instance T.FromJSON PageBlockListItem where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockListItem" -> parsePageBlockListItem v
   _ -> mempty
  where
   parsePageBlockListItem :: A.Value -> T.Parser PageBlockListItem
   parsePageBlockListItem = A.withObject "PageBlockListItem" $ \o -> do
    page_blocks <- o A..: "page_blocks"
    label <- o A..: "label"
    return $ PageBlockListItem { page_blocks = page_blocks, label = label }