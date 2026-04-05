module TD.Query.ReadAllForumTopicPollVotes
  (ReadAllForumTopicPollVotes(..)
  , defaultReadAllForumTopicPollVotes
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all poll votes in a topic in a forum supergroup chat as read. Returns 'TD.Data.Ok.Ok'
data ReadAllForumTopicPollVotes
  = ReadAllForumTopicPollVotes
    { chat_id        :: Maybe Int -- ^ Chat identifier
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier in which poll votes are marked as read
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllForumTopicPollVotes where
  shortShow
    ReadAllForumTopicPollVotes
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "ReadAllForumTopicPollVotes"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON ReadAllForumTopicPollVotes where
  toJSON
    ReadAllForumTopicPollVotes
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "readAllForumTopicPollVotes"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultReadAllForumTopicPollVotes :: ReadAllForumTopicPollVotes
defaultReadAllForumTopicPollVotes =
  ReadAllForumTopicPollVotes
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

