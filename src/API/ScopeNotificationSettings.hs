-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ScopeNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains information about notification settings for several chats
-- 
-- __mute_for__ Time left before notifications will be unmuted, in seconds
-- 
-- __sound_id__ Identifier of the notification sound to be played; 0 if sound is disabled
-- 
-- __show_preview__ True, if message content must be displayed in notifications
-- 
-- __disable_pinned_message_notifications__ True, if notifications for incoming pinned messages will be created as for an ordinary unread message
-- 
-- __disable_mention_notifications__ True, if notifications for messages with mentions will be created as for an ordinary unread message
data ScopeNotificationSettings = 

 ScopeNotificationSettings { disable_mention_notifications :: Maybe Bool, disable_pinned_message_notifications :: Maybe Bool, show_preview :: Maybe Bool, sound_id :: Maybe Int, mute_for :: Maybe Int }  deriving (Eq)

instance Show ScopeNotificationSettings where
 show ScopeNotificationSettings { disable_mention_notifications=disable_mention_notifications, disable_pinned_message_notifications=disable_pinned_message_notifications, show_preview=show_preview, sound_id=sound_id, mute_for=mute_for } =
  "ScopeNotificationSettings" ++ cc [p "disable_mention_notifications" disable_mention_notifications, p "disable_pinned_message_notifications" disable_pinned_message_notifications, p "show_preview" show_preview, p "sound_id" sound_id, p "mute_for" mute_for ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ScopeNotificationSettings where
 toJSON ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound_id = sound_id, mute_for = mute_for } =
  A.object [ "@type" A..= T.String "scopeNotificationSettings", "disable_mention_notifications" A..= disable_mention_notifications, "disable_pinned_message_notifications" A..= disable_pinned_message_notifications, "show_preview" A..= show_preview, "sound_id" A..= sound_id, "mute_for" A..= mute_for ]

instance T.FromJSON ScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "scopeNotificationSettings" -> parseScopeNotificationSettings v
   _ -> mempty
  where
   parseScopeNotificationSettings :: A.Value -> T.Parser ScopeNotificationSettings
   parseScopeNotificationSettings = A.withObject "ScopeNotificationSettings" $ \o -> do
    disable_mention_notifications <- o A..:? "disable_mention_notifications"
    disable_pinned_message_notifications <- o A..:? "disable_pinned_message_notifications"
    show_preview <- o A..:? "show_preview"
    sound_id <- mconcat [ o A..:? "sound_id", readMaybe <$> (o A..: "sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    mute_for <- mconcat [ o A..:? "mute_for", readMaybe <$> (o A..: "mute_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound_id = sound_id, mute_for = mute_for }
 parseJSON _ = mempty
