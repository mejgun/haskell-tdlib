-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatMessagesFromUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteChatMessagesFromUser = 
 DeleteChatMessagesFromUser { user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteChatMessagesFromUser where
 toJSON (DeleteChatMessagesFromUser { user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteChatMessagesFromUser", "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- deleteChatMessagesFromUser DeleteChatMessagesFromUser  { user_id :: Int, chat_id :: Int } 



instance T.FromJSON DeleteChatMessagesFromUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatMessagesFromUser" -> parseDeleteChatMessagesFromUser v
  where
   parseDeleteChatMessagesFromUser :: A.Value -> T.Parser DeleteChatMessagesFromUser
   parseDeleteChatMessagesFromUser = A.withObject "DeleteChatMessagesFromUser" $ \o -> do
    user_id <- o A..: "user_id"
    chat_id <- o A..: "chat_id"
    return $ DeleteChatMessagesFromUser { user_id = user_id, chat_id = chat_id }