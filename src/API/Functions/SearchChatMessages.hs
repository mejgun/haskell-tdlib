-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
-- 
-- -(searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __chat_id__ Identifier of the chat in which to search messages
-- 
-- __query__ Query to search for
-- 
-- __sender_id__ Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
-- 
-- __from_message_id__ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
-- 
-- __offset__ Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __filter__ Additional filter for messages to search; pass null to search for all messages
-- 
-- __message_thread_id__ If not 0, only messages in the specified thread will be returned; supergroups only
data SearchChatMessages = 

 SearchChatMessages { message_thread_id :: Maybe Int, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, sender_id :: Maybe MessageSender.MessageSender, query :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show SearchChatMessages where
 show SearchChatMessages { message_thread_id=message_thread_id, _filter=_filter, limit=limit, offset=offset, from_message_id=from_message_id, sender_id=sender_id, query=query, chat_id=chat_id } =
  "SearchChatMessages" ++ cc [p "message_thread_id" message_thread_id, p "_filter" _filter, p "limit" limit, p "offset" offset, p "from_message_id" from_message_id, p "sender_id" sender_id, p "query" query, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchChatMessages where
 toJSON SearchChatMessages { message_thread_id = message_thread_id, _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_id = sender_id, query = query, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "searchChatMessages", "message_thread_id" A..= message_thread_id, "filter" A..= _filter, "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "sender_id" A..= sender_id, "query" A..= query, "chat_id" A..= chat_id ]

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
    sender_id <- o A..:? "sender_id"
    query <- o A..:? "query"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatMessages { message_thread_id = message_thread_id, _filter = _filter, limit = limit, offset = offset, from_message_id = from_message_id, sender_id = sender_id, query = query, chat_id = chat_id }
 parseJSON _ = mempty
