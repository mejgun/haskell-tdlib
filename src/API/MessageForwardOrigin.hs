-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardOrigin where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about the origin of a forwarded message
data MessageForwardOrigin = 
 -- |
 -- 
 -- The message was originally sent by a known user 
 -- 
 -- __sender_user_id__ Identifier of the user that originally sent the message
 MessageForwardOriginUser { sender_user_id :: Maybe Int }  |
 -- |
 -- 
 -- The message was originally sent on behalf of a chat
 -- 
 -- __sender_chat_id__ Identifier of the chat that originally sent the message
 -- 
 -- __author_signature__ For messages originally sent by an anonymous chat administrator, original message author signature
 MessageForwardOriginChat { author_signature :: Maybe String, sender_chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The message was originally sent by a user, which is hidden by their privacy settings 
 -- 
 -- __sender_name__ Name of the sender
 MessageForwardOriginHiddenUser { sender_name :: Maybe String }  |
 -- |
 -- 
 -- The message was originally a post in a channel
 -- 
 -- __chat_id__ Identifier of the chat from which the message was originally forwarded
 -- 
 -- __message_id__ Message identifier of the original message
 -- 
 -- __author_signature__ Original post author signature
 MessageForwardOriginChannel { author_signature :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The message was imported from an exported message history 
 -- 
 -- __sender_name__ Name of the sender
 MessageForwardOriginMessageImport { sender_name :: Maybe String }  deriving (Eq)

instance Show MessageForwardOrigin where
 show MessageForwardOriginUser { sender_user_id=sender_user_id } =
  "MessageForwardOriginUser" ++ U.cc [U.p "sender_user_id" sender_user_id ]

 show MessageForwardOriginChat { author_signature=author_signature, sender_chat_id=sender_chat_id } =
  "MessageForwardOriginChat" ++ U.cc [U.p "author_signature" author_signature, U.p "sender_chat_id" sender_chat_id ]

 show MessageForwardOriginHiddenUser { sender_name=sender_name } =
  "MessageForwardOriginHiddenUser" ++ U.cc [U.p "sender_name" sender_name ]

 show MessageForwardOriginChannel { author_signature=author_signature, message_id=message_id, chat_id=chat_id } =
  "MessageForwardOriginChannel" ++ U.cc [U.p "author_signature" author_signature, U.p "message_id" message_id, U.p "chat_id" chat_id ]

 show MessageForwardOriginMessageImport { sender_name=sender_name } =
  "MessageForwardOriginMessageImport" ++ U.cc [U.p "sender_name" sender_name ]

instance T.ToJSON MessageForwardOrigin where
 toJSON MessageForwardOriginUser { sender_user_id = sender_user_id } =
  A.object [ "@type" A..= T.String "messageForwardOriginUser", "sender_user_id" A..= sender_user_id ]

 toJSON MessageForwardOriginChat { author_signature = author_signature, sender_chat_id = sender_chat_id } =
  A.object [ "@type" A..= T.String "messageForwardOriginChat", "author_signature" A..= author_signature, "sender_chat_id" A..= sender_chat_id ]

 toJSON MessageForwardOriginHiddenUser { sender_name = sender_name } =
  A.object [ "@type" A..= T.String "messageForwardOriginHiddenUser", "sender_name" A..= sender_name ]

 toJSON MessageForwardOriginChannel { author_signature = author_signature, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "messageForwardOriginChannel", "author_signature" A..= author_signature, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON MessageForwardOriginMessageImport { sender_name = sender_name } =
  A.object [ "@type" A..= T.String "messageForwardOriginMessageImport", "sender_name" A..= sender_name ]

instance T.FromJSON MessageForwardOrigin where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardOriginUser" -> parseMessageForwardOriginUser v
   "messageForwardOriginChat" -> parseMessageForwardOriginChat v
   "messageForwardOriginHiddenUser" -> parseMessageForwardOriginHiddenUser v
   "messageForwardOriginChannel" -> parseMessageForwardOriginChannel v
   "messageForwardOriginMessageImport" -> parseMessageForwardOriginMessageImport v
   _ -> mempty
  where
   parseMessageForwardOriginUser :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginUser = A.withObject "MessageForwardOriginUser" $ \o -> do
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageForwardOriginUser { sender_user_id = sender_user_id }

   parseMessageForwardOriginChat :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginChat = A.withObject "MessageForwardOriginChat" $ \o -> do
    author_signature <- o A..:? "author_signature"
    sender_chat_id <- mconcat [ o A..:? "sender_chat_id", readMaybe <$> (o A..: "sender_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageForwardOriginChat { author_signature = author_signature, sender_chat_id = sender_chat_id }

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

   parseMessageForwardOriginMessageImport :: A.Value -> T.Parser MessageForwardOrigin
   parseMessageForwardOriginMessageImport = A.withObject "MessageForwardOriginMessageImport" $ \o -> do
    sender_name <- o A..:? "sender_name"
    return $ MessageForwardOriginMessageImport { sender_name = sender_name }
 parseJSON _ = mempty
