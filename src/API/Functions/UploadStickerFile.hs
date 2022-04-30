-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UploadStickerFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

-- |
-- 
-- Uploads a file with a sticker; returns the uploaded file 
-- 
-- __user_id__ Sticker file owner; ignored for regular users
-- 
-- __sticker__ Sticker file to upload
data UploadStickerFile = 

 UploadStickerFile { sticker :: Maybe InputSticker.InputSticker, user_id :: Maybe Int }  deriving (Eq)

instance Show UploadStickerFile where
 show UploadStickerFile { sticker=sticker, user_id=user_id } =
  "UploadStickerFile" ++ U.cc [U.p "sticker" sticker, U.p "user_id" user_id ]

instance T.ToJSON UploadStickerFile where
 toJSON UploadStickerFile { sticker = sticker, user_id = user_id } =
  A.object [ "@type" A..= T.String "uploadStickerFile", "sticker" A..= sticker, "user_id" A..= user_id ]

instance T.FromJSON UploadStickerFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "uploadStickerFile" -> parseUploadStickerFile v
   _ -> mempty
  where
   parseUploadStickerFile :: A.Value -> T.Parser UploadStickerFile
   parseUploadStickerFile = A.withObject "UploadStickerFile" $ \o -> do
    sticker <- o A..:? "sticker"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UploadStickerFile { sticker = sticker, user_id = user_id }
 parseJSON _ = mempty
