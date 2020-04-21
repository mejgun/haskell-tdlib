-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMembersFilter as ChatMembersFilter

--main = putStrLn "ok"

data SearchChatMembers = 
 SearchChatMembers { _filter :: ChatMembersFilter.ChatMembersFilter, limit :: Int, query :: String, chat_id :: Int }  deriving (Show)

instance T.ToJSON SearchChatMembers where
 toJSON (SearchChatMembers { _filter = _filter, limit = limit, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMembers", "filter" A..= _filter, "limit" A..= limit, "query" A..= query, "chat_id" A..= chat_id ]



instance T.FromJSON SearchChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMembers" -> parseSearchChatMembers v

   _ -> mempty ""
  where
   parseSearchChatMembers :: A.Value -> T.Parser SearchChatMembers
   parseSearchChatMembers = A.withObject "SearchChatMembers" $ \o -> do
    _filter <- o A..: "filter"
    limit <- o A..: "limit"
    query <- o A..: "query"
    chat_id <- o A..: "chat_id"
    return $ SearchChatMembers { _filter = _filter, limit = limit, query = query, chat_id = chat_id }