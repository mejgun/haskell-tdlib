{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddLocalMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.MessageReplyTo as MessageReplyTo
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
data AddLocalMessage = AddLocalMessage
  { -- | The content of the message to be added
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | Pass true to disable notification for the message
    disable_notification :: Maybe Bool,
    -- | Identifier of the replied message or story; pass null if none
    reply_to :: Maybe MessageReplyTo.MessageReplyTo,
    -- | Identifier of the sender of the message
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Target chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddLocalMessage where
  show
    AddLocalMessage
      { input_message_content = input_message_content_,
        disable_notification = disable_notification_,
        reply_to = reply_to_,
        sender_id = sender_id_,
        chat_id = chat_id_
      } =
      "AddLocalMessage"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "disable_notification" disable_notification_,
            U.p "reply_to" reply_to_,
            U.p "sender_id" sender_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON AddLocalMessage where
  toJSON
    AddLocalMessage
      { input_message_content = input_message_content_,
        disable_notification = disable_notification_,
        reply_to = reply_to_,
        sender_id = sender_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "addLocalMessage",
          "input_message_content" A..= input_message_content_,
          "disable_notification" A..= disable_notification_,
          "reply_to" A..= reply_to_,
          "sender_id" A..= sender_id_,
          "chat_id" A..= chat_id_
        ]
