module TD.Query.GetDirectMessagesChatTopic
  (GetDirectMessagesChatTopic(..)
  , defaultGetDirectMessagesChatTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.DirectMessagesChatTopic.DirectMessagesChatTopic'
data GetDirectMessagesChatTopic
  = GetDirectMessagesChatTopic
    { chat_id  :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , topic_id :: Maybe Int -- ^ Identifier of the topic to get
    }
  deriving (Eq, Show)

instance I.ShortShow GetDirectMessagesChatTopic where
  shortShow
    GetDirectMessagesChatTopic
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = "GetDirectMessagesChatTopic"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          ]

instance AT.ToJSON GetDirectMessagesChatTopic where
  toJSON
    GetDirectMessagesChatTopic
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getDirectMessagesChatTopic"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          ]

defaultGetDirectMessagesChatTopic :: GetDirectMessagesChatTopic
defaultGetDirectMessagesChatTopic =
  GetDirectMessagesChatTopic
    { chat_id  = Nothing
    , topic_id = Nothing
    }

