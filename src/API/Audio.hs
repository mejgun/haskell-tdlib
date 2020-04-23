-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Audio where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

data Audio = 
 Audio { audio :: Maybe File.File, album_cover_thumbnail :: Maybe PhotoSize.PhotoSize, album_cover_minithumbnail :: Maybe Minithumbnail.Minithumbnail, mime_type :: Maybe String, file_name :: Maybe String, performer :: Maybe String, title :: Maybe String, duration :: Maybe Int }  deriving (Show)

instance T.ToJSON Audio where
 toJSON (Audio { audio = audio, album_cover_thumbnail = album_cover_thumbnail, album_cover_minithumbnail = album_cover_minithumbnail, mime_type = mime_type, file_name = file_name, performer = performer, title = title, duration = duration }) =
  A.object [ "@type" A..= T.String "audio", "audio" A..= audio, "album_cover_thumbnail" A..= album_cover_thumbnail, "album_cover_minithumbnail" A..= album_cover_minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name, "performer" A..= performer, "title" A..= title, "duration" A..= duration ]

instance T.FromJSON Audio where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "audio" -> parseAudio v
   _ -> mempty
  where
   parseAudio :: A.Value -> T.Parser Audio
   parseAudio = A.withObject "Audio" $ \o -> do
    audio <- optional $ o A..: "audio"
    album_cover_thumbnail <- optional $ o A..: "album_cover_thumbnail"
    album_cover_minithumbnail <- optional $ o A..: "album_cover_minithumbnail"
    mime_type <- optional $ o A..: "mime_type"
    file_name <- optional $ o A..: "file_name"
    performer <- optional $ o A..: "performer"
    title <- optional $ o A..: "title"
    duration <- optional $ o A..: "duration"
    return $ Audio { audio = audio, album_cover_thumbnail = album_cover_thumbnail, album_cover_minithumbnail = album_cover_minithumbnail, mime_type = mime_type, file_name = file_name, performer = performer, title = title, duration = duration }