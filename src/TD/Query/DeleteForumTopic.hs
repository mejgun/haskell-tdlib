module TD.Query.DeleteForumTopic
  (DeleteForumTopic(..)
  , defaultDeleteForumTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_delete_messages administrator right in the supergroup unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages. Returns 'TD.Data.Ok.Ok'
data DeleteForumTopic
  = DeleteForumTopic
    { chat_id        :: Maybe Int -- ^ Identifier of the chat
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteForumTopic where
  shortShow
    DeleteForumTopic
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "DeleteForumTopic"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON DeleteForumTopic where
  toJSON
    DeleteForumTopic
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "deleteForumTopic"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultDeleteForumTopic :: DeleteForumTopic
defaultDeleteForumTopic =
  DeleteForumTopic
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

