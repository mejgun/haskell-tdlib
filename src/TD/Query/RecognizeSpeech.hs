module TD.Query.RecognizeSpeech
  (RecognizeSpeech(..)
  , defaultRecognizeSpeech
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Recognizes speech in a video note or a voice note message. Returns 'TD.Data.Ok.Ok'
data RecognizeSpeech
  = RecognizeSpeech
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int -- ^ Identifier of the message. Use messageProperties.can_recognize_speech to check whether the message is suitable
    }
  deriving (Eq, Show)

instance I.ShortShow RecognizeSpeech where
  shortShow
    RecognizeSpeech
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "RecognizeSpeech"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON RecognizeSpeech where
  toJSON
    RecognizeSpeech
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "recognizeSpeech"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultRecognizeSpeech :: RecognizeSpeech
defaultRecognizeSpeech =
  RecognizeSpeech
    { chat_id    = Nothing
    , message_id = Nothing
    }

