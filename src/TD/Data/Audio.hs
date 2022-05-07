{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Audio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

data Audio = -- | Describes an audio file. Audio is usually in MP3 or M4A format @duration Duration of the audio, in seconds; as defined by the sender @title Title of the audio; as defined by the sender @performer Performer of the audio; as defined by the sender
  Audio
  { -- |
    audio :: Maybe File.File,
    -- | The thumbnail of the album cover in JPEG format; as defined by the sender. The full size thumbnail is supposed to be extracted from the downloaded file; may be null @audio File containing the audio
    album_cover_thumbnail :: Maybe Thumbnail.Thumbnail,
    -- |
    album_cover_minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- |
    mime_type :: Maybe String,
    -- | Original name of the file; as defined by the sender @mime_type The MIME type of the file; as defined by the sender @album_cover_minithumbnail The minithumbnail of the album cover; may be null
    file_name :: Maybe String,
    -- |
    performer :: Maybe String,
    -- |
    title :: Maybe String,
    -- |
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show Audio where
  show
    Audio
      { audio = audio,
        album_cover_thumbnail = album_cover_thumbnail,
        album_cover_minithumbnail = album_cover_minithumbnail,
        mime_type = mime_type,
        file_name = file_name,
        performer = performer,
        title = title,
        duration = duration
      } =
      "Audio"
        ++ U.cc
          [ U.p "audio" audio,
            U.p "album_cover_thumbnail" album_cover_thumbnail,
            U.p "album_cover_minithumbnail" album_cover_minithumbnail,
            U.p "mime_type" mime_type,
            U.p "file_name" file_name,
            U.p "performer" performer,
            U.p "title" title,
            U.p "duration" duration
          ]

instance T.FromJSON Audio where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "audio" -> parseAudio v
      _ -> mempty
    where
      parseAudio :: A.Value -> T.Parser Audio
      parseAudio = A.withObject "Audio" $ \o -> do
        audio_ <- o A..:? "audio"
        album_cover_thumbnail_ <- o A..:? "album_cover_thumbnail"
        album_cover_minithumbnail_ <- o A..:? "album_cover_minithumbnail"
        mime_type_ <- o A..:? "mime_type"
        file_name_ <- o A..:? "file_name"
        performer_ <- o A..:? "performer"
        title_ <- o A..:? "title"
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Audio {audio = audio_, album_cover_thumbnail = album_cover_thumbnail_, album_cover_minithumbnail = album_cover_minithumbnail_, mime_type = mime_type_, file_name = file_name_, performer = performer_, title = title_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON Audio where
  toJSON
    Audio
      { audio = audio,
        album_cover_thumbnail = album_cover_thumbnail,
        album_cover_minithumbnail = album_cover_minithumbnail,
        mime_type = mime_type,
        file_name = file_name,
        performer = performer,
        title = title,
        duration = duration
      } =
      A.object
        [ "@type" A..= T.String "audio",
          "audio" A..= audio,
          "album_cover_thumbnail" A..= album_cover_thumbnail,
          "album_cover_minithumbnail" A..= album_cover_minithumbnail,
          "mime_type" A..= mime_type,
          "file_name" A..= file_name,
          "performer" A..= performer,
          "title" A..= title,
          "duration" A..= duration
        ]
