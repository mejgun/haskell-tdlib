{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditMessageReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
data EditMessageReplyMarkup = EditMessageReplyMarkup
  { -- | The new message reply markup; pass null if none
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageReplyMarkup where
  show
    EditMessageReplyMarkup
      { reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      "EditMessageReplyMarkup"
        ++ U.cc
          [ U.p "reply_markup" reply_markup,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON EditMessageReplyMarkup where
  toJSON
    EditMessageReplyMarkup
      { reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "editMessageReplyMarkup",
          "reply_markup" A..= reply_markup,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
