module TD.Query.EditMessageReplyMarkup
  (EditMessageReplyMarkup(..)
  , defaultEditMessageReplyMarkup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup

data EditMessageReplyMarkup -- ^ Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
  = EditMessageReplyMarkup
    { chat_id      :: Maybe Int                     -- ^ The chat the message belongs to
    , message_id   :: Maybe Int                     -- ^ Identifier of the message
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none
    }
  deriving (Eq)

instance Show EditMessageReplyMarkup where
  show
    EditMessageReplyMarkup
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      }
        = "EditMessageReplyMarkup"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "reply_markup" `I.p` reply_markup_
          ]

instance AT.ToJSON EditMessageReplyMarkup where
  toJSON
    EditMessageReplyMarkup
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      }
        = A.object
          [ "@type"        A..= AT.String "editMessageReplyMarkup"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "reply_markup" A..= reply_markup_
          ]

defaultEditMessageReplyMarkup :: EditMessageReplyMarkup
defaultEditMessageReplyMarkup =
  EditMessageReplyMarkup
    { chat_id      = Nothing
    , message_id   = Nothing
    , reply_markup = Nothing
    }

