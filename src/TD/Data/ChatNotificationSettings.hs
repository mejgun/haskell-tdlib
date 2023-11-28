module TD.Data.ChatNotificationSettings
  ( ChatNotificationSettings(..)    
  , defaultChatNotificationSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatNotificationSettings
  = ChatNotificationSettings -- ^ Contains information about notification settings for a chat or a forum topic
    { use_default_mute_for                             :: Maybe Bool -- ^ If true, the value for the relevant type of chat or the forum chat is used instead of mute_for
    , mute_for                                         :: Maybe Int  -- ^ Time left before notifications will be unmuted, in seconds
    , use_default_sound                                :: Maybe Bool -- ^ If true, the value for the relevant type of chat or the forum chat is used instead of sound_id
    , sound_id                                         :: Maybe Int  -- ^ Identifier of the notification sound to be played for messages; 0 if sound is disabled
    , use_default_show_preview                         :: Maybe Bool -- ^ If true, the value for the relevant type of chat or the forum chat is used instead of show_preview
    , show_preview                                     :: Maybe Bool -- ^ True, if message content must be displayed in notifications
    , use_default_mute_stories                         :: Maybe Bool -- ^ If true, the value for the relevant type of chat is used instead of mute_stories
    , mute_stories                                     :: Maybe Bool -- ^ True, if story notifications are disabled for the chat
    , use_default_story_sound                          :: Maybe Bool -- ^ If true, the value for the relevant type of chat is used instead of story_sound_id
    , story_sound_id                                   :: Maybe Int  -- ^ Identifier of the notification sound to be played for stories; 0 if sound is disabled
    , use_default_show_story_sender                    :: Maybe Bool -- ^ If true, the value for the relevant type of chat is used instead of show_story_sender
    , show_story_sender                                :: Maybe Bool -- ^ True, if the sender of stories must be displayed in notifications
    , use_default_disable_pinned_message_notifications :: Maybe Bool -- ^ If true, the value for the relevant type of chat or the forum chat is used instead of disable_pinned_message_notifications
    , disable_pinned_message_notifications             :: Maybe Bool -- ^ If true, notifications for incoming pinned messages will be created as for an ordinary unread message
    , use_default_disable_mention_notifications        :: Maybe Bool -- ^ If true, the value for the relevant type of chat or the forum chat is used instead of disable_mention_notifications
    , disable_mention_notifications                    :: Maybe Bool -- ^ If true, notifications for messages with mentions will be created as for an ordinary unread message
    }
  deriving (Eq, Show)

instance I.ShortShow ChatNotificationSettings where
  shortShow ChatNotificationSettings
    { use_default_mute_for                             = use_default_mute_for_
    , mute_for                                         = mute_for_
    , use_default_sound                                = use_default_sound_
    , sound_id                                         = sound_id_
    , use_default_show_preview                         = use_default_show_preview_
    , show_preview                                     = show_preview_
    , use_default_mute_stories                         = use_default_mute_stories_
    , mute_stories                                     = mute_stories_
    , use_default_story_sound                          = use_default_story_sound_
    , story_sound_id                                   = story_sound_id_
    , use_default_show_story_sender                    = use_default_show_story_sender_
    , show_story_sender                                = show_story_sender_
    , use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_
    , disable_pinned_message_notifications             = disable_pinned_message_notifications_
    , use_default_disable_mention_notifications        = use_default_disable_mention_notifications_
    , disable_mention_notifications                    = disable_mention_notifications_
    }
      = "ChatNotificationSettings"
        ++ I.cc
        [ "use_default_mute_for"                             `I.p` use_default_mute_for_
        , "mute_for"                                         `I.p` mute_for_
        , "use_default_sound"                                `I.p` use_default_sound_
        , "sound_id"                                         `I.p` sound_id_
        , "use_default_show_preview"                         `I.p` use_default_show_preview_
        , "show_preview"                                     `I.p` show_preview_
        , "use_default_mute_stories"                         `I.p` use_default_mute_stories_
        , "mute_stories"                                     `I.p` mute_stories_
        , "use_default_story_sound"                          `I.p` use_default_story_sound_
        , "story_sound_id"                                   `I.p` story_sound_id_
        , "use_default_show_story_sender"                    `I.p` use_default_show_story_sender_
        , "show_story_sender"                                `I.p` show_story_sender_
        , "use_default_disable_pinned_message_notifications" `I.p` use_default_disable_pinned_message_notifications_
        , "disable_pinned_message_notifications"             `I.p` disable_pinned_message_notifications_
        , "use_default_disable_mention_notifications"        `I.p` use_default_disable_mention_notifications_
        , "disable_mention_notifications"                    `I.p` disable_mention_notifications_
        ]

instance AT.FromJSON ChatNotificationSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatNotificationSettings" -> parseChatNotificationSettings v
      _                          -> mempty
    
    where
      parseChatNotificationSettings :: A.Value -> AT.Parser ChatNotificationSettings
      parseChatNotificationSettings = A.withObject "ChatNotificationSettings" $ \o -> do
        use_default_mute_for_                             <- o A..:?                       "use_default_mute_for"
        mute_for_                                         <- o A..:?                       "mute_for"
        use_default_sound_                                <- o A..:?                       "use_default_sound"
        sound_id_                                         <- fmap I.readInt64 <$> o A..:?  "sound_id"
        use_default_show_preview_                         <- o A..:?                       "use_default_show_preview"
        show_preview_                                     <- o A..:?                       "show_preview"
        use_default_mute_stories_                         <- o A..:?                       "use_default_mute_stories"
        mute_stories_                                     <- o A..:?                       "mute_stories"
        use_default_story_sound_                          <- o A..:?                       "use_default_story_sound"
        story_sound_id_                                   <- fmap I.readInt64 <$> o A..:?  "story_sound_id"
        use_default_show_story_sender_                    <- o A..:?                       "use_default_show_story_sender"
        show_story_sender_                                <- o A..:?                       "show_story_sender"
        use_default_disable_pinned_message_notifications_ <- o A..:?                       "use_default_disable_pinned_message_notifications"
        disable_pinned_message_notifications_             <- o A..:?                       "disable_pinned_message_notifications"
        use_default_disable_mention_notifications_        <- o A..:?                       "use_default_disable_mention_notifications"
        disable_mention_notifications_                    <- o A..:?                       "disable_mention_notifications"
        pure $ ChatNotificationSettings
          { use_default_mute_for                             = use_default_mute_for_
          , mute_for                                         = mute_for_
          , use_default_sound                                = use_default_sound_
          , sound_id                                         = sound_id_
          , use_default_show_preview                         = use_default_show_preview_
          , show_preview                                     = show_preview_
          , use_default_mute_stories                         = use_default_mute_stories_
          , mute_stories                                     = mute_stories_
          , use_default_story_sound                          = use_default_story_sound_
          , story_sound_id                                   = story_sound_id_
          , use_default_show_story_sender                    = use_default_show_story_sender_
          , show_story_sender                                = show_story_sender_
          , use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_
          , disable_pinned_message_notifications             = disable_pinned_message_notifications_
          , use_default_disable_mention_notifications        = use_default_disable_mention_notifications_
          , disable_mention_notifications                    = disable_mention_notifications_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatNotificationSettings where
  toJSON ChatNotificationSettings
    { use_default_mute_for                             = use_default_mute_for_
    , mute_for                                         = mute_for_
    , use_default_sound                                = use_default_sound_
    , sound_id                                         = sound_id_
    , use_default_show_preview                         = use_default_show_preview_
    , show_preview                                     = show_preview_
    , use_default_mute_stories                         = use_default_mute_stories_
    , mute_stories                                     = mute_stories_
    , use_default_story_sound                          = use_default_story_sound_
    , story_sound_id                                   = story_sound_id_
    , use_default_show_story_sender                    = use_default_show_story_sender_
    , show_story_sender                                = show_story_sender_
    , use_default_disable_pinned_message_notifications = use_default_disable_pinned_message_notifications_
    , disable_pinned_message_notifications             = disable_pinned_message_notifications_
    , use_default_disable_mention_notifications        = use_default_disable_mention_notifications_
    , disable_mention_notifications                    = disable_mention_notifications_
    }
      = A.object
        [ "@type"                                            A..= AT.String "chatNotificationSettings"
        , "use_default_mute_for"                             A..= use_default_mute_for_
        , "mute_for"                                         A..= mute_for_
        , "use_default_sound"                                A..= use_default_sound_
        , "sound_id"                                         A..= fmap I.writeInt64  sound_id_
        , "use_default_show_preview"                         A..= use_default_show_preview_
        , "show_preview"                                     A..= show_preview_
        , "use_default_mute_stories"                         A..= use_default_mute_stories_
        , "mute_stories"                                     A..= mute_stories_
        , "use_default_story_sound"                          A..= use_default_story_sound_
        , "story_sound_id"                                   A..= fmap I.writeInt64  story_sound_id_
        , "use_default_show_story_sender"                    A..= use_default_show_story_sender_
        , "show_story_sender"                                A..= show_story_sender_
        , "use_default_disable_pinned_message_notifications" A..= use_default_disable_pinned_message_notifications_
        , "disable_pinned_message_notifications"             A..= disable_pinned_message_notifications_
        , "use_default_disable_mention_notifications"        A..= use_default_disable_mention_notifications_
        , "disable_mention_notifications"                    A..= disable_mention_notifications_
        ]

defaultChatNotificationSettings :: ChatNotificationSettings
defaultChatNotificationSettings =
  ChatNotificationSettings
    { use_default_mute_for                             = Nothing
    , mute_for                                         = Nothing
    , use_default_sound                                = Nothing
    , sound_id                                         = Nothing
    , use_default_show_preview                         = Nothing
    , show_preview                                     = Nothing
    , use_default_mute_stories                         = Nothing
    , mute_stories                                     = Nothing
    , use_default_story_sound                          = Nothing
    , story_sound_id                                   = Nothing
    , use_default_show_story_sender                    = Nothing
    , show_story_sender                                = Nothing
    , use_default_disable_pinned_message_notifications = Nothing
    , disable_pinned_message_notifications             = Nothing
    , use_default_disable_mention_notifications        = Nothing
    , disable_mention_notifications                    = Nothing
    }

