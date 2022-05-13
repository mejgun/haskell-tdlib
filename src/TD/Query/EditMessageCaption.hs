{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditMessageCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.ReplyMarkup as ReplyMarkup
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
      { caption = caption_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "EditMessageCaption"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "reply_markup" reply_markup_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditMessageCaption where
  toJSON
    EditMessageCaption
      { caption = caption_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editMessageCaption",
          "caption" A..= caption_,
          "reply_markup" A..= reply_markup_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
