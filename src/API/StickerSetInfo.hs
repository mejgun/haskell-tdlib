-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSetInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.StickerType as StickerType
import {-# SOURCE #-} qualified API.ClosedVectorPath as ClosedVectorPath
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail

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
-- __thumbnail__ Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null
-- 
-- __thumbnail_outline__ Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
-- 
-- __is_installed__ True, if the sticker set has been installed by the current user
-- 
-- __is_archived__ True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
-- 
-- __is_official__ True, if the sticker set is official
-- 
-- __sticker_type__ Type of the stickers in the set
-- 
-- __is_viewed__ True for already viewed trending sticker sets
-- 
-- __size__ Total number of stickers in the set
-- 
-- __covers__ Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
data StickerSetInfo = 

 StickerSetInfo { covers :: Maybe [Sticker.Sticker], size :: Maybe Int, is_viewed :: Maybe Bool, sticker_type :: Maybe StickerType.StickerType, is_official :: Maybe Bool, is_archived :: Maybe Bool, is_installed :: Maybe Bool, thumbnail_outline :: Maybe [ClosedVectorPath.ClosedVectorPath], thumbnail :: Maybe Thumbnail.Thumbnail, name :: Maybe String, title :: Maybe String, _id :: Maybe Int }  deriving (Eq)

instance Show StickerSetInfo where
 show StickerSetInfo { covers=covers, size=size, is_viewed=is_viewed, sticker_type=sticker_type, is_official=is_official, is_archived=is_archived, is_installed=is_installed, thumbnail_outline=thumbnail_outline, thumbnail=thumbnail, name=name, title=title, _id=_id } =
  "StickerSetInfo" ++ U.cc [U.p "covers" covers, U.p "size" size, U.p "is_viewed" is_viewed, U.p "sticker_type" sticker_type, U.p "is_official" is_official, U.p "is_archived" is_archived, U.p "is_installed" is_installed, U.p "thumbnail_outline" thumbnail_outline, U.p "thumbnail" thumbnail, U.p "name" name, U.p "title" title, U.p "_id" _id ]

instance T.ToJSON StickerSetInfo where
 toJSON StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, sticker_type = sticker_type, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail_outline = thumbnail_outline, thumbnail = thumbnail, name = name, title = title, _id = _id } =
  A.object [ "@type" A..= T.String "stickerSetInfo", "covers" A..= covers, "size" A..= size, "is_viewed" A..= is_viewed, "sticker_type" A..= sticker_type, "is_official" A..= is_official, "is_archived" A..= is_archived, "is_installed" A..= is_installed, "thumbnail_outline" A..= thumbnail_outline, "thumbnail" A..= thumbnail, "name" A..= name, "title" A..= title, "id" A..= _id ]

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
    sticker_type <- o A..:? "sticker_type"
    is_official <- o A..:? "is_official"
    is_archived <- o A..:? "is_archived"
    is_installed <- o A..:? "is_installed"
    thumbnail_outline <- o A..:? "thumbnail_outline"
    thumbnail <- o A..:? "thumbnail"
    name <- o A..:? "name"
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, sticker_type = sticker_type, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail_outline = thumbnail_outline, thumbnail = thumbnail, name = name, title = title, _id = _id }
 parseJSON _ = mempty
