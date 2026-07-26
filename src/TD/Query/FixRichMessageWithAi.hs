module TD.Query.FixRichMessageWithAi
  (FixRichMessageWithAi(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputRichMessage as InputRichMessage

-- | Fixes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.RichMessage.RichMessage'
data FixRichMessageWithAi
  = FixRichMessageWithAi
    { message :: Maybe InputRichMessage.InputRichMessage -- ^ The original message
    }
  deriving (Eq, Show)

instance I.ShortShow FixRichMessageWithAi where
  shortShow
    FixRichMessageWithAi
      { message = message_
      }
        = "FixRichMessageWithAi"
          ++ I.cc
          [ "message" `I.p` message_
          ]

instance AT.ToJSON FixRichMessageWithAi where
  toJSON
    FixRichMessageWithAi
      { message = message_
      }
        = A.object
          [ "@type"   A..= AT.String "fixRichMessageWithAi"
          , "message" A..= message_
          ]

