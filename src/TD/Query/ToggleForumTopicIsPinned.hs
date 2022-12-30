{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleForumTopicIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the pinned state of a forum topic; requires can_manage_topics administrator right in the supergroup. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics
data ToggleForumTopicIsPinned = ToggleForumTopicIsPinned
  { -- | Pass true to pin the topic; pass false to unpin it
    is_pinned :: Maybe Bool,
    -- | Message thread identifier of the forum topic
    message_thread_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleForumTopicIsPinned where
  show
    ToggleForumTopicIsPinned
      { is_pinned = is_pinned_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "ToggleForumTopicIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleForumTopicIsPinned where
  toJSON
    ToggleForumTopicIsPinned
      { is_pinned = is_pinned_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleForumTopicIsPinned",
          "is_pinned" A..= is_pinned_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
