{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendInlineQueryResultMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSendOptions as MessageSendOptions
import qualified Utils as U

-- |
-- Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
data SendInlineQueryResultMessage = SendInlineQueryResultMessage
  { -- | Pass true to hide the bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username"), and GetOption("venue_search_bot_username")
    hide_via_bot :: Maybe Bool,
    -- | Identifier of the inline result
    result_id :: Maybe String,
    -- | Identifier of the inline query
    query_id :: Maybe Int,
    -- | Options to be used to send the message; pass null to use default options
    options :: Maybe MessageSendOptions.MessageSendOptions,
    -- | Identifier of a replied message; 0 if none
    reply_to_message_id :: Maybe Int,
    -- | If not 0, a message thread identifier in which the message will be sent
    message_thread_id :: Maybe Int,
    -- | Target chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendInlineQueryResultMessage where
  show
    SendInlineQueryResultMessage
      { hide_via_bot = hide_via_bot,
        result_id = result_id,
        query_id = query_id,
        options = options,
        reply_to_message_id = reply_to_message_id,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      "SendInlineQueryResultMessage"
        ++ U.cc
          [ U.p "hide_via_bot" hide_via_bot,
            U.p "result_id" result_id,
            U.p "query_id" query_id,
            U.p "options" options,
            U.p "reply_to_message_id" reply_to_message_id,
            U.p "message_thread_id" message_thread_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SendInlineQueryResultMessage where
  toJSON
    SendInlineQueryResultMessage
      { hide_via_bot = hide_via_bot,
        result_id = result_id,
        query_id = query_id,
        options = options,
        reply_to_message_id = reply_to_message_id,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "sendInlineQueryResultMessage",
          "hide_via_bot" A..= hide_via_bot,
          "result_id" A..= result_id,
          "query_id" A..= query_id,
          "options" A..= options,
          "reply_to_message_id" A..= reply_to_message_id,
          "message_thread_id" A..= message_thread_id,
          "chat_id" A..= chat_id
        ]
