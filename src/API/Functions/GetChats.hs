-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Returns an ordered list of chats in a chat list. Chats are sorted by the pair (order, chat_id) in decreasing order. (For example, to get a list of chats from the beginning, the offset_order should be equal to a biggest signed 64-bit number 9223372036854775807 == 2^63 - 1).
-- 
-- -For optimal performance the number of returned chats is chosen by the library
-- 
-- __chat_list__ The chat list in which to return chats
-- 
-- __offset_order__ Chat order to return chats from
-- 
-- __offset_chat_id__ Chat identifier to return chats from
-- 
-- __limit__ The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
data GetChats = 

 GetChats { limit :: Maybe Int, offset_chat_id :: Maybe Int, offset_order :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  deriving (Show, Eq)

instance T.ToJSON GetChats where
 toJSON (GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "getChats", "limit" A..= limit, "offset_chat_id" A..= offset_chat_id, "offset_order" A..= offset_order, "chat_list" A..= chat_list ]

instance T.FromJSON GetChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChats" -> parseGetChats v
   _ -> mempty
  where
   parseGetChats :: A.Value -> T.Parser GetChats
   parseGetChats = A.withObject "GetChats" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_chat_id <- mconcat [ o A..:? "offset_chat_id", readMaybe <$> (o A..: "offset_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_order <- mconcat [ o A..:? "offset_order", readMaybe <$> (o A..: "offset_order" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_list <- o A..:? "chat_list"
    return $ GetChats { limit = limit, offset_chat_id = offset_chat_id, offset_order = offset_order, chat_list = chat_list }