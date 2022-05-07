{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
data EditMessageText = EditMessageText
  { -- | New text content of the message. Must be of type inputMessageText
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageText where
  show
    EditMessageText
      { input_message_content = input_message_content,
        reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      "EditMessageText"
        ++ U.cc
          [ U.p "input_message_content" input_message_content,
            U.p "reply_markup" reply_markup,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON EditMessageText where
  toJSON
    EditMessageText
      { input_message_content = input_message_content,
        reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "editMessageText",
          "input_message_content" A..= input_message_content,
          "reply_markup" A..= reply_markup,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
