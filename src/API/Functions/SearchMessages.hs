-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
-- 
-- -For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __chat_list__ Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
-- 
-- __query__ Query to search for
-- 
-- __offset_date__ The date of the message starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last message
-- 
-- __offset_chat_id__ The chat identifier of the last found message, or 0 for the first request
-- 
-- __offset_message_id__ The message identifier of the last found message, or 0 for the first request
-- 
-- __limit__ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __filter__ Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
-- 
-- __min_date__ If not 0, the minimum date of the messages to return
-- 
-- __max_date__ If not 0, the maximum date of the messages to return
data SearchMessages = 

 SearchMessages { max_date :: Maybe Int, min_date :: Maybe Int, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, limit :: Maybe Int, offset_message_id :: Maybe Int, offset_chat_id :: Maybe Int, offset_date :: Maybe Int, query :: Maybe String, chat_list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show SearchMessages where
 show SearchMessages { max_date=max_date, min_date=min_date, _filter=_filter, limit=limit, offset_message_id=offset_message_id, offset_chat_id=offset_chat_id, offset_date=offset_date, query=query, chat_list=chat_list } =
  "SearchMessages" ++ cc [p "max_date" max_date, p "min_date" min_date, p "_filter" _filter, p "limit" limit, p "offset_message_id" offset_message_id, p "offset_chat_id" offset_chat_id, p "offset_date" offset_date, p "query" query, p "chat_list" chat_list ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchMessages where
 toJSON SearchMessages { max_date = max_date, min_date = min_date, _filter = _filter, limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list } =
  A.object [ "@type" A..= T.String "searchMessages", "max_date" A..= max_date, "min_date" A..= min_date, "filter" A..= _filter, "limit" A..= limit, "offset_message_id" A..= offset_message_id, "offset_chat_id" A..= offset_chat_id, "offset_date" A..= offset_date, "query" A..= query, "chat_list" A..= chat_list ]

instance T.FromJSON SearchMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchMessages" -> parseSearchMessages v
   _ -> mempty
  where
   parseSearchMessages :: A.Value -> T.Parser SearchMessages
   parseSearchMessages = A.withObject "SearchMessages" $ \o -> do
    max_date <- mconcat [ o A..:? "max_date", readMaybe <$> (o A..: "max_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    min_date <- mconcat [ o A..:? "min_date", readMaybe <$> (o A..: "min_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _filter <- o A..:? "filter"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_message_id <- mconcat [ o A..:? "offset_message_id", readMaybe <$> (o A..: "offset_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_chat_id <- mconcat [ o A..:? "offset_chat_id", readMaybe <$> (o A..: "offset_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_date <- mconcat [ o A..:? "offset_date", readMaybe <$> (o A..: "offset_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    chat_list <- o A..:? "chat_list"
    return $ SearchMessages { max_date = max_date, min_date = min_date, _filter = _filter, limit = limit, offset_message_id = offset_message_id, offset_chat_id = offset_chat_id, offset_date = offset_date, query = query, chat_list = chat_list }
 parseJSON _ = mempty
