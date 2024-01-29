module TD.Query.GetSavedMessagesTopicMessageByDate
  (GetSavedMessagesTopicMessageByDate(..)
  , defaultGetSavedMessagesTopicMessageByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTopic as SavedMessagesTopic

-- | Returns the last message sent in a Saved Messages topic no later than the specified date. Returns 'TD.Data.Message.Message'
data GetSavedMessagesTopicMessageByDate
  = GetSavedMessagesTopicMessageByDate
    { saved_messages_topic :: Maybe SavedMessagesTopic.SavedMessagesTopic -- ^ Saved Messages topic which message will be returned
    , date                 :: Maybe Int                                   -- ^ Point in time (Unix timestamp) relative to which to search for messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTopicMessageByDate where
  shortShow
    GetSavedMessagesTopicMessageByDate
      { saved_messages_topic = saved_messages_topic_
      , date                 = date_
      }
        = "GetSavedMessagesTopicMessageByDate"
          ++ I.cc
          [ "saved_messages_topic" `I.p` saved_messages_topic_
          , "date"                 `I.p` date_
          ]

instance AT.ToJSON GetSavedMessagesTopicMessageByDate where
  toJSON
    GetSavedMessagesTopicMessageByDate
      { saved_messages_topic = saved_messages_topic_
      , date                 = date_
      }
        = A.object
          [ "@type"                A..= AT.String "getSavedMessagesTopicMessageByDate"
          , "saved_messages_topic" A..= saved_messages_topic_
          , "date"                 A..= date_
          ]

defaultGetSavedMessagesTopicMessageByDate :: GetSavedMessagesTopicMessageByDate
defaultGetSavedMessagesTopicMessageByDate =
  GetSavedMessagesTopicMessageByDate
    { saved_messages_topic = Nothing
    , date                 = Nothing
    }

