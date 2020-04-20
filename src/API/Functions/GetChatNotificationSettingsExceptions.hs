-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatNotificationSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

--main = putStrLn "ok"

data GetChatNotificationSettingsExceptions = 
 GetChatNotificationSettingsExceptions { compare_sound :: Bool, scope :: NotificationSettingsScope.NotificationSettingsScope }  -- deriving (Show)

instance T.ToJSON GetChatNotificationSettingsExceptions where
 toJSON (GetChatNotificationSettingsExceptions { compare_sound = compare_sound, scope = scope }) =
  A.object [ "@type" A..= T.String "getChatNotificationSettingsExceptions", "compare_sound" A..= compare_sound, "scope" A..= scope ]
-- getChatNotificationSettingsExceptions GetChatNotificationSettingsExceptions  { compare_sound :: Bool, scope :: NotificationSettingsScope.NotificationSettingsScope } 

