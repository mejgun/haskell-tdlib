-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMembersFilter as ChatMembersFilter

-- |
-- 
-- Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels 
-- 
-- __chat_id__ Chat identifier
-- 
-- __query__ Query to search for
-- 
-- __limit__ The maximum number of users to be returned
-- 
-- __filter__ The type of users to return. By default, chatMembersFilterMembers
data SearchChatMembers = 

 SearchChatMembers { _filter :: Maybe ChatMembersFilter.ChatMembersFilter, limit :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatMembers where
 toJSON (SearchChatMembers { _filter = _filter, limit = limit, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMembers", "filter" A..= _filter, "limit" A..= limit, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMembers" -> parseSearchChatMembers v
   _ -> mempty
  where
   parseSearchChatMembers :: A.Value -> T.Parser SearchChatMembers
   parseSearchChatMembers = A.withObject "SearchChatMembers" $ \o -> do
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatMembers { _filter = _filter, limit = limit, query = query, chat_id = chat_id }