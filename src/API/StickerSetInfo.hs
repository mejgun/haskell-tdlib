-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSetInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

-- |
-- 
-- Represents short information about a sticker set
-- 
-- __id__ Identifier of the sticker set
-- 
-- __title__ Title of the sticker set
-- 
-- __name__ Name of the sticker set
-- 
-- __thumbnail__ Sticker set thumbnail in WEBP format with width and height 100; may be null
-- 
-- __is_installed__ True, if the sticker set has been installed by current user
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
-- __size__ Total number of stickers in the set
-- 
-- __covers__ Contains up to the first 5 stickers from the set, depending on the context. If the client needs more stickers the full set should be requested
data StickerSetInfo = 
 StickerSetInfo { covers :: Maybe [Sticker.Sticker], size :: Maybe Int, is_viewed :: Maybe Bool, is_masks :: Maybe Bool, is_animated :: Maybe Bool, is_official :: Maybe Bool, is_archived :: Maybe Bool, is_installed :: Maybe Bool, thumbnail :: Maybe PhotoSize.PhotoSize, name :: Maybe String, title :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON StickerSetInfo where
 toJSON (StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "stickerSetInfo", "covers" A..= covers, "size" A..= size, "is_viewed" A..= is_viewed, "is_masks" A..= is_masks, "is_animated" A..= is_animated, "is_official" A..= is_official, "is_archived" A..= is_archived, "is_installed" A..= is_installed, "thumbnail" A..= thumbnail, "name" A..= name, "title" A..= title, "id" A..= _id ]

instance T.FromJSON StickerSetInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSetInfo" -> parseStickerSetInfo v
   _ -> mempty
  where
   parseStickerSetInfo :: A.Value -> T.Parser StickerSetInfo
   parseStickerSetInfo = A.withObject "StickerSetInfo" $ \o -> do
    covers <- o A..:? "covers"
    size <- mconcat [ o A..:? "size", readMaybe <$> (o A..: "size" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_viewed <- o A..:? "is_viewed"
    is_masks <- o A..:? "is_masks"
    is_animated <- o A..:? "is_animated"
    is_official <- o A..:? "is_official"
    is_archived <- o A..:? "is_archived"
    is_installed <- o A..:? "is_installed"
    thumbnail <- o A..:? "thumbnail"
    name <- o A..:? "name"
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }