-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
-- 
-- -For optimal performance the number of returned messages is chosen by the library
-- 
-- __chat_list__ Chat list in which to search messages; pass null to search in all chats regardless of their chat list
-- 
-- __query__ Query to search for
-- 
-- __offset_date__ The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the last message
-- 
-- __offset_chat_id__ The chat identifier of the last found message, or 0 for the first request
-- 
-- __offset_message_id__ The message identifier of the last found message, or 0 for the first request
-- 
-- __limit__ The maximum number of messages to be returned, up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
data SearchMessages = 

 SearchMessages { limit :: Maybe Int, offset_message_id :: Maybe Int, offset_chat_id :: Maybe Int, offset_date :: Maybe Int, query :: Maybe String, chat_list :: Maybe ChatList.ChatList }  deriving (Show, Eq)

instance T.ToJSON SearchMessages where
 toJSON (SearchMessages { limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "searchMessages", "limit" A..= limit, "offset_message_id" A..= offset_message_id, "offset_chat_id" A..= offset_chat_id, "offset_date" A..= offset_date, "query" A..= query, "chat_list" A..= chat_list ]

instance T.FromJSON SearchMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchMessages" -> parseSearchMessages v
   _ -> mempty
  where
   parseSearchMessages :: A.Value -> T.Parser SearchMessages
   parseSearchMessages = A.withObject "SearchMessages" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_message_id <- mconcat [ o A..:? "offset_message_id", readMaybe <$> (o A..: "offset_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_chat_id <- mconcat [ o A..:? "offset_chat_id", readMaybe <$> (o A..: "offset_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_date <- mconcat [ o A..:? "offset_date", readMaybe <$> (o A..: "offset_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_list <- o A..:? "chat_list"
    return $ SearchMessages { limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }