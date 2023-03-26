{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatNotificationSettings = -- | Contains information about notification settings for a chat or a forum topic
  ChatNotificationSettings
  { -- | If true, notifications for messages with mentions will be created as for an ordinary unread message
    disable_mention_notifications :: Maybe Bool,
    -- | If true, disable_mention_notifications is ignored and the value for the relevant type of chat or the forum chat is used instead
    use_default_disable_mention_notifications :: Maybe Bool,
    -- | If true, notifications for incoming pinned messages will be created as for an ordinary unread message
    disable_pinned_message_notifications :: Maybe Bool,
    -- | If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat or the forum chat is used instead
    use_default_disable_pinned_message_notifications :: Maybe Bool,
    -- | True, if message content must be displayed in notifications
    show_preview :: Maybe Bool,
    -- | If true, show_preview is ignored and the value for the relevant type of chat or the forum chat is used instead
    use_default_show_preview :: Maybe Bool,
    -- | Identifier of the notification sound to be played; 0 if sound is disabled
    sound_id :: Maybe Int,
    -- | If true, the value for the relevant type of chat or the forum chat is used instead of sound_id
    use_default_sound :: Maybe Bool,
    -- | Time left before notifications will be unmuted, in seconds
    mute_for :: Maybe Int,
    -- | If true, mute_for is ignored and the value for the relevant type of chat or the forum chat is used instead
    use_default_mute_for :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatNotificationSettings where
  show
    ChatNotificationSettings
      { disable_mention_notifications = disable_mention_notifications_,
        use_default_disable_mention_notifications = use_default_disable_mention_notifications_,
        disable_pinned_message_notifications = disable_pinned_message_notifications_,
        use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_,
        show_preview = show_preview_,
        use_default_show_preview = use_default_show_preview_,
        sound_id = sound_id_,
        use_default_sound = use_default_sound_,
        mute_for = mute_for_,
        use_default_mute_for = use_default_mute_for_
      } =
      "ChatNotificationSettings"
        ++ U.cc
          [ U.p "disable_mention_notifications" disable_mention_notifications_,
            U.p "use_default_disable_mention_notifications" use_default_disable_mention_notifications_,
            U.p "disable_pinned_message_notifications" disable_pinned_message_notifications_,
            U.p "use_default_disable_pinned_message_notifications" use_default_disable_pinned_message_notifications_,
            U.p "show_preview" show_preview_,
            U.p "use_default_show_preview" use_default_show_preview_,
            U.p "sound_id" sound_id_,
            U.p "use_default_sound" use_default_sound_,
            U.p "mute_for" mute_for_,
            U.p "use_default_mute_for" use_default_mute_for_
          ]

instance T.FromJSON ChatNotificationSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatNotificationSettings" -> parseChatNotificationSettings v
      _ -> mempty
    where
      parseChatNotificationSettings :: A.Value -> T.Parser ChatNotificationSettings
      parseChatNotificationSettings = A.withObject "ChatNotificationSettings" $ \o -> do
        disable_mention_notifications_ <- o A..:? "disable_mention_notifications"
        use_default_disable_mention_notifications_ <- o A..:? "use_default_disable_mention_notifications"
        disable_pinned_message_notifications_ <- o A..:? "disable_pinned_message_notifications"
        use_default_disable_pinned_message_notifications_ <- o A..:? "use_default_disable_pinned_message_notifications"
        show_preview_ <- o A..:? "show_preview"
        use_default_show_preview_ <- o A..:? "use_default_show_preview"
        sound_id_ <- U.rm <$> (o A..:? "sound_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        use_default_sound_ <- o A..:? "use_default_sound"
        mute_for_ <- o A..:? "mute_for"
        use_default_mute_for_ <- o A..:? "use_default_mute_for"
        return $ ChatNotificationSettings {disable_mention_notifications = disable_mention_notifications_, use_default_disable_mention_notifications = use_default_disable_mention_notifications_, disable_pinned_message_notifications = disable_pinned_message_notifications_, use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_, show_preview = show_preview_, use_default_show_preview = use_default_show_preview_, sound_id = sound_id_, use_default_sound = use_default_sound_, mute_for = mute_for_, use_default_mute_for = use_default_mute_for_}
  parseJSON _ = mempty

instance T.ToJSON ChatNotificationSettings where
  toJSON
    ChatNotificationSettings
      { disable_mention_notifications = disable_mention_notifications_,
        use_default_disable_mention_notifications = use_default_disable_mention_notifications_,
        disable_pinned_message_notifications = disable_pinned_message_notifications_,
        use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_,
        show_preview = show_preview_,
        use_default_show_preview = use_default_show_preview_,
        sound_id = sound_id_,
        use_default_sound = use_default_sound_,
        mute_for = mute_for_,
        use_default_mute_for = use_default_mute_for_
      } =
      A.object
        [ "@type" A..= T.String "chatNotificationSettings",
          "disable_mention_notifications" A..= disable_mention_notifications_,
          "use_default_disable_mention_notifications" A..= use_default_disable_mention_notifications_,
          "disable_pinned_message_notifications" A..= disable_pinned_message_notifications_,
          "use_default_disable_pinned_message_notifications" A..= use_default_disable_pinned_message_notifications_,
          "show_preview" A..= show_preview_,
          "use_default_show_preview" A..= use_default_show_preview_,
          "sound_id" A..= U.toS sound_id_,
          "use_default_sound" A..= use_default_sound_,
          "mute_for" A..= mute_for_,
          "use_default_mute_for" A..= use_default_mute_for_
        ]
