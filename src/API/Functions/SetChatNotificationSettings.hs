-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings

data SetChatNotificationSettings = 
 SetChatNotificationSettings { notification_settings :: ChatNotificationSettings.ChatNotificationSettings, chat_id :: Int }  deriving (Show)

instance T.ToJSON SetChatNotificationSettings where
 toJSON (SetChatNotificationSettings { notification_settings = notification_settings, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatNotificationSettings", "notification_settings" A..= notification_settings, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatNotificationSettings" -> parseSetChatNotificationSettings v
   _ -> mempty
  where
   parseSetChatNotificationSettings :: A.Value -> T.Parser SetChatNotificationSettings
   parseSetChatNotificationSettings = A.withObject "SetChatNotificationSettings" $ \o -> do
    notification_settings <- o A..: "notification_settings"
    chat_id <- o A..: "chat_id"
    return $ SetChatNotificationSettings { notification_settings = notification_settings, chat_id = chat_id }