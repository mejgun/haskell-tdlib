{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatMessageCalendar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset"
data GetChatMessageCalendar = GetChatMessageCalendar
  { -- | The message identifier from which to return information about messages; use 0 to get results from the last message
    from_message_id :: Maybe Int,
    -- | Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | Identifier of the chat in which to return information about messages
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatMessageCalendar where
  show
    GetChatMessageCalendar
      { from_message_id = from_message_id,
        _filter = _filter,
        chat_id = chat_id
      } =
      "GetChatMessageCalendar"
        ++ U.cc
          [ U.p "from_message_id" from_message_id,
            U.p "_filter" _filter,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatMessageCalendar where
  toJSON
    GetChatMessageCalendar
      { from_message_id = from_message_id,
        _filter = _filter,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatMessageCalendar",
          "from_message_id" A..= from_message_id,
          "filter" A..= _filter,
          "chat_id" A..= chat_id
        ]
