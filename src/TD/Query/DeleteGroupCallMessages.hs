module TD.Query.DeleteGroupCallMessages
  (DeleteGroupCallMessages(..)
  , defaultDeleteGroupCallMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes messages in a group call; for live story calls only. Requires groupCallMessage.can_be_deleted right. Returns 'TD.Data.Ok.Ok'
data DeleteGroupCallMessages
  = DeleteGroupCallMessages
    { group_call_id :: Maybe Int   -- ^ Group call identifier
    , message_ids   :: Maybe [Int] -- ^ Identifiers of the messages to be deleted
    , report_spam   :: Maybe Bool  -- ^ Pass true to report the messages as spam
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteGroupCallMessages where
  shortShow
    DeleteGroupCallMessages
      { group_call_id = group_call_id_
      , message_ids   = message_ids_
      , report_spam   = report_spam_
      }
        = "DeleteGroupCallMessages"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "message_ids"   `I.p` message_ids_
          , "report_spam"   `I.p` report_spam_
          ]

instance AT.ToJSON DeleteGroupCallMessages where
  toJSON
    DeleteGroupCallMessages
      { group_call_id = group_call_id_
      , message_ids   = message_ids_
      , report_spam   = report_spam_
      }
        = A.object
          [ "@type"         A..= AT.String "deleteGroupCallMessages"
          , "group_call_id" A..= group_call_id_
          , "message_ids"   A..= message_ids_
          , "report_spam"   A..= report_spam_
          ]

defaultDeleteGroupCallMessages :: DeleteGroupCallMessages
defaultDeleteGroupCallMessages =
  DeleteGroupCallMessages
    { group_call_id = Nothing
    , message_ids   = Nothing
    , report_spam   = Nothing
    }

