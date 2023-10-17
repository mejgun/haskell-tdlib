module TD.Query.EditMessageCaption
  (EditMessageCaption(..)
  , defaultEditMessageCaption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.FormattedText as FormattedText

-- | Edits the message content caption. Returns the edited message after the edit is completed on the server side
data EditMessageCaption
  = EditMessageCaption
    { chat_id      :: Maybe Int                         -- ^ The chat the message belongs to
    , message_id   :: Maybe Int                         -- ^ Identifier of the message
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup     -- ^ The new message reply markup; pass null if none; for bots only
    , caption      :: Maybe FormattedText.FormattedText -- ^ New message content caption; 0-getOption("message_caption_length_max") characters; pass null to remove caption
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageCaption where
  shortShow
    EditMessageCaption
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , caption      = caption_
      }
        = "EditMessageCaption"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "reply_markup" `I.p` reply_markup_
          , "caption"      `I.p` caption_
          ]

instance AT.ToJSON EditMessageCaption where
  toJSON
    EditMessageCaption
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , caption      = caption_
      }
        = A.object
          [ "@type"        A..= AT.String "editMessageCaption"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "reply_markup" A..= reply_markup_
          , "caption"      A..= caption_
          ]

defaultEditMessageCaption :: EditMessageCaption
defaultEditMessageCaption =
  EditMessageCaption
    { chat_id      = Nothing
    , message_id   = Nothing
    , reply_markup = Nothing
    , caption      = Nothing
    }

