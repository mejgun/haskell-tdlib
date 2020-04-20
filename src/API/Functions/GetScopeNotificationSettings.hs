-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

--main = putStrLn "ok"

data GetScopeNotificationSettings = 
 GetScopeNotificationSettings { scope :: NotificationSettingsScope.NotificationSettingsScope }  -- deriving (Show)

instance T.ToJSON GetScopeNotificationSettings where
 toJSON (GetScopeNotificationSettings { scope = scope }) =
  A.object [ "@type" A..= T.String "getScopeNotificationSettings", "scope" A..= scope ]
-- getScopeNotificationSettings GetScopeNotificationSettings  { scope :: NotificationSettingsScope.NotificationSettingsScope } 

