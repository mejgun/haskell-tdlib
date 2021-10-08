-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatNotificationSettingsExceptions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

-- |
-- 
-- Returns list of chats with non-default notification settings
-- 
-- __scope__ If specified, only chats from the scope will be returned; pass null to return chats from all scopes
-- 
-- __compare_sound__ If true, also chats with non-default sound will be returned
data GetChatNotificationSettingsExceptions = 

 GetChatNotificationSettingsExceptions { compare_sound :: Maybe Bool, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  deriving (Eq)

instance Show GetChatNotificationSettingsExceptions where
 show GetChatNotificationSettingsExceptions { compare_sound=compare_sound, scope=scope } =
  "GetChatNotificationSettingsExceptions" ++ cc [p "compare_sound" compare_sound, p "scope" scope ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatNotificationSettingsExceptions where
 toJSON GetChatNotificationSettingsExceptions { compare_sound = compare_sound, scope = scope } =
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
 parseJSON _ = mempty
