{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
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
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Query to search for
    query :: Maybe String,
    -- | Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show SearchMessages where
  show
    SearchMessages
      { max_date = max_date_,
        min_date = min_date_,
        _filter = _filter_,
        limit = limit_,
        offset = offset_,
        query = query_,
        chat_list = chat_list_
      } =
      "SearchMessages"
        ++ U.cc
          [ U.p "max_date" max_date_,
            U.p "min_date" min_date_,
            U.p "_filter" _filter_,
            U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "query" query_,
            U.p "chat_list" chat_list_
          ]

instance T.ToJSON SearchMessages where
  toJSON
    SearchMessages
      { max_date = max_date_,
        min_date = min_date_,
        _filter = _filter_,
        limit = limit_,
        offset = offset_,
        query = query_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "searchMessages",
          "max_date" A..= max_date_,
          "min_date" A..= min_date_,
          "filter" A..= _filter_,
          "limit" A..= limit_,
          "offset" A..= offset_,
          "query" A..= query_,
          "chat_list" A..= chat_list_
        ]
