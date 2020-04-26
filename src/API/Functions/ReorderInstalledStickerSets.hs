-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReorderInstalledStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the order of installed sticker sets 
-- 
-- __is_masks__ Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets
-- 
-- __sticker_set_ids__ Identifiers of installed sticker sets in the new correct order
data ReorderInstalledStickerSets = 
 ReorderInstalledStickerSets { sticker_set_ids :: Maybe [Int], is_masks :: Maybe Bool }  deriving (Show, Eq)

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
    sticker_set_ids <- o A..:? "sticker_set_ids"
    is_masks <- o A..:? "is_masks"
    return $ ReorderInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }