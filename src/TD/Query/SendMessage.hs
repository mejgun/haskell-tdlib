{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.MessageReplyTo as MessageReplyTo
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Sends a message. Returns the sent message
data SendMessage = SendMessage
  { -- | The content of the message to be sent
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | Markup for replying to the message; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Options to be used to send the message; pass null to use default options
    options :: Maybe MessageSendOptions.MessageSendOptions,
    -- | Identifier of the replied message or story; pass null if none
    reply_to :: Maybe MessageReplyTo.MessageReplyTo,
    -- | If not 0, a message thread identifier in which the message will be sent
    message_thread_id :: Maybe Int,
    -- | Target chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendMessage where
  show
    SendMessage
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        options = options_,
        reply_to = reply_to_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SendMessage"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "options" options_,
            U.p "reply_to" reply_to_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendMessage where
  toJSON
    SendMessage
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        options = options_,
        reply_to = reply_to_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendMessage",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "options" A..= options_,
          "reply_to" A..= reply_to_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
