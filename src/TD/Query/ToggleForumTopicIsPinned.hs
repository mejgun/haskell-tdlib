module TD.Query.ToggleForumTopicIsPinned(ToggleForumTopicIsPinned(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleForumTopicIsPinned -- ^ Changes the pinned state of a forum topic; requires can_manage_topics administrator right in the supergroup. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics
  = ToggleForumTopicIsPinned
    { chat_id           :: Maybe Int  -- ^ Chat identifier
    , message_thread_id :: Maybe Int  -- ^ Message thread identifier of the forum topic
    , is_pinned         :: Maybe Bool -- ^ Pass true to pin the topic; pass false to unpin it
    }
  deriving (Eq)

instance Show ToggleForumTopicIsPinned where
  show
    ToggleForumTopicIsPinned
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , is_pinned         = is_pinned_
      }
        = "ToggleForumTopicIsPinned"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          , "is_pinned"         `I.p` is_pinned_
          ]

instance AT.ToJSON ToggleForumTopicIsPinned where
  toJSON
    ToggleForumTopicIsPinned
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , is_pinned         = is_pinned_
      }
        = A.object
          [ "@type"             A..= AT.String "toggleForumTopicIsPinned"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          , "is_pinned"         A..= is_pinned_
          ]
