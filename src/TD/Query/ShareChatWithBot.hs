{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ShareChatWithBot where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Shares a chat after pressing a keyboardButtonTypeRequestChat button with the bot
data ShareChatWithBot = ShareChatWithBot
  { -- | Pass true to check that the chat can be shared by the button instead of actually sharing it. Doesn't check bot_is_member and bot_administrator_rights restrictions.
    -- If the bot must be a member, then all chats from getGroupsInCommon and all chats, where the user can add the bot, are suitable. In the latter case the bot will be automatically added to the chat.
    -- If the bot must be an administrator, then all chats, where the bot already has requested rights or can be added to administrators by the user, are suitable. In the latter case the bot will be automatically granted requested rights
    only_check :: Maybe Bool,
    -- | Identifier of the shared chat
    shared_chat_id :: Maybe Int,
    -- | Identifier of the button
    button_id :: Maybe Int,
    -- | Identifier of the message with the button
    message_id :: Maybe Int,
    -- | Identifier of the chat with the bot
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ShareChatWithBot where
  show
    ShareChatWithBot
      { only_check = only_check_,
        shared_chat_id = shared_chat_id_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "ShareChatWithBot"
        ++ U.cc
          [ U.p "only_check" only_check_,
            U.p "shared_chat_id" shared_chat_id_,
            U.p "button_id" button_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ShareChatWithBot where
  toJSON
    ShareChatWithBot
      { only_check = only_check_,
        shared_chat_id = shared_chat_id_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "shareChatWithBot",
          "only_check" A..= only_check_,
          "shared_chat_id" A..= shared_chat_id_,
          "button_id" A..= button_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
