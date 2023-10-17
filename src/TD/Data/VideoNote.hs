module TD.Data.VideoNote
  (VideoNote(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.SpeechRecognitionResult as SpeechRecognitionResult
import qualified TD.Data.File as File

data VideoNote
  = VideoNote -- ^ Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
    { duration                  :: Maybe Int                                             -- ^ Duration of the video, in seconds; as defined by the sender
    , waveform                  :: Maybe BS.ByteString                                   -- ^ A waveform representation of the video note's audio in 5-bit format; may be empty if unknown
    , _length                   :: Maybe Int                                             -- ^ Video width and height; as defined by the sender
    , minithumbnail             :: Maybe Minithumbnail.Minithumbnail                     -- ^ Video minithumbnail; may be null
    , thumbnail                 :: Maybe Thumbnail.Thumbnail                             -- ^ Video thumbnail in JPEG format; as defined by the sender; may be null
    , speech_recognition_result :: Maybe SpeechRecognitionResult.SpeechRecognitionResult -- ^ Result of speech recognition in the video note; may be null
    , video                     :: Maybe File.File                                       -- ^ File containing the video
    }
  deriving (Eq, Show)

instance I.ShortShow VideoNote where
  shortShow VideoNote
    { duration                  = duration_
    , waveform                  = waveform_
    , _length                   = _length_
    , minithumbnail             = minithumbnail_
    , thumbnail                 = thumbnail_
    , speech_recognition_result = speech_recognition_result_
    , video                     = video_
    }
      = "VideoNote"
        ++ I.cc
        [ "duration"                  `I.p` duration_
        , "waveform"                  `I.p` waveform_
        , "_length"                   `I.p` _length_
        , "minithumbnail"             `I.p` minithumbnail_
        , "thumbnail"                 `I.p` thumbnail_
        , "speech_recognition_result" `I.p` speech_recognition_result_
        , "video"                     `I.p` video_
        ]

instance AT.FromJSON VideoNote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoNote" -> parseVideoNote v
      _           -> mempty
    
    where
      parseVideoNote :: A.Value -> AT.Parser VideoNote
      parseVideoNote = A.withObject "VideoNote" $ \o -> do
        duration_                  <- o A..:?                       "duration"
        waveform_                  <- fmap I.readBytes <$> o A..:?  "waveform"
        _length_                   <- o A..:?                       "length"
        minithumbnail_             <- o A..:?                       "minithumbnail"
        thumbnail_                 <- o A..:?                       "thumbnail"
        speech_recognition_result_ <- o A..:?                       "speech_recognition_result"
        video_                     <- o A..:?                       "video"
        pure $ VideoNote
          { duration                  = duration_
          , waveform                  = waveform_
          , _length                   = _length_
          , minithumbnail             = minithumbnail_
          , thumbnail                 = thumbnail_
          , speech_recognition_result = speech_recognition_result_
          , video                     = video_
          }
  parseJSON _ = mempty

