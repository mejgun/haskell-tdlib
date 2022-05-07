{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditInlineMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputMessageContent as InputMessageContent
import qualified TD.Reply.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the text of an inline text or game message sent via a bot; for bots only
data EditInlineMessageText = EditInlineMessageText
  { -- | New text content of the message. Must be of type inputMessageText
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | The new message reply markup; pass null if none
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Inline message identifier
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show EditInlineMessageText where
  show
    EditInlineMessageText
      { input_message_content = input_message_content,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      "EditInlineMessageText"
        ++ U.cc
          [ U.p "input_message_content" input_message_content,
            U.p "reply_markup" reply_markup,
            U.p "inline_message_id" inline_message_id
          ]

instance T.ToJSON EditInlineMessageText where
  toJSON
    EditInlineMessageText
      { input_message_content = input_message_content,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      A.object
        [ "@type" A..= T.String "editInlineMessageText",
          "input_message_content" A..= input_message_content,
          "reply_markup" A..= reply_markup,
          "inline_message_id" A..= inline_message_id
        ]
