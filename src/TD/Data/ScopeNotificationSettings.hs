module TD.Data.ScopeNotificationSettings
  ( ScopeNotificationSettings(..)    
  , defaultScopeNotificationSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ScopeNotificationSettings
  = ScopeNotificationSettings -- ^ Contains information about notification settings for several chats
    { mute_for                             :: Maybe Int  -- ^ Time left before notifications will be unmuted, in seconds
    , sound_id                             :: Maybe Int  -- ^ Identifier of the notification sound to be played; 0 if sound is disabled
    , show_preview                         :: Maybe Bool -- ^ True, if message content must be displayed in notifications
    , use_default_mute_stories             :: Maybe Bool -- ^ If true, story notifications are received only for the first 5 chats from topChatCategoryUsers regardless of the value of mute_stories
    , mute_stories                         :: Maybe Bool -- ^ True, if story notifications are disabled
    , story_sound_id                       :: Maybe Int  -- ^ Identifier of the notification sound to be played for stories; 0 if sound is disabled
    , show_story_sender                    :: Maybe Bool -- ^ True, if the sender of stories must be displayed in notifications
    , disable_pinned_message_notifications :: Maybe Bool -- ^ True, if notifications for incoming pinned messages will be created as for an ordinary unread message
    , disable_mention_notifications        :: Maybe Bool -- ^ True, if notifications for messages with mentions will be created as for an ordinary unread message
    }
  deriving (Eq, Show)

instance I.ShortShow ScopeNotificationSettings where
  shortShow ScopeNotificationSettings
    { mute_for                             = mute_for_
    , sound_id                             = sound_id_
    , show_preview                         = show_preview_
    , use_default_mute_stories             = use_default_mute_stories_
    , mute_stories                         = mute_stories_
    , story_sound_id                       = story_sound_id_
    , show_story_sender                    = show_story_sender_
    , disable_pinned_message_notifications = disable_pinned_message_notifications_
    , disable_mention_notifications        = disable_mention_notifications_
    }
      = "ScopeNotificationSettings"
        ++ I.cc
        [ "mute_for"                             `I.p` mute_for_
        , "sound_id"                             `I.p` sound_id_
        , "show_preview"                         `I.p` show_preview_
        , "use_default_mute_stories"             `I.p` use_default_mute_stories_
        , "mute_stories"                         `I.p` mute_stories_
        , "story_sound_id"                       `I.p` story_sound_id_
        , "show_story_sender"                    `I.p` show_story_sender_
        , "disable_pinned_message_notifications" `I.p` disable_pinned_message_notifications_
        , "disable_mention_notifications"        `I.p` disable_mention_notifications_
        ]

instance AT.FromJSON ScopeNotificationSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "scopeNotificationSettings" -> parseScopeNotificationSettings v
      _                           -> mempty
    
    where
      parseScopeNotificationSettings :: A.Value -> AT.Parser ScopeNotificationSettings
      parseScopeNotificationSettings = A.withObject "ScopeNotificationSettings" $ \o -> do
        mute_for_                             <- o A..:?                       "mute_for"
        sound_id_                             <- fmap I.readInt64 <$> o A..:?  "sound_id"
        show_preview_                         <- o A..:?                       "show_preview"
        use_default_mute_stories_             <- o A..:?                       "use_default_mute_stories"
        mute_stories_                         <- o A..:?                       "mute_stories"
        story_sound_id_                       <- fmap I.readInt64 <$> o A..:?  "story_sound_id"
        show_story_sender_                    <- o A..:?                       "show_story_sender"
        disable_pinned_message_notifications_ <- o A..:?                       "disable_pinned_message_notifications"
        disable_mention_notifications_        <- o A..:?                       "disable_mention_notifications"
        pure $ ScopeNotificationSettings
          { mute_for                             = mute_for_
          , sound_id                             = sound_id_
          , show_preview                         = show_preview_
          , use_default_mute_stories             = use_default_mute_stories_
          , mute_stories                         = mute_stories_
          , story_sound_id                       = story_sound_id_
          , show_story_sender                    = show_story_sender_
          , disable_pinned_message_notifications = disable_pinned_message_notifications_
          , disable_mention_notifications        = disable_mention_notifications_
          }
  parseJSON _ = mempty

instance AT.ToJSON ScopeNotificationSettings where
  toJSON ScopeNotificationSettings
    { mute_for                             = mute_for_
    , sound_id                             = sound_id_
    , show_preview                         = show_preview_
    , use_default_mute_stories             = use_default_mute_stories_
    , mute_stories                         = mute_stories_
    , story_sound_id                       = story_sound_id_
    , show_story_sender                    = show_story_sender_
    , disable_pinned_message_notifications = disable_pinned_message_notifications_
    , disable_mention_notifications        = disable_mention_notifications_
    }
      = A.object
        [ "@type"                                A..= AT.String "scopeNotificationSettings"
        , "mute_for"                             A..= mute_for_
        , "sound_id"                             A..= fmap I.writeInt64  sound_id_
        , "show_preview"                         A..= show_preview_
        , "use_default_mute_stories"             A..= use_default_mute_stories_
        , "mute_stories"                         A..= mute_stories_
        , "story_sound_id"                       A..= fmap I.writeInt64  story_sound_id_
        , "show_story_sender"                    A..= show_story_sender_
        , "disable_pinned_message_notifications" A..= disable_pinned_message_notifications_
        , "disable_mention_notifications"        A..= disable_mention_notifications_
        ]

defaultScopeNotificationSettings :: ScopeNotificationSettings
defaultScopeNotificationSettings =
  ScopeNotificationSettings
    { mute_for                             = Nothing
    , sound_id                             = Nothing
    , show_preview                         = Nothing
    , use_default_mute_stories             = Nothing
    , mute_stories                         = Nothing
    , story_sound_id                       = Nothing
    , show_story_sender                    = Nothing
    , disable_pinned_message_notifications = Nothing
    , disable_mention_notifications        = Nothing
    }

