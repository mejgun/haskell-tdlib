module TD.Query.GetDirectMessagesChatTopicRevenue
  (GetDirectMessagesChatTopicRevenue(..)
  , defaultGetDirectMessagesChatTopicRevenue
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the total number of Telegram Stars received by the channel chat for direct messages from the given topic. Returns 'TD.Data.StarCount.StarCount'
data GetDirectMessagesChatTopicRevenue
  = GetDirectMessagesChatTopicRevenue
    { chat_id  :: Maybe Int -- ^ Chat identifier of the channel direct messages chat administered by the current user
    , topic_id :: Maybe Int -- ^ Identifier of the topic
    }
  deriving (Eq, Show)

instance I.ShortShow GetDirectMessagesChatTopicRevenue where
  shortShow
    GetDirectMessagesChatTopicRevenue
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = "GetDirectMessagesChatTopicRevenue"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          ]

instance AT.ToJSON GetDirectMessagesChatTopicRevenue where
  toJSON
    GetDirectMessagesChatTopicRevenue
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getDirectMessagesChatTopicRevenue"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          ]

defaultGetDirectMessagesChatTopicRevenue :: GetDirectMessagesChatTopicRevenue
defaultGetDirectMessagesChatTopicRevenue =
  GetDirectMessagesChatTopicRevenue
    { chat_id  = Nothing
    , topic_id = Nothing
    }

