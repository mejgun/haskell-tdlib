module TD.Query.DeleteGroupCallMessagesBySender
  (DeleteGroupCallMessagesBySender(..)
  , defaultDeleteGroupCallMessagesBySender
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Deletes all messages sent by the specified message sender in a group call; for live story calls only. Requires groupCall.can_delete_messages right. Returns 'TD.Data.Ok.Ok'
data DeleteGroupCallMessagesBySender
  = DeleteGroupCallMessagesBySender
    { group_call_id :: Maybe Int                         -- ^ Group call identifier
    , sender_id     :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of messages to delete
    , report_spam   :: Maybe Bool                        -- ^ Pass true to report the messages as spam
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteGroupCallMessagesBySender where
  shortShow
    DeleteGroupCallMessagesBySender
      { group_call_id = group_call_id_
      , sender_id     = sender_id_
      , report_spam   = report_spam_
      }
        = "DeleteGroupCallMessagesBySender"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "sender_id"     `I.p` sender_id_
          , "report_spam"   `I.p` report_spam_
          ]

instance AT.ToJSON DeleteGroupCallMessagesBySender where
  toJSON
    DeleteGroupCallMessagesBySender
      { group_call_id = group_call_id_
      , sender_id     = sender_id_
      , report_spam   = report_spam_
      }
        = A.object
          [ "@type"         A..= AT.String "deleteGroupCallMessagesBySender"
          , "group_call_id" A..= group_call_id_
          , "sender_id"     A..= sender_id_
          , "report_spam"   A..= report_spam_
          ]

defaultDeleteGroupCallMessagesBySender :: DeleteGroupCallMessagesBySender
defaultDeleteGroupCallMessagesBySender =
  DeleteGroupCallMessagesBySender
    { group_call_id = Nothing
    , sender_id     = Nothing
    , report_spam   = Nothing
    }

