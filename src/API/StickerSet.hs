-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Emojis as Emojis
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

--main = putStrLn "ok"

data StickerSet = 
 StickerSet { emojis :: [Emojis.Emojis], stickers :: [Sticker.Sticker], is_viewed :: Bool, is_masks :: Bool, is_animated :: Bool, is_official :: Bool, is_archived :: Bool, is_installed :: Bool, thumbnail :: PhotoSize.PhotoSize, name :: String, title :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON StickerSet where
 toJSON (StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "stickerSet", "emojis" A..= emojis, "stickers" A..= stickers, "is_viewed" A..= is_viewed, "is_masks" A..= is_masks, "is_animated" A..= is_animated, "is_official" A..= is_official, "is_archived" A..= is_archived, "is_installed" A..= is_installed, "thumbnail" A..= thumbnail, "name" A..= name, "title" A..= title, "id" A..= _id ]
-- stickerSet StickerSet  { emojis :: [Emojis.Emojis], stickers :: [Sticker.Sticker], is_viewed :: Bool, is_masks :: Bool, is_animated :: Bool, is_official :: Bool, is_archived :: Bool, is_installed :: Bool, thumbnail :: PhotoSize.PhotoSize, name :: String, title :: String, _id :: Int } 



instance T.FromJSON StickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSet" -> parseStickerSet v
  where
   parseStickerSet :: A.Value -> T.Parser StickerSet
   parseStickerSet = A.withObject "StickerSet" $ \o -> do
    emojis <- o A..: "emojis"
    stickers <- o A..: "stickers"
    is_viewed <- o A..: "is_viewed"
    is_masks <- o A..: "is_masks"
    is_animated <- o A..: "is_animated"
    is_official <- o A..: "is_official"
    is_archived <- o A..: "is_archived"
    is_installed <- o A..: "is_installed"
    thumbnail <- o A..: "thumbnail"
    name <- o A..: "name"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }