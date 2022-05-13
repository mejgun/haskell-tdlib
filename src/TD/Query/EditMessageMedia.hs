{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditMessageMedia where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the content of a message with an animation, an audio, a document, a photo or a video, including message caption. If only the caption needs to be edited, use editMessageCaption instead.
-- The media can't be edited if the message was set to self-destruct or to a self-destructing media. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns the edited message after the edit is completed on the server side
data EditMessageMedia = EditMessageMedia
  { -- | New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    input_message_content :: Maybe InputMessageContent.InputMessageContent,
    -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageMedia where
  show
    EditMessageMedia
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "EditMessageMedia"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditMessageMedia where
  toJSON
    EditMessageMedia
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editMessageMedia",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
