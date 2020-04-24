-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSet where

import Control.Applicative (optional)
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
    emojis <- optional $ o A..: "emojis"
    stickers <- optional $ o A..: "stickers"
    is_viewed <- optional $ o A..: "is_viewed"
    is_masks <- optional $ o A..: "is_masks"
    is_animated <- optional $ o A..: "is_animated"
    is_official <- optional $ o A..: "is_official"
    is_archived <- optional $ o A..: "is_archived"
    is_installed <- optional $ o A..: "is_installed"
    thumbnail <- optional $ o A..: "thumbnail"
    name <- optional $ o A..: "name"
    title <- optional $ o A..: "title"
    _id <- optional $ o A..: "id"
    return $ StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }