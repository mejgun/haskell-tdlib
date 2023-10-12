module TD.Query.DeleteForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteForumTopic -- ^ Deletes all messages in a forum topic; requires can_delete_messages administrator right in the supergroup unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages
  = DeleteForumTopic
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier of the forum topic
    }
  deriving (Eq)

instance Show DeleteForumTopic where
  show
    DeleteForumTopic
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "DeleteForumTopic"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON DeleteForumTopic where
  toJSON
    DeleteForumTopic
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "deleteForumTopic"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]
