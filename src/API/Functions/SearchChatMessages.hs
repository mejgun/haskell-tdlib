-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

-- |
-- 
-- Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
-- 
-- -(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library
-- 
-- __chat_id__ Identifier of the chat in which to search messages
-- 
-- __query__ Query to search for
-- 
-- __sender_user_id__ If not 0, only messages sent by the specified user will be returned. Not supported in secret chats
-- 
-- __from_message_id__ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
-- 
-- __offset__ Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
-- 
-- __filter__ Filter for message content in the search results
data SearchChatMessages = 
 SearchChatMessages { _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, sender_user_id :: Maybe Int, query :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatMessages where
 toJSON (SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatMessages", "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender_user_id" A..= sender_user_id, "query" A..= query, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatMessages" -> parseSearchChatMessages v
   _ -> mempty
  where
   parseSearchChatMessages :: A.Value -> T.Parser SearchChatMessages
   parseSearchChatMessages = A.withObject "SearchChatMessages" $ \o -> do
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatMessages { _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_user_id = sender_user_id, query = query, chat_id = chat_id }