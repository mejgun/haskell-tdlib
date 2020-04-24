-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetArchivedStickerSets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetArchivedStickerSets = 
 GetArchivedStickerSets { limit :: Maybe Int, offset_sticker_set_id :: Maybe Int, is_masks :: Maybe Bool }  deriving (Show, Eq)

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
    limit <- optional $ o A..: "limit"
    offset_sticker_set_id <- optional $ o A..: "offset_sticker_set_id"
    is_masks <- optional $ o A..: "is_masks"
    return $ GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }