-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLocalMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent

-- |
-- 
-- Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message 
-- 
-- __chat_id__ Target chat
-- 
-- __sender_user_id__ Identifier of the user who will be shown as the sender of the message; may be 0 for channel posts
-- 
-- __reply_to_message_id__ Identifier of the message to reply to or 0
-- 
-- __disable_notification__ Pass true to disable notification for the message
-- 
-- __input_message_content__ The content of the message to be added
data AddLocalMessage = 

 AddLocalMessage { input_message_content :: Maybe InputMessageContent.InputMessageContent, disable_notification :: Maybe Bool, reply_to_message_id :: Maybe Int, sender_user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AddLocalMessage where
 toJSON (AddLocalMessage { input_message_content = input_message_content, disable_notification = disable_notification, reply_to_message_id = reply_to_message_id, sender_user_id = sender_user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addLocalMessage", "input_message_content" A..= input_message_content, "disable_notification" A..= disable_notification, "reply_to_message_id" A..= reply_to_message_id, "sender_user_id" A..= sender_user_id, "chat_id" A..= chat_id ]

instance T.FromJSON AddLocalMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addLocalMessage" -> parseAddLocalMessage v
   _ -> mempty
  where
   parseAddLocalMessage :: A.Value -> T.Parser AddLocalMessage
   parseAddLocalMessage = A.withObject "AddLocalMessage" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    disable_notification <- o A..:? "disable_notification"
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddLocalMessage { input_message_content = input_message_content, disable_notification = disable_notification, reply_to_message_id = reply_to_message_id, sender_user_id = sender_user_id, chat_id = chat_id }