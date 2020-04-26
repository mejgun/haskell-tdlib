-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputThumbnail where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- A thumbnail to be sent along with a file; should be in JPEG or WEBP format for stickers, and less than 200 KB in size 
-- 
-- __thumbnail__ Thumbnail file to send. Sending thumbnails by file_id is currently not supported
-- 
-- __width__ Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
-- 
-- __height__ Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
data InputThumbnail = 
 InputThumbnail { height :: Maybe Int, width :: Maybe Int, thumbnail :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON InputThumbnail where
 toJSON (InputThumbnail { height = height, width = width, thumbnail = thumbnail }) =
  A.object [ "@type" A..= T.String "inputThumbnail", "height" A..= height, "width" A..= width, "thumbnail" A..= thumbnail ]

instance T.FromJSON InputThumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputThumbnail" -> parseInputThumbnail v
   _ -> mempty
  where
   parseInputThumbnail :: A.Value -> T.Parser InputThumbnail
   parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail <- o A..:? "thumbnail"
    return $ InputThumbnail { height = height, width = width, thumbnail = thumbnail }