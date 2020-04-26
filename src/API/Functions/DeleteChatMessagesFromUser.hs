-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatMessagesFromUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Deletes all messages sent by the specified user to a chat. Supported only for supergroups; requires can_delete_messages administrator privileges 
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ User identifier
data DeleteChatMessagesFromUser = 
 DeleteChatMessagesFromUser { user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteChatMessagesFromUser where
 toJSON (DeleteChatMessagesFromUser { user_id = user_id, chat_id = chat_id }) =
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