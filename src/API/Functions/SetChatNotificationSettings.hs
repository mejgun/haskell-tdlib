-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings

data SetChatNotificationSettings = 
 SetChatNotificationSettings { notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    notification_settings <- o A..:? "notification_settings"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatNotificationSettings { notification_settings = notification_settings, chat_id = chat_id }