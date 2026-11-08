module TD.Query.RecognizeSpeechInFile
  (RecognizeSpeechInFile(..)
  , defaultRecognizeSpeechInFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Recognizes speech in an audio file and returns the recognized text. The file must be in OGG format with Opus codec and must have size up to 1 MB. The same rules as for recognizeSpeech apply to the Telegram Premium requirement and speech recognition trial; must not be used in secret chats. Returns 'TD.Data.Text.Text'
data RecognizeSpeechInFile
  = RecognizeSpeechInFile
    { audio_file     :: Maybe InputFile.InputFile -- ^ The audio file
    , recognition_id :: Maybe Int                 -- ^ Unique identifier of the speech recognition, which will be used in updateSpeechRecognitionInFile to send partially recognized text; pass 0 if partial results aren't needed
    }
  deriving (Eq, Show)

instance I.ShortShow RecognizeSpeechInFile where
  shortShow
    RecognizeSpeechInFile
      { audio_file     = audio_file_
      , recognition_id = recognition_id_
      }
        = "RecognizeSpeechInFile"
          ++ I.cc
          [ "audio_file"     `I.p` audio_file_
          , "recognition_id" `I.p` recognition_id_
          ]

instance AT.ToJSON RecognizeSpeechInFile where
  toJSON
    RecognizeSpeechInFile
      { audio_file     = audio_file_
      , recognition_id = recognition_id_
      }
        = A.object
          [ "@type"          A..= AT.String "recognizeSpeechInFile"
          , "audio_file"     A..= audio_file_
          , "recognition_id" A..= fmap I.writeInt64  recognition_id_
          ]

defaultRecognizeSpeechInFile :: RecognizeSpeechInFile
defaultRecognizeSpeechInFile =
  RecognizeSpeechInFile
    { audio_file     = Nothing
    , recognition_id = Nothing
    }

