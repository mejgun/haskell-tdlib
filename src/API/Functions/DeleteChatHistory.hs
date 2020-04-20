-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteChatHistory = 
 DeleteChatHistory { revoke :: Bool, remove_from_chat_list :: Bool, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteChatHistory where
 toJSON (DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteChatHistory", "revoke" A..= revoke, "remove_from_chat_list" A..= remove_from_chat_list, "chat_id" A..= chat_id ]
-- deleteChatHistory DeleteChatHistory  { revoke :: Bool, remove_from_chat_list :: Bool, chat_id :: Int } 



instance T.FromJSON DeleteChatHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatHistory" -> parseDeleteChatHistory v
  where
   parseDeleteChatHistory :: A.Value -> T.Parser DeleteChatHistory
   parseDeleteChatHistory = A.withObject "DeleteChatHistory" $ \o -> do
    revoke <- o A..: "revoke"
    remove_from_chat_list <- o A..: "remove_from_chat_list"
    chat_id <- o A..: "chat_id"
    return $ DeleteChatHistory { revoke = revoke, remove_from_chat_list = remove_from_chat_list, chat_id = chat_id }