-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Audio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data Audio = 
 Audio { audio :: File.File, album_cover_thumbnail :: PhotoSize.PhotoSize, album_cover_minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String, performer :: String, title :: String, duration :: Int }  -- deriving (Show)

instance T.ToJSON Audio where
 toJSON (Audio { audio = audio, album_cover_thumbnail = album_cover_thumbnail, album_cover_minithumbnail = album_cover_minithumbnail, mime_type = mime_type, file_name = file_name, performer = performer, title = title, duration = duration }) =
  A.object [ "@type" A..= T.String "audio", "audio" A..= audio, "album_cover_thumbnail" A..= album_cover_thumbnail, "album_cover_minithumbnail" A..= album_cover_minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name, "performer" A..= performer, "title" A..= title, "duration" A..= duration ]
-- audio Audio  { audio :: File.File, album_cover_thumbnail :: PhotoSize.PhotoSize, album_cover_minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String, performer :: String, title :: String, duration :: Int } 

