-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetArchivedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetArchivedStickerSets = 
 GetArchivedStickerSets { limit :: Int, offset_sticker_set_id :: Int, is_masks :: Bool }  deriving (Show)

instance T.ToJSON GetArchivedStickerSets where
 toJSON (GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "getArchivedStickerSets", "limit" A..= limit, "offset_sticker_set_id" A..= offset_sticker_set_id, "is_masks" A..= is_masks ]

instance T.FromJSON GetArchivedStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getArchivedStickerSets" -> parseGetArchivedStickerSets v
   _ -> mempty
  where
   parseGetArchivedStickerSets :: A.Value -> T.Parser GetArchivedStickerSets
   parseGetArchivedStickerSets = A.withObject "GetArchivedStickerSets" $ \o -> do
    limit <- o A..: "limit"
    offset_sticker_set_id <- o A..: "offset_sticker_set_id"
    is_masks <- o A..: "is_masks"
    return $ GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }