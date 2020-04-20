-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ScopeNotificationSettings = 
 ScopeNotificationSettings { disable_mention_notifications :: Bool, disable_pinned_message_notifications :: Bool, show_preview :: Bool, sound :: String, mute_for :: Int }  -- deriving (Show)

instance T.ToJSON ScopeNotificationSettings where
 toJSON (ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound = sound, mute_for = mute_for }) =
  A.object [ "@type" A..= T.String "scopeNotificationSettings", "disable_mention_notifications" A..= disable_mention_notifications, "disable_pinned_message_notifications" A..= disable_pinned_message_notifications, "show_preview" A..= show_preview, "sound" A..= sound, "mute_for" A..= mute_for ]
-- scopeNotificationSettings ScopeNotificationSettings  { disable_mention_notifications :: Bool, disable_pinned_message_notifications :: Bool, show_preview :: Bool, sound :: String, mute_for :: Int } 



instance T.FromJSON ScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "scopeNotificationSettings" -> parseScopeNotificationSettings v
  where
   parseScopeNotificationSettings :: A.Value -> T.Parser ScopeNotificationSettings
   parseScopeNotificationSettings = A.withObject "ScopeNotificationSettings" $ \o -> do
    disable_mention_notifications <- o A..: "disable_mention_notifications"
    disable_pinned_message_notifications <- o A..: "disable_pinned_message_notifications"
    show_preview <- o A..: "show_preview"
    sound <- o A..: "sound"
    mute_for <- o A..: "mute_for"
    return $ ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound = sound, mute_for = mute_for }