module TD.Data.ForumTopic
  (ForumTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo
import qualified TD.Data.Message as Message
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.DraftMessage as DraftMessage

data ForumTopic
  = ForumTopic -- ^ Describes a forum topic
    { info                        :: Maybe ForumTopicInfo.ForumTopicInfo                     -- ^ Basic information about the topic
    , last_message                :: Maybe Message.Message                                   -- ^ Last message in the topic; may be null if unknown
    , is_pinned                   :: Maybe Bool                                              -- ^ True, if the topic is pinned in the topic list
    , unread_count                :: Maybe Int                                               -- ^ Number of unread messages in the topic
    , last_read_inbox_message_id  :: Maybe Int                                               -- ^ Identifier of the last read incoming message
    , last_read_outbox_message_id :: Maybe Int                                               -- ^ Identifier of the last read outgoing message
    , unread_mention_count        :: Maybe Int                                               -- ^ Number of unread messages with a mention/reply in the topic
    , unread_reaction_count       :: Maybe Int                                               -- ^ Number of messages with unread reactions in the topic
    , notification_settings       :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ Notification settings for the topic
    , draft_message               :: Maybe DraftMessage.DraftMessage                         -- ^ A draft of a message in the topic; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow ForumTopic where
  shortShow ForumTopic
    { info                        = info_
    , last_message                = last_message_
    , is_pinned                   = is_pinned_
    , unread_count                = unread_count_
    , last_read_inbox_message_id  = last_read_inbox_message_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    , unread_mention_count        = unread_mention_count_
    , unread_reaction_count       = unread_reaction_count_
    , notification_settings       = notification_settings_
    , draft_message               = draft_message_
    }
      = "ForumTopic"
        ++ I.cc
        [ "info"                        `I.p` info_
        , "last_message"                `I.p` last_message_
        , "is_pinned"                   `I.p` is_pinned_
        , "unread_count"                `I.p` unread_count_
        , "last_read_inbox_message_id"  `I.p` last_read_inbox_message_id_
        , "last_read_outbox_message_id" `I.p` last_read_outbox_message_id_
        , "unread_mention_count"        `I.p` unread_mention_count_
        , "unread_reaction_count"       `I.p` unread_reaction_count_
        , "notification_settings"       `I.p` notification_settings_
        , "draft_message"               `I.p` draft_message_
        ]

instance AT.FromJSON ForumTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "forumTopic" -> parseForumTopic v
      _            -> mempty
    
    where
      parseForumTopic :: A.Value -> AT.Parser ForumTopic
      parseForumTopic = A.withObject "ForumTopic" $ \o -> do
        info_                        <- o A..:?  "info"
        last_message_                <- o A..:?  "last_message"
        is_pinned_                   <- o A..:?  "is_pinned"
        unread_count_                <- o A..:?  "unread_count"
        last_read_inbox_message_id_  <- o A..:?  "last_read_inbox_message_id"
        last_read_outbox_message_id_ <- o A..:?  "last_read_outbox_message_id"
        unread_mention_count_        <- o A..:?  "unread_mention_count"
        unread_reaction_count_       <- o A..:?  "unread_reaction_count"
        notification_settings_       <- o A..:?  "notification_settings"
        draft_message_               <- o A..:?  "draft_message"
        pure $ ForumTopic
          { info                        = info_
          , last_message                = last_message_
          , is_pinned                   = is_pinned_
          , unread_count                = unread_count_
          , last_read_inbox_message_id  = last_read_inbox_message_id_
          , last_read_outbox_message_id = last_read_outbox_message_id_
          , unread_mention_count        = unread_mention_count_
          , unread_reaction_count       = unread_reaction_count_
          , notification_settings       = notification_settings_
          , draft_message               = draft_message_
          }
  parseJSON _ = mempty

