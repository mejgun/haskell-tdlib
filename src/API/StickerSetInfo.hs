-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

data StickerSetInfo = 
 StickerSetInfo { covers :: [Sticker.Sticker], size :: Int, is_viewed :: Bool, is_masks :: Bool, is_animated :: Bool, is_official :: Bool, is_archived :: Bool, is_installed :: Bool, thumbnail :: PhotoSize.PhotoSize, name :: String, title :: String, _id :: Int }  deriving (Show)

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
    covers <- o A..: "covers"
    size <- o A..: "size"
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
    return $ StickerSetInfo { covers = covers, size = size, is_viewed = is_viewed, is_masks = is_masks, is_animated = is_animated, is_official = is_official, is_archived = is_archived, is_installed = is_installed, thumbnail = thumbnail, name = name, title = title, _id = _id }