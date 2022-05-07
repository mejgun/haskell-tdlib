{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatMessageSender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Selects a message sender to send messages in a chat @chat_id Chat identifier @message_sender_id New message sender for the chat
data SetChatMessageSender = SetChatMessageSender
  { -- |
    message_sender_id :: Maybe MessageSender.MessageSender,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatMessageSender where
  show
    SetChatMessageSender
      { message_sender_id = message_sender_id,
        chat_id = chat_id
      } =
      "SetChatMessageSender"
        ++ U.cc
          [ U.p "message_sender_id" message_sender_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatMessageSender where
  toJSON
    SetChatMessageSender
      { message_sender_id = message_sender_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatMessageSender",
          "message_sender_id" A..= message_sender_id,
          "chat_id" A..= chat_id
        ]
