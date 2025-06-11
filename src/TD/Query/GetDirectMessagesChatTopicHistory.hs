module TD.Query.GetDirectMessagesChatTopicHistory
  (GetDirectMessagesChatTopicHistory(..)
  , defaultGetDirectMessagesChatTopicHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in the topic in a channel direct messages chat administered by the current user. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id). Returns 'TD.Data.Messages.Messages'
data GetDirectMessagesChatTopicHistory
  = GetDirectMessagesChatTopicHistory
    { chat_id         :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , topic_id        :: Maybe Int -- ^ Identifier of the topic which messages will be fetched
    , from_message_id :: Maybe Int -- ^ Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
    , offset          :: Maybe Int -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
    , limit           :: Maybe Int -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetDirectMessagesChatTopicHistory where
  shortShow
    GetDirectMessagesChatTopicHistory
      { chat_id         = chat_id_
      , topic_id        = topic_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetDirectMessagesChatTopicHistory"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "topic_id"        `I.p` topic_id_
          , "from_message_id" `I.p` from_message_id_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetDirectMessagesChatTopicHistory where
  toJSON
    GetDirectMessagesChatTopicHistory
      { chat_id         = chat_id_
      , topic_id        = topic_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getDirectMessagesChatTopicHistory"
          , "chat_id"         A..= chat_id_
          , "topic_id"        A..= topic_id_
          , "from_message_id" A..= from_message_id_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetDirectMessagesChatTopicHistory :: GetDirectMessagesChatTopicHistory
defaultGetDirectMessagesChatTopicHistory =
  GetDirectMessagesChatTopicHistory
    { chat_id         = Nothing
    , topic_id        = Nothing
    , from_message_id = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

