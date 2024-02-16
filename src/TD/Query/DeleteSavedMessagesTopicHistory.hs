module TD.Query.DeleteSavedMessagesTopicHistory
  (DeleteSavedMessagesTopicHistory(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages in a Saved Messages topic. Returns 'TD.Data.Ok.Ok'
data DeleteSavedMessagesTopicHistory
  = DeleteSavedMessagesTopicHistory
    { saved_messages_topic_id :: Maybe Int -- ^ Identifier of Saved Messages topic which messages will be deleted
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteSavedMessagesTopicHistory where
  shortShow
    DeleteSavedMessagesTopicHistory
      { saved_messages_topic_id = saved_messages_topic_id_
      }
        = "DeleteSavedMessagesTopicHistory"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          ]

instance AT.ToJSON DeleteSavedMessagesTopicHistory where
  toJSON
    DeleteSavedMessagesTopicHistory
      { saved_messages_topic_id = saved_messages_topic_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "deleteSavedMessagesTopicHistory"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          ]

