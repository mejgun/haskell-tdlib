module TD.Query.SetChatMessageSender
  (SetChatMessageSender(..)
  , defaultSetChatMessageSender
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Selects a message sender to send messages in a chat. Returns 'TD.Data.Ok.Ok'
data SetChatMessageSender
  = SetChatMessageSender
    { chat_id           :: Maybe Int                         -- ^ Chat identifier
    , message_sender_id :: Maybe MessageSender.MessageSender -- ^ New message sender for the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatMessageSender where
  shortShow
    SetChatMessageSender
      { chat_id           = chat_id_
      , message_sender_id = message_sender_id_
      }
        = "SetChatMessageSender"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_sender_id" `I.p` message_sender_id_
          ]

instance AT.ToJSON SetChatMessageSender where
  toJSON
    SetChatMessageSender
      { chat_id           = chat_id_
      , message_sender_id = message_sender_id_
      }
        = A.object
          [ "@type"             A..= AT.String "setChatMessageSender"
          , "chat_id"           A..= chat_id_
          , "message_sender_id" A..= message_sender_id_
          ]

defaultSetChatMessageSender :: SetChatMessageSender
defaultSetChatMessageSender =
  SetChatMessageSender
    { chat_id           = Nothing
    , message_sender_id = Nothing
    }

