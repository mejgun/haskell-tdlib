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
 Video { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, supports_streaming :: Bool, has_stickers :: Bool, mime_type :: String, file_name :: String, height :: Int, width :: Int, duration :: Int }  -- deriving (Show)

instance T.ToJSON Video where
 toJSON (Video { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, supports_streaming = supports_streaming, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }) =
  A.object [ "@type" A..= T.String "video", "video" A..= video, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "supports_streaming" A..= supports_streaming, "has_stickers" A..= has_stickers, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]
-- video Video  { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, supports_streaming :: Bool, has_stickers :: Bool, mime_type :: String, file_name :: String, height :: Int, width :: Int, duration :: Int } 

