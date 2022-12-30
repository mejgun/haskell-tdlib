{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleForumTopicIsClosed where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup unless the user is creator of the topic
data ToggleForumTopicIsClosed = ToggleForumTopicIsClosed
  { -- | Pass true to close the topic; pass false to reopen it
    is_closed :: Maybe Bool,
    -- | Message thread identifier of the forum topic
    message_thread_id :: Maybe Int,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleForumTopicIsClosed where
  show
    ToggleForumTopicIsClosed
      { is_closed = is_closed_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "ToggleForumTopicIsClosed"
        ++ U.cc
          [ U.p "is_closed" is_closed_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleForumTopicIsClosed where
  toJSON
    ToggleForumTopicIsClosed
      { is_closed = is_closed_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleForumTopicIsClosed",
          "is_closed" A..= is_closed_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
