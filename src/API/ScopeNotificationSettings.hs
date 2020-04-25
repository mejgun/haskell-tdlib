-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ScopeNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ScopeNotificationSettings = 
 ScopeNotificationSettings { disable_mention_notifications :: Maybe Bool, disable_pinned_message_notifications :: Maybe Bool, show_preview :: Maybe Bool, sound :: Maybe String, mute_for :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ScopeNotificationSettings where
 toJSON (ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound = sound, mute_for = mute_for }) =
  A.object [ "@type" A..= T.String "scopeNotificationSettings", "disable_mention_notifications" A..= disable_mention_notifications, "disable_pinned_message_notifications" A..= disable_pinned_message_notifications, "show_preview" A..= show_preview, "sound" A..= sound, "mute_for" A..= mute_for ]

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
    sound <- o A..:? "sound"
    mute_for <- mconcat [ o A..:? "mute_for", readMaybe <$> (o A..: "mute_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ScopeNotificationSettings { disable_mention_notifications = disable_mention_notifications, disable_pinned_message_notifications = disable_pinned_message_notifications, show_preview = show_preview, sound = sound, mute_for = mute_for }