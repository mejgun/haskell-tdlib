-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatNotificationSettings = 
 ChatNotificationSettings { disable_mention_notifications :: Maybe Bool, use_default_disable_mention_notifications :: Maybe Bool, disable_pinned_message_notifications :: Maybe Bool, use_default_disable_pinned_message_notifications :: Maybe Bool, show_preview :: Maybe Bool, use_default_show_preview :: Maybe Bool, sound :: Maybe String, use_default_sound :: Maybe Bool, mute_for :: Maybe Int, use_default_mute_for :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON ChatNotificationSettings where
 toJSON (ChatNotificationSettings { disable_mention_notifications = disable_mention_notifications, use_default_disable_mention_notifications = use_default_disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications, show_preview = show_preview, use_default_show_preview = use_default_show_preview, sound = sound, use_default_sound = use_default_sound, mute_for = mute_for, use_default_mute_for = use_default_mute_for }) =
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