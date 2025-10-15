module TD.Query.ToggleForumTopicIsPinned
  (ToggleForumTopicIsPinned(..)
  , defaultToggleForumTopicIsPinned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the pinned state of a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics. Returns 'TD.Data.Ok.Ok'
data ToggleForumTopicIsPinned
  = ToggleForumTopicIsPinned
    { chat_id        :: Maybe Int  -- ^ Chat identifier
    , forum_topic_id :: Maybe Int  -- ^ Forum topic identifier
    , is_pinned      :: Maybe Bool -- ^ Pass true to pin the topic; pass false to unpin it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleForumTopicIsPinned where
  shortShow
    ToggleForumTopicIsPinned
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , is_pinned      = is_pinned_
      }
        = "ToggleForumTopicIsPinned"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          , "is_pinned"      `I.p` is_pinned_
          ]

instance AT.ToJSON ToggleForumTopicIsPinned where
  toJSON
    ToggleForumTopicIsPinned
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , is_pinned      = is_pinned_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleForumTopicIsPinned"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          , "is_pinned"      A..= is_pinned_
          ]

defaultToggleForumTopicIsPinned :: ToggleForumTopicIsPinned
defaultToggleForumTopicIsPinned =
  ToggleForumTopicIsPinned
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    , is_pinned      = Nothing
    }

