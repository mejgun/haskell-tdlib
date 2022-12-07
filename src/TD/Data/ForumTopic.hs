{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo
import qualified TD.Data.Message as Message
import qualified Utils as U

-- |
data ForumTopic = -- | Describes a forum topic
  ForumTopic
  { -- | A draft of a message in the topic; may be null
    draft_message :: Maybe DraftMessage.DraftMessage,
    -- | Notification settings for the topic
    notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
    -- | Number of messages with unread reactions in the topic
    unread_reaction_count :: Maybe Int,
    -- | Number of unread messages with a mention/reply in the topic
    unread_mention_count :: Maybe Int,
    -- | Identifier of the last read outgoing message
    last_read_outbox_message_id :: Maybe Int,
    -- | Identifier of the last read incoming message
    last_read_inbox_message_id :: Maybe Int,
    -- | Number of unread messages in the topic
    unread_count :: Maybe Int,
    -- | True, if the topic is pinned in the topic list
    is_pinned :: Maybe Bool,
    -- | Last message in the topic; may be null if unknown
    last_message :: Maybe Message.Message,
    -- | Basic information about the topic
    info :: Maybe ForumTopicInfo.ForumTopicInfo
  }
  deriving (Eq)

instance Show ForumTopic where
  show
    ForumTopic
      { draft_message = draft_message_,
        notification_settings = notification_settings_,
        unread_reaction_count = unread_reaction_count_,
        unread_mention_count = unread_mention_count_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        unread_count = unread_count_,
        is_pinned = is_pinned_,
        last_message = last_message_,
        info = info_
      } =
      "ForumTopic"
        ++ U.cc
          [ U.p "draft_message" draft_message_,
            U.p "notification_settings" notification_settings_,
            U.p "unread_reaction_count" unread_reaction_count_,
            U.p "unread_mention_count" unread_mention_count_,
            U.p "last_read_outbox_message_id" last_read_outbox_message_id_,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id_,
            U.p "unread_count" unread_count_,
            U.p "is_pinned" is_pinned_,
            U.p "last_message" last_message_,
            U.p "info" info_
          ]

instance T.FromJSON ForumTopic where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "forumTopic" -> parseForumTopic v
      _ -> mempty
    where
      parseForumTopic :: A.Value -> T.Parser ForumTopic
      parseForumTopic = A.withObject "ForumTopic" $ \o -> do
        draft_message_ <- o A..:? "draft_message"
        notification_settings_ <- o A..:? "notification_settings"
        unread_reaction_count_ <- o A..:? "unread_reaction_count"
        unread_mention_count_ <- o A..:? "unread_mention_count"
        last_read_outbox_message_id_ <- o A..:? "last_read_outbox_message_id"
        last_read_inbox_message_id_ <- o A..:? "last_read_inbox_message_id"
        unread_count_ <- o A..:? "unread_count"
        is_pinned_ <- o A..:? "is_pinned"
        last_message_ <- o A..:? "last_message"
        info_ <- o A..:? "info"
        return $ ForumTopic {draft_message = draft_message_, notification_settings = notification_settings_, unread_reaction_count = unread_reaction_count_, unread_mention_count = unread_mention_count_, last_read_outbox_message_id = last_read_outbox_message_id_, last_read_inbox_message_id = last_read_inbox_message_id_, unread_count = unread_count_, is_pinned = is_pinned_, last_message = last_message_, info = info_}
  parseJSON _ = mempty

instance T.ToJSON ForumTopic where
  toJSON
    ForumTopic
      { draft_message = draft_message_,
        notification_settings = notification_settings_,
        unread_reaction_count = unread_reaction_count_,
        unread_mention_count = unread_mention_count_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        unread_count = unread_count_,
        is_pinned = is_pinned_,
        last_message = last_message_,
        info = info_
      } =
      A.object
        [ "@type" A..= T.String "forumTopic",
          "draft_message" A..= draft_message_,
          "notification_settings" A..= notification_settings_,
          "unread_reaction_count" A..= unread_reaction_count_,
          "unread_mention_count" A..= unread_mention_count_,
          "last_read_outbox_message_id" A..= last_read_outbox_message_id_,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id_,
          "unread_count" A..= unread_count_,
          "is_pinned" A..= is_pinned_,
          "last_message" A..= last_message_,
          "info" A..= info_
        ]
