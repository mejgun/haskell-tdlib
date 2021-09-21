-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Emojis as Emojis
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.ClosedVectorPath as ClosedVectorPath
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail

-- |
-- 
-- Represents a sticker set
-- 
-- __id__ Identifier of the sticker set
-- 
-- __title__ Title of the sticker set
-- 
-- __name__ Name of the sticker set
-- 
-- __thumbnail__ Sticker set thumbnail in WEBP or TGS format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
-- 
-- __thumbnail_outline__ Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
-- 
-- __is_installed__ True, if the sticker set has been installed by the current user
-- 
-- __is_archived__ True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
-- 
-- __is_official__ True, if the sticker set is official
-- 
-- __is_animated__ True, is the stickers in the set are animated
-- 
-- __is_masks__ True, if the stickers in the set are masks
-- 
-- __is_viewed__ True for already viewed trending sticker sets
-- 
-- __stickers__ List of stickers in this set
-- 
-- __emojis__ A list of emoji corresponding to the stickers in the same order. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
data StickerSet = 

 StickerSet { emojis :: Maybe [Emojis.Emojis], stickers :: Maybe [Sticker.Sticker], is_viewed :: Maybe Bool, is_masks :: Maybe Bool, is_animated :: Maybe Bool, is_official :: Maybe Bool, is_archived :: Maybe Bool, is_installed :: Maybe Bool, thumbnail_outline :: Maybe [ClosedVectorPath.ClosedVectorPath], thumbnail :: Maybe Thumbnail.Thumbnail, name :: Maybe String, title :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON StickerSet where
 toJSON (StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail_outline = thumbnail_outline, thumbnail = thumbnail, name = name, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "stickerSet", "emojis" A..= emojis, "stickers" A..= stickers, "is_viewed" A..= is_viewed, "is_masks" A..= is_masks, "is_animated" A..= is_animated, "is_official" A..= is_official, "is_archived" A..= is_archived, "is_installed" A..= is_installed, "thumbnail_outline" A..= thumbnail_outline, "thumbnail" A..= thumbnail, "name" A..= name, "title" A..= title, "id" A..= _id ]

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
    thumbnail_outline <- o A..:? "thumbnail_outline"
    thumbnail <- o A..:? "thumbnail"
    name <- o A..:? "name"
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSet { emojis = emojis, stickers = stickers, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail_outline = thumbnail_outline, thumbnail = thumbnail, name = name, title = title, _id = _id }