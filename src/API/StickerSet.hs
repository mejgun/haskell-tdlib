-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Emojis as Emojis
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

data StickerSet = 
 StickerSet { emojis :: Maybe [Emojis.Emojis], stickers :: Maybe [Sticker.Sticker], is_viewed :: Maybe Bool, is_masks :: Maybe Bool, is_animated :: Maybe Bool, is_official :: Maybe Bool, is_archived :: Maybe Bool, is_installed :: Maybe Bool, thumbnail :: Maybe PhotoSize.PhotoSize, name :: Maybe String, title :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON StickerSet where
 toJSON (StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "stickerSet", "emojis" A..= emojis, "stickers" A..= stickers, "is_viewed" A..= is_viewed, "is_masks" A..= is_masks, "is_animated" A..= is_animated, "is_official" A..= is_official, "is_archived" A..= is_archived, "is_installed" A..= is_installed, "thumbnail" A..= thumbnail, "name" A..= name, "title" A..= title, "id" A..= _id ]

instance T.FromJSON StickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSet" -> parseStickerSet v
   _ -> mempty
  where
   parseStickerSet :: A.Value -> T.Parser StickerSet
   parseStickerSet = A.withObject "StickerSet" $ \o -> do
    emojis <- o A..:? "emojis"
    stickers <- o A..:? "stickers"
    is_viewed <- o A..:? "is_viewed"
    is_masks <- o A..:? "is_masks"
    is_animated <- o A..:? "is_animated"
    is_official <- o A..:? "is_official"
    is_archived <- o A..:? "is_archived"
    is_installed <- o A..:? "is_installed"
    thumbnail <- o A..:? "thumbnail"
    name <- o A..:? "name"
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }