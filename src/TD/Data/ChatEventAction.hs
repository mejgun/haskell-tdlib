{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatEventAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatLocation as ChatLocation
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- | Represents a chat event
data ChatEventAction
  = -- | A message was edited @old_message The original message before the edit @new_message The message after it was edited
    ChatEventMessageEdited
      { -- |
        new_message :: Maybe Message.Message,
        -- |
        old_message :: Maybe Message.Message
      }
  | -- | A message was deleted @message Deleted message
    ChatEventMessageDeleted
      { -- |
        message :: Maybe Message.Message
      }
  | -- | A message was pinned @message Pinned message
    ChatEventMessagePinned
      { -- |
        message :: Maybe Message.Message
      }
  | -- | A message was unpinned @message Unpinned message
    ChatEventMessageUnpinned
      { -- |
        message :: Maybe Message.Message
      }
  | -- | A poll in a message was stopped @message The message with the poll
    ChatEventPollStopped
      { -- |
        message :: Maybe Message.Message
      }
  | -- | A new member joined the chat
    ChatEventMemberJoined
  | -- | A new member joined the chat via an invite link @invite_link Invite link used to join the chat
    ChatEventMemberJoinedByInviteLink
      { -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink
      }
  | -- | A new member was accepted to the chat by an administrator @approver_user_id User identifier of the chat administrator, approved user join request @invite_link Invite link used to join the chat; may be null
    ChatEventMemberJoinedByRequest
      { -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- |
        approver_user_id :: Maybe Int
      }
  | -- | A new chat member was invited @user_id New member user identifier @status New member status
    ChatEventMemberInvited
      { -- |
        status :: Maybe ChatMemberStatus.ChatMemberStatus,
        -- |
        user_id :: Maybe Int
      }
  | -- | A member left the chat
    ChatEventMemberLeft
  | -- | A chat member has gained/lost administrator status, or the list of their administrator privileges has changed @user_id Affected chat member user identifier @old_status Previous status of the chat member @new_status New status of the chat member
    ChatEventMemberPromoted
      { -- |
        new_status :: Maybe ChatMemberStatus.ChatMemberStatus,
        -- |
        old_status :: Maybe ChatMemberStatus.ChatMemberStatus,
        -- |
        user_id :: Maybe Int
      }
  | -- | A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed @member_id Affected chat member identifier @old_status Previous status of the chat member @new_status New status of the chat member
    ChatEventMemberRestricted
      { -- |
        new_status :: Maybe ChatMemberStatus.ChatMemberStatus,
        -- |
        old_status :: Maybe ChatMemberStatus.ChatMemberStatus,
        -- |
        member_id :: Maybe MessageSender.MessageSender
      }
  | -- | The chat available reactions were changed @old_available_reactions Previous chat available reactions @new_available_reactions New chat available reactions
    ChatEventAvailableReactionsChanged
      { -- |
        new_available_reactions :: Maybe [String],
        -- |
        old_available_reactions :: Maybe [String]
      }
  | -- | The chat description was changed @old_description Previous chat description @new_description New chat description
    ChatEventDescriptionChanged
      { -- |
        new_description :: Maybe String,
        -- |
        old_description :: Maybe String
      }
  | -- | The linked chat of a supergroup was changed @old_linked_chat_id Previous supergroup linked chat identifier @new_linked_chat_id New supergroup linked chat identifier
    ChatEventLinkedChatChanged
      { -- |
        new_linked_chat_id :: Maybe Int,
        -- |
        old_linked_chat_id :: Maybe Int
      }
  | -- | The supergroup location was changed @old_location Previous location; may be null @new_location New location; may be null
    ChatEventLocationChanged
      { -- |
        new_location :: Maybe ChatLocation.ChatLocation,
        -- |
        old_location :: Maybe ChatLocation.ChatLocation
      }
  | -- | The message TTL was changed @old_message_ttl Previous value of message_ttl @new_message_ttl New value of message_ttl
    ChatEventMessageTtlChanged
      { -- |
        new_message_ttl :: Maybe Int,
        -- |
        old_message_ttl :: Maybe Int
      }
  | -- | The chat permissions was changed @old_permissions Previous chat permissions @new_permissions New chat permissions
    ChatEventPermissionsChanged
      { -- |
        new_permissions :: Maybe ChatPermissions.ChatPermissions,
        -- |
        old_permissions :: Maybe ChatPermissions.ChatPermissions
      }
  | -- | The chat photo was changed @old_photo Previous chat photo value; may be null @new_photo New chat photo value; may be null
    ChatEventPhotoChanged
      { -- |
        new_photo :: Maybe ChatPhoto.ChatPhoto,
        -- |
        old_photo :: Maybe ChatPhoto.ChatPhoto
      }
  | -- | The slow_mode_delay setting of a supergroup was changed @old_slow_mode_delay Previous value of slow_mode_delay, in seconds @new_slow_mode_delay New value of slow_mode_delay, in seconds
    ChatEventSlowModeDelayChanged
      { -- |
        new_slow_mode_delay :: Maybe Int,
        -- |
        old_slow_mode_delay :: Maybe Int
      }
  | -- | The supergroup sticker set was changed @old_sticker_set_id Previous identifier of the chat sticker set; 0 if none @new_sticker_set_id New identifier of the chat sticker set; 0 if none
    ChatEventStickerSetChanged
      { -- |
        new_sticker_set_id :: Maybe Int,
        -- |
        old_sticker_set_id :: Maybe Int
      }
  | -- | The chat title was changed @old_title Previous chat title @new_title New chat title
    ChatEventTitleChanged
      { -- |
        new_title :: Maybe String,
        -- |
        old_title :: Maybe String
      }
  | -- | The chat username was changed @old_username Previous chat username @new_username New chat username
    ChatEventUsernameChanged
      { -- |
        new_username :: Maybe String,
        -- |
        old_username :: Maybe String
      }
  | -- | The has_protected_content setting of a channel was toggled @has_protected_content New value of has_protected_content
    ChatEventHasProtectedContentToggled
      { -- |
        has_protected_content :: Maybe Bool
      }
  | -- | The can_invite_users permission of a supergroup chat was toggled @can_invite_users New value of can_invite_users permission
    ChatEventInvitesToggled
      { -- |
        can_invite_users :: Maybe Bool
      }
  | -- | The is_all_history_available setting of a supergroup was toggled @is_all_history_available New value of is_all_history_available
    ChatEventIsAllHistoryAvailableToggled
      { -- |
        is_all_history_available :: Maybe Bool
      }
  | -- | The sign_messages setting of a channel was toggled @sign_messages New value of sign_messages
    ChatEventSignMessagesToggled
      { -- |
        sign_messages :: Maybe Bool
      }
  | -- | A chat invite link was edited @old_invite_link Previous information about the invite link @new_invite_link New information about the invite link
    ChatEventInviteLinkEdited
      { -- |
        new_invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- |
        old_invite_link :: Maybe ChatInviteLink.ChatInviteLink
      }
  | -- | A chat invite link was revoked @invite_link The invite link
    ChatEventInviteLinkRevoked
      { -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink
      }
  | -- | A revoked chat invite link was deleted @invite_link The invite link
    ChatEventInviteLinkDeleted
      { -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink
      }
  | -- | A video chat was created @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
    ChatEventVideoChatCreated
      { -- |
        group_call_id :: Maybe Int
      }
  | -- | A video chat was ended @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
    ChatEventVideoChatEnded
      { -- |
        group_call_id :: Maybe Int
      }
  | -- | The mute_new_participants setting of a video chat was toggled @mute_new_participants New value of the mute_new_participants setting
    ChatEventVideoChatMuteNewParticipantsToggled
      { -- |
        mute_new_participants :: Maybe Bool
      }
  | -- | A video chat participant was muted or unmuted @participant_id Identifier of the affected group call participant @is_muted New value of is_muted
    ChatEventVideoChatParticipantIsMutedToggled
      { -- |
        is_muted :: Maybe Bool,
        -- |
        participant_id :: Maybe MessageSender.MessageSender
      }
  | -- | A video chat participant volume level was changed @participant_id Identifier of the affected group call participant @volume_level New value of volume_level; 1-20000 in hundreds of percents
    ChatEventVideoChatParticipantVolumeLevelChanged
      { -- |
        volume_level :: Maybe Int,
        -- |
        participant_id :: Maybe MessageSender.MessageSender
      }
  deriving (Eq)

instance Show ChatEventAction where
  show
    ChatEventMessageEdited
      { new_message = new_message_,
        old_message = old_message_
      } =
      "ChatEventMessageEdited"
        ++ U.cc
          [ U.p "new_message" new_message_,
            U.p "old_message" old_message_
          ]
  show
    ChatEventMessageDeleted
      { message = message_
      } =
      "ChatEventMessageDeleted"
        ++ U.cc
          [ U.p "message" message_
          ]
  show
    ChatEventMessagePinned
      { message = message_
      } =
      "ChatEventMessagePinned"
        ++ U.cc
          [ U.p "message" message_
          ]
  show
    ChatEventMessageUnpinned
      { message = message_
      } =
      "ChatEventMessageUnpinned"
        ++ U.cc
          [ U.p "message" message_
          ]
  show
    ChatEventPollStopped
      { message = message_
      } =
      "ChatEventPollStopped"
        ++ U.cc
          [ U.p "message" message_
          ]
  show ChatEventMemberJoined =
    "ChatEventMemberJoined"
      ++ U.cc
        []
  show
    ChatEventMemberJoinedByInviteLink
      { invite_link = invite_link_
      } =
      "ChatEventMemberJoinedByInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]
  show
    ChatEventMemberJoinedByRequest
      { invite_link = invite_link_,
        approver_user_id = approver_user_id_
      } =
      "ChatEventMemberJoinedByRequest"
        ++ U.cc
          [ U.p "invite_link" invite_link_,
            U.p "approver_user_id" approver_user_id_
          ]
  show
    ChatEventMemberInvited
      { status = status_,
        user_id = user_id_
      } =
      "ChatEventMemberInvited"
        ++ U.cc
          [ U.p "status" status_,
            U.p "user_id" user_id_
          ]
  show ChatEventMemberLeft =
    "ChatEventMemberLeft"
      ++ U.cc
        []
  show
    ChatEventMemberPromoted
      { new_status = new_status_,
        old_status = old_status_,
        user_id = user_id_
      } =
      "ChatEventMemberPromoted"
        ++ U.cc
          [ U.p "new_status" new_status_,
            U.p "old_status" old_status_,
            U.p "user_id" user_id_
          ]
  show
    ChatEventMemberRestricted
      { new_status = new_status_,
        old_status = old_status_,
        member_id = member_id_
      } =
      "ChatEventMemberRestricted"
        ++ U.cc
          [ U.p "new_status" new_status_,
            U.p "old_status" old_status_,
            U.p "member_id" member_id_
          ]
  show
    ChatEventAvailableReactionsChanged
      { new_available_reactions = new_available_reactions_,
        old_available_reactions = old_available_reactions_
      } =
      "ChatEventAvailableReactionsChanged"
        ++ U.cc
          [ U.p "new_available_reactions" new_available_reactions_,
            U.p "old_available_reactions" old_available_reactions_
          ]
  show
    ChatEventDescriptionChanged
      { new_description = new_description_,
        old_description = old_description_
      } =
      "ChatEventDescriptionChanged"
        ++ U.cc
          [ U.p "new_description" new_description_,
            U.p "old_description" old_description_
          ]
  show
    ChatEventLinkedChatChanged
      { new_linked_chat_id = new_linked_chat_id_,
        old_linked_chat_id = old_linked_chat_id_
      } =
      "ChatEventLinkedChatChanged"
        ++ U.cc
          [ U.p "new_linked_chat_id" new_linked_chat_id_,
            U.p "old_linked_chat_id" old_linked_chat_id_
          ]
  show
    ChatEventLocationChanged
      { new_location = new_location_,
        old_location = old_location_
      } =
      "ChatEventLocationChanged"
        ++ U.cc
          [ U.p "new_location" new_location_,
            U.p "old_location" old_location_
          ]
  show
    ChatEventMessageTtlChanged
      { new_message_ttl = new_message_ttl_,
        old_message_ttl = old_message_ttl_
      } =
      "ChatEventMessageTtlChanged"
        ++ U.cc
          [ U.p "new_message_ttl" new_message_ttl_,
            U.p "old_message_ttl" old_message_ttl_
          ]
  show
    ChatEventPermissionsChanged
      { new_permissions = new_permissions_,
        old_permissions = old_permissions_
      } =
      "ChatEventPermissionsChanged"
        ++ U.cc
          [ U.p "new_permissions" new_permissions_,
            U.p "old_permissions" old_permissions_
          ]
  show
    ChatEventPhotoChanged
      { new_photo = new_photo_,
        old_photo = old_photo_
      } =
      "ChatEventPhotoChanged"
        ++ U.cc
          [ U.p "new_photo" new_photo_,
            U.p "old_photo" old_photo_
          ]
  show
    ChatEventSlowModeDelayChanged
      { new_slow_mode_delay = new_slow_mode_delay_,
        old_slow_mode_delay = old_slow_mode_delay_
      } =
      "ChatEventSlowModeDelayChanged"
        ++ U.cc
          [ U.p "new_slow_mode_delay" new_slow_mode_delay_,
            U.p "old_slow_mode_delay" old_slow_mode_delay_
          ]
  show
    ChatEventStickerSetChanged
      { new_sticker_set_id = new_sticker_set_id_,
        old_sticker_set_id = old_sticker_set_id_
      } =
      "ChatEventStickerSetChanged"
        ++ U.cc
          [ U.p "new_sticker_set_id" new_sticker_set_id_,
            U.p "old_sticker_set_id" old_sticker_set_id_
          ]
  show
    ChatEventTitleChanged
      { new_title = new_title_,
        old_title = old_title_
      } =
      "ChatEventTitleChanged"
        ++ U.cc
          [ U.p "new_title" new_title_,
            U.p "old_title" old_title_
          ]
  show
    ChatEventUsernameChanged
      { new_username = new_username_,
        old_username = old_username_
      } =
      "ChatEventUsernameChanged"
        ++ U.cc
          [ U.p "new_username" new_username_,
            U.p "old_username" old_username_
          ]
  show
    ChatEventHasProtectedContentToggled
      { has_protected_content = has_protected_content_
      } =
      "ChatEventHasProtectedContentToggled"
        ++ U.cc
          [ U.p "has_protected_content" has_protected_content_
          ]
  show
    ChatEventInvitesToggled
      { can_invite_users = can_invite_users_
      } =
      "ChatEventInvitesToggled"
        ++ U.cc
          [ U.p "can_invite_users" can_invite_users_
          ]
  show
    ChatEventIsAllHistoryAvailableToggled
      { is_all_history_available = is_all_history_available_
      } =
      "ChatEventIsAllHistoryAvailableToggled"
        ++ U.cc
          [ U.p "is_all_history_available" is_all_history_available_
          ]
  show
    ChatEventSignMessagesToggled
      { sign_messages = sign_messages_
      } =
      "ChatEventSignMessagesToggled"
        ++ U.cc
          [ U.p "sign_messages" sign_messages_
          ]
  show
    ChatEventInviteLinkEdited
      { new_invite_link = new_invite_link_,
        old_invite_link = old_invite_link_
      } =
      "ChatEventInviteLinkEdited"
        ++ U.cc
          [ U.p "new_invite_link" new_invite_link_,
            U.p "old_invite_link" old_invite_link_
          ]
  show
    ChatEventInviteLinkRevoked
      { invite_link = invite_link_
      } =
      "ChatEventInviteLinkRevoked"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]
  show
    ChatEventInviteLinkDeleted
      { invite_link = invite_link_
      } =
      "ChatEventInviteLinkDeleted"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]
  show
    ChatEventVideoChatCreated
      { group_call_id = group_call_id_
      } =
      "ChatEventVideoChatCreated"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]
  show
    ChatEventVideoChatEnded
      { group_call_id = group_call_id_
      } =
      "ChatEventVideoChatEnded"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]
  show
    ChatEventVideoChatMuteNewParticipantsToggled
      { mute_new_participants = mute_new_participants_
      } =
      "ChatEventVideoChatMuteNewParticipantsToggled"
        ++ U.cc
          [ U.p "mute_new_participants" mute_new_participants_
          ]
  show
    ChatEventVideoChatParticipantIsMutedToggled
      { is_muted = is_muted_,
        participant_id = participant_id_
      } =
      "ChatEventVideoChatParticipantIsMutedToggled"
        ++ U.cc
          [ U.p "is_muted" is_muted_,
            U.p "participant_id" participant_id_
          ]
  show
    ChatEventVideoChatParticipantVolumeLevelChanged
      { volume_level = volume_level_,
        participant_id = participant_id_
      } =
      "ChatEventVideoChatParticipantVolumeLevelChanged"
        ++ U.cc
          [ U.p "volume_level" volume_level_,
            U.p "participant_id" participant_id_
          ]

instance T.FromJSON ChatEventAction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatEventMessageEdited" -> parseChatEventMessageEdited v
      "chatEventMessageDeleted" -> parseChatEventMessageDeleted v
      "chatEventMessagePinned" -> parseChatEventMessagePinned v
      "chatEventMessageUnpinned" -> parseChatEventMessageUnpinned v
      "chatEventPollStopped" -> parseChatEventPollStopped v
      "chatEventMemberJoined" -> parseChatEventMemberJoined v
      "chatEventMemberJoinedByInviteLink" -> parseChatEventMemberJoinedByInviteLink v
      "chatEventMemberJoinedByRequest" -> parseChatEventMemberJoinedByRequest v
      "chatEventMemberInvited" -> parseChatEventMemberInvited v
      "chatEventMemberLeft" -> parseChatEventMemberLeft v
      "chatEventMemberPromoted" -> parseChatEventMemberPromoted v
      "chatEventMemberRestricted" -> parseChatEventMemberRestricted v
      "chatEventAvailableReactionsChanged" -> parseChatEventAvailableReactionsChanged v
      "chatEventDescriptionChanged" -> parseChatEventDescriptionChanged v
      "chatEventLinkedChatChanged" -> parseChatEventLinkedChatChanged v
      "chatEventLocationChanged" -> parseChatEventLocationChanged v
      "chatEventMessageTtlChanged" -> parseChatEventMessageTtlChanged v
      "chatEventPermissionsChanged" -> parseChatEventPermissionsChanged v
      "chatEventPhotoChanged" -> parseChatEventPhotoChanged v
      "chatEventSlowModeDelayChanged" -> parseChatEventSlowModeDelayChanged v
      "chatEventStickerSetChanged" -> parseChatEventStickerSetChanged v
      "chatEventTitleChanged" -> parseChatEventTitleChanged v
      "chatEventUsernameChanged" -> parseChatEventUsernameChanged v
      "chatEventHasProtectedContentToggled" -> parseChatEventHasProtectedContentToggled v
      "chatEventInvitesToggled" -> parseChatEventInvitesToggled v
      "chatEventIsAllHistoryAvailableToggled" -> parseChatEventIsAllHistoryAvailableToggled v
      "chatEventSignMessagesToggled" -> parseChatEventSignMessagesToggled v
      "chatEventInviteLinkEdited" -> parseChatEventInviteLinkEdited v
      "chatEventInviteLinkRevoked" -> parseChatEventInviteLinkRevoked v
      "chatEventInviteLinkDeleted" -> parseChatEventInviteLinkDeleted v
      "chatEventVideoChatCreated" -> parseChatEventVideoChatCreated v
      "chatEventVideoChatEnded" -> parseChatEventVideoChatEnded v
      "chatEventVideoChatMuteNewParticipantsToggled" -> parseChatEventVideoChatMuteNewParticipantsToggled v
      "chatEventVideoChatParticipantIsMutedToggled" -> parseChatEventVideoChatParticipantIsMutedToggled v
      "chatEventVideoChatParticipantVolumeLevelChanged" -> parseChatEventVideoChatParticipantVolumeLevelChanged v
      _ -> mempty
    where
      parseChatEventMessageEdited :: A.Value -> T.Parser ChatEventAction
      parseChatEventMessageEdited = A.withObject "ChatEventMessageEdited" $ \o -> do
        new_message_ <- o A..:? "new_message"
        old_message_ <- o A..:? "old_message"
        return $ ChatEventMessageEdited {new_message = new_message_, old_message = old_message_}

      parseChatEventMessageDeleted :: A.Value -> T.Parser ChatEventAction
      parseChatEventMessageDeleted = A.withObject "ChatEventMessageDeleted" $ \o -> do
        message_ <- o A..:? "message"
        return $ ChatEventMessageDeleted {message = message_}

      parseChatEventMessagePinned :: A.Value -> T.Parser ChatEventAction
      parseChatEventMessagePinned = A.withObject "ChatEventMessagePinned" $ \o -> do
        message_ <- o A..:? "message"
        return $ ChatEventMessagePinned {message = message_}

      parseChatEventMessageUnpinned :: A.Value -> T.Parser ChatEventAction
      parseChatEventMessageUnpinned = A.withObject "ChatEventMessageUnpinned" $ \o -> do
        message_ <- o A..:? "message"
        return $ ChatEventMessageUnpinned {message = message_}

      parseChatEventPollStopped :: A.Value -> T.Parser ChatEventAction
      parseChatEventPollStopped = A.withObject "ChatEventPollStopped" $ \o -> do
        message_ <- o A..:? "message"
        return $ ChatEventPollStopped {message = message_}

      parseChatEventMemberJoined :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberJoined = A.withObject "ChatEventMemberJoined" $ \_ -> return ChatEventMemberJoined

      parseChatEventMemberJoinedByInviteLink :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberJoinedByInviteLink = A.withObject "ChatEventMemberJoinedByInviteLink" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        return $ ChatEventMemberJoinedByInviteLink {invite_link = invite_link_}

      parseChatEventMemberJoinedByRequest :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberJoinedByRequest = A.withObject "ChatEventMemberJoinedByRequest" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        approver_user_id_ <- mconcat [o A..:? "approver_user_id", U.rm <$> (o A..: "approver_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventMemberJoinedByRequest {invite_link = invite_link_, approver_user_id = approver_user_id_}

      parseChatEventMemberInvited :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberInvited = A.withObject "ChatEventMemberInvited" $ \o -> do
        status_ <- o A..:? "status"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventMemberInvited {status = status_, user_id = user_id_}

      parseChatEventMemberLeft :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberLeft = A.withObject "ChatEventMemberLeft" $ \_ -> return ChatEventMemberLeft

      parseChatEventMemberPromoted :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberPromoted = A.withObject "ChatEventMemberPromoted" $ \o -> do
        new_status_ <- o A..:? "new_status"
        old_status_ <- o A..:? "old_status"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventMemberPromoted {new_status = new_status_, old_status = old_status_, user_id = user_id_}

      parseChatEventMemberRestricted :: A.Value -> T.Parser ChatEventAction
      parseChatEventMemberRestricted = A.withObject "ChatEventMemberRestricted" $ \o -> do
        new_status_ <- o A..:? "new_status"
        old_status_ <- o A..:? "old_status"
        member_id_ <- o A..:? "member_id"
        return $ ChatEventMemberRestricted {new_status = new_status_, old_status = old_status_, member_id = member_id_}

      parseChatEventAvailableReactionsChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventAvailableReactionsChanged = A.withObject "ChatEventAvailableReactionsChanged" $ \o -> do
        new_available_reactions_ <- o A..:? "new_available_reactions"
        old_available_reactions_ <- o A..:? "old_available_reactions"
        return $ ChatEventAvailableReactionsChanged {new_available_reactions = new_available_reactions_, old_available_reactions = old_available_reactions_}

      parseChatEventDescriptionChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventDescriptionChanged = A.withObject "ChatEventDescriptionChanged" $ \o -> do
        new_description_ <- o A..:? "new_description"
        old_description_ <- o A..:? "old_description"
        return $ ChatEventDescriptionChanged {new_description = new_description_, old_description = old_description_}

      parseChatEventLinkedChatChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventLinkedChatChanged = A.withObject "ChatEventLinkedChatChanged" $ \o -> do
        new_linked_chat_id_ <- mconcat [o A..:? "new_linked_chat_id", U.rm <$> (o A..: "new_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        old_linked_chat_id_ <- mconcat [o A..:? "old_linked_chat_id", U.rm <$> (o A..: "old_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventLinkedChatChanged {new_linked_chat_id = new_linked_chat_id_, old_linked_chat_id = old_linked_chat_id_}

      parseChatEventLocationChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventLocationChanged = A.withObject "ChatEventLocationChanged" $ \o -> do
        new_location_ <- o A..:? "new_location"
        old_location_ <- o A..:? "old_location"
        return $ ChatEventLocationChanged {new_location = new_location_, old_location = old_location_}

      parseChatEventMessageTtlChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventMessageTtlChanged = A.withObject "ChatEventMessageTtlChanged" $ \o -> do
        new_message_ttl_ <- mconcat [o A..:? "new_message_ttl", U.rm <$> (o A..: "new_message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        old_message_ttl_ <- mconcat [o A..:? "old_message_ttl", U.rm <$> (o A..: "old_message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventMessageTtlChanged {new_message_ttl = new_message_ttl_, old_message_ttl = old_message_ttl_}

      parseChatEventPermissionsChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventPermissionsChanged = A.withObject "ChatEventPermissionsChanged" $ \o -> do
        new_permissions_ <- o A..:? "new_permissions"
        old_permissions_ <- o A..:? "old_permissions"
        return $ ChatEventPermissionsChanged {new_permissions = new_permissions_, old_permissions = old_permissions_}

      parseChatEventPhotoChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventPhotoChanged = A.withObject "ChatEventPhotoChanged" $ \o -> do
        new_photo_ <- o A..:? "new_photo"
        old_photo_ <- o A..:? "old_photo"
        return $ ChatEventPhotoChanged {new_photo = new_photo_, old_photo = old_photo_}

      parseChatEventSlowModeDelayChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventSlowModeDelayChanged = A.withObject "ChatEventSlowModeDelayChanged" $ \o -> do
        new_slow_mode_delay_ <- mconcat [o A..:? "new_slow_mode_delay", U.rm <$> (o A..: "new_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
        old_slow_mode_delay_ <- mconcat [o A..:? "old_slow_mode_delay", U.rm <$> (o A..: "old_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventSlowModeDelayChanged {new_slow_mode_delay = new_slow_mode_delay_, old_slow_mode_delay = old_slow_mode_delay_}

      parseChatEventStickerSetChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventStickerSetChanged = A.withObject "ChatEventStickerSetChanged" $ \o -> do
        new_sticker_set_id_ <- mconcat [o A..:? "new_sticker_set_id", U.rm <$> (o A..: "new_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        old_sticker_set_id_ <- mconcat [o A..:? "old_sticker_set_id", U.rm <$> (o A..: "old_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventStickerSetChanged {new_sticker_set_id = new_sticker_set_id_, old_sticker_set_id = old_sticker_set_id_}

      parseChatEventTitleChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventTitleChanged = A.withObject "ChatEventTitleChanged" $ \o -> do
        new_title_ <- o A..:? "new_title"
        old_title_ <- o A..:? "old_title"
        return $ ChatEventTitleChanged {new_title = new_title_, old_title = old_title_}

      parseChatEventUsernameChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventUsernameChanged = A.withObject "ChatEventUsernameChanged" $ \o -> do
        new_username_ <- o A..:? "new_username"
        old_username_ <- o A..:? "old_username"
        return $ ChatEventUsernameChanged {new_username = new_username_, old_username = old_username_}

      parseChatEventHasProtectedContentToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventHasProtectedContentToggled = A.withObject "ChatEventHasProtectedContentToggled" $ \o -> do
        has_protected_content_ <- o A..:? "has_protected_content"
        return $ ChatEventHasProtectedContentToggled {has_protected_content = has_protected_content_}

      parseChatEventInvitesToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventInvitesToggled = A.withObject "ChatEventInvitesToggled" $ \o -> do
        can_invite_users_ <- o A..:? "can_invite_users"
        return $ ChatEventInvitesToggled {can_invite_users = can_invite_users_}

      parseChatEventIsAllHistoryAvailableToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventIsAllHistoryAvailableToggled = A.withObject "ChatEventIsAllHistoryAvailableToggled" $ \o -> do
        is_all_history_available_ <- o A..:? "is_all_history_available"
        return $ ChatEventIsAllHistoryAvailableToggled {is_all_history_available = is_all_history_available_}

      parseChatEventSignMessagesToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventSignMessagesToggled = A.withObject "ChatEventSignMessagesToggled" $ \o -> do
        sign_messages_ <- o A..:? "sign_messages"
        return $ ChatEventSignMessagesToggled {sign_messages = sign_messages_}

      parseChatEventInviteLinkEdited :: A.Value -> T.Parser ChatEventAction
      parseChatEventInviteLinkEdited = A.withObject "ChatEventInviteLinkEdited" $ \o -> do
        new_invite_link_ <- o A..:? "new_invite_link"
        old_invite_link_ <- o A..:? "old_invite_link"
        return $ ChatEventInviteLinkEdited {new_invite_link = new_invite_link_, old_invite_link = old_invite_link_}

      parseChatEventInviteLinkRevoked :: A.Value -> T.Parser ChatEventAction
      parseChatEventInviteLinkRevoked = A.withObject "ChatEventInviteLinkRevoked" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        return $ ChatEventInviteLinkRevoked {invite_link = invite_link_}

      parseChatEventInviteLinkDeleted :: A.Value -> T.Parser ChatEventAction
      parseChatEventInviteLinkDeleted = A.withObject "ChatEventInviteLinkDeleted" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        return $ ChatEventInviteLinkDeleted {invite_link = invite_link_}

      parseChatEventVideoChatCreated :: A.Value -> T.Parser ChatEventAction
      parseChatEventVideoChatCreated = A.withObject "ChatEventVideoChatCreated" $ \o -> do
        group_call_id_ <- mconcat [o A..:? "group_call_id", U.rm <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventVideoChatCreated {group_call_id = group_call_id_}

      parseChatEventVideoChatEnded :: A.Value -> T.Parser ChatEventAction
      parseChatEventVideoChatEnded = A.withObject "ChatEventVideoChatEnded" $ \o -> do
        group_call_id_ <- mconcat [o A..:? "group_call_id", U.rm <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEventVideoChatEnded {group_call_id = group_call_id_}

      parseChatEventVideoChatMuteNewParticipantsToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventVideoChatMuteNewParticipantsToggled = A.withObject "ChatEventVideoChatMuteNewParticipantsToggled" $ \o -> do
        mute_new_participants_ <- o A..:? "mute_new_participants"
        return $ ChatEventVideoChatMuteNewParticipantsToggled {mute_new_participants = mute_new_participants_}

      parseChatEventVideoChatParticipantIsMutedToggled :: A.Value -> T.Parser ChatEventAction
      parseChatEventVideoChatParticipantIsMutedToggled = A.withObject "ChatEventVideoChatParticipantIsMutedToggled" $ \o -> do
        is_muted_ <- o A..:? "is_muted"
        participant_id_ <- o A..:? "participant_id"
        return $ ChatEventVideoChatParticipantIsMutedToggled {is_muted = is_muted_, participant_id = participant_id_}

      parseChatEventVideoChatParticipantVolumeLevelChanged :: A.Value -> T.Parser ChatEventAction
      parseChatEventVideoChatParticipantVolumeLevelChanged = A.withObject "ChatEventVideoChatParticipantVolumeLevelChanged" $ \o -> do
        volume_level_ <- mconcat [o A..:? "volume_level", U.rm <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
        participant_id_ <- o A..:? "participant_id"
        return $ ChatEventVideoChatParticipantVolumeLevelChanged {volume_level = volume_level_, participant_id = participant_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatEventAction where
  toJSON
    ChatEventMessageEdited
      { new_message = new_message_,
        old_message = old_message_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMessageEdited",
          "new_message" A..= new_message_,
          "old_message" A..= old_message_
        ]
  toJSON
    ChatEventMessageDeleted
      { message = message_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMessageDeleted",
          "message" A..= message_
        ]
  toJSON
    ChatEventMessagePinned
      { message = message_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMessagePinned",
          "message" A..= message_
        ]
  toJSON
    ChatEventMessageUnpinned
      { message = message_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMessageUnpinned",
          "message" A..= message_
        ]
  toJSON
    ChatEventPollStopped
      { message = message_
      } =
      A.object
        [ "@type" A..= T.String "chatEventPollStopped",
          "message" A..= message_
        ]
  toJSON ChatEventMemberJoined =
    A.object
      [ "@type" A..= T.String "chatEventMemberJoined"
      ]
  toJSON
    ChatEventMemberJoinedByInviteLink
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMemberJoinedByInviteLink",
          "invite_link" A..= invite_link_
        ]
  toJSON
    ChatEventMemberJoinedByRequest
      { invite_link = invite_link_,
        approver_user_id = approver_user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMemberJoinedByRequest",
          "invite_link" A..= invite_link_,
          "approver_user_id" A..= approver_user_id_
        ]
  toJSON
    ChatEventMemberInvited
      { status = status_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMemberInvited",
          "status" A..= status_,
          "user_id" A..= user_id_
        ]
  toJSON ChatEventMemberLeft =
    A.object
      [ "@type" A..= T.String "chatEventMemberLeft"
      ]
  toJSON
    ChatEventMemberPromoted
      { new_status = new_status_,
        old_status = old_status_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMemberPromoted",
          "new_status" A..= new_status_,
          "old_status" A..= old_status_,
          "user_id" A..= user_id_
        ]
  toJSON
    ChatEventMemberRestricted
      { new_status = new_status_,
        old_status = old_status_,
        member_id = member_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMemberRestricted",
          "new_status" A..= new_status_,
          "old_status" A..= old_status_,
          "member_id" A..= member_id_
        ]
  toJSON
    ChatEventAvailableReactionsChanged
      { new_available_reactions = new_available_reactions_,
        old_available_reactions = old_available_reactions_
      } =
      A.object
        [ "@type" A..= T.String "chatEventAvailableReactionsChanged",
          "new_available_reactions" A..= new_available_reactions_,
          "old_available_reactions" A..= old_available_reactions_
        ]
  toJSON
    ChatEventDescriptionChanged
      { new_description = new_description_,
        old_description = old_description_
      } =
      A.object
        [ "@type" A..= T.String "chatEventDescriptionChanged",
          "new_description" A..= new_description_,
          "old_description" A..= old_description_
        ]
  toJSON
    ChatEventLinkedChatChanged
      { new_linked_chat_id = new_linked_chat_id_,
        old_linked_chat_id = old_linked_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventLinkedChatChanged",
          "new_linked_chat_id" A..= new_linked_chat_id_,
          "old_linked_chat_id" A..= old_linked_chat_id_
        ]
  toJSON
    ChatEventLocationChanged
      { new_location = new_location_,
        old_location = old_location_
      } =
      A.object
        [ "@type" A..= T.String "chatEventLocationChanged",
          "new_location" A..= new_location_,
          "old_location" A..= old_location_
        ]
  toJSON
    ChatEventMessageTtlChanged
      { new_message_ttl = new_message_ttl_,
        old_message_ttl = old_message_ttl_
      } =
      A.object
        [ "@type" A..= T.String "chatEventMessageTtlChanged",
          "new_message_ttl" A..= new_message_ttl_,
          "old_message_ttl" A..= old_message_ttl_
        ]
  toJSON
    ChatEventPermissionsChanged
      { new_permissions = new_permissions_,
        old_permissions = old_permissions_
      } =
      A.object
        [ "@type" A..= T.String "chatEventPermissionsChanged",
          "new_permissions" A..= new_permissions_,
          "old_permissions" A..= old_permissions_
        ]
  toJSON
    ChatEventPhotoChanged
      { new_photo = new_photo_,
        old_photo = old_photo_
      } =
      A.object
        [ "@type" A..= T.String "chatEventPhotoChanged",
          "new_photo" A..= new_photo_,
          "old_photo" A..= old_photo_
        ]
  toJSON
    ChatEventSlowModeDelayChanged
      { new_slow_mode_delay = new_slow_mode_delay_,
        old_slow_mode_delay = old_slow_mode_delay_
      } =
      A.object
        [ "@type" A..= T.String "chatEventSlowModeDelayChanged",
          "new_slow_mode_delay" A..= new_slow_mode_delay_,
          "old_slow_mode_delay" A..= old_slow_mode_delay_
        ]
  toJSON
    ChatEventStickerSetChanged
      { new_sticker_set_id = new_sticker_set_id_,
        old_sticker_set_id = old_sticker_set_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventStickerSetChanged",
          "new_sticker_set_id" A..= new_sticker_set_id_,
          "old_sticker_set_id" A..= old_sticker_set_id_
        ]
  toJSON
    ChatEventTitleChanged
      { new_title = new_title_,
        old_title = old_title_
      } =
      A.object
        [ "@type" A..= T.String "chatEventTitleChanged",
          "new_title" A..= new_title_,
          "old_title" A..= old_title_
        ]
  toJSON
    ChatEventUsernameChanged
      { new_username = new_username_,
        old_username = old_username_
      } =
      A.object
        [ "@type" A..= T.String "chatEventUsernameChanged",
          "new_username" A..= new_username_,
          "old_username" A..= old_username_
        ]
  toJSON
    ChatEventHasProtectedContentToggled
      { has_protected_content = has_protected_content_
      } =
      A.object
        [ "@type" A..= T.String "chatEventHasProtectedContentToggled",
          "has_protected_content" A..= has_protected_content_
        ]
  toJSON
    ChatEventInvitesToggled
      { can_invite_users = can_invite_users_
      } =
      A.object
        [ "@type" A..= T.String "chatEventInvitesToggled",
          "can_invite_users" A..= can_invite_users_
        ]
  toJSON
    ChatEventIsAllHistoryAvailableToggled
      { is_all_history_available = is_all_history_available_
      } =
      A.object
        [ "@type" A..= T.String "chatEventIsAllHistoryAvailableToggled",
          "is_all_history_available" A..= is_all_history_available_
        ]
  toJSON
    ChatEventSignMessagesToggled
      { sign_messages = sign_messages_
      } =
      A.object
        [ "@type" A..= T.String "chatEventSignMessagesToggled",
          "sign_messages" A..= sign_messages_
        ]
  toJSON
    ChatEventInviteLinkEdited
      { new_invite_link = new_invite_link_,
        old_invite_link = old_invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatEventInviteLinkEdited",
          "new_invite_link" A..= new_invite_link_,
          "old_invite_link" A..= old_invite_link_
        ]
  toJSON
    ChatEventInviteLinkRevoked
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatEventInviteLinkRevoked",
          "invite_link" A..= invite_link_
        ]
  toJSON
    ChatEventInviteLinkDeleted
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatEventInviteLinkDeleted",
          "invite_link" A..= invite_link_
        ]
  toJSON
    ChatEventVideoChatCreated
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventVideoChatCreated",
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    ChatEventVideoChatEnded
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventVideoChatEnded",
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    ChatEventVideoChatMuteNewParticipantsToggled
      { mute_new_participants = mute_new_participants_
      } =
      A.object
        [ "@type" A..= T.String "chatEventVideoChatMuteNewParticipantsToggled",
          "mute_new_participants" A..= mute_new_participants_
        ]
  toJSON
    ChatEventVideoChatParticipantIsMutedToggled
      { is_muted = is_muted_,
        participant_id = participant_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventVideoChatParticipantIsMutedToggled",
          "is_muted" A..= is_muted_,
          "participant_id" A..= participant_id_
        ]
  toJSON
    ChatEventVideoChatParticipantVolumeLevelChanged
      { volume_level = volume_level_,
        participant_id = participant_id_
      } =
      A.object
        [ "@type" A..= T.String "chatEventVideoChatParticipantVolumeLevelChanged",
          "volume_level" A..= volume_level_,
          "participant_id" A..= participant_id_
        ]
