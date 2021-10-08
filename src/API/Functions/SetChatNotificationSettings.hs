-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings

-- |
-- 
-- Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
-- 
-- __chat_id__ Chat identifier
-- 
-- __notification_settings__ New notification settings for the chat. If the chat is muted for more than 1 week, it is considered to be muted forever
data SetChatNotificationSettings = 

 SetChatNotificationSettings { notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatNotificationSettings where
 show SetChatNotificationSettings { notification_settings=notification_settings, chat_id=chat_id } =
  "SetChatNotificationSettings" ++ cc [p "notification_settings" notification_settings, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatNotificationSettings where
 toJSON SetChatNotificationSettings { notification_settings = notification_settings, chat_id = chat_id } =
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
 parseJSON _ = mempty
