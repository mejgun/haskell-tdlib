module TD.Query.GetChatAvailableMessageSenders
  (GetChatAvailableMessageSenders(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetChatAvailableMessageSenders -- ^ Returns list of message sender identifiers, which can be used to send messages in a chat
  = GetChatAvailableMessageSenders
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatAvailableMessageSenders where
  show
    GetChatAvailableMessageSenders
      { chat_id = chat_id_
      }
        = "GetChatAvailableMessageSenders"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatAvailableMessageSenders where
  toJSON
    GetChatAvailableMessageSenders
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatAvailableMessageSenders"
          , "chat_id" A..= chat_id_
          ]

