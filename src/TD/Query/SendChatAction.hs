{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatAction as ChatAction
import qualified Utils as U

-- |
-- Sends a notification about user activity in a chat @chat_id Chat identifier @message_thread_id If not 0, a message thread identifier in which the action was performed @action The action description; pass null to cancel the currently active action
data SendChatAction = SendChatAction
  { -- |
    action :: Maybe ChatAction.ChatAction,
    -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendChatAction where
  show
    SendChatAction
      { action = action,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      "SendChatAction"
        ++ U.cc
          [ U.p "action" action,
            U.p "message_thread_id" message_thread_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SendChatAction where
  toJSON
    SendChatAction
      { action = action,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "sendChatAction",
          "action" A..= action,
          "message_thread_id" A..= message_thread_id,
          "chat_id" A..= chat_id
        ]
