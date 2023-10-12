module TD.Data.VoiceNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.SpeechRecognitionResult as SpeechRecognitionResult
import qualified TD.Data.File as File

data VoiceNote
  = VoiceNote -- ^ Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
    { duration                  :: Maybe Int                                             -- ^ Duration of the voice note, in seconds; as defined by the sender
    , waveform                  :: Maybe BS.ByteString                                   -- ^ A waveform representation of the voice note in 5-bit format
    , mime_type                 :: Maybe T.Text                                          -- ^ MIME type of the file; as defined by the sender
    , speech_recognition_result :: Maybe SpeechRecognitionResult.SpeechRecognitionResult -- ^ Result of speech recognition in the voice note; may be null
    , voice                     :: Maybe File.File                                       -- ^ File containing the voice note
    }
  deriving (Eq)

instance Show VoiceNote where
  show VoiceNote
    { duration                  = duration_
    , waveform                  = waveform_
    , mime_type                 = mime_type_
    , speech_recognition_result = speech_recognition_result_
    , voice                     = voice_
    }
      = "VoiceNote"
        ++ I.cc
        [ "duration"                  `I.p` duration_
        , "waveform"                  `I.p` waveform_
        , "mime_type"                 `I.p` mime_type_
        , "speech_recognition_result" `I.p` speech_recognition_result_
        , "voice"                     `I.p` voice_
        ]

instance AT.FromJSON VoiceNote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "voiceNote" -> parseVoiceNote v
      _           -> mempty
    
    where
      parseVoiceNote :: A.Value -> AT.Parser VoiceNote
      parseVoiceNote = A.withObject "VoiceNote" $ \o -> do
        duration_                  <- o A..:?                       "duration"
        waveform_                  <- fmap I.readBytes <$> o A..:?  "waveform"
        mime_type_                 <- o A..:?                       "mime_type"
        speech_recognition_result_ <- o A..:?                       "speech_recognition_result"
        voice_                     <- o A..:?                       "voice"
        pure $ VoiceNote
          { duration                  = duration_
          , waveform                  = waveform_
          , mime_type                 = mime_type_
          , speech_recognition_result = speech_recognition_result_
          , voice                     = voice_
          }

instance AT.ToJSON VoiceNote where
  toJSON VoiceNote
    { duration                  = duration_
    , waveform                  = waveform_
    , mime_type                 = mime_type_
    , speech_recognition_result = speech_recognition_result_
    , voice                     = voice_
    }
      = A.object
        [ "@type"                     A..= AT.String "voiceNote"
        , "duration"                  A..= duration_
        , "waveform"                  A..= fmap I.writeBytes  waveform_
        , "mime_type"                 A..= mime_type_
        , "speech_recognition_result" A..= speech_recognition_result_
        , "voice"                     A..= voice_
        ]
