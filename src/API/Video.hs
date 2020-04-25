-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Video where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

data Video = 
 Video { video :: Maybe File.File, thumbnail :: Maybe PhotoSize.PhotoSize, minithumbnail :: Maybe Minithumbnail.Minithumbnail, supports_streaming :: Maybe Bool, has_stickers :: Maybe Bool, mime_type :: Maybe String, file_name :: Maybe String, height :: Maybe Int, width :: Maybe Int, duration :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Video where
 toJSON (Video { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, supports_streaming = supports_streaming, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }) =
  A.object [ "@type" A..= T.String "video", "video" A..= video, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "supports_streaming" A..= supports_streaming, "has_stickers" A..= has_stickers, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]

instance T.FromJSON Video where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "video" -> parseVideo v
   _ -> mempty
  where
   parseVideo :: A.Value -> T.Parser Video
   parseVideo = A.withObject "Video" $ \o -> do
    video <- o A..:? "video"
    thumbnail <- o A..:? "thumbnail"
    minithumbnail <- o A..:? "minithumbnail"
    supports_streaming <- o A..:? "supports_streaming"
    has_stickers <- o A..:? "has_stickers"
    mime_type <- o A..:? "mime_type"
    file_name <- o A..:? "file_name"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Video { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, supports_streaming = supports_streaming, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }