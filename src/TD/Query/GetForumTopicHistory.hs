module TD.Query.GetForumTopicHistory
  (GetForumTopicHistory(..)
  , defaultGetForumTopicHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in a topic in a forum supergroup chat or a chat with a bot with topics. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib. Returns 'TD.Data.Messages.Messages'
data GetForumTopicHistory
  = GetForumTopicHistory
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , forum_topic_id  :: Maybe Int -- ^ Forum topic identifier
    , from_message_id :: Maybe Int -- ^ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    , offset          :: Maybe Int -- ^ Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages
    , limit           :: Maybe Int -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopicHistory where
  shortShow
    GetForumTopicHistory
      { chat_id         = chat_id_
      , forum_topic_id  = forum_topic_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetForumTopicHistory"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "forum_topic_id"  `I.p` forum_topic_id_
          , "from_message_id" `I.p` from_message_id_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetForumTopicHistory where
  toJSON
    GetForumTopicHistory
      { chat_id         = chat_id_
      , forum_topic_id  = forum_topic_id_
      , from_message_id = from_message_id_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getForumTopicHistory"
          , "chat_id"         A..= chat_id_
          , "forum_topic_id"  A..= forum_topic_id_
          , "from_message_id" A..= from_message_id_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetForumTopicHistory :: GetForumTopicHistory
defaultGetForumTopicHistory =
  GetForumTopicHistory
    { chat_id         = Nothing
    , forum_topic_id  = Nothing
    , from_message_id = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

