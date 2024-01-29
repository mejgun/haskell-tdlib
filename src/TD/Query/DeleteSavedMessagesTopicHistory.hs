module TD.Query.DeleteSavedMessagesTopicHistory
  (DeleteSavedMessagesTopicHistory(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTopic as SavedMessagesTopic

-- | Deletes all messages in a Saved Messages topic. Returns 'TD.Data.Ok.Ok'
data DeleteSavedMessagesTopicHistory
  = DeleteSavedMessagesTopicHistory
    { saved_messages_topic :: Maybe SavedMessagesTopic.SavedMessagesTopic -- ^ Saved Messages topic which messages will be deleted
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteSavedMessagesTopicHistory where
  shortShow
    DeleteSavedMessagesTopicHistory
      { saved_messages_topic = saved_messages_topic_
      }
        = "DeleteSavedMessagesTopicHistory"
          ++ I.cc
          [ "saved_messages_topic" `I.p` saved_messages_topic_
          ]

instance AT.ToJSON DeleteSavedMessagesTopicHistory where
  toJSON
    DeleteSavedMessagesTopicHistory
      { saved_messages_topic = saved_messages_topic_
      }
        = A.object
          [ "@type"                A..= AT.String "deleteSavedMessagesTopicHistory"
          , "saved_messages_topic" A..= saved_messages_topic_
          ]

