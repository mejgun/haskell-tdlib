-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Represents a chat event
data ChatEventAction = 
 -- |
 -- 
 -- A message was edited 
 -- 
 -- __old_message__ The original message before the edit
 -- 
 -- __new_message__ The message after it was edited
 ChatEventMessageEdited { new_message :: Maybe Message.Message, old_message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A message was deleted 
 -- 
 -- __message__ Deleted message
 ChatEventMessageDeleted { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A message was pinned 
 -- 
 -- __message__ Pinned message
 ChatEventMessagePinned { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A message was unpinned 
 -- 
 -- __message__ Unpinned message
 ChatEventMessageUnpinned { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A poll in a message was stopped 
 -- 
 -- __message__ The message with the poll
 ChatEventPollStopped { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A new member joined the chat
 ChatEventMemberJoined |
 -- |
 -- 
 -- A new member joined the chat via an invite link 
 -- 
 -- __invite_link__ Invite link used to join the chat
 ChatEventMemberJoinedByInviteLink { invite_link :: Maybe ChatInviteLink.ChatInviteLink }  |
 -- |
 -- 
 -- A new member was accepted to the chat by an administrator 
 -- 
 -- __approver_user_id__ User identifier of the chat administrator, approved user join request
 -- 
 -- __invite_link__ Invite link used to join the chat; may be null
 ChatEventMemberJoinedByRequest { invite_link :: Maybe ChatInviteLink.ChatInviteLink, approver_user_id :: Maybe Int }  |
 -- |
 -- 
 -- A new chat member was invited 
 -- 
 -- __user_id__ New member user identifier
 -- 
 -- __status__ New member status
 ChatEventMemberInvited { status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int }  |
 -- |
 -- 
 -- A member left the chat
 ChatEventMemberLeft |
 -- |
 -- 
 -- A chat member has gained/lost administrator status, or the list of their administrator privileges has changed 
 -- 
 -- __user_id__ Affected chat member user identifier
 -- 
 -- __old_status__ Previous status of the chat member
 -- 
 -- __new_status__ New status of the chat member
 ChatEventMemberPromoted { new_status :: Maybe ChatMemberStatus.ChatMemberStatus, old_status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed 
 -- 
 -- __member_id__ Affected chat member identifier
 -- 
 -- __old_status__ Previous status of the chat member
 -- 
 -- __new_status__ New status of the chat member
 ChatEventMemberRestricted { new_status :: Maybe ChatMemberStatus.ChatMemberStatus, old_status :: Maybe ChatMemberStatus.ChatMemberStatus, member_id :: Maybe MessageSender.MessageSender }  |
 -- |
 -- 
 -- The chat available reactions were changed 
 -- 
 -- __old_available_reactions__ Previous chat available reactions
 -- 
 -- __new_available_reactions__ New chat available reactions
 ChatEventAvailableReactionsChanged { new_available_reactions :: Maybe [String], old_available_reactions :: Maybe [String] }  |
 -- |
 -- 
 -- The chat description was changed 
 -- 
 -- __old_description__ Previous chat description
 -- 
 -- __new_description__ New chat description
 ChatEventDescriptionChanged { new_description :: Maybe String, old_description :: Maybe String }  |
 -- |
 -- 
 -- The linked chat of a supergroup was changed 
 -- 
 -- __old_linked_chat_id__ Previous supergroup linked chat identifier
 -- 
 -- __new_linked_chat_id__ New supergroup linked chat identifier
 ChatEventLinkedChatChanged { new_linked_chat_id :: Maybe Int, old_linked_chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The supergroup location was changed 
 -- 
 -- __old_location__ Previous location; may be null
 -- 
 -- __new_location__ New location; may be null
 ChatEventLocationChanged { new_location :: Maybe ChatLocation.ChatLocation, old_location :: Maybe ChatLocation.ChatLocation }  |
 -- |
 -- 
 -- The message TTL was changed 
 -- 
 -- __old_message_ttl__ Previous value of message_ttl
 -- 
 -- __new_message_ttl__ New value of message_ttl
 ChatEventMessageTtlChanged { new_message_ttl :: Maybe Int, old_message_ttl :: Maybe Int }  |
 -- |
 -- 
 -- The chat permissions was changed 
 -- 
 -- __old_permissions__ Previous chat permissions
 -- 
 -- __new_permissions__ New chat permissions
 ChatEventPermissionsChanged { new_permissions :: Maybe ChatPermissions.ChatPermissions, old_permissions :: Maybe ChatPermissions.ChatPermissions }  |
 -- |
 -- 
 -- The chat photo was changed 
 -- 
 -- __old_photo__ Previous chat photo value; may be null
 -- 
 -- __new_photo__ New chat photo value; may be null
 ChatEventPhotoChanged { new_photo :: Maybe ChatPhoto.ChatPhoto, old_photo :: Maybe ChatPhoto.ChatPhoto }  |
 -- |
 -- 
 -- The slow_mode_delay setting of a supergroup was changed 
 -- 
 -- __old_slow_mode_delay__ Previous value of slow_mode_delay, in seconds
 -- 
 -- __new_slow_mode_delay__ New value of slow_mode_delay, in seconds
 ChatEventSlowModeDelayChanged { new_slow_mode_delay :: Maybe Int, old_slow_mode_delay :: Maybe Int }  |
 -- |
 -- 
 -- The supergroup sticker set was changed 
 -- 
 -- __old_sticker_set_id__ Previous identifier of the chat sticker set; 0 if none
 -- 
 -- __new_sticker_set_id__ New identifier of the chat sticker set; 0 if none
 ChatEventStickerSetChanged { new_sticker_set_id :: Maybe Int, old_sticker_set_id :: Maybe Int }  |
 -- |
 -- 
 -- The chat title was changed 
 -- 
 -- __old_title__ Previous chat title
 -- 
 -- __new_title__ New chat title
 ChatEventTitleChanged { new_title :: Maybe String, old_title :: Maybe String }  |
 -- |
 -- 
 -- The chat username was changed 
 -- 
 -- __old_username__ Previous chat username
 -- 
 -- __new_username__ New chat username
 ChatEventUsernameChanged { new_username :: Maybe String, old_username :: Maybe String }  |
 -- |
 -- 
 -- The has_protected_content setting of a channel was toggled 
 -- 
 -- __has_protected_content__ New value of has_protected_content
 ChatEventHasProtectedContentToggled { has_protected_content :: Maybe Bool }  |
 -- |
 -- 
 -- The can_invite_users permission of a supergroup chat was toggled 
 -- 
 -- __can_invite_users__ New value of can_invite_users permission
 ChatEventInvitesToggled { can_invite_users :: Maybe Bool }  |
 -- |
 -- 
 -- The is_all_history_available setting of a supergroup was toggled 
 -- 
 -- __is_all_history_available__ New value of is_all_history_available
 ChatEventIsAllHistoryAvailableToggled { is_all_history_available :: Maybe Bool }  |
 -- |
 -- 
 -- The sign_messages setting of a channel was toggled 
 -- 
 -- __sign_messages__ New value of sign_messages
 ChatEventSignMessagesToggled { sign_messages :: Maybe Bool }  |
 -- |
 -- 
 -- A chat invite link was edited 
 -- 
 -- __old_invite_link__ Previous information about the invite link
 -- 
 -- __new_invite_link__ New information about the invite link
 ChatEventInviteLinkEdited { new_invite_link :: Maybe ChatInviteLink.ChatInviteLink, old_invite_link :: Maybe ChatInviteLink.ChatInviteLink }  |
 -- |
 -- 
 -- A chat invite link was revoked 
 -- 
 -- __invite_link__ The invite link
 ChatEventInviteLinkRevoked { invite_link :: Maybe ChatInviteLink.ChatInviteLink }  |
 -- |
 -- 
 -- A revoked chat invite link was deleted 
 -- 
 -- __invite_link__ The invite link
 ChatEventInviteLinkDeleted { invite_link :: Maybe ChatInviteLink.ChatInviteLink }  |
 -- |
 -- 
 -- A video chat was created 
 -- 
 -- __group_call_id__ Identifier of the video chat. The video chat can be received through the method getGroupCall
 ChatEventVideoChatCreated { group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A video chat was ended 
 -- 
 -- __group_call_id__ Identifier of the video chat. The video chat can be received through the method getGroupCall
 ChatEventVideoChatEnded { group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- The mute_new_participants setting of a video chat was toggled 
 -- 
 -- __mute_new_participants__ New value of the mute_new_participants setting
 ChatEventVideoChatMuteNewParticipantsToggled { mute_new_participants :: Maybe Bool }  |
 -- |
 -- 
 -- A video chat participant was muted or unmuted 
 -- 
 -- __participant_id__ Identifier of the affected group call participant
 -- 
 -- __is_muted__ New value of is_muted
 ChatEventVideoChatParticipantIsMutedToggled { is_muted :: Maybe Bool, participant_id :: Maybe MessageSender.MessageSender }  |
 -- |
 -- 
 -- A video chat participant volume level was changed 
 -- 
 -- __participant_id__ Identifier of the affected group call participant
 -- 
 -- __volume_level__ New value of volume_level; 1-20000 in hundreds of percents
 ChatEventVideoChatParticipantVolumeLevelChanged { volume_level :: Maybe Int, participant_id :: Maybe MessageSender.MessageSender }  deriving (Eq)

instance Show ChatEventAction where
 show ChatEventMessageEdited { new_message=new_message, old_message=old_message } =
  "ChatEventMessageEdited" ++ cc [p "new_message" new_message, p "old_message" old_message ]

 show ChatEventMessageDeleted { message=message } =
  "ChatEventMessageDeleted" ++ cc [p "message" message ]

 show ChatEventMessagePinned { message=message } =
  "ChatEventMessagePinned" ++ cc [p "message" message ]

 show ChatEventMessageUnpinned { message=message } =
  "ChatEventMessageUnpinned" ++ cc [p "message" message ]

 show ChatEventPollStopped { message=message } =
  "ChatEventPollStopped" ++ cc [p "message" message ]

 show ChatEventMemberJoined {  } =
  "ChatEventMemberJoined" ++ cc [ ]

 show ChatEventMemberJoinedByInviteLink { invite_link=invite_link } =
  "ChatEventMemberJoinedByInviteLink" ++ cc [p "invite_link" invite_link ]

 show ChatEventMemberJoinedByRequest { invite_link=invite_link, approver_user_id=approver_user_id } =
  "ChatEventMemberJoinedByRequest" ++ cc [p "invite_link" invite_link, p "approver_user_id" approver_user_id ]

 show ChatEventMemberInvited { status=status, user_id=user_id } =
  "ChatEventMemberInvited" ++ cc [p "status" status, p "user_id" user_id ]

 show ChatEventMemberLeft {  } =
  "ChatEventMemberLeft" ++ cc [ ]

 show ChatEventMemberPromoted { new_status=new_status, old_status=old_status, user_id=user_id } =
  "ChatEventMemberPromoted" ++ cc [p "new_status" new_status, p "old_status" old_status, p "user_id" user_id ]

 show ChatEventMemberRestricted { new_status=new_status, old_status=old_status, member_id=member_id } =
  "ChatEventMemberRestricted" ++ cc [p "new_status" new_status, p "old_status" old_status, p "member_id" member_id ]

 show ChatEventAvailableReactionsChanged { new_available_reactions=new_available_reactions, old_available_reactions=old_available_reactions } =
  "ChatEventAvailableReactionsChanged" ++ cc [p "new_available_reactions" new_available_reactions, p "old_available_reactions" old_available_reactions ]

 show ChatEventDescriptionChanged { new_description=new_description, old_description=old_description } =
  "ChatEventDescriptionChanged" ++ cc [p "new_description" new_description, p "old_description" old_description ]

 show ChatEventLinkedChatChanged { new_linked_chat_id=new_linked_chat_id, old_linked_chat_id=old_linked_chat_id } =
  "ChatEventLinkedChatChanged" ++ cc [p "new_linked_chat_id" new_linked_chat_id, p "old_linked_chat_id" old_linked_chat_id ]

 show ChatEventLocationChanged { new_location=new_location, old_location=old_location } =
  "ChatEventLocationChanged" ++ cc [p "new_location" new_location, p "old_location" old_location ]

 show ChatEventMessageTtlChanged { new_message_ttl=new_message_ttl, old_message_ttl=old_message_ttl } =
  "ChatEventMessageTtlChanged" ++ cc [p "new_message_ttl" new_message_ttl, p "old_message_ttl" old_message_ttl ]

 show ChatEventPermissionsChanged { new_permissions=new_permissions, old_permissions=old_permissions } =
  "ChatEventPermissionsChanged" ++ cc [p "new_permissions" new_permissions, p "old_permissions" old_permissions ]

 show ChatEventPhotoChanged { new_photo=new_photo, old_photo=old_photo } =
  "ChatEventPhotoChanged" ++ cc [p "new_photo" new_photo, p "old_photo" old_photo ]

 show ChatEventSlowModeDelayChanged { new_slow_mode_delay=new_slow_mode_delay, old_slow_mode_delay=old_slow_mode_delay } =
  "ChatEventSlowModeDelayChanged" ++ cc [p "new_slow_mode_delay" new_slow_mode_delay, p "old_slow_mode_delay" old_slow_mode_delay ]

 show ChatEventStickerSetChanged { new_sticker_set_id=new_sticker_set_id, old_sticker_set_id=old_sticker_set_id } =
  "ChatEventStickerSetChanged" ++ cc [p "new_sticker_set_id" new_sticker_set_id, p "old_sticker_set_id" old_sticker_set_id ]

 show ChatEventTitleChanged { new_title=new_title, old_title=old_title } =
  "ChatEventTitleChanged" ++ cc [p "new_title" new_title, p "old_title" old_title ]

 show ChatEventUsernameChanged { new_username=new_username, old_username=old_username } =
  "ChatEventUsernameChanged" ++ cc [p "new_username" new_username, p "old_username" old_username ]

 show ChatEventHasProtectedContentToggled { has_protected_content=has_protected_content } =
  "ChatEventHasProtectedContentToggled" ++ cc [p "has_protected_content" has_protected_content ]

 show ChatEventInvitesToggled { can_invite_users=can_invite_users } =
  "ChatEventInvitesToggled" ++ cc [p "can_invite_users" can_invite_users ]

 show ChatEventIsAllHistoryAvailableToggled { is_all_history_available=is_all_history_available } =
  "ChatEventIsAllHistoryAvailableToggled" ++ cc [p "is_all_history_available" is_all_history_available ]

 show ChatEventSignMessagesToggled { sign_messages=sign_messages } =
  "ChatEventSignMessagesToggled" ++ cc [p "sign_messages" sign_messages ]

 show ChatEventInviteLinkEdited { new_invite_link=new_invite_link, old_invite_link=old_invite_link } =
  "ChatEventInviteLinkEdited" ++ cc [p "new_invite_link" new_invite_link, p "old_invite_link" old_invite_link ]

 show ChatEventInviteLinkRevoked { invite_link=invite_link } =
  "ChatEventInviteLinkRevoked" ++ cc [p "invite_link" invite_link ]

 show ChatEventInviteLinkDeleted { invite_link=invite_link } =
  "ChatEventInviteLinkDeleted" ++ cc [p "invite_link" invite_link ]

 show ChatEventVideoChatCreated { group_call_id=group_call_id } =
  "ChatEventVideoChatCreated" ++ cc [p "group_call_id" group_call_id ]

 show ChatEventVideoChatEnded { group_call_id=group_call_id } =
  "ChatEventVideoChatEnded" ++ cc [p "group_call_id" group_call_id ]

 show ChatEventVideoChatMuteNewParticipantsToggled { mute_new_participants=mute_new_participants } =
  "ChatEventVideoChatMuteNewParticipantsToggled" ++ cc [p "mute_new_participants" mute_new_participants ]

 show ChatEventVideoChatParticipantIsMutedToggled { is_muted=is_muted, participant_id=participant_id } =
  "ChatEventVideoChatParticipantIsMutedToggled" ++ cc [p "is_muted" is_muted, p "participant_id" participant_id ]

 show ChatEventVideoChatParticipantVolumeLevelChanged { volume_level=volume_level, participant_id=participant_id } =
  "ChatEventVideoChatParticipantVolumeLevelChanged" ++ cc [p "volume_level" volume_level, p "participant_id" participant_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatEventAction where
 toJSON ChatEventMessageEdited { new_message = new_message, old_message = old_message } =
  A.object [ "@type" A..= T.String "chatEventMessageEdited", "new_message" A..= new_message, "old_message" A..= old_message ]

 toJSON ChatEventMessageDeleted { message = message } =
  A.object [ "@type" A..= T.String "chatEventMessageDeleted", "message" A..= message ]

 toJSON ChatEventMessagePinned { message = message } =
  A.object [ "@type" A..= T.String "chatEventMessagePinned", "message" A..= message ]

 toJSON ChatEventMessageUnpinned { message = message } =
  A.object [ "@type" A..= T.String "chatEventMessageUnpinned", "message" A..= message ]

 toJSON ChatEventPollStopped { message = message } =
  A.object [ "@type" A..= T.String "chatEventPollStopped", "message" A..= message ]

 toJSON ChatEventMemberJoined {  } =
  A.object [ "@type" A..= T.String "chatEventMemberJoined" ]

 toJSON ChatEventMemberJoinedByInviteLink { invite_link = invite_link } =
  A.object [ "@type" A..= T.String "chatEventMemberJoinedByInviteLink", "invite_link" A..= invite_link ]

 toJSON ChatEventMemberJoinedByRequest { invite_link = invite_link, approver_user_id = approver_user_id } =
  A.object [ "@type" A..= T.String "chatEventMemberJoinedByRequest", "invite_link" A..= invite_link, "approver_user_id" A..= approver_user_id ]

 toJSON ChatEventMemberInvited { status = status, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatEventMemberInvited", "status" A..= status, "user_id" A..= user_id ]

 toJSON ChatEventMemberLeft {  } =
  A.object [ "@type" A..= T.String "chatEventMemberLeft" ]

 toJSON ChatEventMemberPromoted { new_status = new_status, old_status = old_status, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatEventMemberPromoted", "new_status" A..= new_status, "old_status" A..= old_status, "user_id" A..= user_id ]

 toJSON ChatEventMemberRestricted { new_status = new_status, old_status = old_status, member_id = member_id } =
  A.object [ "@type" A..= T.String "chatEventMemberRestricted", "new_status" A..= new_status, "old_status" A..= old_status, "member_id" A..= member_id ]

 toJSON ChatEventAvailableReactionsChanged { new_available_reactions = new_available_reactions, old_available_reactions = old_available_reactions } =
  A.object [ "@type" A..= T.String "chatEventAvailableReactionsChanged", "new_available_reactions" A..= new_available_reactions, "old_available_reactions" A..= old_available_reactions ]

 toJSON ChatEventDescriptionChanged { new_description = new_description, old_description = old_description } =
  A.object [ "@type" A..= T.String "chatEventDescriptionChanged", "new_description" A..= new_description, "old_description" A..= old_description ]

 toJSON ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id } =
  A.object [ "@type" A..= T.String "chatEventLinkedChatChanged", "new_linked_chat_id" A..= new_linked_chat_id, "old_linked_chat_id" A..= old_linked_chat_id ]

 toJSON ChatEventLocationChanged { new_location = new_location, old_location = old_location } =
  A.object [ "@type" A..= T.String "chatEventLocationChanged", "new_location" A..= new_location, "old_location" A..= old_location ]

 toJSON ChatEventMessageTtlChanged { new_message_ttl = new_message_ttl, old_message_ttl = old_message_ttl } =
  A.object [ "@type" A..= T.String "chatEventMessageTtlChanged", "new_message_ttl" A..= new_message_ttl, "old_message_ttl" A..= old_message_ttl ]

 toJSON ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions } =
  A.object [ "@type" A..= T.String "chatEventPermissionsChanged", "new_permissions" A..= new_permissions, "old_permissions" A..= old_permissions ]

 toJSON ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo } =
  A.object [ "@type" A..= T.String "chatEventPhotoChanged", "new_photo" A..= new_photo, "old_photo" A..= old_photo ]

 toJSON ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay } =
  A.object [ "@type" A..= T.String "chatEventSlowModeDelayChanged", "new_slow_mode_delay" A..= new_slow_mode_delay, "old_slow_mode_delay" A..= old_slow_mode_delay ]

 toJSON ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id } =
  A.object [ "@type" A..= T.String "chatEventStickerSetChanged", "new_sticker_set_id" A..= new_sticker_set_id, "old_sticker_set_id" A..= old_sticker_set_id ]

 toJSON ChatEventTitleChanged { new_title = new_title, old_title = old_title } =
  A.object [ "@type" A..= T.String "chatEventTitleChanged", "new_title" A..= new_title, "old_title" A..= old_title ]

 toJSON ChatEventUsernameChanged { new_username = new_username, old_username = old_username } =
  A.object [ "@type" A..= T.String "chatEventUsernameChanged", "new_username" A..= new_username, "old_username" A..= old_username ]

 toJSON ChatEventHasProtectedContentToggled { has_protected_content = has_protected_content } =
  A.object [ "@type" A..= T.String "chatEventHasProtectedContentToggled", "has_protected_content" A..= has_protected_content ]

 toJSON ChatEventInvitesToggled { can_invite_users = can_invite_users } =
  A.object [ "@type" A..= T.String "chatEventInvitesToggled", "can_invite_users" A..= can_invite_users ]

 toJSON ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available } =
  A.object [ "@type" A..= T.String "chatEventIsAllHistoryAvailableToggled", "is_all_history_available" A..= is_all_history_available ]

 toJSON ChatEventSignMessagesToggled { sign_messages = sign_messages } =
  A.object [ "@type" A..= T.String "chatEventSignMessagesToggled", "sign_messages" A..= sign_messages ]

 toJSON ChatEventInviteLinkEdited { new_invite_link = new_invite_link, old_invite_link = old_invite_link } =
  A.object [ "@type" A..= T.String "chatEventInviteLinkEdited", "new_invite_link" A..= new_invite_link, "old_invite_link" A..= old_invite_link ]

 toJSON ChatEventInviteLinkRevoked { invite_link = invite_link } =
  A.object [ "@type" A..= T.String "chatEventInviteLinkRevoked", "invite_link" A..= invite_link ]

 toJSON ChatEventInviteLinkDeleted { invite_link = invite_link } =
  A.object [ "@type" A..= T.String "chatEventInviteLinkDeleted", "invite_link" A..= invite_link ]

 toJSON ChatEventVideoChatCreated { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "chatEventVideoChatCreated", "group_call_id" A..= group_call_id ]

 toJSON ChatEventVideoChatEnded { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "chatEventVideoChatEnded", "group_call_id" A..= group_call_id ]

 toJSON ChatEventVideoChatMuteNewParticipantsToggled { mute_new_participants = mute_new_participants } =
  A.object [ "@type" A..= T.String "chatEventVideoChatMuteNewParticipantsToggled", "mute_new_participants" A..= mute_new_participants ]

 toJSON ChatEventVideoChatParticipantIsMutedToggled { is_muted = is_muted, participant_id = participant_id } =
  A.object [ "@type" A..= T.String "chatEventVideoChatParticipantIsMutedToggled", "is_muted" A..= is_muted, "participant_id" A..= participant_id ]

 toJSON ChatEventVideoChatParticipantVolumeLevelChanged { volume_level = volume_level, participant_id = participant_id } =
  A.object [ "@type" A..= T.String "chatEventVideoChatParticipantVolumeLevelChanged", "volume_level" A..= volume_level, "participant_id" A..= participant_id ]

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
    new_message <- o A..:? "new_message"
    old_message <- o A..:? "old_message"
    return $ ChatEventMessageEdited { new_message = new_message, old_message = old_message }

   parseChatEventMessageDeleted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageDeleted = A.withObject "ChatEventMessageDeleted" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventMessageDeleted { message = message }

   parseChatEventMessagePinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessagePinned = A.withObject "ChatEventMessagePinned" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventMessagePinned { message = message }

   parseChatEventMessageUnpinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageUnpinned = A.withObject "ChatEventMessageUnpinned" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventMessageUnpinned { message = message }

   parseChatEventPollStopped :: A.Value -> T.Parser ChatEventAction
   parseChatEventPollStopped = A.withObject "ChatEventPollStopped" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventPollStopped { message = message }

   parseChatEventMemberJoined :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoined = A.withObject "ChatEventMemberJoined" $ \o -> do
    return $ ChatEventMemberJoined {  }

   parseChatEventMemberJoinedByInviteLink :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoinedByInviteLink = A.withObject "ChatEventMemberJoinedByInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ ChatEventMemberJoinedByInviteLink { invite_link = invite_link }

   parseChatEventMemberJoinedByRequest :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoinedByRequest = A.withObject "ChatEventMemberJoinedByRequest" $ \o -> do
    invite_link <- o A..:? "invite_link"
    approver_user_id <- mconcat [ o A..:? "approver_user_id", readMaybe <$> (o A..: "approver_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMemberJoinedByRequest { invite_link = invite_link, approver_user_id = approver_user_id }

   parseChatEventMemberInvited :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberInvited = A.withObject "ChatEventMemberInvited" $ \o -> do
    status <- o A..:? "status"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMemberInvited { status = status, user_id = user_id }

   parseChatEventMemberLeft :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberLeft = A.withObject "ChatEventMemberLeft" $ \o -> do
    return $ ChatEventMemberLeft {  }

   parseChatEventMemberPromoted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberPromoted = A.withObject "ChatEventMemberPromoted" $ \o -> do
    new_status <- o A..:? "new_status"
    old_status <- o A..:? "old_status"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMemberPromoted { new_status = new_status, old_status = old_status, user_id = user_id }

   parseChatEventMemberRestricted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberRestricted = A.withObject "ChatEventMemberRestricted" $ \o -> do
    new_status <- o A..:? "new_status"
    old_status <- o A..:? "old_status"
    member_id <- o A..:? "member_id"
    return $ ChatEventMemberRestricted { new_status = new_status, old_status = old_status, member_id = member_id }

   parseChatEventAvailableReactionsChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventAvailableReactionsChanged = A.withObject "ChatEventAvailableReactionsChanged" $ \o -> do
    new_available_reactions <- o A..:? "new_available_reactions"
    old_available_reactions <- o A..:? "old_available_reactions"
    return $ ChatEventAvailableReactionsChanged { new_available_reactions = new_available_reactions, old_available_reactions = old_available_reactions }

   parseChatEventDescriptionChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventDescriptionChanged = A.withObject "ChatEventDescriptionChanged" $ \o -> do
    new_description <- o A..:? "new_description"
    old_description <- o A..:? "old_description"
    return $ ChatEventDescriptionChanged { new_description = new_description, old_description = old_description }

   parseChatEventLinkedChatChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLinkedChatChanged = A.withObject "ChatEventLinkedChatChanged" $ \o -> do
    new_linked_chat_id <- mconcat [ o A..:? "new_linked_chat_id", readMaybe <$> (o A..: "new_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_linked_chat_id <- mconcat [ o A..:? "old_linked_chat_id", readMaybe <$> (o A..: "old_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id }

   parseChatEventLocationChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLocationChanged = A.withObject "ChatEventLocationChanged" $ \o -> do
    new_location <- o A..:? "new_location"
    old_location <- o A..:? "old_location"
    return $ ChatEventLocationChanged { new_location = new_location, old_location = old_location }

   parseChatEventMessageTtlChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageTtlChanged = A.withObject "ChatEventMessageTtlChanged" $ \o -> do
    new_message_ttl <- mconcat [ o A..:? "new_message_ttl", readMaybe <$> (o A..: "new_message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_message_ttl <- mconcat [ o A..:? "old_message_ttl", readMaybe <$> (o A..: "old_message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMessageTtlChanged { new_message_ttl = new_message_ttl, old_message_ttl = old_message_ttl }

   parseChatEventPermissionsChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPermissionsChanged = A.withObject "ChatEventPermissionsChanged" $ \o -> do
    new_permissions <- o A..:? "new_permissions"
    old_permissions <- o A..:? "old_permissions"
    return $ ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions }

   parseChatEventPhotoChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPhotoChanged = A.withObject "ChatEventPhotoChanged" $ \o -> do
    new_photo <- o A..:? "new_photo"
    old_photo <- o A..:? "old_photo"
    return $ ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo }

   parseChatEventSlowModeDelayChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventSlowModeDelayChanged = A.withObject "ChatEventSlowModeDelayChanged" $ \o -> do
    new_slow_mode_delay <- mconcat [ o A..:? "new_slow_mode_delay", readMaybe <$> (o A..: "new_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_slow_mode_delay <- mconcat [ o A..:? "old_slow_mode_delay", readMaybe <$> (o A..: "old_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay }

   parseChatEventStickerSetChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventStickerSetChanged = A.withObject "ChatEventStickerSetChanged" $ \o -> do
    new_sticker_set_id <- mconcat [ o A..:? "new_sticker_set_id", readMaybe <$> (o A..: "new_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_sticker_set_id <- mconcat [ o A..:? "old_sticker_set_id", readMaybe <$> (o A..: "old_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id }

   parseChatEventTitleChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventTitleChanged = A.withObject "ChatEventTitleChanged" $ \o -> do
    new_title <- o A..:? "new_title"
    old_title <- o A..:? "old_title"
    return $ ChatEventTitleChanged { new_title = new_title, old_title = old_title }

   parseChatEventUsernameChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventUsernameChanged = A.withObject "ChatEventUsernameChanged" $ \o -> do
    new_username <- o A..:? "new_username"
    old_username <- o A..:? "old_username"
    return $ ChatEventUsernameChanged { new_username = new_username, old_username = old_username }

   parseChatEventHasProtectedContentToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventHasProtectedContentToggled = A.withObject "ChatEventHasProtectedContentToggled" $ \o -> do
    has_protected_content <- o A..:? "has_protected_content"
    return $ ChatEventHasProtectedContentToggled { has_protected_content = has_protected_content }

   parseChatEventInvitesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventInvitesToggled = A.withObject "ChatEventInvitesToggled" $ \o -> do
    can_invite_users <- o A..:? "can_invite_users"
    return $ ChatEventInvitesToggled { can_invite_users = can_invite_users }

   parseChatEventIsAllHistoryAvailableToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventIsAllHistoryAvailableToggled = A.withObject "ChatEventIsAllHistoryAvailableToggled" $ \o -> do
    is_all_history_available <- o A..:? "is_all_history_available"
    return $ ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available }

   parseChatEventSignMessagesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventSignMessagesToggled = A.withObject "ChatEventSignMessagesToggled" $ \o -> do
    sign_messages <- o A..:? "sign_messages"
    return $ ChatEventSignMessagesToggled { sign_messages = sign_messages }

   parseChatEventInviteLinkEdited :: A.Value -> T.Parser ChatEventAction
   parseChatEventInviteLinkEdited = A.withObject "ChatEventInviteLinkEdited" $ \o -> do
    new_invite_link <- o A..:? "new_invite_link"
    old_invite_link <- o A..:? "old_invite_link"
    return $ ChatEventInviteLinkEdited { new_invite_link = new_invite_link, old_invite_link = old_invite_link }

   parseChatEventInviteLinkRevoked :: A.Value -> T.Parser ChatEventAction
   parseChatEventInviteLinkRevoked = A.withObject "ChatEventInviteLinkRevoked" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ ChatEventInviteLinkRevoked { invite_link = invite_link }

   parseChatEventInviteLinkDeleted :: A.Value -> T.Parser ChatEventAction
   parseChatEventInviteLinkDeleted = A.withObject "ChatEventInviteLinkDeleted" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ ChatEventInviteLinkDeleted { invite_link = invite_link }

   parseChatEventVideoChatCreated :: A.Value -> T.Parser ChatEventAction
   parseChatEventVideoChatCreated = A.withObject "ChatEventVideoChatCreated" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventVideoChatCreated { group_call_id = group_call_id }

   parseChatEventVideoChatEnded :: A.Value -> T.Parser ChatEventAction
   parseChatEventVideoChatEnded = A.withObject "ChatEventVideoChatEnded" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventVideoChatEnded { group_call_id = group_call_id }

   parseChatEventVideoChatMuteNewParticipantsToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventVideoChatMuteNewParticipantsToggled = A.withObject "ChatEventVideoChatMuteNewParticipantsToggled" $ \o -> do
    mute_new_participants <- o A..:? "mute_new_participants"
    return $ ChatEventVideoChatMuteNewParticipantsToggled { mute_new_participants = mute_new_participants }

   parseChatEventVideoChatParticipantIsMutedToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventVideoChatParticipantIsMutedToggled = A.withObject "ChatEventVideoChatParticipantIsMutedToggled" $ \o -> do
    is_muted <- o A..:? "is_muted"
    participant_id <- o A..:? "participant_id"
    return $ ChatEventVideoChatParticipantIsMutedToggled { is_muted = is_muted, participant_id = participant_id }

   parseChatEventVideoChatParticipantVolumeLevelChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventVideoChatParticipantVolumeLevelChanged = A.withObject "ChatEventVideoChatParticipantVolumeLevelChanged" $ \o -> do
    volume_level <- mconcat [ o A..:? "volume_level", readMaybe <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    participant_id <- o A..:? "participant_id"
    return $ ChatEventVideoChatParticipantVolumeLevelChanged { volume_level = volume_level, participant_id = participant_id }
 parseJSON _ = mempty
