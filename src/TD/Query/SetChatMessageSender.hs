{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatMessageSender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
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
      { message_sender_id = message_sender_id_,
        chat_id = chat_id_
      } =
      "SetChatMessageSender"
        ++ U.cc
          [ U.p "message_sender_id" message_sender_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatMessageSender where
  toJSON
    SetChatMessageSender
      { message_sender_id = message_sender_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatMessageSender",
          "message_sender_id" A..= message_sender_id_,
          "chat_id" A..= chat_id_
        ]
