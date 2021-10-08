-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatMessagesFromUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes all messages sent by the specified user to a chat. Supported only for supergroups; requires can_delete_messages administrator privileges 
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ User identifier
data DeleteChatMessagesFromUser = 

 DeleteChatMessagesFromUser { user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatMessagesFromUser where
 show DeleteChatMessagesFromUser { user_id=user_id, chat_id=chat_id } =
  "DeleteChatMessagesFromUser" ++ cc [p "user_id" user_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteChatMessagesFromUser where
 toJSON DeleteChatMessagesFromUser { user_id = user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChatMessagesFromUser", "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatMessagesFromUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatMessagesFromUser" -> parseDeleteChatMessagesFromUser v
   _ -> mempty
  where
   parseDeleteChatMessagesFromUser :: A.Value -> T.Parser DeleteChatMessagesFromUser
   parseDeleteChatMessagesFromUser = A.withObject "DeleteChatMessagesFromUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatMessagesFromUser { user_id = user_id, chat_id = chat_id }
 parseJSON _ = mempty
