{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.VideoNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.SpeechRecognitionResult as SpeechRecognitionResult
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data VideoNote = -- | Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
  VideoNote
  { -- | File containing the video
    video :: Maybe File.File,
    -- | Result of speech recognition in the video note; may be null
    speech_recognition_result :: Maybe SpeechRecognitionResult.SpeechRecognitionResult,
    -- | Video thumbnail in JPEG format; as defined by the sender; may be null
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Video minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | Video width and height; as defined by the sender
    _length :: Maybe Int,
    -- | A waveform representation of the video note's audio in 5-bit format; may be empty if unknown
    waveform :: Maybe String,
    -- | Duration of the video, in seconds; as defined by the sender
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show VideoNote where
  show
    VideoNote
      { video = video_,
        speech_recognition_result = speech_recognition_result_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        _length = _length_,
        waveform = waveform_,
        duration = duration_
      } =
      "VideoNote"
        ++ U.cc
          [ U.p "video" video_,
            U.p "speech_recognition_result" speech_recognition_result_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "_length" _length_,
            U.p "waveform" waveform_,
            U.p "duration" duration_
          ]

instance T.FromJSON VideoNote where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "videoNote" -> parseVideoNote v
      _ -> mempty
    where
      parseVideoNote :: A.Value -> T.Parser VideoNote
      parseVideoNote = A.withObject "VideoNote" $ \o -> do
        video_ <- o A..:? "video"
        speech_recognition_result_ <- o A..:? "speech_recognition_result"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        _length_ <- o A..:? "length"
        waveform_ <- o A..:? "waveform"
        duration_ <- o A..:? "duration"
        return $ VideoNote {video = video_, speech_recognition_result = speech_recognition_result_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, _length = _length_, waveform = waveform_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON VideoNote where
  toJSON
    VideoNote
      { video = video_,
        speech_recognition_result = speech_recognition_result_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        _length = _length_,
        waveform = waveform_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "videoNote",
          "video" A..= video_,
          "speech_recognition_result" A..= speech_recognition_result_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "length" A..= _length_,
          "waveform" A..= waveform_,
          "duration" A..= duration_
        ]
