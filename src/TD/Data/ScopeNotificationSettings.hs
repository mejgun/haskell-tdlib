{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ScopeNotificationSettings = -- | Contains information about notification settings for several chats
  ScopeNotificationSettings
  { -- | True, if notifications for messages with mentions will be created as for an ordinary unread message
    disable_mention_notifications :: Maybe Bool,
    -- | True, if notifications for incoming pinned messages will be created as for an ordinary unread message
    disable_pinned_message_notifications :: Maybe Bool,
    -- | True, if message content must be displayed in notifications
    show_preview :: Maybe Bool,
    -- | Identifier of the notification sound to be played; 0 if sound is disabled
    sound_id :: Maybe Int,
    -- | Time left before notifications will be unmuted, in seconds
    mute_for :: Maybe Int
  }
  deriving (Eq)

instance Show ScopeNotificationSettings where
  show
    ScopeNotificationSettings
      { disable_mention_notifications = disable_mention_notifications_,
        disable_pinned_message_notifications = disable_pinned_message_notifications_,
        show_preview = show_preview_,
        sound_id = sound_id_,
        mute_for = mute_for_
      } =
      "ScopeNotificationSettings"
        ++ U.cc
          [ U.p "disable_mention_notifications" disable_mention_notifications_,
            U.p "disable_pinned_message_notifications" disable_pinned_message_notifications_,
            U.p "show_preview" show_preview_,
            U.p "sound_id" sound_id_,
            U.p "mute_for" mute_for_
          ]

instance T.FromJSON ScopeNotificationSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "scopeNotificationSettings" -> parseScopeNotificationSettings v
      _ -> mempty
    where
      parseScopeNotificationSettings :: A.Value -> T.Parser ScopeNotificationSettings
      parseScopeNotificationSettings = A.withObject "ScopeNotificationSettings" $ \o -> do
        disable_mention_notifications_ <- o A..:? "disable_mention_notifications"
        disable_pinned_message_notifications_ <- o A..:? "disable_pinned_message_notifications"
        show_preview_ <- o A..:? "show_preview"
        sound_id_ <- mconcat [o A..:? "sound_id", U.rm <$> (o A..: "sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        mute_for_ <- mconcat [o A..:? "mute_for", U.rm <$> (o A..: "mute_for" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ScopeNotificationSettings {disable_mention_notifications = disable_mention_notifications_, disable_pinned_message_notifications = disable_pinned_message_notifications_, show_preview = show_preview_, sound_id = sound_id_, mute_for = mute_for_}
  parseJSON _ = mempty

instance T.ToJSON ScopeNotificationSettings where
  toJSON
    ScopeNotificationSettings
      { disable_mention_notifications = disable_mention_notifications_,
        disable_pinned_message_notifications = disable_pinned_message_notifications_,
        show_preview = show_preview_,
        sound_id = sound_id_,
        mute_for = mute_for_
      } =
      A.object
        [ "@type" A..= T.String "scopeNotificationSettings",
          "disable_mention_notifications" A..= disable_mention_notifications_,
          "disable_pinned_message_notifications" A..= disable_pinned_message_notifications_,
          "show_preview" A..= show_preview_,
          "sound_id" A..= sound_id_,
          "mute_for" A..= mute_for_
        ]
