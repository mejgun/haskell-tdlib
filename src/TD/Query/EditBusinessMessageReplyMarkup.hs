module TD.Query.EditBusinessMessageReplyMarkup
  (EditBusinessMessageReplyMarkup(..)
  , defaultEditBusinessMessageReplyMarkup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup

-- | Edits the reply markup of a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageReplyMarkup
  = EditBusinessMessageReplyMarkup
    { business_connection_id :: Maybe T.Text                  -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                     -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                     -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageReplyMarkup where
  shortShow
    EditBusinessMessageReplyMarkup
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      }
        = "EditBusinessMessageReplyMarkup"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          ]

instance AT.ToJSON EditBusinessMessageReplyMarkup where
  toJSON
    EditBusinessMessageReplyMarkup
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageReplyMarkup"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          ]

defaultEditBusinessMessageReplyMarkup :: EditBusinessMessageReplyMarkup
defaultEditBusinessMessageReplyMarkup =
  EditBusinessMessageReplyMarkup
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    }

