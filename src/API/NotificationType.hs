-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.PushMessageContent as PushMessageContent

--main = putStrLn "ok"

data NotificationType = 
 NotificationTypeNewMessage { message :: Message.Message }  
 | NotificationTypeNewSecretChat 
 | NotificationTypeNewCall { call_id :: Int }  
 | NotificationTypeNewPushMessage { content :: PushMessageContent.PushMessageContent, is_outgoing :: Bool, sender_name :: String, sender_user_id :: Int, message_id :: Int }  deriving (Show)

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

   _ -> mempty ""
  where
   parseNotificationTypeNewMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
    message <- o A..: "message"
    return $ NotificationTypeNewMessage { message = message }

   parseNotificationTypeNewSecretChat :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewSecretChat = A.withObject "NotificationTypeNewSecretChat" $ \o -> do
    return $ NotificationTypeNewSecretChat {  }

   parseNotificationTypeNewCall :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
    call_id <- o A..: "call_id"
    return $ NotificationTypeNewCall { call_id = call_id }

   parseNotificationTypeNewPushMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
    content <- o A..: "content"
    is_outgoing <- o A..: "is_outgoing"
    sender_name <- o A..: "sender_name"
    sender_user_id <- o A..: "sender_user_id"
    message_id <- o A..: "message_id"
    return $ NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender_user_id = sender_user_id, message_id = message_id }