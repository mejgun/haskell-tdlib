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



instance T.FromJSON GetScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getScopeNotificationSettings" -> parseGetScopeNotificationSettings v
  where
   parseGetScopeNotificationSettings :: A.Value -> T.Parser GetScopeNotificationSettings
   parseGetScopeNotificationSettings = A.withObject "GetScopeNotificationSettings" $ \o -> do
    scope <- o A..: "scope"
    return $ GetScopeNotificationSettings { scope = scope }