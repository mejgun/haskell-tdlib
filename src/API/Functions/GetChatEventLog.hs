-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatEventLog where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEventLogFilters as ChatEventLogFilters

data GetChatEventLog = 
 GetChatEventLog { user_ids :: Maybe [Int], filters :: Maybe ChatEventLogFilters.ChatEventLogFilters, limit :: Maybe Int, from_event_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetChatEventLog where
 toJSON (GetChatEventLog { user_ids = user_ids, filters = filters, limit = limit, from_event_id = from_event_id, query = query, chat_id = chat_id }) =
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
    user_ids <- optional $ o A..: "user_ids"
    filters <- optional $ o A..: "filters"
    limit <- optional $ o A..: "limit"
    from_event_id <- optional $ o A..: "from_event_id"
    query <- optional $ o A..: "query"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatEventLog { user_ids = user_ids, filters = filters, limit = limit, from_event_id = from_event_id, query = query, chat_id = chat_id }