module TD.Query.UnpinAllForumTopicMessages
  (UnpinAllForumTopicMessages(..)
  , defaultUnpinAllForumTopicMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all pinned messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_pin_messages member right in the supergroup. Returns 'TD.Data.Ok.Ok'
data UnpinAllForumTopicMessages
  = UnpinAllForumTopicMessages
    { chat_id        :: Maybe Int -- ^ Identifier of the chat
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier in which messages will be unpinned
    }
  deriving (Eq, Show)

instance I.ShortShow UnpinAllForumTopicMessages where
  shortShow
    UnpinAllForumTopicMessages
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "UnpinAllForumTopicMessages"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON UnpinAllForumTopicMessages where
  toJSON
    UnpinAllForumTopicMessages
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "unpinAllForumTopicMessages"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultUnpinAllForumTopicMessages :: UnpinAllForumTopicMessages
defaultUnpinAllForumTopicMessages =
  UnpinAllForumTopicMessages
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

