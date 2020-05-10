-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatNotificationSettingsExceptions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

-- |
-- 
-- Returns list of chats with non-default notification settings 
-- 
-- __scope__ If specified, only chats from the specified scope will be returned
-- 
-- __compare_sound__ If true, also chats with non-default sound will be returned
data GetChatNotificationSettingsExceptions = 

 GetChatNotificationSettingsExceptions { compare_sound :: Maybe Bool, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  deriving (Show, Eq)

instance T.ToJSON GetChatNotificationSettingsExceptions where
 toJSON (GetChatNotificationSettingsExceptions { compare_sound = compare_sound, scope = scope }) =
  A.object [ "@type" A..= T.String "getChatNotificationSettingsExceptions", "compare_sound" A..= compare_sound, "scope" A..= scope ]

instance T.FromJSON GetChatNotificationSettingsExceptions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatNotificationSettingsExceptions" -> parseGetChatNotificationSettingsExceptions v
   _ -> mempty
  where
   parseGetChatNotificationSettingsExceptions :: A.Value -> T.Parser GetChatNotificationSettingsExceptions
   parseGetChatNotificationSettingsExceptions = A.withObject "GetChatNotificationSettingsExceptions" $ \o -> do
    compare_sound <- o A..:? "compare_sound"
    scope <- o A..:? "scope"
    return $ GetChatNotificationSettingsExceptions { compare_sound = compare_sound, scope = scope }