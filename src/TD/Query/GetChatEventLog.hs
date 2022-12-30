{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatEventLog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatEventLogFilters as ChatEventLogFilters
import qualified Utils as U

-- |
-- Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i.e., in order of decreasing event_id)
data GetChatEventLog = GetChatEventLog
  { -- | User identifiers by which to filter events. By default, events relating to all users will be returned
    user_ids :: Maybe [Int],
    -- | The types of events to return; pass null to get chat events of all types
    filters :: Maybe ChatEventLogFilters.ChatEventLogFilters,
    -- | The maximum number of events to return; up to 100
    limit :: Maybe Int,
    -- | Identifier of an event from which to return results. Use 0 to get results from the latest events
    from_event_id :: Maybe Int,
    -- | Search query by which to filter events
    query :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatEventLog where
  show
    GetChatEventLog
      { user_ids = user_ids_,
        filters = filters_,
        limit = limit_,
        from_event_id = from_event_id_,
        query = query_,
        chat_id = chat_id_
      } =
      "GetChatEventLog"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "filters" filters_,
            U.p "limit" limit_,
            U.p "from_event_id" from_event_id_,
            U.p "query" query_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatEventLog where
  toJSON
    GetChatEventLog
      { user_ids = user_ids_,
        filters = filters_,
        limit = limit_,
        from_event_id = from_event_id_,
        query = query_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatEventLog",
          "user_ids" A..= user_ids_,
          "filters" A..= filters_,
          "limit" A..= limit_,
          "from_event_id" A..= U.toS from_event_id_,
          "query" A..= query_,
          "chat_id" A..= chat_id_
        ]
