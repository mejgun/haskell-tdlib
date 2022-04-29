-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatSparseMessagePositions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

-- |
-- 
-- Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
-- 
-- -Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
-- 
-- __chat_id__ Identifier of the chat in which to return information about message positions
-- 
-- __filter__ Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
-- 
-- __from_message_id__ The message identifier from which to return information about message positions
-- 
-- __limit__ The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
data GetChatSparseMessagePositions = 

 GetChatSparseMessagePositions { limit :: Maybe Int, from_message_id :: Maybe Int, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatSparseMessagePositions where
 show GetChatSparseMessagePositions { limit=limit, from_message_id=from_message_id, _filter=_filter, chat_id=chat_id } =
  "GetChatSparseMessagePositions" ++ cc [p "limit" limit, p "from_message_id" from_message_id, p "_filter" _filter, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatSparseMessagePositions where
 toJSON GetChatSparseMessagePositions { limit = limit, from_message_id = from_message_id, _filter = _filter, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatSparseMessagePositions", "limit" A..= limit, "from_message_id" A..= from_message_id, "filter" A..= _filter, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatSparseMessagePositions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatSparseMessagePositions" -> parseGetChatSparseMessagePositions v
   _ -> mempty
  where
   parseGetChatSparseMessagePositions :: A.Value -> T.Parser GetChatSparseMessagePositions
   parseGetChatSparseMessagePositions = A.withObject "GetChatSparseMessagePositions" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _filter <- o A..:? "filter"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatSparseMessagePositions { limit = limit, from_message_id = from_message_id, _filter = _filter, chat_id = chat_id }
 parseJSON _ = mempty
