-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMessageSender where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Selects a message sender to send messages in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_sender_id__ New message sender for the chat
data SetChatMessageSender = 

 SetChatMessageSender { message_sender_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatMessageSender where
 show SetChatMessageSender { message_sender_id=message_sender_id, chat_id=chat_id } =
  "SetChatMessageSender" ++ U.cc [U.p "message_sender_id" message_sender_id, U.p "chat_id" chat_id ]

instance T.ToJSON SetChatMessageSender where
 toJSON SetChatMessageSender { message_sender_id = message_sender_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatMessageSender", "message_sender_id" A..= message_sender_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatMessageSender where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMessageSender" -> parseSetChatMessageSender v
   _ -> mempty
  where
   parseSetChatMessageSender :: A.Value -> T.Parser SetChatMessageSender
   parseSetChatMessageSender = A.withObject "SetChatMessageSender" $ \o -> do
    message_sender_id <- o A..:? "message_sender_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatMessageSender { message_sender_id = message_sender_id, chat_id = chat_id }
 parseJSON _ = mempty
