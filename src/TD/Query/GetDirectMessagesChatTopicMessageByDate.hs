module TD.Query.GetDirectMessagesChatTopicMessageByDate
  (GetDirectMessagesChatTopicMessageByDate(..)
  , defaultGetDirectMessagesChatTopicMessageByDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the last message sent in the topic in a channel direct messages chat administered by the current user no later than the specified date. Returns 'TD.Data.Message.Message'
data GetDirectMessagesChatTopicMessageByDate
  = GetDirectMessagesChatTopicMessageByDate
    { chat_id  :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , topic_id :: Maybe Int -- ^ Identifier of the topic which messages will be fetched
    , date     :: Maybe Int -- ^ Point in time (Unix timestamp) relative to which to search for messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetDirectMessagesChatTopicMessageByDate where
  shortShow
    GetDirectMessagesChatTopicMessageByDate
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , date     = date_
      }
        = "GetDirectMessagesChatTopicMessageByDate"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          , "date"     `I.p` date_
          ]

instance AT.ToJSON GetDirectMessagesChatTopicMessageByDate where
  toJSON
    GetDirectMessagesChatTopicMessageByDate
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , date     = date_
      }
        = A.object
          [ "@type"    A..= AT.String "getDirectMessagesChatTopicMessageByDate"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          , "date"     A..= date_
          ]

defaultGetDirectMessagesChatTopicMessageByDate :: GetDirectMessagesChatTopicMessageByDate
defaultGetDirectMessagesChatTopicMessageByDate =
  GetDirectMessagesChatTopicMessageByDate
    { chat_id  = Nothing
    , topic_id = Nothing
    , date     = Nothing
    }

