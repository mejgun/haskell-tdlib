module TD.Query.DeleteSavedMessagesTopicMessagesByDate
  (DeleteSavedMessagesTopicMessagesByDate(..)
  , defaultDeleteSavedMessagesTopicMessagesByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages between the specified dates in a Saved Messages topic. Messages sent in the last 30 seconds will not be deleted. Returns 'TD.Data.Ok.Ok'
data DeleteSavedMessagesTopicMessagesByDate
  = DeleteSavedMessagesTopicMessagesByDate
    { saved_messages_topic_id :: Maybe Int -- ^ Identifier of Saved Messages topic which messages will be deleted
    , min_date                :: Maybe Int -- ^ The minimum date of the messages to delete
    , max_date                :: Maybe Int -- ^ The maximum date of the messages to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteSavedMessagesTopicMessagesByDate where
  shortShow
    DeleteSavedMessagesTopicMessagesByDate
      { saved_messages_topic_id = saved_messages_topic_id_
      , min_date                = min_date_
      , max_date                = max_date_
      }
        = "DeleteSavedMessagesTopicMessagesByDate"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "min_date"                `I.p` min_date_
          , "max_date"                `I.p` max_date_
          ]

instance AT.ToJSON DeleteSavedMessagesTopicMessagesByDate where
  toJSON
    DeleteSavedMessagesTopicMessagesByDate
      { saved_messages_topic_id = saved_messages_topic_id_
      , min_date                = min_date_
      , max_date                = max_date_
      }
        = A.object
          [ "@type"                   A..= AT.String "deleteSavedMessagesTopicMessagesByDate"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "min_date"                A..= min_date_
          , "max_date"                A..= max_date_
          ]

defaultDeleteSavedMessagesTopicMessagesByDate :: DeleteSavedMessagesTopicMessagesByDate
defaultDeleteSavedMessagesTopicMessagesByDate =
  DeleteSavedMessagesTopicMessagesByDate
    { saved_messages_topic_id = Nothing
    , min_date                = Nothing
    , max_date                = Nothing
    }

