-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatToList where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
-- 
-- __chat_id__ Chat identifier
-- 
-- __chat_list__ The chat list. Use getChatListsToAddChat to get suitable chat lists
data AddChatToList = 

 AddChatToList { chat_list :: Maybe ChatList.ChatList, chat_id :: Maybe Int }  deriving (Eq)

instance Show AddChatToList where
 show AddChatToList { chat_list=chat_list, chat_id=chat_id } =
  "AddChatToList" ++ cc [p "chat_list" chat_list, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddChatToList where
 toJSON AddChatToList { chat_list = chat_list, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "addChatToList", "chat_list" A..= chat_list, "chat_id" A..= chat_id ]

instance T.FromJSON AddChatToList where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addChatToList" -> parseAddChatToList v
   _ -> mempty
  where
   parseAddChatToList :: A.Value -> T.Parser AddChatToList
   parseAddChatToList = A.withObject "AddChatToList" $ \o -> do
    chat_list <- o A..:? "chat_list"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddChatToList { chat_list = chat_list, chat_id = chat_id }
 parseJSON _ = mempty
