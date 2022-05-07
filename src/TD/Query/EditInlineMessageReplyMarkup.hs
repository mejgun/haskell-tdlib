{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditInlineMessageReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the reply markup of an inline message sent via a bot; for bots only
data EditInlineMessageReplyMarkup = EditInlineMessageReplyMarkup
  { -- | The new message reply markup; pass null if none
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Inline message identifier
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show EditInlineMessageReplyMarkup where
  show
    EditInlineMessageReplyMarkup
      { reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      "EditInlineMessageReplyMarkup"
        ++ U.cc
          [ U.p "reply_markup" reply_markup,
            U.p "inline_message_id" inline_message_id
          ]

instance T.ToJSON EditInlineMessageReplyMarkup where
  toJSON
    EditInlineMessageReplyMarkup
      { reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      A.object
        [ "@type" A..= T.String "editInlineMessageReplyMarkup",
          "reply_markup" A..= reply_markup,
          "inline_message_id" A..= inline_message_id
        ]
