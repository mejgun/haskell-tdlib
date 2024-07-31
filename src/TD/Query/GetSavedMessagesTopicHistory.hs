module TD.Query.GetSavedMessagesTopicHistory
  (GetSavedMessagesTopicHistory(..)
  , defaultGetSavedMessagesTopicHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in a Saved Messages topic. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id). Returns 'TD.Data.Messages.Messages'
data GetSavedMessagesTopicHistory
  = GetSavedMessagesTopicHistory
    { saved_messages_topic_id :: Maybe Int -- ^ Identifier of Saved Messages topic which messages will be fetched
    , from_message_id         :: Maybe Int -- ^ Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
    , offset                  :: Maybe Int -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
    , limit                   :: Maybe Int -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTopicHistory where
  shortShow
    GetSavedMessagesTopicHistory
      { saved_messages_topic_id = saved_messages_topic_id_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      }
        = "GetSavedMessagesTopicHistory"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "from_message_id"         `I.p` from_message_id_
          , "offset"                  `I.p` offset_
          , "limit"                   `I.p` limit_
          ]

instance AT.ToJSON GetSavedMessagesTopicHistory where
  toJSON
    GetSavedMessagesTopicHistory
      { saved_messages_topic_id = saved_messages_topic_id_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      }
        = A.object
          [ "@type"                   A..= AT.String "getSavedMessagesTopicHistory"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "from_message_id"         A..= from_message_id_
          , "offset"                  A..= offset_
          , "limit"                   A..= limit_
          ]

defaultGetSavedMessagesTopicHistory :: GetSavedMessagesTopicHistory
defaultGetSavedMessagesTopicHistory =
  GetSavedMessagesTopicHistory
    { saved_messages_topic_id = Nothing
    , from_message_id         = Nothing
    , offset                  = Nothing
    , limit                   = Nothing
    }

