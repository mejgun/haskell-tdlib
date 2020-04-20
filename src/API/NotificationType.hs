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
 | NotificationTypeNewPushMessage { content :: PushMessageContent.PushMessageContent, is_outgoing :: Bool, sender_name :: String, sender_user_id :: Int, message_id :: Int }  -- deriving (Show)

instance T.ToJSON NotificationType where
 toJSON (NotificationTypeNewMessage { message = message }) =
  A.object [ "@type" A..= T.String "notificationTypeNewMessage", "message" A..= message ]

 toJSON (NotificationTypeNewSecretChat {  }) =
  A.object [ "@type" A..= T.String "notificationTypeNewSecretChat" ]

 toJSON (NotificationTypeNewCall { call_id = call_id }) =
  A.object [ "@type" A..= T.String "notificationTypeNewCall", "call_id" A..= call_id ]

 toJSON (NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender_user_id = sender_user_id, message_id = message_id }) =
  A.object [ "@type" A..= T.String "notificationTypeNewPushMessage", "content" A..= content, "is_outgoing" A..= is_outgoing, "sender_name" A..= sender_name, "sender_user_id" A..= sender_user_id, "message_id" A..= message_id ]
-- notificationTypeNewMessage NotificationType  { message :: Message.Message } 

-- notificationTypeNewSecretChat NotificationType 

-- notificationTypeNewCall NotificationType  { call_id :: Int } 

-- notificationTypeNewPushMessage NotificationType  { content :: PushMessageContent.PushMessageContent, is_outgoing :: Bool, sender_name :: String, sender_user_id :: Int, message_id :: Int } 

