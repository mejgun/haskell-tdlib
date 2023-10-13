module TD.Query.DeleteChatMessagesBySender(DeleteChatMessagesBySender(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data DeleteChatMessagesBySender -- ^ Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator privileges
  = DeleteChatMessagesBySender
    { chat_id   :: Maybe Int                         -- ^ Chat identifier
    , sender_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of messages to delete
    }
  deriving (Eq)

instance Show DeleteChatMessagesBySender where
  show
    DeleteChatMessagesBySender
      { chat_id   = chat_id_
      , sender_id = sender_id_
      }
        = "DeleteChatMessagesBySender"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "sender_id" `I.p` sender_id_
          ]

instance AT.ToJSON DeleteChatMessagesBySender where
  toJSON
    DeleteChatMessagesBySender
      { chat_id   = chat_id_
      , sender_id = sender_id_
      }
        = A.object
          [ "@type"     A..= AT.String "deleteChatMessagesBySender"
          , "chat_id"   A..= chat_id_
          , "sender_id" A..= sender_id_
          ]
