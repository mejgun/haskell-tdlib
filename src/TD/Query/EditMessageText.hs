module TD.Query.EditMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

data EditMessageText -- ^ Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
  = EditMessageText
    { chat_id               :: Maybe Int                                     -- ^ The chat the message belongs to
    , message_id            :: Maybe Int                                     -- ^ Identifier of the message
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New text content of the message. Must be of type inputMessageText
    }
  deriving (Eq)

instance Show EditMessageText where
  show
    EditMessageText
      { chat_id               = chat_id_
      , message_id            = message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditMessageText"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "message_id"            `I.p` message_id_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditMessageText where
  toJSON
    EditMessageText
      { chat_id               = chat_id_
      , message_id            = message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editMessageText"
          , "chat_id"               A..= chat_id_
          , "message_id"            A..= message_id_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]
