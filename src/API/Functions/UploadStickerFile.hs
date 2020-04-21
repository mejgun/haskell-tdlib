-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UploadStickerFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data UploadStickerFile = 
 UploadStickerFile { png_sticker :: InputFile.InputFile, user_id :: Int }  deriving (Show)

instance T.ToJSON UploadStickerFile where
 toJSON (UploadStickerFile { png_sticker = png_sticker, user_id = user_id }) =
  A.object [ "@type" A..= T.String "uploadStickerFile", "png_sticker" A..= png_sticker, "user_id" A..= user_id ]



instance T.FromJSON UploadStickerFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "uploadStickerFile" -> parseUploadStickerFile v

   _ -> mempty ""
  where
   parseUploadStickerFile :: A.Value -> T.Parser UploadStickerFile
   parseUploadStickerFile = A.withObject "UploadStickerFile" $ \o -> do
    png_sticker <- o A..: "png_sticker"
    user_id <- o A..: "user_id"
    return $ UploadStickerFile { png_sticker = png_sticker, user_id = user_id }