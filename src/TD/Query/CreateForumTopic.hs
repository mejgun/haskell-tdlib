{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon
import qualified Utils as U

-- |
-- Creates a topic in a forum supergroup chat; requires can_manage_topics rights in the supergroup
data CreateForumTopic = CreateForumTopic
  { -- | Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons
    icon :: Maybe ForumTopicIcon.ForumTopicIcon,
    -- | Name of the topic; 1-128 characters
    name :: Maybe String,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateForumTopic where
  show
    CreateForumTopic
      { icon = icon_,
        name = name_,
        chat_id = chat_id_
      } =
      "CreateForumTopic"
        ++ U.cc
          [ U.p "icon" icon_,
            U.p "name" name_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON CreateForumTopic where
  toJSON
    CreateForumTopic
      { icon = icon_,
        name = name_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "createForumTopic",
          "icon" A..= icon_,
          "name" A..= name_,
          "chat_id" A..= chat_id_
        ]
