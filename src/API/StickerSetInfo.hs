-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSetInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

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
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }