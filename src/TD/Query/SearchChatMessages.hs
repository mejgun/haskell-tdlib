{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified TD.Reply.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
-- (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
data SearchChatMessages = SearchChatMessages
  { -- | If not 0, only messages in the specified thread will be returned; supergroups only
    message_thread_id :: Maybe Int,
    -- | Additional filter for messages to search; pass null to search for all messages
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
    offset :: Maybe Int,
    -- | Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    from_message_id :: Maybe Int,
    -- | Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Query to search for
    query :: Maybe String,
    -- | Identifier of the chat in which to search messages
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchChatMessages where
  show
    SearchChatMessages
      { message_thread_id = message_thread_id,
        _filter = _filter,
        limit = limit,
        offset = offset,
        from_message_id = from_message_id,
        sender_id = sender_id,
        query = query,
        chat_id = chat_id
      } =
      "SearchChatMessages"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id,
            U.p "_filter" _filter,
            U.p "limit" limit,
            U.p "offset" offset,
            U.p "from_message_id" from_message_id,
            U.p "sender_id" sender_id,
            U.p "query" query,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SearchChatMessages where
  toJSON
    SearchChatMessages
      { message_thread_id = message_thread_id,
        _filter = _filter,
        limit = limit,
        offset = offset,
        from_message_id = from_message_id,
        sender_id = sender_id,
        query = query,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "searchChatMessages",
          "message_thread_id" A..= message_thread_id,
          "filter" A..= _filter,
          "limit" A..= limit,
          "offset" A..= offset,
          "from_message_id" A..= from_message_id,
          "sender_id" A..= sender_id,
          "query" A..= query,
          "chat_id" A..= chat_id
        ]
