-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSender where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about the sender of a message
data MessageSender = 
 -- |
 -- 
 -- The message was sent by a known user 
 -- 
 -- __user_id__ Identifier of the user that sent the message
 MessageSenderUser { user_id :: Maybe Int }  |
 -- |
 -- 
 -- The message was sent on behalf of a chat 
 -- 
 -- __chat_id__ Identifier of the chat that sent the message
 MessageSenderChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageSender where
 toJSON (MessageSenderUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "messageSenderUser", "user_id" A..= user_id ]

 toJSON (MessageSenderChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "messageSenderChat", "chat_id" A..= chat_id ]

instance T.FromJSON MessageSender where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSenderUser" -> parseMessageSenderUser v
   "messageSenderChat" -> parseMessageSenderChat v
   _ -> mempty
  where
   parseMessageSenderUser :: A.Value -> T.Parser MessageSender
   parseMessageSenderUser = A.withObject "MessageSenderUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageSenderUser { user_id = user_id }

   parseMessageSenderChat :: A.Value -> T.Parser MessageSender
   parseMessageSenderChat = A.withObject "MessageSenderChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageSenderChat { chat_id = chat_id }