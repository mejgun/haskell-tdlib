-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Video where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data Video = 
 Video { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, supports_streaming :: Bool, has_stickers :: Bool, mime_type :: String, file_name :: String, height :: Int, width :: Int, duration :: Int }  deriving (Show)

instance T.ToJSON Video where
 toJSON (Video { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, supports_streaming = supports_streaming, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }) =
  A.object [ "@type" A..= T.String "video", "video" A..= video, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "supports_streaming" A..= supports_streaming, "has_stickers" A..= has_stickers, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]



instance T.FromJSON Video where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "video" -> parseVideo v

   _ -> mempty ""
  where
   parseVideo :: A.Value -> T.Parser Video
   parseVideo = A.withObject "Video" $ \o -> do
    video <- o A..: "video"
    thumbnail <- o A..: "thumbnail"
    minithumbnail <- o A..: "minithumbnail"
    supports_streaming <- o A..: "supports_streaming"
    has_stickers <- o A..: "has_stickers"
    mime_type <- o A..: "mime_type"
    file_name <- o A..: "file_name"
    height <- o A..: "height"
    width <- o A..: "width"
    duration <- o A..: "duration"
    return $ Video { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, supports_streaming = supports_streaming, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }