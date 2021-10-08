-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains information about notification settings for a chat
-- 
-- __use_default_mute_for__ If true, mute_for is ignored and the value for the relevant type of chat is used instead
-- 
-- __mute_for__ Time left before notifications will be unmuted, in seconds
-- 
-- __use_default_sound__ If true, sound is ignored and the value for the relevant type of chat is used instead
-- 
-- __sound__ The name of an audio file to be used for notification sounds; only applies to iOS applications
-- 
-- __use_default_show_preview__ If true, show_preview is ignored and the value for the relevant type of chat is used instead
-- 
-- __show_preview__ True, if message content must be displayed in notifications
-- 
-- __use_default_disable_pinned_message_notifications__ If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat is used instead
-- 
-- __disable_pinned_message_notifications__ If true, notifications for incoming pinned messages will be created as for an ordinary unread message
-- 
-- __use_default_disable_mention_notifications__ If true, disable_mention_notifications is ignored and the value for the relevant type of chat is used instead
-- 
-- __disable_mention_notifications__ If true, notifications for messages with mentions will be created as for an ordinary unread message
data ChatNotificationSettings = 

 ChatNotificationSettings { disable_mention_notifications :: Maybe Bool, use_default_disable_mention_notifications :: Maybe Bool, disable_pinned_message_notifications :: Maybe Bool, use_default_disable_pinned_message_notifications :: Maybe Bool, show_preview :: Maybe Bool, use_default_show_preview :: Maybe Bool, sound :: Maybe String, use_default_sound :: Maybe Bool, mute_for :: Maybe Int, use_default_mute_for :: Maybe Bool }  deriving (Eq)

instance Show ChatNotificationSettings where
 show ChatNotificationSettings { disable_mention_notifications=disable_mention_notifications, use_default_disable_mention_notifications=use_default_disable_mention_notifications, disable_pinned_message_notifications=disable_pinned_message_notifications, use_default_disable_pinned_message_notifications=use_default_disable_pinned_message_notifications, show_preview=show_preview, use_default_show_preview=use_default_show_preview, sound=sound, use_default_sound=use_default_sound, mute_for=mute_for, use_default_mute_for=use_default_mute_for } =
  "ChatNotificationSettings" ++ cc [p "disable_mention_notifications" disable_mention_notifications, p "use_default_disable_mention_notifications" use_default_disable_mention_notifications, p "disable_pinned_message_notifications" disable_pinned_message_notifications, p "use_default_disable_pinned_message_notifications" use_default_disable_pinned_message_notifications, p "show_preview" show_preview, p "use_default_show_preview" use_default_show_preview, p "sound" sound, p "use_default_sound" use_default_sound, p "mute_for" mute_for, p "use_default_mute_for" use_default_mute_for ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatNotificationSettings where
 toJSON ChatNotificationSettings { disable_mention_notifications = disable_mention_notifications, use_default_disable_mention_notifications = use_default_disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications, show_preview = show_preview, use_default_show_preview = use_default_show_preview, sound = sound, use_default_sound = use_default_sound, mute_for = mute_for, use_default_mute_for = use_default_mute_for } =
  A.object [ "@type" A..= T.String "chatNotificationSettings", "disable_mention_notifications" A..= disable_mention_notifications, "use_default_disable_mention_notifications" A..= use_default_disable_mention_notifications, "disable_pinned_message_notifications" A..= disable_pinned_message_notifications, "use_default_disable_pinned_message_notifications" A..= use_default_disable_pinned_message_notifications, "show_preview" A..= show_preview, "use_default_show_preview" A..= use_default_show_preview, "sound" A..= sound, "use_default_sound" A..= use_default_sound, "mute_for" A..= mute_for, "use_default_mute_for" A..= use_default_mute_for ]

instance T.FromJSON ChatNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatNotificationSettings" -> parseChatNotificationSettings v
   _ -> mempty
  where
   parseChatNotificationSettings :: A.Value -> T.Parser ChatNotificationSettings
   parseChatNotificationSettings = A.withObject "ChatNotificationSettings" $ \o -> do
    disable_mention_notifications <- o A..:? "disable_mention_notifications"
    use_default_disable_mention_notifications <- o A..:? "use_default_disable_mention_notifications"
    disable_pinned_message_notifications <- o A..:? "disable_pinned_message_notifications"
    use_default_disable_pinned_message_notifications <- o A..:? "use_default_disable_pinned_message_notifications"
    show_preview <- o A..:? "show_preview"
    use_default_show_preview <- o A..:? "use_default_show_preview"
    sound <- o A..:? "sound"
    use_default_sound <- o A..:? "use_default_sound"
    mute_for <- mconcat [ o A..:? "mute_for", readMaybe <$> (o A..: "mute_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    use_default_mute_for <- o A..:? "use_default_mute_for"
    return $ ChatNotificationSettings { disable_mention_notifications = disable_mention_notifications, use_default_disable_mention_notifications = use_default_disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications, show_preview = show_preview, use_default_show_preview = use_default_show_preview, sound = sound, use_default_sound = use_default_sound, mute_for = mute_for, use_default_mute_for = use_default_mute_for }
 parseJSON _ = mempty
