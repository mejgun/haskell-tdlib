module TD.Query.EditInlineMessageText
  (EditInlineMessageText(..)
  , defaultEditInlineMessageText
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the text of an inline text or game message sent via a bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditInlineMessageText
  = EditInlineMessageText
    { inline_message_id     :: Maybe T.Text                                  -- ^ Inline message identifier
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New text content of the message. Must be of type inputMessageText
    }
  deriving (Eq, Show)

instance I.ShortShow EditInlineMessageText where
  shortShow
    EditInlineMessageText
      { inline_message_id     = inline_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditInlineMessageText"
          ++ I.cc
          [ "inline_message_id"     `I.p` inline_message_id_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditInlineMessageText where
  toJSON
    EditInlineMessageText
      { inline_message_id     = inline_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editInlineMessageText"
          , "inline_message_id"     A..= inline_message_id_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditInlineMessageText :: EditInlineMessageText
defaultEditInlineMessageText =
  EditInlineMessageText
    { inline_message_id     = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

