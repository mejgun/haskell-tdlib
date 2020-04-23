-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatHistory where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteChatHistory = 
 DeleteChatHistory { revoke :: Maybe Bool, remove_from_chat_list :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON DeleteChatHistory where
 toJSON (DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id }) =
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
    revoke <- optional $ o A..: "revoke"
    remove_from_chat_list <- optional $ o A..: "remove_from_chat_list"
    chat_id <- optional $ o A..: "chat_id"
    return $ DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id }