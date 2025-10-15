module TD.Query.ReadAllForumTopicReactions
  (ReadAllForumTopicReactions(..)
  , defaultReadAllForumTopicReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all reactions in a topic in a forum supergroup chat or a chat with a bot with topics as read. Returns 'TD.Data.Ok.Ok'
data ReadAllForumTopicReactions
  = ReadAllForumTopicReactions
    { chat_id        :: Maybe Int -- ^ Chat identifier
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier in which reactions are marked as read
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllForumTopicReactions where
  shortShow
    ReadAllForumTopicReactions
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "ReadAllForumTopicReactions"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON ReadAllForumTopicReactions where
  toJSON
    ReadAllForumTopicReactions
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "readAllForumTopicReactions"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultReadAllForumTopicReactions :: ReadAllForumTopicReactions
defaultReadAllForumTopicReactions =
  ReadAllForumTopicReactions
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

