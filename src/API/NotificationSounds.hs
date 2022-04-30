-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationSounds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.NotificationSound as NotificationSound

-- |
-- 
-- Contains a list of notification sounds 
-- 
-- __notification_sounds__ A list of notification sounds
data NotificationSounds = 

 NotificationSounds { notification_sounds :: Maybe [NotificationSound.NotificationSound] }  deriving (Eq)

instance Show NotificationSounds where
 show NotificationSounds { notification_sounds=notification_sounds } =
  "NotificationSounds" ++ U.cc [U.p "notification_sounds" notification_sounds ]

instance T.ToJSON NotificationSounds where
 toJSON NotificationSounds { notification_sounds = notification_sounds } =
  A.object [ "@type" A..= T.String "notificationSounds", "notification_sounds" A..= notification_sounds ]

instance T.FromJSON NotificationSounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationSounds" -> parseNotificationSounds v
   _ -> mempty
  where
   parseNotificationSounds :: A.Value -> T.Parser NotificationSounds
   parseNotificationSounds = A.withObject "NotificationSounds" $ \o -> do
    notification_sounds <- o A..:? "notification_sounds"
    return $ NotificationSounds { notification_sounds = notification_sounds }
 parseJSON _ = mempty
