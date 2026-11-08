module TD.Query.GetSpeechRecognitionLanguages
  (GetSpeechRecognitionLanguages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns 1-3 most probable languages of speech in voice notes. Returns 'TD.Data.SpeechRecognitionLanguages.SpeechRecognitionLanguages'
data GetSpeechRecognitionLanguages
  = GetSpeechRecognitionLanguages
    { chat_id :: Maybe Int -- ^ Identifier of the chat; pass 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow GetSpeechRecognitionLanguages where
  shortShow
    GetSpeechRecognitionLanguages
      { chat_id = chat_id_
      }
        = "GetSpeechRecognitionLanguages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetSpeechRecognitionLanguages where
  toJSON
    GetSpeechRecognitionLanguages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getSpeechRecognitionLanguages"
          , "chat_id" A..= chat_id_
          ]

