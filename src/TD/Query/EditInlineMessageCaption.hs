module TD.Query.EditInlineMessageCaption
  (EditInlineMessageCaption(..)
  , defaultEditInlineMessageCaption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.FormattedText as FormattedText

data EditInlineMessageCaption -- ^ Edits the caption of an inline message sent via a bot; for bots only
  = EditInlineMessageCaption
    { inline_message_id :: Maybe T.Text                      -- ^ Inline message identifier
    , reply_markup      :: Maybe ReplyMarkup.ReplyMarkup     -- ^ The new message reply markup; pass null if none
    , caption           :: Maybe FormattedText.FormattedText -- ^ New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
    }
  deriving (Eq)

instance Show EditInlineMessageCaption where
  show
    EditInlineMessageCaption
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      , caption           = caption_
      }
        = "EditInlineMessageCaption"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "reply_markup"      `I.p` reply_markup_
          , "caption"           `I.p` caption_
          ]

instance AT.ToJSON EditInlineMessageCaption where
  toJSON
    EditInlineMessageCaption
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      , caption           = caption_
      }
        = A.object
          [ "@type"             A..= AT.String "editInlineMessageCaption"
          , "inline_message_id" A..= inline_message_id_
          , "reply_markup"      A..= reply_markup_
          , "caption"           A..= caption_
          ]

defaultEditInlineMessageCaption :: EditInlineMessageCaption
defaultEditInlineMessageCaption =
  EditInlineMessageCaption
    { inline_message_id = Nothing
    , reply_markup      = Nothing
    , caption           = Nothing
    }

