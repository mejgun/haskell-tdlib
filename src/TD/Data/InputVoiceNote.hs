module TD.Data.InputVoiceNote
  ( InputVoiceNote(..)    
  , defaultInputVoiceNote 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified Data.ByteString as BS

data InputVoiceNote
  = InputVoiceNote -- ^ A voice note to be sent
    { voice_note :: Maybe InputFile.InputFile -- ^ Voice note file to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio
    , duration   :: Maybe Int                 -- ^ Duration of the voice note, in seconds
    , waveform   :: Maybe BS.ByteString       -- ^ Waveform representation of the voice note in 5-bit format
    }
  deriving (Eq, Show)

instance I.ShortShow InputVoiceNote where
  shortShow InputVoiceNote
    { voice_note = voice_note_
    , duration   = duration_
    , waveform   = waveform_
    }
      = "InputVoiceNote"
        ++ I.cc
        [ "voice_note" `I.p` voice_note_
        , "duration"   `I.p` duration_
        , "waveform"   `I.p` waveform_
        ]

instance AT.FromJSON InputVoiceNote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputVoiceNote" -> parseInputVoiceNote v
      _                -> mempty
    
    where
      parseInputVoiceNote :: A.Value -> AT.Parser InputVoiceNote
      parseInputVoiceNote = A.withObject "InputVoiceNote" $ \o -> do
        voice_note_ <- o A..:?                       "voice_note"
        duration_   <- o A..:?                       "duration"
        waveform_   <- fmap I.readBytes <$> o A..:?  "waveform"
        pure $ InputVoiceNote
          { voice_note = voice_note_
          , duration   = duration_
          , waveform   = waveform_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputVoiceNote where
  toJSON InputVoiceNote
    { voice_note = voice_note_
    , duration   = duration_
    , waveform   = waveform_
    }
      = A.object
        [ "@type"      A..= AT.String "inputVoiceNote"
        , "voice_note" A..= voice_note_
        , "duration"   A..= duration_
        , "waveform"   A..= fmap I.writeBytes  waveform_
        ]

defaultInputVoiceNote :: InputVoiceNote
defaultInputVoiceNote =
  InputVoiceNote
    { voice_note = Nothing
    , duration   = Nothing
    , waveform   = Nothing
    }

