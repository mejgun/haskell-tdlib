module TD.Query.GetForumTopic
  (GetForumTopic(..)
  , defaultGetForumTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a topic in a forum supergroup chat or a chat with a bot with topics. Returns 'TD.Data.ForumTopic.ForumTopic'
data GetForumTopic
  = GetForumTopic
    { chat_id        :: Maybe Int -- ^ Identifier of the chat
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopic where
  shortShow
    GetForumTopic
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "GetForumTopic"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON GetForumTopic where
  toJSON
    GetForumTopic
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getForumTopic"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultGetForumTopic :: GetForumTopic
defaultGetForumTopic =
  GetForumTopic
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

