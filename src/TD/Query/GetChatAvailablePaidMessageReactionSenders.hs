module TD.Query.GetChatAvailablePaidMessageReactionSenders
  (GetChatAvailablePaidMessageReactionSenders(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of message sender identifiers, which can be used to send a paid reaction in a chat. Returns 'TD.Data.MessageSenders.MessageSenders'
data GetChatAvailablePaidMessageReactionSenders
  = GetChatAvailablePaidMessageReactionSenders
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatAvailablePaidMessageReactionSenders where
  shortShow
    GetChatAvailablePaidMessageReactionSenders
      { chat_id = chat_id_
      }
        = "GetChatAvailablePaidMessageReactionSenders"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatAvailablePaidMessageReactionSenders where
  toJSON
    GetChatAvailablePaidMessageReactionSenders
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatAvailablePaidMessageReactionSenders"
          , "chat_id" A..= chat_id_
          ]

