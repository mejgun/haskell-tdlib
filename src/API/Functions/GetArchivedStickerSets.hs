-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetArchivedStickerSets where

import Text.Read (readMaybe)

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
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_sticker_set_id <- mconcat [ o A..:? "offset_sticker_set_id", readMaybe <$> (o A..: "offset_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_masks <- o A..:? "is_masks"
    return $ GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }