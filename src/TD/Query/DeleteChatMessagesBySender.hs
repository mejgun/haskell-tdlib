{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteChatMessagesBySender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator privileges @chat_id Chat identifier @sender_id Identifier of the sender of messages to delete
data DeleteChatMessagesBySender = DeleteChatMessagesBySender
  { -- |
    sender_id :: Maybe MessageSender.MessageSender,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatMessagesBySender where
  show
    DeleteChatMessagesBySender
      { sender_id = sender_id,
        chat_id = chat_id
      } =
      "DeleteChatMessagesBySender"
        ++ U.cc
          [ U.p "sender_id" sender_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteChatMessagesBySender where
  toJSON
    DeleteChatMessagesBySender
      { sender_id = sender_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteChatMessagesBySender",
          "sender_id" A..= sender_id,
          "chat_id" A..= chat_id
        ]
