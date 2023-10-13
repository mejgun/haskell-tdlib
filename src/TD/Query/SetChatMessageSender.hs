module TD.Query.SetChatMessageSender(SetChatMessageSender(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data SetChatMessageSender -- ^ Selects a message sender to send messages in a chat
  = SetChatMessageSender
    { chat_id           :: Maybe Int                         -- ^ Chat identifier
    , message_sender_id :: Maybe MessageSender.MessageSender -- ^ New message sender for the chat
    }
  deriving (Eq)

instance Show SetChatMessageSender where
  show
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
