module TD.Query.EditMessageReplyMarkup
  (EditMessageReplyMarkup(..)
  , defaultEditMessageReplyMarkup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup

-- | Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageReplyMarkup
  = EditMessageReplyMarkup
    { chat_id      :: Maybe Int                     -- ^ The chat the message belongs to
    , message_id   :: Maybe Int                     -- ^ Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageReplyMarkup where
  shortShow
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

