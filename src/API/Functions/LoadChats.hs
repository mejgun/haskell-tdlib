-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LoadChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. Returns a 404 error if all chats has been loaded
-- 
-- __chat_list__ The chat list in which to load chats; pass null to load chats from the main chat list
-- 
-- __limit__ The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
data LoadChats = 

 LoadChats { limit :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show LoadChats where
 show LoadChats { limit=limit, chat_list=chat_list } =
  "LoadChats" ++ cc [p "limit" limit, p "chat_list" chat_list ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LoadChats where
 toJSON LoadChats { limit = limit, chat_list = chat_list } =
  A.object [ "@type" A..= T.String "loadChats", "limit" A..= limit, "chat_list" A..= chat_list ]

instance T.FromJSON LoadChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "loadChats" -> parseLoadChats v
   _ -> mempty
  where
   parseLoadChats :: A.Value -> T.Parser LoadChats
   parseLoadChats = A.withObject "LoadChats" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_list <- o A..:? "chat_list"
    return $ LoadChats { limit = limit, chat_list = chat_list }
 parseJSON _ = mempty
