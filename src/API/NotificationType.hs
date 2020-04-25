-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.PushMessageContent as PushMessageContent

data NotificationType = 
 NotificationTypeNewMessage { message :: Maybe Message.Message }  
 | NotificationTypeNewSecretChat 
 | NotificationTypeNewCall { call_id :: Maybe Int }  
 | NotificationTypeNewPushMessage { content :: Maybe PushMessageContent.PushMessageContent, is_outgoing :: Maybe Bool, sender_name :: Maybe String, sender_user_id :: Maybe Int, message_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON NotificationType where
 toJSON (NotificationTypeNewMessage { message = message }) =
  A.object [ "@type" A..= T.String "notificationTypeNewMessage", "message" A..= message ]

 toJSON (NotificationTypeNewSecretChat {  }) =
  A.object [ "@type" A..= T.String "notificationTypeNewSecretChat" ]

 toJSON (NotificationTypeNewCall { call_id = call_id }) =
  A.object [ "@type" A..= T.String "notificationTypeNewCall", "call_id" A..= call_id ]

 toJSON (NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender_user_id = sender_user_id, message_id = message_id }) =
  A.object [ "@type" A..= T.String "notificationTypeNewPushMessage", "content" A..= content, "is_outgoing" A..= is_outgoing, "sender_name" A..= sender_name, "sender_user_id" A..= sender_user_id, "message_id" A..= message_id ]

instance T.FromJSON NotificationType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationTypeNewMessage" -> parseNotificationTypeNewMessage v
   "notificationTypeNewSecretChat" -> parseNotificationTypeNewSecretChat v
   "notificationTypeNewCall" -> parseNotificationTypeNewCall v
   "notificationTypeNewPushMessage" -> parseNotificationTypeNewPushMessage v
   _ -> mempty
  where
   parseNotificationTypeNewMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
    message <- o A..:? "message"
    return $ NotificationTypeNewMessage { message = message }

   parseNotificationTypeNewSecretChat :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewSecretChat = A.withObject "NotificationTypeNewSecretChat" $ \o -> do
    return $ NotificationTypeNewSecretChat {  }

   parseNotificationTypeNewCall :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationTypeNewCall { call_id = call_id }

   parseNotificationTypeNewPushMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
    content <- o A..:? "content"
    is_outgoing <- o A..:? "is_outgoing"
    sender_name <- o A..:? "sender_name"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender_user_id = sender_user_id, message_id = message_id }