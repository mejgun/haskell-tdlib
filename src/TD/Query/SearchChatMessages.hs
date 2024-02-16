module TD.Query.SearchChatMessages
  (SearchChatMessages(..)
  , defaultSearchChatMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit. A combination of query, sender_id, filter and message_thread_id search criteria is expected to be supported, only if it is required for Telegram official application implementation. Returns 'TD.Data.FoundChatMessages.FoundChatMessages'
data SearchChatMessages
  = SearchChatMessages
    { chat_id                 :: Maybe Int                                       -- ^ Identifier of the chat in which to search messages
    , query                   :: Maybe T.Text                                    -- ^ Query to search for
    , sender_id               :: Maybe MessageSender.MessageSender               -- ^ Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
    , from_message_id         :: Maybe Int                                       -- ^ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    , offset                  :: Maybe Int                                       -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset to get the specified message and some newer messages
    , limit                   :: Maybe Int                                       -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , _filter                 :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Additional filter for messages to search; pass null to search for all messages
    , message_thread_id       :: Maybe Int                                       -- ^ If not 0, only messages in the specified thread will be returned; supergroups only
    , saved_messages_topic_id :: Maybe Int                                       -- ^ If not 0, only messages in the specified Saved Messages topic will be returned; pass 0 to return all messages, or for chats other than Saved Messages
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatMessages where
  shortShow
    SearchChatMessages
      { chat_id                 = chat_id_
      , query                   = query_
      , sender_id               = sender_id_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      , _filter                 = _filter_
      , message_thread_id       = message_thread_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = "SearchChatMessages"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "query"                   `I.p` query_
          , "sender_id"               `I.p` sender_id_
          , "from_message_id"         `I.p` from_message_id_
          , "offset"                  `I.p` offset_
          , "limit"                   `I.p` limit_
          , "_filter"                 `I.p` _filter_
          , "message_thread_id"       `I.p` message_thread_id_
          , "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          ]

instance AT.ToJSON SearchChatMessages where
  toJSON
    SearchChatMessages
      { chat_id                 = chat_id_
      , query                   = query_
      , sender_id               = sender_id_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      , _filter                 = _filter_
      , message_thread_id       = message_thread_id_
      , saved_messages_topic_id = saved_messages_topic_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "searchChatMessages"
          , "chat_id"                 A..= chat_id_
          , "query"                   A..= query_
          , "sender_id"               A..= sender_id_
          , "from_message_id"         A..= from_message_id_
          , "offset"                  A..= offset_
          , "limit"                   A..= limit_
          , "filter"                  A..= _filter_
          , "message_thread_id"       A..= message_thread_id_
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          ]

defaultSearchChatMessages :: SearchChatMessages
defaultSearchChatMessages =
  SearchChatMessages
    { chat_id                 = Nothing
    , query                   = Nothing
    , sender_id               = Nothing
    , from_message_id         = Nothing
    , offset                  = Nothing
    , limit                   = Nothing
    , _filter                 = Nothing
    , message_thread_id       = Nothing
    , saved_messages_topic_id = Nothing
    }

