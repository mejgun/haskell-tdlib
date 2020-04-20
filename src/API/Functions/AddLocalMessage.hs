-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLocalMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent

--main = putStrLn "ok"

data AddLocalMessage = 
 AddLocalMessage { input_message_content :: InputMessageContent.InputMessageContent, disable_notification :: Bool, reply_to_message_id :: Int, sender_user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON AddLocalMessage where
 toJSON (AddLocalMessage { input_message_content = input_message_content, disable_notification = disable_notification, reply_to_message_id = reply_to_message_id, sender_user_id = sender_user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addLocalMessage", "input_message_content" A..= input_message_content, "disable_notification" A..= disable_notification, "reply_to_message_id" A..= reply_to_message_id, "sender_user_id" A..= sender_user_id, "chat_id" A..= chat_id ]
-- addLocalMessage AddLocalMessage  { input_message_content :: InputMessageContent.InputMessageContent, disable_notification :: Bool, reply_to_message_id :: Int, sender_user_id :: Int, chat_id :: Int } 



instance T.FromJSON AddLocalMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addLocalMessage" -> parseAddLocalMessage v
  where
   parseAddLocalMessage :: A.Value -> T.Parser AddLocalMessage
   parseAddLocalMessage = A.withObject "AddLocalMessage" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    disable_notification <- o A..: "disable_notification"
    reply_to_message_id <- o A..: "reply_to_message_id"
    sender_user_id <- o A..: "sender_user_id"
    chat_id <- o A..: "chat_id"
    return $ AddLocalMessage { input_message_content = input_message_content, disable_notification = disable_notification, reply_to_message_id = reply_to_message_id, sender_user_id = sender_user_id, chat_id = chat_id }