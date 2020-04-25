-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UploadStickerFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data UploadStickerFile = 
 UploadStickerFile { png_sticker :: Maybe InputFile.InputFile, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON UploadStickerFile where
 toJSON (UploadStickerFile { png_sticker = png_sticker, user_id = user_id }) =
  A.object [ "@type" A..= T.String "uploadStickerFile", "png_sticker" A..= png_sticker, "user_id" A..= user_id ]

instance T.FromJSON UploadStickerFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "uploadStickerFile" -> parseUploadStickerFile v
   _ -> mempty
  where
   parseUploadStickerFile :: A.Value -> T.Parser UploadStickerFile
   parseUploadStickerFile = A.withObject "UploadStickerFile" $ \o -> do
    png_sticker <- o A..:? "png_sticker"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UploadStickerFile { png_sticker = png_sticker, user_id = user_id }