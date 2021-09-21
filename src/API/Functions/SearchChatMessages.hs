-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
-- 
-- -(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __chat_id__ Identifier of the chat in which to search messages
-- 
-- __query__ Query to search for
-- 
-- __sender__ If not null, only messages sent by the specified sender will be returned. Not supported in secret chats
-- 
-- __from_message_id__ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
-- 
-- __offset__ Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __filter__ Filter for message content in the search results
-- 
-- __message_thread_id__ If not 0, only messages in the specified thread will be returned; supergroups only
data SearchChatMessages = 

 SearchChatMessages { message_thread_id :: Maybe Int, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, sender :: Maybe MessageSender.MessageSender, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatMessages where
 toJSON (SearchChatMessages { message_thread_id = message_thread_id, _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender = sender, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMessages", "message_thread_id" A..= message_thread_id, "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender" A..= sender, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMessages" -> parseSearchChatMessages v
   _ -> mempty
  where
   parseSearchChatMessages :: A.Value -> T.Parser SearchChatMessages
   parseSearchChatMessages = A.withObject "SearchChatMessages" $ \o -> do
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender <- o A..:? "sender"
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatMessages { message_thread_id = message_thread_id, _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender = sender, query = query, chat_id = chat_id }