module TD.Query.SetPinnedForumTopics
  (SetPinnedForumTopics(..)
  , defaultSetPinnedForumTopics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the order of pinned topics in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup. Returns 'TD.Data.Ok.Ok'
data SetPinnedForumTopics
  = SetPinnedForumTopics
    { chat_id         :: Maybe Int   -- ^ Chat identifier
    , forum_topic_ids :: Maybe [Int] -- ^ The new list of identifiers of the pinned forum topics
    }
  deriving (Eq, Show)

instance I.ShortShow SetPinnedForumTopics where
  shortShow
    SetPinnedForumTopics
      { chat_id         = chat_id_
      , forum_topic_ids = forum_topic_ids_
      }
        = "SetPinnedForumTopics"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "forum_topic_ids" `I.p` forum_topic_ids_
          ]

instance AT.ToJSON SetPinnedForumTopics where
  toJSON
    SetPinnedForumTopics
      { chat_id         = chat_id_
      , forum_topic_ids = forum_topic_ids_
      }
        = A.object
          [ "@type"           A..= AT.String "setPinnedForumTopics"
          , "chat_id"         A..= chat_id_
          , "forum_topic_ids" A..= forum_topic_ids_
          ]

defaultSetPinnedForumTopics :: SetPinnedForumTopics
defaultSetPinnedForumTopics =
  SetPinnedForumTopics
    { chat_id         = Nothing
    , forum_topic_ids = Nothing
    }

