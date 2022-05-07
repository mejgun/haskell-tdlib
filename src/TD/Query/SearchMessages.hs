{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatList as ChatList
import qualified TD.Reply.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
-- For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
data SearchMessages = SearchMessages
  { -- | If not 0, the maximum date of the messages to return
    max_date :: Maybe Int,
    -- | If not 0, the minimum date of the messages to return
    min_date :: Maybe Int,
    -- | Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | The message identifier of the last found message, or 0 for the first request
    offset_message_id :: Maybe Int,
    -- | The chat identifier of the last found message, or 0 for the first request
    offset_chat_id :: Maybe Int,
    -- | The date of the message starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last message
    offset_date :: Maybe Int,
    -- | Query to search for
    query :: Maybe String,
    -- | Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show SearchMessages where
  show
    SearchMessages
      { max_date = max_date,
        min_date = min_date,
        _filter = _filter,
        limit = limit,
        offset_message_id = offset_message_id,
        offset_chat_id = offset_chat_id,
        offset_date = offset_date,
        query = query,
        chat_list = chat_list
      } =
      "SearchMessages"
        ++ U.cc
          [ U.p "max_date" max_date,
            U.p "min_date" min_date,
            U.p "_filter" _filter,
            U.p "limit" limit,
            U.p "offset_message_id" offset_message_id,
            U.p "offset_chat_id" offset_chat_id,
            U.p "offset_date" offset_date,
            U.p "query" query,
            U.p "chat_list" chat_list
          ]

instance T.ToJSON SearchMessages where
  toJSON
    SearchMessages
      { max_date = max_date,
        min_date = min_date,
        _filter = _filter,
        limit = limit,
        offset_message_id = offset_message_id,
        offset_chat_id = offset_chat_id,
        offset_date = offset_date,
        query = query,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "searchMessages",
          "max_date" A..= max_date,
          "min_date" A..= min_date,
          "filter" A..= _filter,
          "limit" A..= limit,
          "offset_message_id" A..= offset_message_id,
          "offset_chat_id" A..= offset_chat_id,
          "offset_date" A..= offset_date,
          "query" A..= query,
          "chat_list" A..= chat_list
        ]
