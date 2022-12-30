{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.VoiceNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.SpeechRecognitionResult as SpeechRecognitionResult
import qualified Utils as U

-- |
data VoiceNote = -- | Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
  VoiceNote
  { -- | File containing the voice note
    voice :: Maybe File.File,
    -- | Result of speech recognition in the voice note; may be null
    speech_recognition_result :: Maybe SpeechRecognitionResult.SpeechRecognitionResult,
    -- | MIME type of the file; as defined by the sender
    mime_type :: Maybe String,
    -- | A waveform representation of the voice note in 5-bit format
    waveform :: Maybe String,
    -- | Duration of the voice note, in seconds; as defined by the sender
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show VoiceNote where
  show
    VoiceNote
      { voice = voice_,
        speech_recognition_result = speech_recognition_result_,
        mime_type = mime_type_,
        waveform = waveform_,
        duration = duration_
      } =
      "VoiceNote"
        ++ U.cc
          [ U.p "voice" voice_,
            U.p "speech_recognition_result" speech_recognition_result_,
            U.p "mime_type" mime_type_,
            U.p "waveform" waveform_,
            U.p "duration" duration_
          ]

instance T.FromJSON VoiceNote where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "voiceNote" -> parseVoiceNote v
      _ -> mempty
    where
      parseVoiceNote :: A.Value -> T.Parser VoiceNote
      parseVoiceNote = A.withObject "VoiceNote" $ \o -> do
        voice_ <- o A..:? "voice"
        speech_recognition_result_ <- o A..:? "speech_recognition_result"
        mime_type_ <- o A..:? "mime_type"
        waveform_ <- o A..:? "waveform"
        duration_ <- o A..:? "duration"
        return $ VoiceNote {voice = voice_, speech_recognition_result = speech_recognition_result_, mime_type = mime_type_, waveform = waveform_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON VoiceNote where
  toJSON
    VoiceNote
      { voice = voice_,
        speech_recognition_result = speech_recognition_result_,
        mime_type = mime_type_,
        waveform = waveform_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "voiceNote",
          "voice" A..= voice_,
          "speech_recognition_result" A..= speech_recognition_result_,
          "mime_type" A..= mime_type_,
          "waveform" A..= waveform_,
          "duration" A..= duration_
        ]
