-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetAllNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
data ResetAllNotificationSettings = 

 ResetAllNotificationSettings deriving (Eq)

instance Show ResetAllNotificationSettings where
 show ResetAllNotificationSettings {  } =
  "ResetAllNotificationSettings" ++ U.cc [ ]

instance T.ToJSON ResetAllNotificationSettings where
 toJSON ResetAllNotificationSettings {  } =
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
 parseJSON _ = mempty
