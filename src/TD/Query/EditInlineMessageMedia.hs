{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditInlineMessageMedia where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only
data EditInlineMessageMedia = EditInlineMessageMedia
  { -- | New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Inline message identifier
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show EditInlineMessageMedia where
  show
    EditInlineMessageMedia
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        inline_message_id = inline_message_id_
      } =
      "EditInlineMessageMedia"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "inline_message_id" inline_message_id_
          ]

instance T.ToJSON EditInlineMessageMedia where
  toJSON
    EditInlineMessageMedia
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        inline_message_id = inline_message_id_
      } =
      A.object
        [ "@type" A..= T.String "editInlineMessageMedia",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "inline_message_id" A..= inline_message_id_
        ]
