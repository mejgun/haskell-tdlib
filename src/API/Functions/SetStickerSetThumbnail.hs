-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetStickerSetThumbnail where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Sets a sticker set thumbnail; for bots only. Returns the sticker set
-- 
-- __user_id__ Sticker set owner
-- 
-- __name__ Sticker set name
-- 
-- __thumbnail__ Thumbnail to set in PNG or TGS format. Animated thumbnail must be set for animated sticker sets and only for them. You can use a zero InputFileId to delete the thumbnail
data SetStickerSetThumbnail = 

 SetStickerSetThumbnail { thumbnail :: Maybe InputFile.InputFile, name :: Maybe String, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetStickerSetThumbnail where
 toJSON (SetStickerSetThumbnail { thumbnail = thumbnail, name = name, user_id = user_id }) =
  A.object [ "@type" A..= T.String "setStickerSetThumbnail", "thumbnail" A..= thumbnail, "name" A..= name, "user_id" A..= user_id ]

instance T.FromJSON SetStickerSetThumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setStickerSetThumbnail" -> parseSetStickerSetThumbnail v
   _ -> mempty
  where
   parseSetStickerSetThumbnail :: A.Value -> T.Parser SetStickerSetThumbnail
   parseSetStickerSetThumbnail = A.withObject "SetStickerSetThumbnail" $ \o -> do
    thumbnail <- o A..:? "thumbnail"
    name <- o A..:? "name"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetStickerSetThumbnail { thumbnail = thumbnail, name = name, user_id = user_id }