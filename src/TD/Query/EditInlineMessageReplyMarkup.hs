module TD.Query.EditInlineMessageReplyMarkup
  (EditInlineMessageReplyMarkup(..)
  , defaultEditInlineMessageReplyMarkup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup

-- | Edits the reply markup of an inline message sent via a bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditInlineMessageReplyMarkup
  = EditInlineMessageReplyMarkup
    { inline_message_id :: Maybe T.Text                  -- ^ Inline message identifier
    , reply_markup      :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none
    }
  deriving (Eq, Show)

instance I.ShortShow EditInlineMessageReplyMarkup where
  shortShow
    EditInlineMessageReplyMarkup
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      }
        = "EditInlineMessageReplyMarkup"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "reply_markup"      `I.p` reply_markup_
          ]

instance AT.ToJSON EditInlineMessageReplyMarkup where
  toJSON
    EditInlineMessageReplyMarkup
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      }
        = A.object
          [ "@type"             A..= AT.String "editInlineMessageReplyMarkup"
          , "inline_message_id" A..= inline_message_id_
          , "reply_markup"      A..= reply_markup_
          ]

defaultEditInlineMessageReplyMarkup :: EditInlineMessageReplyMarkup
defaultEditInlineMessageReplyMarkup =
  EditInlineMessageReplyMarkup
    { inline_message_id = Nothing
    , reply_markup      = Nothing
    }

