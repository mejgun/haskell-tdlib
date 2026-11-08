module TD.Query.FixRecognizedRichMessageWithAi
  (FixRecognizedRichMessageWithAi(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputRichMessage as InputRichMessage

-- | Fixes a rich message with text received as a result of speech recognition using an AI model by correcting recognition errors and adding punctuation. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.RichMessage.RichMessage'
data FixRecognizedRichMessageWithAi
  = FixRecognizedRichMessageWithAi
    { message :: Maybe InputRichMessage.InputRichMessage -- ^ The message with the recognized text
    }
  deriving (Eq, Show)

instance I.ShortShow FixRecognizedRichMessageWithAi where
  shortShow
    FixRecognizedRichMessageWithAi
      { message = message_
      }
        = "FixRecognizedRichMessageWithAi"
          ++ I.cc
          [ "message" `I.p` message_
          ]

instance AT.ToJSON FixRecognizedRichMessageWithAi where
  toJSON
    FixRecognizedRichMessageWithAi
      { message = message_
      }
        = A.object
          [ "@type"   A..= AT.String "fixRecognizedRichMessageWithAi"
          , "message" A..= message_
          ]

