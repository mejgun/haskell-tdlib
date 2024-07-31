module TD.Query.EditMessageText
  (EditMessageText(..)
  , defaultEditMessageText
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageText
  = EditMessageText
    { chat_id               :: Maybe Int                                     -- ^ The chat the message belongs to
    , message_id            :: Maybe Int                                     -- ^ Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New text content of the message. Must be of type inputMessageText
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageText where
  shortShow
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

defaultEditMessageText :: EditMessageText
defaultEditMessageText =
  EditMessageText
    { chat_id               = Nothing
    , message_id            = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

