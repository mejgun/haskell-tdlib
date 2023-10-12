module TD.Data.ChatEventAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.ChatLocation as ChatLocation
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo

data ChatEventAction -- ^ Represents a chat event
  = ChatEventMessageEdited -- ^ A message was edited
    { old_message :: Maybe Message.Message -- ^ The original message before the edit
    , new_message :: Maybe Message.Message -- ^ The message after it was edited
    }
  | ChatEventMessageDeleted -- ^ A message was deleted
    { message                             :: Maybe Message.Message -- ^ Deleted message
    , can_report_anti_spam_false_positive :: Maybe Bool            -- ^ True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive
    }
  | ChatEventMessagePinned -- ^ A message was pinned
    { message :: Maybe Message.Message -- ^ Pinned message
    }
  | ChatEventMessageUnpinned -- ^ A message was unpinned
    { message :: Maybe Message.Message -- ^ Unpinned message
    }
  | ChatEventPollStopped -- ^ A poll in a message was stopped
    { message :: Maybe Message.Message -- ^ The message with the poll
    }
  | ChatEventMemberJoined -- ^ A new member joined the chat
  | ChatEventMemberJoinedByInviteLink -- ^ A new member joined the chat via an invite link
    { invite_link                 :: Maybe ChatInviteLink.ChatInviteLink -- ^ Invite link used to join the chat
    , via_chat_folder_invite_link :: Maybe Bool                          -- ^ True, if the user has joined the chat using an invite link for a chat folder
    }
  | ChatEventMemberJoinedByRequest -- ^ A new member was accepted to the chat by an administrator
    { approver_user_id :: Maybe Int                           -- ^ User identifier of the chat administrator, approved user join request
    , invite_link      :: Maybe ChatInviteLink.ChatInviteLink -- ^ Invite link used to join the chat; may be null
    }
  | ChatEventMemberInvited -- ^ A new chat member was invited
    { user_id :: Maybe Int                               -- ^ New member user identifier
    , status  :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ New member status
    }
  | ChatEventMemberLeft -- ^ A member left the chat
  | ChatEventMemberPromoted -- ^ A chat member has gained/lost administrator status, or the list of their administrator privileges has changed
    { user_id    :: Maybe Int                               -- ^ Affected chat member user identifier
    , old_status :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ Previous status of the chat member
    , new_status :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ New status of the chat member
    }
  | ChatEventMemberRestricted -- ^ A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed
    { member_id  :: Maybe MessageSender.MessageSender       -- ^ Affected chat member identifier
    , old_status :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ Previous status of the chat member
    , new_status :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ New status of the chat member
    }
  | ChatEventAvailableReactionsChanged -- ^ The chat available reactions were changed
    { old_available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions -- ^ Previous chat available reactions
    , new_available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions -- ^ New chat available reactions
    }
  | ChatEventDescriptionChanged -- ^ The chat description was changed
    { old_description :: Maybe T.Text -- ^ Previous chat description
    , new_description :: Maybe T.Text -- ^ New chat description
    }
  | ChatEventLinkedChatChanged -- ^ The linked chat of a supergroup was changed
    { old_linked_chat_id :: Maybe Int -- ^ Previous supergroup linked chat identifier
    , new_linked_chat_id :: Maybe Int -- ^ New supergroup linked chat identifier
    }
  | ChatEventLocationChanged -- ^ The supergroup location was changed
    { old_location :: Maybe ChatLocation.ChatLocation -- ^ Previous location; may be null
    , new_location :: Maybe ChatLocation.ChatLocation -- ^ New location; may be null
    }
  | ChatEventMessageAutoDeleteTimeChanged -- ^ The message auto-delete timer was changed
    { old_message_auto_delete_time :: Maybe Int -- ^ Previous value of message_auto_delete_time
    , new_message_auto_delete_time :: Maybe Int -- ^ New value of message_auto_delete_time
    }
  | ChatEventPermissionsChanged -- ^ The chat permissions was changed
    { old_permissions :: Maybe ChatPermissions.ChatPermissions -- ^ Previous chat permissions
    , new_permissions :: Maybe ChatPermissions.ChatPermissions -- ^ New chat permissions
    }
  | ChatEventPhotoChanged -- ^ The chat photo was changed
    { old_photo :: Maybe ChatPhoto.ChatPhoto -- ^ Previous chat photo value; may be null
    , new_photo :: Maybe ChatPhoto.ChatPhoto -- ^ New chat photo value; may be null
    }
  | ChatEventSlowModeDelayChanged -- ^ The slow_mode_delay setting of a supergroup was changed
    { old_slow_mode_delay :: Maybe Int -- ^ Previous value of slow_mode_delay, in seconds
    , new_slow_mode_delay :: Maybe Int -- ^ New value of slow_mode_delay, in seconds
    }
  | ChatEventStickerSetChanged -- ^ The supergroup sticker set was changed
    { old_sticker_set_id :: Maybe Int -- ^ Previous identifier of the chat sticker set; 0 if none
    , new_sticker_set_id :: Maybe Int -- ^ New identifier of the chat sticker set; 0 if none
    }
  | ChatEventTitleChanged -- ^ The chat title was changed
    { old_title :: Maybe T.Text -- ^ Previous chat title
    , new_title :: Maybe T.Text -- ^ New chat title
    }
  | ChatEventUsernameChanged -- ^ The chat editable username was changed
    { old_username :: Maybe T.Text -- ^ Previous chat username
    , new_username :: Maybe T.Text -- ^ New chat username
    }
  | ChatEventActiveUsernamesChanged -- ^ The chat active usernames were changed
    { old_usernames :: Maybe [T.Text] -- ^ Previous list of active usernames
    , new_usernames :: Maybe [T.Text] -- ^ New list of active usernames
    }
  | ChatEventHasProtectedContentToggled -- ^ The has_protected_content setting of a channel was toggled
    { has_protected_content :: Maybe Bool -- ^ New value of has_protected_content
    }
  | ChatEventInvitesToggled -- ^ The can_invite_users permission of a supergroup chat was toggled
    { can_invite_users :: Maybe Bool -- ^ New value of can_invite_users permission
    }
  | ChatEventIsAllHistoryAvailableToggled -- ^ The is_all_history_available setting of a supergroup was toggled
    { is_all_history_available :: Maybe Bool -- ^ New value of is_all_history_available
    }
  | ChatEventHasAggressiveAntiSpamEnabledToggled -- ^ The has_aggressive_anti_spam_enabled setting of a supergroup was toggled
    { has_aggressive_anti_spam_enabled :: Maybe Bool -- ^ New value of has_aggressive_anti_spam_enabled
    }
  | ChatEventSignMessagesToggled -- ^ The sign_messages setting of a channel was toggled
    { sign_messages :: Maybe Bool -- ^ New value of sign_messages
    }
  | ChatEventInviteLinkEdited -- ^ A chat invite link was edited
    { old_invite_link :: Maybe ChatInviteLink.ChatInviteLink -- ^ Previous information about the invite link
    , new_invite_link :: Maybe ChatInviteLink.ChatInviteLink -- ^ New information about the invite link
    }
  | ChatEventInviteLinkRevoked -- ^ A chat invite link was revoked
    { invite_link :: Maybe ChatInviteLink.ChatInviteLink -- ^ The invite link
    }
  | ChatEventInviteLinkDeleted -- ^ A revoked chat invite link was deleted
    { invite_link :: Maybe ChatInviteLink.ChatInviteLink -- ^ The invite link
    }
  | ChatEventVideoChatCreated -- ^ A video chat was created
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    }
  | ChatEventVideoChatEnded -- ^ A video chat was ended
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    }
  | ChatEventVideoChatMuteNewParticipantsToggled -- ^ The mute_new_participants setting of a video chat was toggled
    { mute_new_participants :: Maybe Bool -- ^ New value of the mute_new_participants setting
    }
  | ChatEventVideoChatParticipantIsMutedToggled -- ^ A video chat participant was muted or unmuted
    { participant_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the affected group call participant
    , is_muted       :: Maybe Bool                        -- ^ New value of is_muted
    }
  | ChatEventVideoChatParticipantVolumeLevelChanged -- ^ A video chat participant volume level was changed
    { participant_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the affected group call participant
    , volume_level   :: Maybe Int                         -- ^ New value of volume_level; 1-20000 in hundreds of percents
    }
  | ChatEventIsForumToggled -- ^ The is_forum setting of a channel was toggled
    { is_forum :: Maybe Bool -- ^ New value of is_forum
    }
  | ChatEventForumTopicCreated -- ^ A new forum topic was created
    { topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ Information about the topic
    }
  | ChatEventForumTopicEdited -- ^ A forum topic was edited
    { old_topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ Old information about the topic
    , new_topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ New information about the topic
    }
  | ChatEventForumTopicToggleIsClosed -- ^ A forum topic was closed or reopened
    { topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ New information about the topic
    }
  | ChatEventForumTopicToggleIsHidden -- ^ The General forum topic was hidden or unhidden
    { topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ New information about the topic
    }
  | ChatEventForumTopicDeleted -- ^ A forum topic was deleted
    { topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ Information about the topic
    }
  | ChatEventForumTopicPinned -- ^ A pinned forum topic was changed
    { old_topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ Information about the old pinned topic; may be null
    , new_topic_info :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ Information about the new pinned topic; may be null
    }
  deriving (Eq)

instance Show ChatEventAction where
  show ChatEventMessageEdited
    { old_message = old_message_
    , new_message = new_message_
    }
      = "ChatEventMessageEdited"
        ++ I.cc
        [ "old_message" `I.p` old_message_
        , "new_message" `I.p` new_message_
        ]
  show ChatEventMessageDeleted
    { message                             = message_
    , can_report_anti_spam_false_positive = can_report_anti_spam_false_positive_
    }
      = "ChatEventMessageDeleted"
        ++ I.cc
        [ "message"                             `I.p` message_
        , "can_report_anti_spam_false_positive" `I.p` can_report_anti_spam_false_positive_
        ]
  show ChatEventMessagePinned
    { message = message_
    }
      = "ChatEventMessagePinned"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  show ChatEventMessageUnpinned
    { message = message_
    }
      = "ChatEventMessageUnpinned"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  show ChatEventPollStopped
    { message = message_
    }
      = "ChatEventPollStopped"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  show ChatEventMemberJoined
      = "ChatEventMemberJoined"
  show ChatEventMemberJoinedByInviteLink
    { invite_link                 = invite_link_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    }
      = "ChatEventMemberJoinedByInviteLink"
        ++ I.cc
        [ "invite_link"                 `I.p` invite_link_
        , "via_chat_folder_invite_link" `I.p` via_chat_folder_invite_link_
        ]
  show ChatEventMemberJoinedByRequest
    { approver_user_id = approver_user_id_
    , invite_link      = invite_link_
    }
      = "ChatEventMemberJoinedByRequest"
        ++ I.cc
        [ "approver_user_id" `I.p` approver_user_id_
        , "invite_link"      `I.p` invite_link_
        ]
  show ChatEventMemberInvited
    { user_id = user_id_
    , status  = status_
    }
      = "ChatEventMemberInvited"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "status"  `I.p` status_
        ]
  show ChatEventMemberLeft
      = "ChatEventMemberLeft"
  show ChatEventMemberPromoted
    { user_id    = user_id_
    , old_status = old_status_
    , new_status = new_status_
    }
      = "ChatEventMemberPromoted"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "old_status" `I.p` old_status_
        , "new_status" `I.p` new_status_
        ]
  show ChatEventMemberRestricted
    { member_id  = member_id_
    , old_status = old_status_
    , new_status = new_status_
    }
      = "ChatEventMemberRestricted"
        ++ I.cc
        [ "member_id"  `I.p` member_id_
        , "old_status" `I.p` old_status_
        , "new_status" `I.p` new_status_
        ]
  show ChatEventAvailableReactionsChanged
    { old_available_reactions = old_available_reactions_
    , new_available_reactions = new_available_reactions_
    }
      = "ChatEventAvailableReactionsChanged"
        ++ I.cc
        [ "old_available_reactions" `I.p` old_available_reactions_
        , "new_available_reactions" `I.p` new_available_reactions_
        ]
  show ChatEventDescriptionChanged
    { old_description = old_description_
    , new_description = new_description_
    }
      = "ChatEventDescriptionChanged"
        ++ I.cc
        [ "old_description" `I.p` old_description_
        , "new_description" `I.p` new_description_
        ]
  show ChatEventLinkedChatChanged
    { old_linked_chat_id = old_linked_chat_id_
    , new_linked_chat_id = new_linked_chat_id_
    }
      = "ChatEventLinkedChatChanged"
        ++ I.cc
        [ "old_linked_chat_id" `I.p` old_linked_chat_id_
        , "new_linked_chat_id" `I.p` new_linked_chat_id_
        ]
  show ChatEventLocationChanged
    { old_location = old_location_
    , new_location = new_location_
    }
      = "ChatEventLocationChanged"
        ++ I.cc
        [ "old_location" `I.p` old_location_
        , "new_location" `I.p` new_location_
        ]
  show ChatEventMessageAutoDeleteTimeChanged
    { old_message_auto_delete_time = old_message_auto_delete_time_
    , new_message_auto_delete_time = new_message_auto_delete_time_
    }
      = "ChatEventMessageAutoDeleteTimeChanged"
        ++ I.cc
        [ "old_message_auto_delete_time" `I.p` old_message_auto_delete_time_
        , "new_message_auto_delete_time" `I.p` new_message_auto_delete_time_
        ]
  show ChatEventPermissionsChanged
    { old_permissions = old_permissions_
    , new_permissions = new_permissions_
    }
      = "ChatEventPermissionsChanged"
        ++ I.cc
        [ "old_permissions" `I.p` old_permissions_
        , "new_permissions" `I.p` new_permissions_
        ]
  show ChatEventPhotoChanged
    { old_photo = old_photo_
    , new_photo = new_photo_
    }
      = "ChatEventPhotoChanged"
        ++ I.cc
        [ "old_photo" `I.p` old_photo_
        , "new_photo" `I.p` new_photo_
        ]
  show ChatEventSlowModeDelayChanged
    { old_slow_mode_delay = old_slow_mode_delay_
    , new_slow_mode_delay = new_slow_mode_delay_
    }
      = "ChatEventSlowModeDelayChanged"
        ++ I.cc
        [ "old_slow_mode_delay" `I.p` old_slow_mode_delay_
        , "new_slow_mode_delay" `I.p` new_slow_mode_delay_
        ]
  show ChatEventStickerSetChanged
    { old_sticker_set_id = old_sticker_set_id_
    , new_sticker_set_id = new_sticker_set_id_
    }
      = "ChatEventStickerSetChanged"
        ++ I.cc
        [ "old_sticker_set_id" `I.p` old_sticker_set_id_
        , "new_sticker_set_id" `I.p` new_sticker_set_id_
        ]
  show ChatEventTitleChanged
    { old_title = old_title_
    , new_title = new_title_
    }
      = "ChatEventTitleChanged"
        ++ I.cc
        [ "old_title" `I.p` old_title_
        , "new_title" `I.p` new_title_
        ]
  show ChatEventUsernameChanged
    { old_username = old_username_
    , new_username = new_username_
    }
      = "ChatEventUsernameChanged"
        ++ I.cc
        [ "old_username" `I.p` old_username_
        , "new_username" `I.p` new_username_
        ]
  show ChatEventActiveUsernamesChanged
    { old_usernames = old_usernames_
    , new_usernames = new_usernames_
    }
      = "ChatEventActiveUsernamesChanged"
        ++ I.cc
        [ "old_usernames" `I.p` old_usernames_
        , "new_usernames" `I.p` new_usernames_
        ]
  show ChatEventHasProtectedContentToggled
    { has_protected_content = has_protected_content_
    }
      = "ChatEventHasProtectedContentToggled"
        ++ I.cc
        [ "has_protected_content" `I.p` has_protected_content_
        ]
  show ChatEventInvitesToggled
    { can_invite_users = can_invite_users_
    }
      = "ChatEventInvitesToggled"
        ++ I.cc
        [ "can_invite_users" `I.p` can_invite_users_
        ]
  show ChatEventIsAllHistoryAvailableToggled
    { is_all_history_available = is_all_history_available_
    }
      = "ChatEventIsAllHistoryAvailableToggled"
        ++ I.cc
        [ "is_all_history_available" `I.p` is_all_history_available_
        ]
  show ChatEventHasAggressiveAntiSpamEnabledToggled
    { has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
    }
      = "ChatEventHasAggressiveAntiSpamEnabledToggled"
        ++ I.cc
        [ "has_aggressive_anti_spam_enabled" `I.p` has_aggressive_anti_spam_enabled_
        ]
  show ChatEventSignMessagesToggled
    { sign_messages = sign_messages_
    }
      = "ChatEventSignMessagesToggled"
        ++ I.cc
        [ "sign_messages" `I.p` sign_messages_
        ]
  show ChatEventInviteLinkEdited
    { old_invite_link = old_invite_link_
    , new_invite_link = new_invite_link_
    }
      = "ChatEventInviteLinkEdited"
        ++ I.cc
        [ "old_invite_link" `I.p` old_invite_link_
        , "new_invite_link" `I.p` new_invite_link_
        ]
  show ChatEventInviteLinkRevoked
    { invite_link = invite_link_
    }
      = "ChatEventInviteLinkRevoked"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]
  show ChatEventInviteLinkDeleted
    { invite_link = invite_link_
    }
      = "ChatEventInviteLinkDeleted"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]
  show ChatEventVideoChatCreated
    { group_call_id = group_call_id_
    }
      = "ChatEventVideoChatCreated"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        ]
  show ChatEventVideoChatEnded
    { group_call_id = group_call_id_
    }
      = "ChatEventVideoChatEnded"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        ]
  show ChatEventVideoChatMuteNewParticipantsToggled
    { mute_new_participants = mute_new_participants_
    }
      = "ChatEventVideoChatMuteNewParticipantsToggled"
        ++ I.cc
        [ "mute_new_participants" `I.p` mute_new_participants_
        ]
  show ChatEventVideoChatParticipantIsMutedToggled
    { participant_id = participant_id_
    , is_muted       = is_muted_
    }
      = "ChatEventVideoChatParticipantIsMutedToggled"
        ++ I.cc
        [ "participant_id" `I.p` participant_id_
        , "is_muted"       `I.p` is_muted_
        ]
  show ChatEventVideoChatParticipantVolumeLevelChanged
    { participant_id = participant_id_
    , volume_level   = volume_level_
    }
      = "ChatEventVideoChatParticipantVolumeLevelChanged"
        ++ I.cc
        [ "participant_id" `I.p` participant_id_
        , "volume_level"   `I.p` volume_level_
        ]
  show ChatEventIsForumToggled
    { is_forum = is_forum_
    }
      = "ChatEventIsForumToggled"
        ++ I.cc
        [ "is_forum" `I.p` is_forum_
        ]
  show ChatEventForumTopicCreated
    { topic_info = topic_info_
    }
      = "ChatEventForumTopicCreated"
        ++ I.cc
        [ "topic_info" `I.p` topic_info_
        ]
  show ChatEventForumTopicEdited
    { old_topic_info = old_topic_info_
    , new_topic_info = new_topic_info_
    }
      = "ChatEventForumTopicEdited"
        ++ I.cc
        [ "old_topic_info" `I.p` old_topic_info_
        , "new_topic_info" `I.p` new_topic_info_
        ]
  show ChatEventForumTopicToggleIsClosed
    { topic_info = topic_info_
    }
      = "ChatEventForumTopicToggleIsClosed"
        ++ I.cc
        [ "topic_info" `I.p` topic_info_
        ]
  show ChatEventForumTopicToggleIsHidden
    { topic_info = topic_info_
    }
      = "ChatEventForumTopicToggleIsHidden"
        ++ I.cc
        [ "topic_info" `I.p` topic_info_
        ]
  show ChatEventForumTopicDeleted
    { topic_info = topic_info_
    }
      = "ChatEventForumTopicDeleted"
        ++ I.cc
        [ "topic_info" `I.p` topic_info_
        ]
  show ChatEventForumTopicPinned
    { old_topic_info = old_topic_info_
    , new_topic_info = new_topic_info_
    }
      = "ChatEventForumTopicPinned"
        ++ I.cc
        [ "old_topic_info" `I.p` old_topic_info_
        , "new_topic_info" `I.p` new_topic_info_
        ]

instance AT.FromJSON ChatEventAction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatEventMessageEdited"                          -> parseChatEventMessageEdited v
      "chatEventMessageDeleted"                         -> parseChatEventMessageDeleted v
      "chatEventMessagePinned"                          -> parseChatEventMessagePinned v
      "chatEventMessageUnpinned"                        -> parseChatEventMessageUnpinned v
      "chatEventPollStopped"                            -> parseChatEventPollStopped v
      "chatEventMemberJoined"                           -> pure ChatEventMemberJoined
      "chatEventMemberJoinedByInviteLink"               -> parseChatEventMemberJoinedByInviteLink v
      "chatEventMemberJoinedByRequest"                  -> parseChatEventMemberJoinedByRequest v
      "chatEventMemberInvited"                          -> parseChatEventMemberInvited v
      "chatEventMemberLeft"                             -> pure ChatEventMemberLeft
      "chatEventMemberPromoted"                         -> parseChatEventMemberPromoted v
      "chatEventMemberRestricted"                       -> parseChatEventMemberRestricted v
      "chatEventAvailableReactionsChanged"              -> parseChatEventAvailableReactionsChanged v
      "chatEventDescriptionChanged"                     -> parseChatEventDescriptionChanged v
      "chatEventLinkedChatChanged"                      -> parseChatEventLinkedChatChanged v
      "chatEventLocationChanged"                        -> parseChatEventLocationChanged v
      "chatEventMessageAutoDeleteTimeChanged"           -> parseChatEventMessageAutoDeleteTimeChanged v
      "chatEventPermissionsChanged"                     -> parseChatEventPermissionsChanged v
      "chatEventPhotoChanged"                           -> parseChatEventPhotoChanged v
      "chatEventSlowModeDelayChanged"                   -> parseChatEventSlowModeDelayChanged v
      "chatEventStickerSetChanged"                      -> parseChatEventStickerSetChanged v
      "chatEventTitleChanged"                           -> parseChatEventTitleChanged v
      "chatEventUsernameChanged"                        -> parseChatEventUsernameChanged v
      "chatEventActiveUsernamesChanged"                 -> parseChatEventActiveUsernamesChanged v
      "chatEventHasProtectedContentToggled"             -> parseChatEventHasProtectedContentToggled v
      "chatEventInvitesToggled"                         -> parseChatEventInvitesToggled v
      "chatEventIsAllHistoryAvailableToggled"           -> parseChatEventIsAllHistoryAvailableToggled v
      "chatEventHasAggressiveAntiSpamEnabledToggled"    -> parseChatEventHasAggressiveAntiSpamEnabledToggled v
      "chatEventSignMessagesToggled"                    -> parseChatEventSignMessagesToggled v
      "chatEventInviteLinkEdited"                       -> parseChatEventInviteLinkEdited v
      "chatEventInviteLinkRevoked"                      -> parseChatEventInviteLinkRevoked v
      "chatEventInviteLinkDeleted"                      -> parseChatEventInviteLinkDeleted v
      "chatEventVideoChatCreated"                       -> parseChatEventVideoChatCreated v
      "chatEventVideoChatEnded"                         -> parseChatEventVideoChatEnded v
      "chatEventVideoChatMuteNewParticipantsToggled"    -> parseChatEventVideoChatMuteNewParticipantsToggled v
      "chatEventVideoChatParticipantIsMutedToggled"     -> parseChatEventVideoChatParticipantIsMutedToggled v
      "chatEventVideoChatParticipantVolumeLevelChanged" -> parseChatEventVideoChatParticipantVolumeLevelChanged v
      "chatEventIsForumToggled"                         -> parseChatEventIsForumToggled v
      "chatEventForumTopicCreated"                      -> parseChatEventForumTopicCreated v
      "chatEventForumTopicEdited"                       -> parseChatEventForumTopicEdited v
      "chatEventForumTopicToggleIsClosed"               -> parseChatEventForumTopicToggleIsClosed v
      "chatEventForumTopicToggleIsHidden"               -> parseChatEventForumTopicToggleIsHidden v
      "chatEventForumTopicDeleted"                      -> parseChatEventForumTopicDeleted v
      "chatEventForumTopicPinned"                       -> parseChatEventForumTopicPinned v
      _                                                 -> mempty
    
    where
      parseChatEventMessageEdited :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMessageEdited = A.withObject "ChatEventMessageEdited" $ \o -> do
        old_message_ <- o A..:?  "old_message"
        new_message_ <- o A..:?  "new_message"
        pure $ ChatEventMessageEdited
          { old_message = old_message_
          , new_message = new_message_
          }
      parseChatEventMessageDeleted :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMessageDeleted = A.withObject "ChatEventMessageDeleted" $ \o -> do
        message_                             <- o A..:?  "message"
        can_report_anti_spam_false_positive_ <- o A..:?  "can_report_anti_spam_false_positive"
        pure $ ChatEventMessageDeleted
          { message                             = message_
          , can_report_anti_spam_false_positive = can_report_anti_spam_false_positive_
          }
      parseChatEventMessagePinned :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMessagePinned = A.withObject "ChatEventMessagePinned" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ ChatEventMessagePinned
          { message = message_
          }
      parseChatEventMessageUnpinned :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMessageUnpinned = A.withObject "ChatEventMessageUnpinned" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ ChatEventMessageUnpinned
          { message = message_
          }
      parseChatEventPollStopped :: A.Value -> AT.Parser ChatEventAction
      parseChatEventPollStopped = A.withObject "ChatEventPollStopped" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ ChatEventPollStopped
          { message = message_
          }
      parseChatEventMemberJoinedByInviteLink :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMemberJoinedByInviteLink = A.withObject "ChatEventMemberJoinedByInviteLink" $ \o -> do
        invite_link_                 <- o A..:?  "invite_link"
        via_chat_folder_invite_link_ <- o A..:?  "via_chat_folder_invite_link"
        pure $ ChatEventMemberJoinedByInviteLink
          { invite_link                 = invite_link_
          , via_chat_folder_invite_link = via_chat_folder_invite_link_
          }
      parseChatEventMemberJoinedByRequest :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMemberJoinedByRequest = A.withObject "ChatEventMemberJoinedByRequest" $ \o -> do
        approver_user_id_ <- o A..:?  "approver_user_id"
        invite_link_      <- o A..:?  "invite_link"
        pure $ ChatEventMemberJoinedByRequest
          { approver_user_id = approver_user_id_
          , invite_link      = invite_link_
          }
      parseChatEventMemberInvited :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMemberInvited = A.withObject "ChatEventMemberInvited" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        status_  <- o A..:?  "status"
        pure $ ChatEventMemberInvited
          { user_id = user_id_
          , status  = status_
          }
      parseChatEventMemberPromoted :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMemberPromoted = A.withObject "ChatEventMemberPromoted" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        old_status_ <- o A..:?  "old_status"
        new_status_ <- o A..:?  "new_status"
        pure $ ChatEventMemberPromoted
          { user_id    = user_id_
          , old_status = old_status_
          , new_status = new_status_
          }
      parseChatEventMemberRestricted :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMemberRestricted = A.withObject "ChatEventMemberRestricted" $ \o -> do
        member_id_  <- o A..:?  "member_id"
        old_status_ <- o A..:?  "old_status"
        new_status_ <- o A..:?  "new_status"
        pure $ ChatEventMemberRestricted
          { member_id  = member_id_
          , old_status = old_status_
          , new_status = new_status_
          }
      parseChatEventAvailableReactionsChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventAvailableReactionsChanged = A.withObject "ChatEventAvailableReactionsChanged" $ \o -> do
        old_available_reactions_ <- o A..:?  "old_available_reactions"
        new_available_reactions_ <- o A..:?  "new_available_reactions"
        pure $ ChatEventAvailableReactionsChanged
          { old_available_reactions = old_available_reactions_
          , new_available_reactions = new_available_reactions_
          }
      parseChatEventDescriptionChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventDescriptionChanged = A.withObject "ChatEventDescriptionChanged" $ \o -> do
        old_description_ <- o A..:?  "old_description"
        new_description_ <- o A..:?  "new_description"
        pure $ ChatEventDescriptionChanged
          { old_description = old_description_
          , new_description = new_description_
          }
      parseChatEventLinkedChatChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventLinkedChatChanged = A.withObject "ChatEventLinkedChatChanged" $ \o -> do
        old_linked_chat_id_ <- o A..:?  "old_linked_chat_id"
        new_linked_chat_id_ <- o A..:?  "new_linked_chat_id"
        pure $ ChatEventLinkedChatChanged
          { old_linked_chat_id = old_linked_chat_id_
          , new_linked_chat_id = new_linked_chat_id_
          }
      parseChatEventLocationChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventLocationChanged = A.withObject "ChatEventLocationChanged" $ \o -> do
        old_location_ <- o A..:?  "old_location"
        new_location_ <- o A..:?  "new_location"
        pure $ ChatEventLocationChanged
          { old_location = old_location_
          , new_location = new_location_
          }
      parseChatEventMessageAutoDeleteTimeChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventMessageAutoDeleteTimeChanged = A.withObject "ChatEventMessageAutoDeleteTimeChanged" $ \o -> do
        old_message_auto_delete_time_ <- o A..:?  "old_message_auto_delete_time"
        new_message_auto_delete_time_ <- o A..:?  "new_message_auto_delete_time"
        pure $ ChatEventMessageAutoDeleteTimeChanged
          { old_message_auto_delete_time = old_message_auto_delete_time_
          , new_message_auto_delete_time = new_message_auto_delete_time_
          }
      parseChatEventPermissionsChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventPermissionsChanged = A.withObject "ChatEventPermissionsChanged" $ \o -> do
        old_permissions_ <- o A..:?  "old_permissions"
        new_permissions_ <- o A..:?  "new_permissions"
        pure $ ChatEventPermissionsChanged
          { old_permissions = old_permissions_
          , new_permissions = new_permissions_
          }
      parseChatEventPhotoChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventPhotoChanged = A.withObject "ChatEventPhotoChanged" $ \o -> do
        old_photo_ <- o A..:?  "old_photo"
        new_photo_ <- o A..:?  "new_photo"
        pure $ ChatEventPhotoChanged
          { old_photo = old_photo_
          , new_photo = new_photo_
          }
      parseChatEventSlowModeDelayChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventSlowModeDelayChanged = A.withObject "ChatEventSlowModeDelayChanged" $ \o -> do
        old_slow_mode_delay_ <- o A..:?  "old_slow_mode_delay"
        new_slow_mode_delay_ <- o A..:?  "new_slow_mode_delay"
        pure $ ChatEventSlowModeDelayChanged
          { old_slow_mode_delay = old_slow_mode_delay_
          , new_slow_mode_delay = new_slow_mode_delay_
          }
      parseChatEventStickerSetChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventStickerSetChanged = A.withObject "ChatEventStickerSetChanged" $ \o -> do
        old_sticker_set_id_ <- fmap I.readInt64 <$> o A..:?  "old_sticker_set_id"
        new_sticker_set_id_ <- fmap I.readInt64 <$> o A..:?  "new_sticker_set_id"
        pure $ ChatEventStickerSetChanged
          { old_sticker_set_id = old_sticker_set_id_
          , new_sticker_set_id = new_sticker_set_id_
          }
      parseChatEventTitleChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventTitleChanged = A.withObject "ChatEventTitleChanged" $ \o -> do
        old_title_ <- o A..:?  "old_title"
        new_title_ <- o A..:?  "new_title"
        pure $ ChatEventTitleChanged
          { old_title = old_title_
          , new_title = new_title_
          }
      parseChatEventUsernameChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventUsernameChanged = A.withObject "ChatEventUsernameChanged" $ \o -> do
        old_username_ <- o A..:?  "old_username"
        new_username_ <- o A..:?  "new_username"
        pure $ ChatEventUsernameChanged
          { old_username = old_username_
          , new_username = new_username_
          }
      parseChatEventActiveUsernamesChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventActiveUsernamesChanged = A.withObject "ChatEventActiveUsernamesChanged" $ \o -> do
        old_usernames_ <- o A..:?  "old_usernames"
        new_usernames_ <- o A..:?  "new_usernames"
        pure $ ChatEventActiveUsernamesChanged
          { old_usernames = old_usernames_
          , new_usernames = new_usernames_
          }
      parseChatEventHasProtectedContentToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventHasProtectedContentToggled = A.withObject "ChatEventHasProtectedContentToggled" $ \o -> do
        has_protected_content_ <- o A..:?  "has_protected_content"
        pure $ ChatEventHasProtectedContentToggled
          { has_protected_content = has_protected_content_
          }
      parseChatEventInvitesToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventInvitesToggled = A.withObject "ChatEventInvitesToggled" $ \o -> do
        can_invite_users_ <- o A..:?  "can_invite_users"
        pure $ ChatEventInvitesToggled
          { can_invite_users = can_invite_users_
          }
      parseChatEventIsAllHistoryAvailableToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventIsAllHistoryAvailableToggled = A.withObject "ChatEventIsAllHistoryAvailableToggled" $ \o -> do
        is_all_history_available_ <- o A..:?  "is_all_history_available"
        pure $ ChatEventIsAllHistoryAvailableToggled
          { is_all_history_available = is_all_history_available_
          }
      parseChatEventHasAggressiveAntiSpamEnabledToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventHasAggressiveAntiSpamEnabledToggled = A.withObject "ChatEventHasAggressiveAntiSpamEnabledToggled" $ \o -> do
        has_aggressive_anti_spam_enabled_ <- o A..:?  "has_aggressive_anti_spam_enabled"
        pure $ ChatEventHasAggressiveAntiSpamEnabledToggled
          { has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
          }
      parseChatEventSignMessagesToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventSignMessagesToggled = A.withObject "ChatEventSignMessagesToggled" $ \o -> do
        sign_messages_ <- o A..:?  "sign_messages"
        pure $ ChatEventSignMessagesToggled
          { sign_messages = sign_messages_
          }
      parseChatEventInviteLinkEdited :: A.Value -> AT.Parser ChatEventAction
      parseChatEventInviteLinkEdited = A.withObject "ChatEventInviteLinkEdited" $ \o -> do
        old_invite_link_ <- o A..:?  "old_invite_link"
        new_invite_link_ <- o A..:?  "new_invite_link"
        pure $ ChatEventInviteLinkEdited
          { old_invite_link = old_invite_link_
          , new_invite_link = new_invite_link_
          }
      parseChatEventInviteLinkRevoked :: A.Value -> AT.Parser ChatEventAction
      parseChatEventInviteLinkRevoked = A.withObject "ChatEventInviteLinkRevoked" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ ChatEventInviteLinkRevoked
          { invite_link = invite_link_
          }
      parseChatEventInviteLinkDeleted :: A.Value -> AT.Parser ChatEventAction
      parseChatEventInviteLinkDeleted = A.withObject "ChatEventInviteLinkDeleted" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ ChatEventInviteLinkDeleted
          { invite_link = invite_link_
          }
      parseChatEventVideoChatCreated :: A.Value -> AT.Parser ChatEventAction
      parseChatEventVideoChatCreated = A.withObject "ChatEventVideoChatCreated" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        pure $ ChatEventVideoChatCreated
          { group_call_id = group_call_id_
          }
      parseChatEventVideoChatEnded :: A.Value -> AT.Parser ChatEventAction
      parseChatEventVideoChatEnded = A.withObject "ChatEventVideoChatEnded" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        pure $ ChatEventVideoChatEnded
          { group_call_id = group_call_id_
          }
      parseChatEventVideoChatMuteNewParticipantsToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventVideoChatMuteNewParticipantsToggled = A.withObject "ChatEventVideoChatMuteNewParticipantsToggled" $ \o -> do
        mute_new_participants_ <- o A..:?  "mute_new_participants"
        pure $ ChatEventVideoChatMuteNewParticipantsToggled
          { mute_new_participants = mute_new_participants_
          }
      parseChatEventVideoChatParticipantIsMutedToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventVideoChatParticipantIsMutedToggled = A.withObject "ChatEventVideoChatParticipantIsMutedToggled" $ \o -> do
        participant_id_ <- o A..:?  "participant_id"
        is_muted_       <- o A..:?  "is_muted"
        pure $ ChatEventVideoChatParticipantIsMutedToggled
          { participant_id = participant_id_
          , is_muted       = is_muted_
          }
      parseChatEventVideoChatParticipantVolumeLevelChanged :: A.Value -> AT.Parser ChatEventAction
      parseChatEventVideoChatParticipantVolumeLevelChanged = A.withObject "ChatEventVideoChatParticipantVolumeLevelChanged" $ \o -> do
        participant_id_ <- o A..:?  "participant_id"
        volume_level_   <- o A..:?  "volume_level"
        pure $ ChatEventVideoChatParticipantVolumeLevelChanged
          { participant_id = participant_id_
          , volume_level   = volume_level_
          }
      parseChatEventIsForumToggled :: A.Value -> AT.Parser ChatEventAction
      parseChatEventIsForumToggled = A.withObject "ChatEventIsForumToggled" $ \o -> do
        is_forum_ <- o A..:?  "is_forum"
        pure $ ChatEventIsForumToggled
          { is_forum = is_forum_
          }
      parseChatEventForumTopicCreated :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicCreated = A.withObject "ChatEventForumTopicCreated" $ \o -> do
        topic_info_ <- o A..:?  "topic_info"
        pure $ ChatEventForumTopicCreated
          { topic_info = topic_info_
          }
      parseChatEventForumTopicEdited :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicEdited = A.withObject "ChatEventForumTopicEdited" $ \o -> do
        old_topic_info_ <- o A..:?  "old_topic_info"
        new_topic_info_ <- o A..:?  "new_topic_info"
        pure $ ChatEventForumTopicEdited
          { old_topic_info = old_topic_info_
          , new_topic_info = new_topic_info_
          }
      parseChatEventForumTopicToggleIsClosed :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicToggleIsClosed = A.withObject "ChatEventForumTopicToggleIsClosed" $ \o -> do
        topic_info_ <- o A..:?  "topic_info"
        pure $ ChatEventForumTopicToggleIsClosed
          { topic_info = topic_info_
          }
      parseChatEventForumTopicToggleIsHidden :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicToggleIsHidden = A.withObject "ChatEventForumTopicToggleIsHidden" $ \o -> do
        topic_info_ <- o A..:?  "topic_info"
        pure $ ChatEventForumTopicToggleIsHidden
          { topic_info = topic_info_
          }
      parseChatEventForumTopicDeleted :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicDeleted = A.withObject "ChatEventForumTopicDeleted" $ \o -> do
        topic_info_ <- o A..:?  "topic_info"
        pure $ ChatEventForumTopicDeleted
          { topic_info = topic_info_
          }
      parseChatEventForumTopicPinned :: A.Value -> AT.Parser ChatEventAction
      parseChatEventForumTopicPinned = A.withObject "ChatEventForumTopicPinned" $ \o -> do
        old_topic_info_ <- o A..:?  "old_topic_info"
        new_topic_info_ <- o A..:?  "new_topic_info"
        pure $ ChatEventForumTopicPinned
          { old_topic_info = old_topic_info_
          , new_topic_info = new_topic_info_
          }

instance AT.ToJSON ChatEventAction where
  toJSON ChatEventMessageEdited
    { old_message = old_message_
    , new_message = new_message_
    }
      = A.object
        [ "@type"       A..= AT.String "chatEventMessageEdited"
        , "old_message" A..= old_message_
        , "new_message" A..= new_message_
        ]
  toJSON ChatEventMessageDeleted
    { message                             = message_
    , can_report_anti_spam_false_positive = can_report_anti_spam_false_positive_
    }
      = A.object
        [ "@type"                               A..= AT.String "chatEventMessageDeleted"
        , "message"                             A..= message_
        , "can_report_anti_spam_false_positive" A..= can_report_anti_spam_false_positive_
        ]
  toJSON ChatEventMessagePinned
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "chatEventMessagePinned"
        , "message" A..= message_
        ]
  toJSON ChatEventMessageUnpinned
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "chatEventMessageUnpinned"
        , "message" A..= message_
        ]
  toJSON ChatEventPollStopped
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "chatEventPollStopped"
        , "message" A..= message_
        ]
  toJSON ChatEventMemberJoined
      = A.object
        [ "@type" A..= AT.String "chatEventMemberJoined"
        ]
  toJSON ChatEventMemberJoinedByInviteLink
    { invite_link                 = invite_link_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    }
      = A.object
        [ "@type"                       A..= AT.String "chatEventMemberJoinedByInviteLink"
        , "invite_link"                 A..= invite_link_
        , "via_chat_folder_invite_link" A..= via_chat_folder_invite_link_
        ]
  toJSON ChatEventMemberJoinedByRequest
    { approver_user_id = approver_user_id_
    , invite_link      = invite_link_
    }
      = A.object
        [ "@type"            A..= AT.String "chatEventMemberJoinedByRequest"
        , "approver_user_id" A..= approver_user_id_
        , "invite_link"      A..= invite_link_
        ]
  toJSON ChatEventMemberInvited
    { user_id = user_id_
    , status  = status_
    }
      = A.object
        [ "@type"   A..= AT.String "chatEventMemberInvited"
        , "user_id" A..= user_id_
        , "status"  A..= status_
        ]
  toJSON ChatEventMemberLeft
      = A.object
        [ "@type" A..= AT.String "chatEventMemberLeft"
        ]
  toJSON ChatEventMemberPromoted
    { user_id    = user_id_
    , old_status = old_status_
    , new_status = new_status_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventMemberPromoted"
        , "user_id"    A..= user_id_
        , "old_status" A..= old_status_
        , "new_status" A..= new_status_
        ]
  toJSON ChatEventMemberRestricted
    { member_id  = member_id_
    , old_status = old_status_
    , new_status = new_status_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventMemberRestricted"
        , "member_id"  A..= member_id_
        , "old_status" A..= old_status_
        , "new_status" A..= new_status_
        ]
  toJSON ChatEventAvailableReactionsChanged
    { old_available_reactions = old_available_reactions_
    , new_available_reactions = new_available_reactions_
    }
      = A.object
        [ "@type"                   A..= AT.String "chatEventAvailableReactionsChanged"
        , "old_available_reactions" A..= old_available_reactions_
        , "new_available_reactions" A..= new_available_reactions_
        ]
  toJSON ChatEventDescriptionChanged
    { old_description = old_description_
    , new_description = new_description_
    }
      = A.object
        [ "@type"           A..= AT.String "chatEventDescriptionChanged"
        , "old_description" A..= old_description_
        , "new_description" A..= new_description_
        ]
  toJSON ChatEventLinkedChatChanged
    { old_linked_chat_id = old_linked_chat_id_
    , new_linked_chat_id = new_linked_chat_id_
    }
      = A.object
        [ "@type"              A..= AT.String "chatEventLinkedChatChanged"
        , "old_linked_chat_id" A..= old_linked_chat_id_
        , "new_linked_chat_id" A..= new_linked_chat_id_
        ]
  toJSON ChatEventLocationChanged
    { old_location = old_location_
    , new_location = new_location_
    }
      = A.object
        [ "@type"        A..= AT.String "chatEventLocationChanged"
        , "old_location" A..= old_location_
        , "new_location" A..= new_location_
        ]
  toJSON ChatEventMessageAutoDeleteTimeChanged
    { old_message_auto_delete_time = old_message_auto_delete_time_
    , new_message_auto_delete_time = new_message_auto_delete_time_
    }
      = A.object
        [ "@type"                        A..= AT.String "chatEventMessageAutoDeleteTimeChanged"
        , "old_message_auto_delete_time" A..= old_message_auto_delete_time_
        , "new_message_auto_delete_time" A..= new_message_auto_delete_time_
        ]
  toJSON ChatEventPermissionsChanged
    { old_permissions = old_permissions_
    , new_permissions = new_permissions_
    }
      = A.object
        [ "@type"           A..= AT.String "chatEventPermissionsChanged"
        , "old_permissions" A..= old_permissions_
        , "new_permissions" A..= new_permissions_
        ]
  toJSON ChatEventPhotoChanged
    { old_photo = old_photo_
    , new_photo = new_photo_
    }
      = A.object
        [ "@type"     A..= AT.String "chatEventPhotoChanged"
        , "old_photo" A..= old_photo_
        , "new_photo" A..= new_photo_
        ]
  toJSON ChatEventSlowModeDelayChanged
    { old_slow_mode_delay = old_slow_mode_delay_
    , new_slow_mode_delay = new_slow_mode_delay_
    }
      = A.object
        [ "@type"               A..= AT.String "chatEventSlowModeDelayChanged"
        , "old_slow_mode_delay" A..= old_slow_mode_delay_
        , "new_slow_mode_delay" A..= new_slow_mode_delay_
        ]
  toJSON ChatEventStickerSetChanged
    { old_sticker_set_id = old_sticker_set_id_
    , new_sticker_set_id = new_sticker_set_id_
    }
      = A.object
        [ "@type"              A..= AT.String "chatEventStickerSetChanged"
        , "old_sticker_set_id" A..= fmap I.writeInt64  old_sticker_set_id_
        , "new_sticker_set_id" A..= fmap I.writeInt64  new_sticker_set_id_
        ]
  toJSON ChatEventTitleChanged
    { old_title = old_title_
    , new_title = new_title_
    }
      = A.object
        [ "@type"     A..= AT.String "chatEventTitleChanged"
        , "old_title" A..= old_title_
        , "new_title" A..= new_title_
        ]
  toJSON ChatEventUsernameChanged
    { old_username = old_username_
    , new_username = new_username_
    }
      = A.object
        [ "@type"        A..= AT.String "chatEventUsernameChanged"
        , "old_username" A..= old_username_
        , "new_username" A..= new_username_
        ]
  toJSON ChatEventActiveUsernamesChanged
    { old_usernames = old_usernames_
    , new_usernames = new_usernames_
    }
      = A.object
        [ "@type"         A..= AT.String "chatEventActiveUsernamesChanged"
        , "old_usernames" A..= old_usernames_
        , "new_usernames" A..= new_usernames_
        ]
  toJSON ChatEventHasProtectedContentToggled
    { has_protected_content = has_protected_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "chatEventHasProtectedContentToggled"
        , "has_protected_content" A..= has_protected_content_
        ]
  toJSON ChatEventInvitesToggled
    { can_invite_users = can_invite_users_
    }
      = A.object
        [ "@type"            A..= AT.String "chatEventInvitesToggled"
        , "can_invite_users" A..= can_invite_users_
        ]
  toJSON ChatEventIsAllHistoryAvailableToggled
    { is_all_history_available = is_all_history_available_
    }
      = A.object
        [ "@type"                    A..= AT.String "chatEventIsAllHistoryAvailableToggled"
        , "is_all_history_available" A..= is_all_history_available_
        ]
  toJSON ChatEventHasAggressiveAntiSpamEnabledToggled
    { has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
    }
      = A.object
        [ "@type"                            A..= AT.String "chatEventHasAggressiveAntiSpamEnabledToggled"
        , "has_aggressive_anti_spam_enabled" A..= has_aggressive_anti_spam_enabled_
        ]
  toJSON ChatEventSignMessagesToggled
    { sign_messages = sign_messages_
    }
      = A.object
        [ "@type"         A..= AT.String "chatEventSignMessagesToggled"
        , "sign_messages" A..= sign_messages_
        ]
  toJSON ChatEventInviteLinkEdited
    { old_invite_link = old_invite_link_
    , new_invite_link = new_invite_link_
    }
      = A.object
        [ "@type"           A..= AT.String "chatEventInviteLinkEdited"
        , "old_invite_link" A..= old_invite_link_
        , "new_invite_link" A..= new_invite_link_
        ]
  toJSON ChatEventInviteLinkRevoked
    { invite_link = invite_link_
    }
      = A.object
        [ "@type"       A..= AT.String "chatEventInviteLinkRevoked"
        , "invite_link" A..= invite_link_
        ]
  toJSON ChatEventInviteLinkDeleted
    { invite_link = invite_link_
    }
      = A.object
        [ "@type"       A..= AT.String "chatEventInviteLinkDeleted"
        , "invite_link" A..= invite_link_
        ]
  toJSON ChatEventVideoChatCreated
    { group_call_id = group_call_id_
    }
      = A.object
        [ "@type"         A..= AT.String "chatEventVideoChatCreated"
        , "group_call_id" A..= group_call_id_
        ]
  toJSON ChatEventVideoChatEnded
    { group_call_id = group_call_id_
    }
      = A.object
        [ "@type"         A..= AT.String "chatEventVideoChatEnded"
        , "group_call_id" A..= group_call_id_
        ]
  toJSON ChatEventVideoChatMuteNewParticipantsToggled
    { mute_new_participants = mute_new_participants_
    }
      = A.object
        [ "@type"                 A..= AT.String "chatEventVideoChatMuteNewParticipantsToggled"
        , "mute_new_participants" A..= mute_new_participants_
        ]
  toJSON ChatEventVideoChatParticipantIsMutedToggled
    { participant_id = participant_id_
    , is_muted       = is_muted_
    }
      = A.object
        [ "@type"          A..= AT.String "chatEventVideoChatParticipantIsMutedToggled"
        , "participant_id" A..= participant_id_
        , "is_muted"       A..= is_muted_
        ]
  toJSON ChatEventVideoChatParticipantVolumeLevelChanged
    { participant_id = participant_id_
    , volume_level   = volume_level_
    }
      = A.object
        [ "@type"          A..= AT.String "chatEventVideoChatParticipantVolumeLevelChanged"
        , "participant_id" A..= participant_id_
        , "volume_level"   A..= volume_level_
        ]
  toJSON ChatEventIsForumToggled
    { is_forum = is_forum_
    }
      = A.object
        [ "@type"    A..= AT.String "chatEventIsForumToggled"
        , "is_forum" A..= is_forum_
        ]
  toJSON ChatEventForumTopicCreated
    { topic_info = topic_info_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventForumTopicCreated"
        , "topic_info" A..= topic_info_
        ]
  toJSON ChatEventForumTopicEdited
    { old_topic_info = old_topic_info_
    , new_topic_info = new_topic_info_
    }
      = A.object
        [ "@type"          A..= AT.String "chatEventForumTopicEdited"
        , "old_topic_info" A..= old_topic_info_
        , "new_topic_info" A..= new_topic_info_
        ]
  toJSON ChatEventForumTopicToggleIsClosed
    { topic_info = topic_info_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventForumTopicToggleIsClosed"
        , "topic_info" A..= topic_info_
        ]
  toJSON ChatEventForumTopicToggleIsHidden
    { topic_info = topic_info_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventForumTopicToggleIsHidden"
        , "topic_info" A..= topic_info_
        ]
  toJSON ChatEventForumTopicDeleted
    { topic_info = topic_info_
    }
      = A.object
        [ "@type"      A..= AT.String "chatEventForumTopicDeleted"
        , "topic_info" A..= topic_info_
        ]
  toJSON ChatEventForumTopicPinned
    { old_topic_info = old_topic_info_
    , new_topic_info = new_topic_info_
    }
      = A.object
        [ "@type"          A..= AT.String "chatEventForumTopicPinned"
        , "old_topic_info" A..= old_topic_info_
        , "new_topic_info" A..= new_topic_info_
        ]
