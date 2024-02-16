module TD.Query.GetChatMessageCalendar
  (GetChatMessageCalendar(..)
  , defaultGetChatMessageCalendar
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset". Returns 'TD.Data.MessageCalendar.MessageCalendar'
data GetChatMessageCalendar
  = GetChatMessageCalendar
    { chat_id                 :: Maybe Int                                       -- ^ Identifier of the chat in which to return information about messages
    , _filter                 :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    , from_message_id         :: Maybe Int                                       -- ^ The message identifier from which to return information about messages; use 0 to get results from the last message
    , saved_messages_topic_id :: Maybe Int                                       -- ^ If not0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessageCalendar where
  shortShow
    GetChatMessageCalendar
      { chat_id                 = chat_id_
      , _filter                 = _filter_
      , from_message_id         = from_message_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = "GetChatMessageCalendar"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "_filter"                 `I.p` _filter_
          , "from_message_id"         `I.p` from_message_id_
          , "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          ]

instance AT.ToJSON GetChatMessageCalendar where
  toJSON
    GetChatMessageCalendar
      { chat_id                 = chat_id_
      , _filter                 = _filter_
      , from_message_id         = from_message_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "getChatMessageCalendar"
          , "chat_id"                 A..= chat_id_
          , "filter"                  A..= _filter_
          , "from_message_id"         A..= from_message_id_
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          ]

defaultGetChatMessageCalendar :: GetChatMessageCalendar
defaultGetChatMessageCalendar =
  GetChatMessageCalendar
    { chat_id                 = Nothing
    , _filter                 = Nothing
    , from_message_id         = Nothing
    , saved_messages_topic_id = Nothing
    }

