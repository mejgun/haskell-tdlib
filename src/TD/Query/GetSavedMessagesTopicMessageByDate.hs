module TD.Query.GetSavedMessagesTopicMessageByDate
  (GetSavedMessagesTopicMessageByDate(..)
  , defaultGetSavedMessagesTopicMessageByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the last message sent in a Saved Messages topic no later than the specified date. Returns 'TD.Data.Message.Message'
data GetSavedMessagesTopicMessageByDate
  = GetSavedMessagesTopicMessageByDate
    { saved_messages_topic_id :: Maybe Int -- ^ Identifier of Saved Messages topic which message will be returned
    , date                    :: Maybe Int -- ^ Point in time (Unix timestamp) relative to which to search for messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTopicMessageByDate where
  shortShow
    GetSavedMessagesTopicMessageByDate
      { saved_messages_topic_id = saved_messages_topic_id_
      , date                    = date_
      }
        = "GetSavedMessagesTopicMessageByDate"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "date"                    `I.p` date_
          ]

instance AT.ToJSON GetSavedMessagesTopicMessageByDate where
  toJSON
    GetSavedMessagesTopicMessageByDate
      { saved_messages_topic_id = saved_messages_topic_id_
      , date                    = date_
      }
        = A.object
          [ "@type"                   A..= AT.String "getSavedMessagesTopicMessageByDate"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "date"                    A..= date_
          ]

defaultGetSavedMessagesTopicMessageByDate :: GetSavedMessagesTopicMessageByDate
defaultGetSavedMessagesTopicMessageByDate =
  GetSavedMessagesTopicMessageByDate
    { saved_messages_topic_id = Nothing
    , date                    = Nothing
    }

