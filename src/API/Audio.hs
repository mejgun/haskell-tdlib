-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Audio where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes an audio file. Audio is usually in MP3 or M4A format 
-- 
-- __duration__ Duration of the audio, in seconds; as defined by the sender
-- 
-- __title__ Title of the audio; as defined by the sender
-- 
-- __performer__ Performer of the audio; as defined by the sender
-- 
-- __file_name__ Original name of the file; as defined by the sender
-- 
-- __mime_type__ The MIME type of the file; as defined by the sender
-- 
-- __album_cover_minithumbnail__ The minithumbnail of the album cover; may be null
-- 
-- __album_cover_thumbnail__ The thumbnail of the album cover; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null
-- 
-- __audio__ File containing the audio
data Audio = 

 Audio { audio :: Maybe File.File, album_cover_thumbnail :: Maybe PhotoSize.PhotoSize, album_cover_minithumbnail :: Maybe Minithumbnail.Minithumbnail, mime_type :: Maybe String, file_name :: Maybe String, performer :: Maybe String, title :: Maybe String, duration :: Maybe Int }  deriving (Show, Eq)

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
    audio <- o A..:? "audio"
    album_cover_thumbnail <- o A..:? "album_cover_thumbnail"
    album_cover_minithumbnail <- o A..:? "album_cover_minithumbnail"
    mime_type <- o A..:? "mime_type"
    file_name <- o A..:? "file_name"
    performer <- o A..:? "performer"
    title <- o A..:? "title"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Audio { audio = audio, album_cover_thumbnail = album_cover_thumbnail, album_cover_minithumbnail = album_cover_minithumbnail, mime_type = mime_type, file_name = file_name, performer = performer, title = title, duration = duration }