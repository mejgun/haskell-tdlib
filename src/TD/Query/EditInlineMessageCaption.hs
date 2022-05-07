{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditInlineMessageCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FormattedText as FormattedText
import qualified TD.Reply.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the caption of an inline message sent via a bot; for bots only
data EditInlineMessageCaption = EditInlineMessageCaption
  { -- | New message content caption; pass null to remove caption; 0-GetOption("message_caption_length_max") characters
    caption :: Maybe FormattedText.FormattedText,
    -- | The new message reply markup; pass null if none
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Inline message identifier
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show EditInlineMessageCaption where
  show
    EditInlineMessageCaption
      { caption = caption,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      "EditInlineMessageCaption"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "reply_markup" reply_markup,
            U.p "inline_message_id" inline_message_id
          ]

instance T.ToJSON EditInlineMessageCaption where
  toJSON
    EditInlineMessageCaption
      { caption = caption,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      A.object
        [ "@type" A..= T.String "editInlineMessageCaption",
          "caption" A..= caption,
          "reply_markup" A..= reply_markup,
          "inline_message_id" A..= inline_message_id
        ]
