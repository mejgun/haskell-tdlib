-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatNotificationSettings = 
 ChatNotificationSettings { disable_mention_notifications :: Bool, use_default_disable_mention_notifications :: Bool, disable_pinned_message_notifications :: Bool, use_default_disable_pinned_message_notifications :: Bool, show_preview :: Bool, use_default_show_preview :: Bool, sound :: String, use_default_sound :: Bool, mute_for :: Int, use_default_mute_for :: Bool }  -- deriving (Show)

instance T.ToJSON ChatNotificationSettings where
 toJSON (ChatNotificationSettings { disable_mention_notifications = disable_mention_notifications, use_default_disable_mention_notifications = use_default_disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications, show_preview = show_preview, use_default_show_preview = use_default_show_preview, sound = sound, use_default_sound = use_default_sound, mute_for = mute_for, use_default_mute_for = use_default_mute_for }) =
  A.object [ "@type" A..= T.String "chatNotificationSettings", "disable_mention_notifications" A..= disable_mention_notifications, "use_default_disable_mention_notifications" A..= use_default_disable_mention_notifications, "disable_pinned_message_notifications" A..= disable_pinned_message_notifications, "use_default_disable_pinned_message_notifications" A..= use_default_disable_pinned_message_notifications, "show_preview" A..= show_preview, "use_default_show_preview" A..= use_default_show_preview, "sound" A..= sound, "use_default_sound" A..= use_default_sound, "mute_for" A..= mute_for, "use_default_mute_for" A..= use_default_mute_for ]
-- chatNotificationSettings ChatNotificationSettings  { disable_mention_notifications :: Bool, use_default_disable_mention_notifications :: Bool, disable_pinned_message_notifications :: Bool, use_default_disable_pinned_message_notifications :: Bool, show_preview :: Bool, use_default_show_preview :: Bool, sound :: String, use_default_sound :: Bool, mute_for :: Int, use_default_mute_for :: Bool } 

