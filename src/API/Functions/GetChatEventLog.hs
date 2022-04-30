-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatEventLog where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatEventLogFilters as ChatEventLogFilters

-- |
-- 
-- Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)
-- 
-- __chat_id__ Chat identifier
-- 
-- __query__ Search query by which to filter events
-- 
-- __from_event_id__ Identifier of an event from which to return results. Use 0 to get results from the latest events
-- 
-- __limit__ The maximum number of events to return; up to 100
-- 
-- __filters__ The types of events to return; pass null to get chat events of all types
-- 
-- __user_ids__ User identifiers by which to filter events. By default, events relating to all users will be returned
data GetChatEventLog = 

 GetChatEventLog { user_ids :: Maybe [Int], filters :: Maybe ChatEventLogFilters.ChatEventLogFilters, limit :: Maybe Int, from_event_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatEventLog where
 show GetChatEventLog { user_ids=user_ids, filters=filters, limit=limit, from_event_id=from_event_id, query=query, chat_id=chat_id } =
  "GetChatEventLog" ++ U.cc [U.p "user_ids" user_ids, U.p "filters" filters, U.p "limit" limit, U.p "from_event_id" from_event_id, U.p "query" query, U.p "chat_id" chat_id ]

instance T.ToJSON GetChatEventLog where
 toJSON GetChatEventLog { user_ids = user_ids, filters = filters, limit = limit, from_event_id = from_event_id, query = query, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatEventLog", "user_ids" A..= user_ids, "filters" A..= filters, "limit" A..= limit, "from_event_id" A..= from_event_id, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatEventLog where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatEventLog" -> parseGetChatEventLog v
   _ -> mempty
  where
   parseGetChatEventLog :: A.Value -> T.Parser GetChatEventLog
   parseGetChatEventLog = A.withObject "GetChatEventLog" $ \o -> do
    user_ids <- o A..:? "user_ids"
    filters <- o A..:? "filters"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_event_id <- mconcat [ o A..:? "from_event_id", readMaybe <$> (o A..: "from_event_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatEventLog { user_ids = user_ids, filters = filters, limit = limit, from_event_id = from_event_id, query = query, chat_id = chat_id }
 parseJSON _ = mempty
