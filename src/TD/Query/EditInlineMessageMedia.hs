module TD.Query.EditInlineMessageMedia(EditInlineMessageMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

data EditInlineMessageMedia -- ^ Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only
  = EditInlineMessageMedia
    { inline_message_id     :: Maybe T.Text                                  -- ^ Inline message identifier
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    }
  deriving (Eq)

instance Show EditInlineMessageMedia where
  show
    EditInlineMessageMedia
      { inline_message_id     = inline_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditInlineMessageMedia"
          ++ I.cc
          [ "inline_message_id"     `I.p` inline_message_id_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditInlineMessageMedia where
  toJSON
    EditInlineMessageMedia
      { inline_message_id     = inline_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editInlineMessageMedia"
          , "inline_message_id"     A..= inline_message_id_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]
