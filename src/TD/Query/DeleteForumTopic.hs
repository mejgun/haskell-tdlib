{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all messages in a forum topic; requires can_delete_messages administrator rights in the supergroup unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages
data DeleteForumTopic = DeleteForumTopic
  { -- | Message thread identifier of the forum topic
    message_thread_id :: Maybe Int,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteForumTopic where
  show
    DeleteForumTopic
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "DeleteForumTopic"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON DeleteForumTopic where
  toJSON
    DeleteForumTopic
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteForumTopic",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
