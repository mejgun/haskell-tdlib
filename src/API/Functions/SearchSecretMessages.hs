-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchSecretMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

-- |
-- 
-- Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library
-- 
-- __chat_id__ Identifier of the chat in which to search. Specify 0 to search in all secret chats
-- 
-- __query__ Query to search for. If empty, searchChatMessages should be used instead
-- 
-- __from_search_id__ The identifier from the result of a previous request, use 0 to get results from the last message
-- 
-- __limit__ The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
-- 
-- __filter__ A filter for the content of messages in the search results
data SearchSecretMessages = 
 SearchSecretMessages { _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, from_search_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchSecretMessages where
 toJSON (SearchSecretMessages { _filter = _filter, limit = limit, from_search_id = from_search_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchSecretMessages", "filter" A..= _filter, "limit" A..= limit, "from_search_id" A..= from_search_id, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchSecretMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchSecretMessages" -> parseSearchSecretMessages v
   _ -> mempty
  where
   parseSearchSecretMessages :: A.Value -> T.Parser SearchSecretMessages
   parseSearchSecretMessages = A.withObject "SearchSecretMessages" $ \o -> do
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_search_id <- mconcat [ o A..:? "from_search_id", readMaybe <$> (o A..: "from_search_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchSecretMessages { _filter = _filter, limit = limit, from_search_id = from_search_id, query = query, chat_id = chat_id }