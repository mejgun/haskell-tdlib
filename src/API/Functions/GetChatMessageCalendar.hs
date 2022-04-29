-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageCalendar where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

-- |
-- 
-- Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset"
-- 
-- __chat_id__ Identifier of the chat in which to return information about messages
-- 
-- __filter__ Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
-- 
-- __from_message_id__ The message identifier from which to return information about messages; use 0 to get results from the last message
data GetChatMessageCalendar = 

 GetChatMessageCalendar { from_message_id :: Maybe Int, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatMessageCalendar where
 show GetChatMessageCalendar { from_message_id=from_message_id, _filter=_filter, chat_id=chat_id } =
  "GetChatMessageCalendar" ++ cc [p "from_message_id" from_message_id, p "_filter" _filter, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatMessageCalendar where
 toJSON GetChatMessageCalendar { from_message_id = from_message_id, _filter = _filter, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatMessageCalendar", "from_message_id" A..= from_message_id, "filter" A..= _filter, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMessageCalendar where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMessageCalendar" -> parseGetChatMessageCalendar v
   _ -> mempty
  where
   parseGetChatMessageCalendar :: A.Value -> T.Parser GetChatMessageCalendar
   parseGetChatMessageCalendar = A.withObject "GetChatMessageCalendar" $ \o -> do
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _filter <- o A..:? "filter"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatMessageCalendar { from_message_id = from_message_id, _filter = _filter, chat_id = chat_id }
 parseJSON _ = mempty
