module TD.Query.EditBusinessMessageText
  (EditBusinessMessageText(..)
  , defaultEditBusinessMessageText
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the text of a text or game message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageText
  = EditBusinessMessageText
    { business_connection_id :: Maybe T.Text                                  -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                                     -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                                     -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none
    , input_message_content  :: Maybe InputMessageContent.InputMessageContent -- ^ New text content of the message. Must be of type inputMessageText
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageText where
  shortShow
    EditBusinessMessageText
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = "EditBusinessMessageText"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "input_message_content"  `I.p` input_message_content_
          ]

instance AT.ToJSON EditBusinessMessageText where
  toJSON
    EditBusinessMessageText
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageText"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "input_message_content"  A..= input_message_content_
          ]

defaultEditBusinessMessageText :: EditBusinessMessageText
defaultEditBusinessMessageText =
  EditBusinessMessageText
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , input_message_content  = Nothing
    }

