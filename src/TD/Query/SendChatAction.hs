{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAction as ChatAction
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
      { action = action_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SendChatAction"
        ++ U.cc
          [ U.p "action" action_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendChatAction where
  toJSON
    SendChatAction
      { action = action_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendChatAction",
          "action" A..= action_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
