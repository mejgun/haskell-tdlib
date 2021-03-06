-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetAllNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Resets all notification settings to their default values. By default, all chats are unmuted, the sound is set to "default" and message previews are shown
data ResetAllNotificationSettings = 

 ResetAllNotificationSettings deriving (Show, Eq)

instance T.ToJSON ResetAllNotificationSettings where
 toJSON (ResetAllNotificationSettings {  }) =
  A.object [ "@type" A..= T.String "resetAllNotificationSettings" ]

instance T.FromJSON ResetAllNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetAllNotificationSettings" -> parseResetAllNotificationSettings v
   _ -> mempty
  where
   parseResetAllNotificationSettings :: A.Value -> T.Parser ResetAllNotificationSettings
   parseResetAllNotificationSettings = A.withObject "ResetAllNotificationSettings" $ \o -> do
    return $ ResetAllNotificationSettings {  }