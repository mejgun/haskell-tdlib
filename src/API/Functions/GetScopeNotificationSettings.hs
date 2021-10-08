-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetScopeNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

-- |
-- 
-- Returns the notification settings for chats of a given type 
-- 
-- __scope__ Types of chats for which to return the notification settings information
data GetScopeNotificationSettings = 

 GetScopeNotificationSettings { scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  deriving (Eq)

instance Show GetScopeNotificationSettings where
 show GetScopeNotificationSettings { scope=scope } =
  "GetScopeNotificationSettings" ++ cc [p "scope" scope ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetScopeNotificationSettings where
 toJSON GetScopeNotificationSettings { scope = scope } =
  A.object [ "@type" A..= T.String "getScopeNotificationSettings", "scope" A..= scope ]

instance T.FromJSON GetScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getScopeNotificationSettings" -> parseGetScopeNotificationSettings v
   _ -> mempty
  where
   parseGetScopeNotificationSettings :: A.Value -> T.Parser GetScopeNotificationSettings
   parseGetScopeNotificationSettings = A.withObject "GetScopeNotificationSettings" $ \o -> do
    scope <- o A..:? "scope"
    return $ GetScopeNotificationSettings { scope = scope }
 parseJSON _ = mempty
