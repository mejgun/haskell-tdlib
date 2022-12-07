{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendInlineQueryResultMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified Utils as U

-- |
-- Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
data SendInlineQueryResultMessage = SendInlineQueryResultMessage
  { -- | Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
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
      { hide_via_bot = hide_via_bot_,
        result_id = result_id_,
        query_id = query_id_,
        options = options_,
        reply_to_message_id = reply_to_message_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SendInlineQueryResultMessage"
        ++ U.cc
          [ U.p "hide_via_bot" hide_via_bot_,
            U.p "result_id" result_id_,
            U.p "query_id" query_id_,
            U.p "options" options_,
            U.p "reply_to_message_id" reply_to_message_id_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendInlineQueryResultMessage where
  toJSON
    SendInlineQueryResultMessage
      { hide_via_bot = hide_via_bot_,
        result_id = result_id_,
        query_id = query_id_,
        options = options_,
        reply_to_message_id = reply_to_message_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendInlineQueryResultMessage",
          "hide_via_bot" A..= hide_via_bot_,
          "result_id" A..= result_id_,
          "query_id" A..= U.toS query_id_,
          "options" A..= options_,
          "reply_to_message_id" A..= reply_to_message_id_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
