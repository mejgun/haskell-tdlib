-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state
-- 
-- __chat_list__ The chat list in which to return chats; pass null to get chats from the main chat list
-- 
-- __limit__ The maximum number of chats to be returned
data GetChats = 

 GetChats { limit :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show GetChats where
 show GetChats { limit=limit, chat_list=chat_list } =
  "GetChats" ++ cc [p "limit" limit, p "chat_list" chat_list ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChats where
 toJSON GetChats { limit = limit, chat_list = chat_list } =
  A.object [ "@type" A..= T.String "getChats", "limit" A..= limit, "chat_list" A..= chat_list ]

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
    chat_list <- o A..:? "chat_list"
    return $ GetChats { limit = limit, chat_list = chat_list }
 parseJSON _ = mempty
