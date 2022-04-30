-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatHistory where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __remove_from_chat_list__ Pass true to remove the chat from all chat lists
-- 
-- __revoke__ Pass true to delete chat history for all users
data DeleteChatHistory = 

 DeleteChatHistory { revoke :: Maybe Bool, remove_from_chat_list :: Maybe Bool, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatHistory where
 show DeleteChatHistory { revoke=revoke, remove_from_chat_list=remove_from_chat_list, chat_id=chat_id } =
  "DeleteChatHistory" ++ U.cc [U.p "revoke" revoke, U.p "remove_from_chat_list" remove_from_chat_list, U.p "chat_id" chat_id ]

instance T.ToJSON DeleteChatHistory where
 toJSON DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChatHistory", "revoke" A..= revoke, "remove_from_chat_list" A..= remove_from_chat_list, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatHistory" -> parseDeleteChatHistory v
   _ -> mempty
  where
   parseDeleteChatHistory :: A.Value -> T.Parser DeleteChatHistory
   parseDeleteChatHistory = A.withObject "DeleteChatHistory" $ \o -> do
    revoke <- o A..:? "revoke"
    remove_from_chat_list <- o A..:? "remove_from_chat_list"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id }
 parseJSON _ = mempty
