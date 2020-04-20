-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMembersFilter as ChatMembersFilter

--main = putStrLn "ok"

data SearchChatMembers = 
 SearchChatMembers { _filter :: ChatMembersFilter.ChatMembersFilter, limit :: Int, query :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchChatMembers where
 toJSON (SearchChatMembers { _filter = _filter, limit = limit, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMembers", "filter" A..= _filter, "limit" A..= limit, "query" A..= query, "chat_id" A..= chat_id ]
-- searchChatMembers SearchChatMembers  { _filter :: ChatMembersFilter.ChatMembersFilter, limit :: Int, query :: String, chat_id :: Int } 

