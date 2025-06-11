module TD.Query.DeleteDirectMessagesChatTopicMessagesByDate
  (DeleteDirectMessagesChatTopicMessagesByDate(..)
  , defaultDeleteDirectMessagesChatTopicMessagesByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages between the specified dates in the topic in a channel direct messages chat administered by the current user. Messages sent in the last 30 seconds will not be deleted. Returns 'TD.Data.Ok.Ok'
data DeleteDirectMessagesChatTopicMessagesByDate
  = DeleteDirectMessagesChatTopicMessagesByDate
    { chat_id  :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , topic_id :: Maybe Int -- ^ Identifier of the topic which messages will be deleted
    , min_date :: Maybe Int -- ^ The minimum date of the messages to delete
    , max_date :: Maybe Int -- ^ The maximum date of the messages to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteDirectMessagesChatTopicMessagesByDate where
  shortShow
    DeleteDirectMessagesChatTopicMessagesByDate
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , min_date = min_date_
      , max_date = max_date_
      }
        = "DeleteDirectMessagesChatTopicMessagesByDate"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          , "min_date" `I.p` min_date_
          , "max_date" `I.p` max_date_
          ]

instance AT.ToJSON DeleteDirectMessagesChatTopicMessagesByDate where
  toJSON
    DeleteDirectMessagesChatTopicMessagesByDate
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , min_date = min_date_
      , max_date = max_date_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteDirectMessagesChatTopicMessagesByDate"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          , "min_date" A..= min_date_
          , "max_date" A..= max_date_
          ]

defaultDeleteDirectMessagesChatTopicMessagesByDate :: DeleteDirectMessagesChatTopicMessagesByDate
defaultDeleteDirectMessagesChatTopicMessagesByDate =
  DeleteDirectMessagesChatTopicMessagesByDate
    { chat_id  = Nothing
    , topic_id = Nothing
    , min_date = Nothing
    , max_date = Nothing
    }

