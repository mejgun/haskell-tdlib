module TD.Query.GetChatEventLog
  (GetChatEventLog(..)
  , defaultGetChatEventLog
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatEventLogFilters as ChatEventLogFilters

-- | Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i.e., in order of decreasing event_id). Returns 'TD.Data.ChatEvents.ChatEvents'
data GetChatEventLog
  = GetChatEventLog
    { chat_id       :: Maybe Int                                     -- ^ Chat identifier
    , query         :: Maybe T.Text                                  -- ^ Search query by which to filter events
    , from_event_id :: Maybe Int                                     -- ^ Identifier of an event from which to return results. Use 0 to get results from the latest events
    , limit         :: Maybe Int                                     -- ^ The maximum number of events to return; up to 100
    , filters       :: Maybe ChatEventLogFilters.ChatEventLogFilters -- ^ The types of events to return; pass null to get chat events of all types
    , user_ids      :: Maybe [Int]                                   -- ^ User identifiers by which to filter events. By default, events relating to all users will be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatEventLog where
  shortShow
    GetChatEventLog
      { chat_id       = chat_id_
      , query         = query_
      , from_event_id = from_event_id_
      , limit         = limit_
      , filters       = filters_
      , user_ids      = user_ids_
      }
        = "GetChatEventLog"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "query"         `I.p` query_
          , "from_event_id" `I.p` from_event_id_
          , "limit"         `I.p` limit_
          , "filters"       `I.p` filters_
          , "user_ids"      `I.p` user_ids_
          ]

instance AT.ToJSON GetChatEventLog where
  toJSON
    GetChatEventLog
      { chat_id       = chat_id_
      , query         = query_
      , from_event_id = from_event_id_
      , limit         = limit_
      , filters       = filters_
      , user_ids      = user_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "getChatEventLog"
          , "chat_id"       A..= chat_id_
          , "query"         A..= query_
          , "from_event_id" A..= fmap I.writeInt64  from_event_id_
          , "limit"         A..= limit_
          , "filters"       A..= filters_
          , "user_ids"      A..= user_ids_
          ]

defaultGetChatEventLog :: GetChatEventLog
defaultGetChatEventLog =
  GetChatEventLog
    { chat_id       = Nothing
    , query         = Nothing
    , from_event_id = Nothing
    , limit         = Nothing
    , filters       = Nothing
    , user_ids      = Nothing
    }

