module TD.Query.ReadAllForumTopicMentions
  (ReadAllForumTopicMentions(..)
  , defaultReadAllForumTopicMentions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Marks all mentions in a topic in a forum supergroup chat as read. Returns 'TD.Data.Ok.Ok'
data ReadAllForumTopicMentions
  = ReadAllForumTopicMentions
    { chat_id        :: Maybe Int -- ^ Chat identifier
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier in which mentions are marked as read
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllForumTopicMentions where
  shortShow
    ReadAllForumTopicMentions
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "ReadAllForumTopicMentions"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON ReadAllForumTopicMentions where
  toJSON
    ReadAllForumTopicMentions
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "readAllForumTopicMentions"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultReadAllForumTopicMentions :: ReadAllForumTopicMentions
defaultReadAllForumTopicMentions =
  ReadAllForumTopicMentions
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

