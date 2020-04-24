-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardOrigin where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data MessageForwardOrigin = 
 MessageForwardOriginUser { sender_user_id :: Maybe Int }  
 | MessageForwardOriginHiddenUser { sender_name :: Maybe String }  
 | MessageForwardOriginChannel { author_signature :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    sender_user_id <- optional $ o A..: "sender_user_id"
    return $ MessageForwardOriginUser { sender_user_id = sender_user_id }

   parseMessageForwardOriginHiddenUser :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginHiddenUser = A.withObject "MessageForwardOriginHiddenUser" $ \o -> do
    sender_name <- optional $ o A..: "sender_name"
    return $ MessageForwardOriginHiddenUser { sender_name = sender_name }

   parseMessageForwardOriginChannel :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginChannel = A.withObject "MessageForwardOriginChannel" $ \o -> do
    author_signature <- optional $ o A..: "author_signature"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ MessageForwardOriginChannel { author_signature = author_signature, message_id = message_id, chat_id = chat_id }