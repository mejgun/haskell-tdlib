module TD.Query.GetChatMessagePosition
  (GetChatMessagePosition(..)
  , defaultGetChatMessagePosition
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat. Cannot be used in secret chats. Returns 'TD.Data.Count.Count'
data GetChatMessagePosition
  = GetChatMessagePosition
    { chat_id                 :: Maybe Int                                       -- ^ Identifier of the chat in which to find message position
    , message_id              :: Maybe Int                                       -- ^ Message identifier
    , _filter                 :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, and searchMessagesFilterFailedToSend are unsupported in this function
    , message_thread_id       :: Maybe Int                                       -- ^ If not 0, only messages in the specified thread will be considered; supergroups only
    , saved_messages_topic_id :: Maybe Int                                       -- ^ If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all relevant messages, or for chats other than Saved Messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessagePosition where
  shortShow
    GetChatMessagePosition
      { chat_id                 = chat_id_
      , message_id              = message_id_
      , _filter                 = _filter_
      , message_thread_id       = message_thread_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = "GetChatMessagePosition"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "message_id"              `I.p` message_id_
          , "_filter"                 `I.p` _filter_
          , "message_thread_id"       `I.p` message_thread_id_
          , "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          ]

instance AT.ToJSON GetChatMessagePosition where
  toJSON
    GetChatMessagePosition
      { chat_id                 = chat_id_
      , message_id              = message_id_
      , _filter                 = _filter_
      , message_thread_id       = message_thread_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "getChatMessagePosition"
          , "chat_id"                 A..= chat_id_
          , "message_id"              A..= message_id_
          , "filter"                  A..= _filter_
          , "message_thread_id"       A..= message_thread_id_
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          ]

defaultGetChatMessagePosition :: GetChatMessagePosition
defaultGetChatMessagePosition =
  GetChatMessagePosition
    { chat_id                 = Nothing
    , message_id              = Nothing
    , _filter                 = Nothing
    , message_thread_id       = Nothing
    , saved_messages_topic_id = Nothing
    }

