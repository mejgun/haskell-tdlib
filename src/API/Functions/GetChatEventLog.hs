-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatEventLog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEventLogFilters as ChatEventLogFilters

--main = putStrLn "ok"

data GetChatEventLog = 
 GetChatEventLog { user_ids :: [Int], filters :: ChatEventLogFilters.ChatEventLogFilters, limit :: Int, from_event_id :: Int, query :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatEventLog where
 toJSON (GetChatEventLog { user_ids = user_ids, filters = filters, limit = limit, from_event_id = from_event_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatEventLog", "user_ids" A..= user_ids, "filters" A..= filters, "limit" A..= limit, "from_event_id" A..= from_event_id, "query" A..= query, "chat_id" A..= chat_id ]
-- getChatEventLog GetChatEventLog  { user_ids :: [Int], filters :: ChatEventLogFilters.ChatEventLogFilters, limit :: Int, from_event_id :: Int, query :: String, chat_id :: Int } 

