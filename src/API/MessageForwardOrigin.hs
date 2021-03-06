-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardOrigin where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about the origin of a forwarded message
data MessageForwardOrigin = 
 -- |
 -- 
 -- The message was originally written by a known user 
 -- 
 -- __sender_user_id__ Identifier of the user that originally sent the message
 MessageForwardOriginUser { sender_user_id :: Maybe Int }  |
 -- |
 -- 
 -- The message was originally written by a user, which is hidden by their privacy settings 
 -- 
 -- __sender_name__ Name of the sender
 MessageForwardOriginHiddenUser { sender_name :: Maybe String }  |
 -- |
 -- 
 -- The message was originally a post in a channel
 -- 
 -- __chat_id__ Identifier of the chat from which the message was originally forwarded
 -- 
 -- __message_id__ Message identifier of the original message; 0 if unknown
 -- 
 -- __author_signature__ Original post author signature
 MessageForwardOriginChannel { author_signature :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageForwardOrigin where
 toJSON (MessageForwardOriginUser { sender_user_id = sender_user_id }) =
  A.object [ "@type" A..= T.String "messageForwardOriginUser", "sender_user_id" A..= sender_user_id ]

 toJSON (MessageForwardOriginHiddenUser { sender_name = sender_name }) =
  A.object [ "@type" A..= T.String "messageForwardOriginHiddenUser", "sender_name" A..= sender_name ]

 toJSON (MessageForwardOriginChannel { author_signature = author_signature, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "messageForwardOriginChannel", "author_signature" A..= author_signature, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON MessageForwardOrigin where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardOriginUser" -> parseMessageForwardOriginUser v
   "messageForwardOriginHiddenUser" -> parseMessageForwardOriginHiddenUser v
   "messageForwardOriginChannel" -> parseMessageForwardOriginChannel v
   _ -> mempty
  where
   parseMessageForwardOriginUser :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginUser = A.withObject "MessageForwardOriginUser" $ \o -> do
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageForwardOriginUser { sender_user_id = sender_user_id }

   parseMessageForwardOriginHiddenUser :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginHiddenUser = A.withObject "MessageForwardOriginHiddenUser" $ \o -> do
    sender_name <- o A..:? "sender_name"
    return $ MessageForwardOriginHiddenUser { sender_name = sender_name }

   parseMessageForwardOriginChannel :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginChannel = A.withObject "MessageForwardOriginChannel" $ \o -> do
    author_signature <- o A..:? "author_signature"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageForwardOriginChannel { author_signature = author_signature, message_id = message_id, chat_id = chat_id }