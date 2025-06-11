module TD.Query.GetChatMessageCalendar
  (GetChatMessageCalendar(..)
  , defaultGetChatMessageCalendar
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageTopic as MessageTopic
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset". Returns 'TD.Data.MessageCalendar.MessageCalendar'
data GetChatMessageCalendar
  = GetChatMessageCalendar
    { chat_id         :: Maybe Int                                       -- ^ Identifier of the chat in which to return information about messages
    , topic_id        :: Maybe MessageTopic.MessageTopic                 -- ^ Pass topic identifier to get the result only in specific topic; pass null to get the result in all topics; forum topics aren't supported
    , _filter         :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    , from_message_id :: Maybe Int                                       -- ^ The message identifier from which to return information about messages; use 0 to get results from the last message
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessageCalendar where
  shortShow
    GetChatMessageCalendar
      { chat_id         = chat_id_
      , topic_id        = topic_id_
      , _filter         = _filter_
      , from_message_id = from_message_id_
      }
        = "GetChatMessageCalendar"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "topic_id"        `I.p` topic_id_
          , "_filter"         `I.p` _filter_
          , "from_message_id" `I.p` from_message_id_
          ]

instance AT.ToJSON GetChatMessageCalendar where
  toJSON
    GetChatMessageCalendar
      { chat_id         = chat_id_
      , topic_id        = topic_id_
      , _filter         = _filter_
      , from_message_id = from_message_id_
      }
        = A.object
          [ "@type"           A..= AT.String "getChatMessageCalendar"
          , "chat_id"         A..= chat_id_
          , "topic_id"        A..= topic_id_
          , "filter"          A..= _filter_
          , "from_message_id" A..= from_message_id_
          ]

defaultGetChatMessageCalendar :: GetChatMessageCalendar
defaultGetChatMessageCalendar =
  GetChatMessageCalendar
    { chat_id         = Nothing
    , topic_id        = Nothing
    , _filter         = Nothing
    , from_message_id = Nothing
    }

