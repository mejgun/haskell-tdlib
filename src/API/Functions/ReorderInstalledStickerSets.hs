-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReorderInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReorderInstalledStickerSets = 
 ReorderInstalledStickerSets { sticker_set_ids :: [Int], is_masks :: Bool }  deriving (Show)

instance T.ToJSON ReorderInstalledStickerSets where
 toJSON (ReorderInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "reorderInstalledStickerSets", "sticker_set_ids" A..= sticker_set_ids, "is_masks" A..= is_masks ]

instance T.FromJSON ReorderInstalledStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reorderInstalledStickerSets" -> parseReorderInstalledStickerSets v
   _ -> mempty
  where
   parseReorderInstalledStickerSets :: A.Value -> T.Parser ReorderInstalledStickerSets
   parseReorderInstalledStickerSets = A.withObject "ReorderInstalledStickerSets" $ \o -> do
    sticker_set_ids <- o A..: "sticker_set_ids"
    is_masks <- o A..: "is_masks"
    return $ ReorderInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }