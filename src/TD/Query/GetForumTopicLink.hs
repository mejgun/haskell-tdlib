module TD.Query.GetForumTopicLink
  (GetForumTopicLink(..)
  , defaultGetForumTopicLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link to a topic in a forum supergroup chat. This is an offline method. Returns 'TD.Data.MessageLink.MessageLink'
data GetForumTopicLink
  = GetForumTopicLink
    { chat_id        :: Maybe Int -- ^ Identifier of the chat
    , forum_topic_id :: Maybe Int -- ^ Forum topic identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopicLink where
  shortShow
    GetForumTopicLink
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = "GetForumTopicLink"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          ]

instance AT.ToJSON GetForumTopicLink where
  toJSON
    GetForumTopicLink
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getForumTopicLink"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          ]

defaultGetForumTopicLink :: GetForumTopicLink
defaultGetForumTopicLink =
  GetForumTopicLink
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    }

