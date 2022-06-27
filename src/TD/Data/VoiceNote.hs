{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.VoiceNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

-- |
data VoiceNote = -- | Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
  VoiceNote
  { -- |
    voice :: Maybe File.File,
    -- | Recognized text of the voice note; Premium users only. Call recognizeSpeech to get recognized text of the voice note @voice File containing the voice note
    recognized_text :: Maybe String,
    -- |
    is_recognized :: Maybe Bool,
    -- | MIME type of the file; as defined by the sender @is_recognized True, if speech recognition is completed; Premium users only
    mime_type :: Maybe String,
    -- |
    waveform :: Maybe String,
    -- | Duration of the voice note, in seconds; as defined by the sender @waveform A waveform representation of the voice note in 5-bit format
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show VoiceNote where
  show
    VoiceNote
      { voice = voice_,
        recognized_text = recognized_text_,
        is_recognized = is_recognized_,
        mime_type = mime_type_,
        waveform = waveform_,
        duration = duration_
      } =
      "VoiceNote"
        ++ U.cc
          [ U.p "voice" voice_,
            U.p "recognized_text" recognized_text_,
            U.p "is_recognized" is_recognized_,
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
        recognized_text_ <- o A..:? "recognized_text"
        is_recognized_ <- o A..:? "is_recognized"
        mime_type_ <- o A..:? "mime_type"
        waveform_ <- o A..:? "waveform"
        duration_ <- o A..:? "duration"
        return $ VoiceNote {voice = voice_, recognized_text = recognized_text_, is_recognized = is_recognized_, mime_type = mime_type_, waveform = waveform_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON VoiceNote where
  toJSON
    VoiceNote
      { voice = voice_,
        recognized_text = recognized_text_,
        is_recognized = is_recognized_,
        mime_type = mime_type_,
        waveform = waveform_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "voiceNote",
          "voice" A..= voice_,
          "recognized_text" A..= recognized_text_,
          "is_recognized" A..= is_recognized_,
          "mime_type" A..= mime_type_,
          "waveform" A..= waveform_,
          "duration" A..= duration_
        ]
