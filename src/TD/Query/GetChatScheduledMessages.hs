module TD.Query.GetChatScheduledMessages
  (GetChatScheduledMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
data GetChatScheduledMessages
  = GetChatScheduledMessages
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetChatScheduledMessages where
  show
    GetChatScheduledMessages
      { chat_id = chat_id_
      }
        = "GetChatScheduledMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatScheduledMessages where
  toJSON
    GetChatScheduledMessages
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatScheduledMessages"
          , "chat_id" A..= chat_id_
          ]

