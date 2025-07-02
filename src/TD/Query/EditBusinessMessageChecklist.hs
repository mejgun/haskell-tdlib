module TD.Query.EditBusinessMessageChecklist
  (EditBusinessMessageChecklist(..)
  , defaultEditBusinessMessageChecklist
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputChecklist as InputChecklist

-- | Edits the content of a checklist in a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageChecklist
  = EditBusinessMessageChecklist
    { business_connection_id :: Maybe T.Text                        -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                           -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                           -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup       -- ^ The new message reply markup; pass null if none
    , checklist              :: Maybe InputChecklist.InputChecklist -- ^ The new checklist. If some tasks were completed, this information will be kept
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageChecklist where
  shortShow
    EditBusinessMessageChecklist
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , checklist              = checklist_
      }
        = "EditBusinessMessageChecklist"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "checklist"              `I.p` checklist_
          ]

instance AT.ToJSON EditBusinessMessageChecklist where
  toJSON
    EditBusinessMessageChecklist
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , checklist              = checklist_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageChecklist"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "checklist"              A..= checklist_
          ]

defaultEditBusinessMessageChecklist :: EditBusinessMessageChecklist
defaultEditBusinessMessageChecklist =
  EditBusinessMessageChecklist
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , checklist              = Nothing
    }

