-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroupType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data NotificationGroupType = 
 NotificationGroupTypeMessages 
 | NotificationGroupTypeMentions 
 | NotificationGroupTypeSecretChat 
 | NotificationGroupTypeCalls deriving (Show, Eq)

instance T.ToJSON NotificationGroupType where
 toJSON (NotificationGroupTypeMessages {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeMessages" ]

 toJSON (NotificationGroupTypeMentions {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeMentions" ]

 toJSON (NotificationGroupTypeSecretChat {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeSecretChat" ]

 toJSON (NotificationGroupTypeCalls {  }) =
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