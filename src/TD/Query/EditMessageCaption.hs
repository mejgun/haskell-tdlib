{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditMessageCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FormattedText as FormattedText
import qualified TD.Reply.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the message content caption. Returns the edited message after the edit is completed on the server side
data EditMessageCaption = EditMessageCaption
  { -- | New message content caption; 0-GetOption("message_caption_length_max") characters; pass null to remove caption
    caption :: Maybe FormattedText.FormattedText,
    -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageCaption where
  show
    EditMessageCaption
      { caption = caption,
        reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      "EditMessageCaption"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "reply_markup" reply_markup,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON EditMessageCaption where
  toJSON
    EditMessageCaption
      { caption = caption,
        reply_markup = reply_markup,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "editMessageCaption",
          "caption" A..= caption,
          "reply_markup" A..= reply_markup,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
