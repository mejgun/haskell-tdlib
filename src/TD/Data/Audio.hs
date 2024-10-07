module TD.Data.Audio
  (Audio(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Audio
  = Audio -- ^ Describes an audio file. Audio is usually in MP3 or M4A format
    { duration                  :: Maybe Int                         -- ^ Duration of the audio, in seconds; as defined by the sender
    , title                     :: Maybe T.Text                      -- ^ Title of the audio; as defined by the sender
    , performer                 :: Maybe T.Text                      -- ^ Performer of the audio; as defined by the sender
    , file_name                 :: Maybe T.Text                      -- ^ Original name of the file; as defined by the sender
    , mime_type                 :: Maybe T.Text                      -- ^ The MIME type of the file; as defined by the sender
    , album_cover_minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ The minithumbnail of the album cover; may be null
    , album_cover_thumbnail     :: Maybe Thumbnail.Thumbnail         -- ^ The thumbnail of the album cover in JPEG format; as defined by the sender. The full size thumbnail is expected to be extracted from the downloaded audio file; may be null
    , external_album_covers     :: Maybe [Thumbnail.Thumbnail]       -- ^ Album cover variants to use if the downloaded audio file contains no album cover. Provided thumbnail dimensions are approximate
    , audio                     :: Maybe File.File                   -- ^ File containing the audio
    }
  deriving (Eq, Show)

instance I.ShortShow Audio where
  shortShow Audio
    { duration                  = duration_
    , title                     = title_
    , performer                 = performer_
    , file_name                 = file_name_
    , mime_type                 = mime_type_
    , album_cover_minithumbnail = album_cover_minithumbnail_
    , album_cover_thumbnail     = album_cover_thumbnail_
    , external_album_covers     = external_album_covers_
    , audio                     = audio_
    }
      = "Audio"
        ++ I.cc
        [ "duration"                  `I.p` duration_
        , "title"                     `I.p` title_
        , "performer"                 `I.p` performer_
        , "file_name"                 `I.p` file_name_
        , "mime_type"                 `I.p` mime_type_
        , "album_cover_minithumbnail" `I.p` album_cover_minithumbnail_
        , "album_cover_thumbnail"     `I.p` album_cover_thumbnail_
        , "external_album_covers"     `I.p` external_album_covers_
        , "audio"                     `I.p` audio_
        ]

instance AT.FromJSON Audio where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "audio" -> parseAudio v
      _       -> mempty
    
    where
      parseAudio :: A.Value -> AT.Parser Audio
      parseAudio = A.withObject "Audio" $ \o -> do
        duration_                  <- o A..:?  "duration"
        title_                     <- o A..:?  "title"
        performer_                 <- o A..:?  "performer"
        file_name_                 <- o A..:?  "file_name"
        mime_type_                 <- o A..:?  "mime_type"
        album_cover_minithumbnail_ <- o A..:?  "album_cover_minithumbnail"
        album_cover_thumbnail_     <- o A..:?  "album_cover_thumbnail"
        external_album_covers_     <- o A..:?  "external_album_covers"
        audio_                     <- o A..:?  "audio"
        pure $ Audio
          { duration                  = duration_
          , title                     = title_
          , performer                 = performer_
          , file_name                 = file_name_
          , mime_type                 = mime_type_
          , album_cover_minithumbnail = album_cover_minithumbnail_
          , album_cover_thumbnail     = album_cover_thumbnail_
          , external_album_covers     = external_album_covers_
          , audio                     = audio_
          }
  parseJSON _ = mempty

