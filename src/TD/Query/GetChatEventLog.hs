{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatEventLog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatEventLogFilters as ChatEventLogFilters
import qualified Utils as U

-- |
-- Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)
data GetChatEventLog = GetChatEventLog
  { -- |
    user_ids :: Maybe [Int],
    -- | The types of events to return; pass null to get chat events of all types @user_ids User identifiers by which to filter events. By default, events relating to all users will be returned
    filters :: Maybe ChatEventLogFilters.ChatEventLogFilters,
    -- |
    limit :: Maybe Int,
    -- |
    from_event_id :: Maybe Int,
    -- |
    query :: Maybe String,
    -- | Chat identifier @query Search query by which to filter events @from_event_id Identifier of an event from which to return results. Use 0 to get results from the latest events @limit The maximum number of events to return; up to 100
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatEventLog where
  show
    GetChatEventLog
      { user_ids = user_ids,
        filters = filters,
        limit = limit,
        from_event_id = from_event_id,
        query = query,
        chat_id = chat_id
      } =
      "GetChatEventLog"
        ++ U.cc
          [ U.p "user_ids" user_ids,
            U.p "filters" filters,
            U.p "limit" limit,
            U.p "from_event_id" from_event_id,
            U.p "query" query,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatEventLog where
  toJSON
    GetChatEventLog
      { user_ids = user_ids,
        filters = filters,
        limit = limit,
        from_event_id = from_event_id,
        query = query,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatEventLog",
          "user_ids" A..= user_ids,
          "filters" A..= filters,
          "limit" A..= limit,
          "from_event_id" A..= from_event_id,
          "query" A..= query,
          "chat_id" A..= chat_id
        ]
