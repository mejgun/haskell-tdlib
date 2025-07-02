module TD.Query.EditMessageChecklist
  (EditMessageChecklist(..)
  , defaultEditMessageChecklist
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputChecklist as InputChecklist

-- | Edits the message content of a checklist. Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageChecklist
  = EditMessageChecklist
    { chat_id      :: Maybe Int                           -- ^ The chat the message belongs to
    , message_id   :: Maybe Int                           -- ^ Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup       -- ^ The new message reply markup; pass null if none; for bots only
    , checklist    :: Maybe InputChecklist.InputChecklist -- ^ The new checklist. If some tasks were completed, this information will be kept
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageChecklist where
  shortShow
    EditMessageChecklist
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , checklist    = checklist_
      }
        = "EditMessageChecklist"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "reply_markup" `I.p` reply_markup_
          , "checklist"    `I.p` checklist_
          ]

instance AT.ToJSON EditMessageChecklist where
  toJSON
    EditMessageChecklist
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , checklist    = checklist_
      }
        = A.object
          [ "@type"        A..= AT.String "editMessageChecklist"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "reply_markup" A..= reply_markup_
          , "checklist"    A..= checklist_
          ]

defaultEditMessageChecklist :: EditMessageChecklist
defaultEditMessageChecklist =
  EditMessageChecklist
    { chat_id      = Nothing
    , message_id   = Nothing
    , reply_markup = Nothing
    , checklist    = Nothing
    }

