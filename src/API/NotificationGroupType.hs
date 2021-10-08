-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroupType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the type of notifications in a notification group
data NotificationGroupType = 
 -- |
 -- 
 -- A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
 NotificationGroupTypeMessages |
 -- |
 -- 
 -- A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
 NotificationGroupTypeMentions |
 -- |
 -- 
 -- A group containing a notification of type notificationTypeNewSecretChat
 NotificationGroupTypeSecretChat |
 -- |
 -- 
 -- A group containing notifications of type notificationTypeNewCall
 NotificationGroupTypeCalls deriving (Eq)

instance Show NotificationGroupType where
 show NotificationGroupTypeMessages {  } =
  "NotificationGroupTypeMessages" ++ cc [ ]

 show NotificationGroupTypeMentions {  } =
  "NotificationGroupTypeMentions" ++ cc [ ]

 show NotificationGroupTypeSecretChat {  } =
  "NotificationGroupTypeSecretChat" ++ cc [ ]

 show NotificationGroupTypeCalls {  } =
  "NotificationGroupTypeCalls" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON NotificationGroupType where
 toJSON NotificationGroupTypeMessages {  } =
  A.object [ "@type" A..= T.String "notificationGroupTypeMessages" ]

 toJSON NotificationGroupTypeMentions {  } =
  A.object [ "@type" A..= T.String "notificationGroupTypeMentions" ]

 toJSON NotificationGroupTypeSecretChat {  } =
  A.object [ "@type" A..= T.String "notificationGroupTypeSecretChat" ]

 toJSON NotificationGroupTypeCalls {  } =
  A.object [ "@type" A..= T.String "notificationGroupTypeCalls" ]

instance T.FromJSON NotificationGroupType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationGroupTypeMessages" -> parseNotificationGroupTypeMessages v
   "notificationGroupTypeMentions" -> parseNotificationGroupTypeMentions v
   "notificationGroupTypeSecretChat" -> parseNotificationGroupTypeSecretChat v
   "notificationGroupTypeCalls" -> parseNotificationGroupTypeCalls v
   _ -> mempty
  where
   parseNotificationGroupTypeMessages :: A.Value -> T.Parser NotificationGroupType
   parseNotificationGroupTypeMessages = A.withObject "NotificationGroupTypeMessages" $ \o -> do
    return $ NotificationGroupTypeMessages {  }

   parseNotificationGroupTypeMentions :: A.Value -> T.Parser NotificationGroupType
   parseNotificationGroupTypeMentions = A.withObject "NotificationGroupTypeMentions" $ \o -> do
    return $ NotificationGroupTypeMentions {  }

   parseNotificationGroupTypeSecretChat :: A.Value -> T.Parser NotificationGroupType
   parseNotificationGroupTypeSecretChat = A.withObject "NotificationGroupTypeSecretChat" $ \o -> do
    return $ NotificationGroupTypeSecretChat {  }

   parseNotificationGroupTypeCalls :: A.Value -> T.Parser NotificationGroupType
   parseNotificationGroupTypeCalls = A.withObject "NotificationGroupTypeCalls" $ \o -> do
    return $ NotificationGroupTypeCalls {  }
 parseJSON _ = mempty
