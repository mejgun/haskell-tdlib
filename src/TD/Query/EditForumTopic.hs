{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Edits title and icon of a topic in a forum supergroup chat; requires can_manage_topics administrator rights in the supergroup unless the user is creator of the topic
data EditForumTopic = EditForumTopic
  { -- | Identifier of the new custom emoji for topic icon. Telegram Premium users can use any custom emoji, other users can use only a custom emoji returned by getForumTopicDefaultIcons
    icon_custom_emoji_id :: Maybe Int,
    -- | New name of the topic; 1-128 characters
    name :: Maybe String,
    -- | Message thread identifier of the forum topic
    message_thread_id :: Maybe Int,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditForumTopic where
  show
    EditForumTopic
      { icon_custom_emoji_id = icon_custom_emoji_id_,
        name = name_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "EditForumTopic"
        ++ U.cc
          [ U.p "icon_custom_emoji_id" icon_custom_emoji_id_,
            U.p "name" name_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditForumTopic where
  toJSON
    EditForumTopic
      { icon_custom_emoji_id = icon_custom_emoji_id_,
        name = name_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editForumTopic",
          "icon_custom_emoji_id" A..= U.toS icon_custom_emoji_id_,
          "name" A..= name_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
