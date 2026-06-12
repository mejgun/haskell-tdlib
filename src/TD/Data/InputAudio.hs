module TD.Data.InputAudio
  ( InputAudio(..)    
  , defaultInputAudio 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail
import qualified Data.Text as T

data InputAudio
  = InputAudio -- ^ An audio to be sent
    { audio                 :: Maybe InputFile.InputFile           -- ^ Audio file to be sent
    , album_cover_thumbnail :: Maybe InputThumbnail.InputThumbnail -- ^ Thumbnail of the cover for the album; pass null to skip thumbnail uploading
    , duration              :: Maybe Int                           -- ^ Duration of the audio, in seconds; may be replaced by the server
    , title                 :: Maybe T.Text                        -- ^ Title of the audio; 0-64 characters; may be replaced by the server
    , performer             :: Maybe T.Text                        -- ^ Performer of the audio; 0-64 characters, may be replaced by the server
    }
  deriving (Eq, Show)

instance I.ShortShow InputAudio where
  shortShow InputAudio
    { audio                 = audio_
    , album_cover_thumbnail = album_cover_thumbnail_
    , duration              = duration_
    , title                 = title_
    , performer             = performer_
    }
      = "InputAudio"
        ++ I.cc
        [ "audio"                 `I.p` audio_
        , "album_cover_thumbnail" `I.p` album_cover_thumbnail_
        , "duration"              `I.p` duration_
        , "title"                 `I.p` title_
        , "performer"             `I.p` performer_
        ]

instance AT.FromJSON InputAudio where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputAudio" -> parseInputAudio v
      _            -> mempty
    
    where
      parseInputAudio :: A.Value -> AT.Parser InputAudio
      parseInputAudio = A.withObject "InputAudio" $ \o -> do
        audio_                 <- o A..:?  "audio"
        album_cover_thumbnail_ <- o A..:?  "album_cover_thumbnail"
        duration_              <- o A..:?  "duration"
        title_                 <- o A..:?  "title"
        performer_             <- o A..:?  "performer"
        pure $ InputAudio
          { audio                 = audio_
          , album_cover_thumbnail = album_cover_thumbnail_
          , duration              = duration_
          , title                 = title_
          , performer             = performer_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputAudio where
  toJSON InputAudio
    { audio                 = audio_
    , album_cover_thumbnail = album_cover_thumbnail_
    , duration              = duration_
    , title                 = title_
    , performer             = performer_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputAudio"
        , "audio"                 A..= audio_
        , "album_cover_thumbnail" A..= album_cover_thumbnail_
        , "duration"              A..= duration_
        , "title"                 A..= title_
        , "performer"             A..= performer_
        ]

defaultInputAudio :: InputAudio
defaultInputAudio =
  InputAudio
    { audio                 = Nothing
    , album_cover_thumbnail = Nothing
    , duration              = Nothing
    , title                 = Nothing
    , performer             = Nothing
    }

