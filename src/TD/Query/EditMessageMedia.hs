module TD.Query.EditMessageMedia
  (EditMessageMedia(..)
  , defaultEditMessageMedia
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the media content of a message, including message caption. If only the caption needs to be edited, use editMessageCaption instead. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageMedia
  = EditMessageMedia
    { chat_id               :: Maybe Int                                     -- ^ The chat the message belongs to
    , message_id            :: Maybe Int                                     -- ^ Identifier of the message. Use messageProperties.can_edit_media to check whether the message can be edited
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageMedia where
  shortShow
    EditMessageMedia
      { chat_id               = chat_id_
      , message_id            = message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditMessageMedia"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "message_id"            `I.p` message_id_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditMessageMedia where
  toJSON
    EditMessageMedia
      { chat_id               = chat_id_
      , message_id            = message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editMessageMedia"
          , "chat_id"               A..= chat_id_
          , "message_id"            A..= message_id_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditMessageMedia :: EditMessageMedia
defaultEditMessageMedia =
  EditMessageMedia
    { chat_id               = Nothing
    , message_id            = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

