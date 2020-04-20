-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings

--main = putStrLn "ok"

data SetChatNotificationSettings = 
 SetChatNotificationSettings { notification_settings :: ChatNotificationSettings.ChatNotificationSettings, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatNotificationSettings where
 toJSON (SetChatNotificationSettings { notification_settings = notification_settings, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatNotificationSettings", "notification_settings" A..= notification_settings, "chat_id" A..= chat_id ]
-- setChatNotificationSettings SetChatNotificationSettings  { notification_settings :: ChatNotificationSettings.ChatNotificationSettings, chat_id :: Int } 

