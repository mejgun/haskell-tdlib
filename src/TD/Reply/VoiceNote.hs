{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.VoiceNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.File as File
import qualified Utils as U

data VoiceNote = -- | Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel @duration Duration of the voice note, in seconds; as defined by the sender
  VoiceNote
  { -- |
    voice :: Maybe File.File,
    -- |
    mime_type :: Maybe String,
    -- | A waveform representation of the voice note in 5-bit format @mime_type MIME type of the file; as defined by the sender @voice File containing the voice note
    waveform :: Maybe String,
    -- |
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show VoiceNote where
  show
    VoiceNote
      { voice = voice,
        mime_type = mime_type,
        waveform = waveform,
        duration = duration
      } =
      "VoiceNote"
        ++ U.cc
          [ U.p "voice" voice,
            U.p "mime_type" mime_type,
            U.p "waveform" waveform,
            U.p "duration" duration
          ]

instance T.FromJSON VoiceNote where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "voiceNote" -> parseVoiceNote v
      _ -> fail ""
    where
      parseVoiceNote :: A.Value -> T.Parser VoiceNote
      parseVoiceNote = A.withObject "VoiceNote" $ \o -> do
        voice_ <- o A..:? "voice"
        mime_type_ <- o A..:? "mime_type"
        waveform_ <- o A..:? "waveform"
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ VoiceNote {voice = voice_, mime_type = mime_type_, waveform = waveform_, duration = duration_}
  parseJSON _ = fail ""

instance T.ToJSON VoiceNote where
  toJSON
    VoiceNote
      { voice = voice,
        mime_type = mime_type,
        waveform = waveform,
        duration = duration
      } =
      A.object
        [ "@type" A..= T.String "voiceNote",
          "voice" A..= voice,
          "mime_type" A..= mime_type,
          "waveform" A..= waveform,
          "duration" A..= duration
        ]
