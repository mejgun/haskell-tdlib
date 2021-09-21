-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation
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
 -- A poll in a message was stopped 
 -- 
 -- __message__ The message with the poll
 ChatEventPollStopped { message :: Maybe Message.Message }  |
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
 -- A new member joined the chat
 ChatEventMemberJoined |
 -- |
 -- 
 -- A new member joined the chat by an invite link 
 -- 
 -- __invite_link__ Invite link used to join the chat
 ChatEventMemberJoinedByInviteLink { invite_link :: Maybe ChatInviteLink.ChatInviteLink }  |
 -- |
 -- 
 -- A member left the chat
 ChatEventMemberLeft |
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
 -- The chat title was changed 
 -- 
 -- __old_title__ Previous chat title
 -- 
 -- __new_title__ New chat title
 ChatEventTitleChanged { new_title :: Maybe String, old_title :: Maybe String }  |
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
 -- The chat description was changed 
 -- 
 -- __old_description__ Previous chat description
 -- 
 -- __new_description__ New chat description
 ChatEventDescriptionChanged { new_description :: Maybe String, old_description :: Maybe String }  |
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
 -- The chat photo was changed 
 -- 
 -- __old_photo__ Previous chat photo value; may be null
 -- 
 -- __new_photo__ New chat photo value; may be null
 ChatEventPhotoChanged { new_photo :: Maybe ChatPhoto.ChatPhoto, old_photo :: Maybe ChatPhoto.ChatPhoto }  |
 -- |
 -- 
 -- The can_invite_users permission of a supergroup chat was toggled 
 -- 
 -- __can_invite_users__ New value of can_invite_users permission
 ChatEventInvitesToggled { can_invite_users :: Maybe Bool }  |
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
 -- The slow_mode_delay setting of a supergroup was changed 
 -- 
 -- __old_slow_mode_delay__ Previous value of slow_mode_delay
 -- 
 -- __new_slow_mode_delay__ New value of slow_mode_delay
 ChatEventSlowModeDelayChanged { new_slow_mode_delay :: Maybe Int, old_slow_mode_delay :: Maybe Int }  |
 -- |
 -- 
 -- The message TTL setting was changed 
 -- 
 -- __old_message_ttl_setting__ Previous value of message_ttl_setting
 -- 
 -- __new_message_ttl_setting__ New value of message_ttl_setting
 ChatEventMessageTtlSettingChanged { new_message_ttl_setting :: Maybe Int, old_message_ttl_setting :: Maybe Int }  |
 -- |
 -- 
 -- The sign_messages setting of a channel was toggled 
 -- 
 -- __sign_messages__ New value of sign_messages
 ChatEventSignMessagesToggled { sign_messages :: Maybe Bool }  |
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
 -- The supergroup location was changed 
 -- 
 -- __old_location__ Previous location; may be null
 -- 
 -- __new_location__ New location; may be null
 ChatEventLocationChanged { new_location :: Maybe ChatLocation.ChatLocation, old_location :: Maybe ChatLocation.ChatLocation }  |
 -- |
 -- 
 -- The is_all_history_available setting of a supergroup was toggled 
 -- 
 -- __is_all_history_available__ New value of is_all_history_available
 ChatEventIsAllHistoryAvailableToggled { is_all_history_available :: Maybe Bool }  |
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
 -- A voice chat was created 
 -- 
 -- __group_call_id__ Identifier of the voice chat. The voice chat can be received through the method getGroupCall
 ChatEventVoiceChatCreated { group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A voice chat was discarded 
 -- 
 -- __group_call_id__ Identifier of the voice chat. The voice chat can be received through the method getGroupCall
 ChatEventVoiceChatDiscarded { group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A voice chat participant was muted or unmuted 
 -- 
 -- __participant_id__ Identifier of the affected group call participant
 -- 
 -- __is_muted__ New value of is_muted
 ChatEventVoiceChatParticipantIsMutedToggled { is_muted :: Maybe Bool, participant_id :: Maybe MessageSender.MessageSender }  |
 -- |
 -- 
 -- A voice chat participant volume level was changed 
 -- 
 -- __participant_id__ Identifier of the affected group call participant
 -- 
 -- __volume_level__ New value of volume_level; 1-20000 in hundreds of percents
 ChatEventVoiceChatParticipantVolumeLevelChanged { volume_level :: Maybe Int, participant_id :: Maybe MessageSender.MessageSender }  |
 -- |
 -- 
 -- The mute_new_participants setting of a voice chat was toggled 
 -- 
 -- __mute_new_participants__ New value of the mute_new_participants setting
 ChatEventVoiceChatMuteNewParticipantsToggled { mute_new_participants :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON ChatEventAction where
 toJSON (ChatEventMessageEdited { new_message = new_message, old_message = old_message }) =
  A.object [ "@type" A..= T.String "chatEventMessageEdited", "new_message" A..= new_message, "old_message" A..= old_message ]

 toJSON (ChatEventMessageDeleted { message = message }) =
  A.object [ "@type" A..= T.String "chatEventMessageDeleted", "message" A..= message ]

 toJSON (ChatEventPollStopped { message = message }) =
  A.object [ "@type" A..= T.String "chatEventPollStopped", "message" A..= message ]

 toJSON (ChatEventMessagePinned { message = message }) =
  A.object [ "@type" A..= T.String "chatEventMessagePinned", "message" A..= message ]

 toJSON (ChatEventMessageUnpinned { message = message }) =
  A.object [ "@type" A..= T.String "chatEventMessageUnpinned", "message" A..= message ]

 toJSON (ChatEventMemberJoined {  }) =
  A.object [ "@type" A..= T.String "chatEventMemberJoined" ]

 toJSON (ChatEventMemberJoinedByInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatEventMemberJoinedByInviteLink", "invite_link" A..= invite_link ]

 toJSON (ChatEventMemberLeft {  }) =
  A.object [ "@type" A..= T.String "chatEventMemberLeft" ]

 toJSON (ChatEventMemberInvited { status = status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberInvited", "status" A..= status, "user_id" A..= user_id ]

 toJSON (ChatEventMemberPromoted { new_status = new_status, old_status = old_status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberPromoted", "new_status" A..= new_status, "old_status" A..= old_status, "user_id" A..= user_id ]

 toJSON (ChatEventMemberRestricted { new_status = new_status, old_status = old_status, member_id = member_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberRestricted", "new_status" A..= new_status, "old_status" A..= old_status, "member_id" A..= member_id ]

 toJSON (ChatEventTitleChanged { new_title = new_title, old_title = old_title }) =
  A.object [ "@type" A..= T.String "chatEventTitleChanged", "new_title" A..= new_title, "old_title" A..= old_title ]

 toJSON (ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions }) =
  A.object [ "@type" A..= T.String "chatEventPermissionsChanged", "new_permissions" A..= new_permissions, "old_permissions" A..= old_permissions ]

 toJSON (ChatEventDescriptionChanged { new_description = new_description, old_description = old_description }) =
  A.object [ "@type" A..= T.String "chatEventDescriptionChanged", "new_description" A..= new_description, "old_description" A..= old_description ]

 toJSON (ChatEventUsernameChanged { new_username = new_username, old_username = old_username }) =
  A.object [ "@type" A..= T.String "chatEventUsernameChanged", "new_username" A..= new_username, "old_username" A..= old_username ]

 toJSON (ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo }) =
  A.object [ "@type" A..= T.String "chatEventPhotoChanged", "new_photo" A..= new_photo, "old_photo" A..= old_photo ]

 toJSON (ChatEventInvitesToggled { can_invite_users = can_invite_users }) =
  A.object [ "@type" A..= T.String "chatEventInvitesToggled", "can_invite_users" A..= can_invite_users ]

 toJSON (ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id }) =
  A.object [ "@type" A..= T.String "chatEventLinkedChatChanged", "new_linked_chat_id" A..= new_linked_chat_id, "old_linked_chat_id" A..= old_linked_chat_id ]

 toJSON (ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay }) =
  A.object [ "@type" A..= T.String "chatEventSlowModeDelayChanged", "new_slow_mode_delay" A..= new_slow_mode_delay, "old_slow_mode_delay" A..= old_slow_mode_delay ]

 toJSON (ChatEventMessageTtlSettingChanged { new_message_ttl_setting = new_message_ttl_setting, old_message_ttl_setting = old_message_ttl_setting }) =
  A.object [ "@type" A..= T.String "chatEventMessageTtlSettingChanged", "new_message_ttl_setting" A..= new_message_ttl_setting, "old_message_ttl_setting" A..= old_message_ttl_setting ]

 toJSON (ChatEventSignMessagesToggled { sign_messages = sign_messages }) =
  A.object [ "@type" A..= T.String "chatEventSignMessagesToggled", "sign_messages" A..= sign_messages ]

 toJSON (ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id }) =
  A.object [ "@type" A..= T.String "chatEventStickerSetChanged", "new_sticker_set_id" A..= new_sticker_set_id, "old_sticker_set_id" A..= old_sticker_set_id ]

 toJSON (ChatEventLocationChanged { new_location = new_location, old_location = old_location }) =
  A.object [ "@type" A..= T.String "chatEventLocationChanged", "new_location" A..= new_location, "old_location" A..= old_location ]

 toJSON (ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available }) =
  A.object [ "@type" A..= T.String "chatEventIsAllHistoryAvailableToggled", "is_all_history_available" A..= is_all_history_available ]

 toJSON (ChatEventInviteLinkEdited { new_invite_link = new_invite_link, old_invite_link = old_invite_link }) =
  A.object [ "@type" A..= T.String "chatEventInviteLinkEdited", "new_invite_link" A..= new_invite_link, "old_invite_link" A..= old_invite_link ]

 toJSON (ChatEventInviteLinkRevoked { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatEventInviteLinkRevoked", "invite_link" A..= invite_link ]

 toJSON (ChatEventInviteLinkDeleted { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatEventInviteLinkDeleted", "invite_link" A..= invite_link ]

 toJSON (ChatEventVoiceChatCreated { group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "chatEventVoiceChatCreated", "group_call_id" A..= group_call_id ]

 toJSON (ChatEventVoiceChatDiscarded { group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "chatEventVoiceChatDiscarded", "group_call_id" A..= group_call_id ]

 toJSON (ChatEventVoiceChatParticipantIsMutedToggled { is_muted = is_muted, participant_id = participant_id }) =
  A.object [ "@type" A..= T.String "chatEventVoiceChatParticipantIsMutedToggled", "is_muted" A..= is_muted, "participant_id" A..= participant_id ]

 toJSON (ChatEventVoiceChatParticipantVolumeLevelChanged { volume_level = volume_level, participant_id = participant_id }) =
  A.object [ "@type" A..= T.String "chatEventVoiceChatParticipantVolumeLevelChanged", "volume_level" A..= volume_level, "participant_id" A..= participant_id ]

 toJSON (ChatEventVoiceChatMuteNewParticipantsToggled { mute_new_participants = mute_new_participants }) =
  A.object [ "@type" A..= T.String "chatEventVoiceChatMuteNewParticipantsToggled", "mute_new_participants" A..= mute_new_participants ]

instance T.FromJSON ChatEventAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEventMessageEdited" -> parseChatEventMessageEdited v
   "chatEventMessageDeleted" -> parseChatEventMessageDeleted v
   "chatEventPollStopped" -> parseChatEventPollStopped v
   "chatEventMessagePinned" -> parseChatEventMessagePinned v
   "chatEventMessageUnpinned" -> parseChatEventMessageUnpinned v
   "chatEventMemberJoined" -> parseChatEventMemberJoined v
   "chatEventMemberJoinedByInviteLink" -> parseChatEventMemberJoinedByInviteLink v
   "chatEventMemberLeft" -> parseChatEventMemberLeft v
   "chatEventMemberInvited" -> parseChatEventMemberInvited v
   "chatEventMemberPromoted" -> parseChatEventMemberPromoted v
   "chatEventMemberRestricted" -> parseChatEventMemberRestricted v
   "chatEventTitleChanged" -> parseChatEventTitleChanged v
   "chatEventPermissionsChanged" -> parseChatEventPermissionsChanged v
   "chatEventDescriptionChanged" -> parseChatEventDescriptionChanged v
   "chatEventUsernameChanged" -> parseChatEventUsernameChanged v
   "chatEventPhotoChanged" -> parseChatEventPhotoChanged v
   "chatEventInvitesToggled" -> parseChatEventInvitesToggled v
   "chatEventLinkedChatChanged" -> parseChatEventLinkedChatChanged v
   "chatEventSlowModeDelayChanged" -> parseChatEventSlowModeDelayChanged v
   "chatEventMessageTtlSettingChanged" -> parseChatEventMessageTtlSettingChanged v
   "chatEventSignMessagesToggled" -> parseChatEventSignMessagesToggled v
   "chatEventStickerSetChanged" -> parseChatEventStickerSetChanged v
   "chatEventLocationChanged" -> parseChatEventLocationChanged v
   "chatEventIsAllHistoryAvailableToggled" -> parseChatEventIsAllHistoryAvailableToggled v
   "chatEventInviteLinkEdited" -> parseChatEventInviteLinkEdited v
   "chatEventInviteLinkRevoked" -> parseChatEventInviteLinkRevoked v
   "chatEventInviteLinkDeleted" -> parseChatEventInviteLinkDeleted v
   "chatEventVoiceChatCreated" -> parseChatEventVoiceChatCreated v
   "chatEventVoiceChatDiscarded" -> parseChatEventVoiceChatDiscarded v
   "chatEventVoiceChatParticipantIsMutedToggled" -> parseChatEventVoiceChatParticipantIsMutedToggled v
   "chatEventVoiceChatParticipantVolumeLevelChanged" -> parseChatEventVoiceChatParticipantVolumeLevelChanged v
   "chatEventVoiceChatMuteNewParticipantsToggled" -> parseChatEventVoiceChatMuteNewParticipantsToggled v
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

   parseChatEventPollStopped :: A.Value -> T.Parser ChatEventAction
   parseChatEventPollStopped = A.withObject "ChatEventPollStopped" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventPollStopped { message = message }

   parseChatEventMessagePinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessagePinned = A.withObject "ChatEventMessagePinned" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventMessagePinned { message = message }

   parseChatEventMessageUnpinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageUnpinned = A.withObject "ChatEventMessageUnpinned" $ \o -> do
    message <- o A..:? "message"
    return $ ChatEventMessageUnpinned { message = message }

   parseChatEventMemberJoined :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoined = A.withObject "ChatEventMemberJoined" $ \o -> do
    return $ ChatEventMemberJoined {  }

   parseChatEventMemberJoinedByInviteLink :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoinedByInviteLink = A.withObject "ChatEventMemberJoinedByInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ ChatEventMemberJoinedByInviteLink { invite_link = invite_link }

   parseChatEventMemberLeft :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberLeft = A.withObject "ChatEventMemberLeft" $ \o -> do
    return $ ChatEventMemberLeft {  }

   parseChatEventMemberInvited :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberInvited = A.withObject "ChatEventMemberInvited" $ \o -> do
    status <- o A..:? "status"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMemberInvited { status = status, user_id = user_id }

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

   parseChatEventTitleChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventTitleChanged = A.withObject "ChatEventTitleChanged" $ \o -> do
    new_title <- o A..:? "new_title"
    old_title <- o A..:? "old_title"
    return $ ChatEventTitleChanged { new_title = new_title, old_title = old_title }

   parseChatEventPermissionsChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPermissionsChanged = A.withObject "ChatEventPermissionsChanged" $ \o -> do
    new_permissions <- o A..:? "new_permissions"
    old_permissions <- o A..:? "old_permissions"
    return $ ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions }

   parseChatEventDescriptionChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventDescriptionChanged = A.withObject "ChatEventDescriptionChanged" $ \o -> do
    new_description <- o A..:? "new_description"
    old_description <- o A..:? "old_description"
    return $ ChatEventDescriptionChanged { new_description = new_description, old_description = old_description }

   parseChatEventUsernameChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventUsernameChanged = A.withObject "ChatEventUsernameChanged" $ \o -> do
    new_username <- o A..:? "new_username"
    old_username <- o A..:? "old_username"
    return $ ChatEventUsernameChanged { new_username = new_username, old_username = old_username }

   parseChatEventPhotoChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPhotoChanged = A.withObject "ChatEventPhotoChanged" $ \o -> do
    new_photo <- o A..:? "new_photo"
    old_photo <- o A..:? "old_photo"
    return $ ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo }

   parseChatEventInvitesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventInvitesToggled = A.withObject "ChatEventInvitesToggled" $ \o -> do
    can_invite_users <- o A..:? "can_invite_users"
    return $ ChatEventInvitesToggled { can_invite_users = can_invite_users }

   parseChatEventLinkedChatChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLinkedChatChanged = A.withObject "ChatEventLinkedChatChanged" $ \o -> do
    new_linked_chat_id <- mconcat [ o A..:? "new_linked_chat_id", readMaybe <$> (o A..: "new_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_linked_chat_id <- mconcat [ o A..:? "old_linked_chat_id", readMaybe <$> (o A..: "old_linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id }

   parseChatEventSlowModeDelayChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventSlowModeDelayChanged = A.withObject "ChatEventSlowModeDelayChanged" $ \o -> do
    new_slow_mode_delay <- mconcat [ o A..:? "new_slow_mode_delay", readMaybe <$> (o A..: "new_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_slow_mode_delay <- mconcat [ o A..:? "old_slow_mode_delay", readMaybe <$> (o A..: "old_slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay }

   parseChatEventMessageTtlSettingChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageTtlSettingChanged = A.withObject "ChatEventMessageTtlSettingChanged" $ \o -> do
    new_message_ttl_setting <- mconcat [ o A..:? "new_message_ttl_setting", readMaybe <$> (o A..: "new_message_ttl_setting" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_message_ttl_setting <- mconcat [ o A..:? "old_message_ttl_setting", readMaybe <$> (o A..: "old_message_ttl_setting" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventMessageTtlSettingChanged { new_message_ttl_setting = new_message_ttl_setting, old_message_ttl_setting = old_message_ttl_setting }

   parseChatEventSignMessagesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventSignMessagesToggled = A.withObject "ChatEventSignMessagesToggled" $ \o -> do
    sign_messages <- o A..:? "sign_messages"
    return $ ChatEventSignMessagesToggled { sign_messages = sign_messages }

   parseChatEventStickerSetChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventStickerSetChanged = A.withObject "ChatEventStickerSetChanged" $ \o -> do
    new_sticker_set_id <- mconcat [ o A..:? "new_sticker_set_id", readMaybe <$> (o A..: "new_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_sticker_set_id <- mconcat [ o A..:? "old_sticker_set_id", readMaybe <$> (o A..: "old_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id }

   parseChatEventLocationChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLocationChanged = A.withObject "ChatEventLocationChanged" $ \o -> do
    new_location <- o A..:? "new_location"
    old_location <- o A..:? "old_location"
    return $ ChatEventLocationChanged { new_location = new_location, old_location = old_location }

   parseChatEventIsAllHistoryAvailableToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventIsAllHistoryAvailableToggled = A.withObject "ChatEventIsAllHistoryAvailableToggled" $ \o -> do
    is_all_history_available <- o A..:? "is_all_history_available"
    return $ ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available }

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

   parseChatEventVoiceChatCreated :: A.Value -> T.Parser ChatEventAction
   parseChatEventVoiceChatCreated = A.withObject "ChatEventVoiceChatCreated" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventVoiceChatCreated { group_call_id = group_call_id }

   parseChatEventVoiceChatDiscarded :: A.Value -> T.Parser ChatEventAction
   parseChatEventVoiceChatDiscarded = A.withObject "ChatEventVoiceChatDiscarded" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEventVoiceChatDiscarded { group_call_id = group_call_id }

   parseChatEventVoiceChatParticipantIsMutedToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventVoiceChatParticipantIsMutedToggled = A.withObject "ChatEventVoiceChatParticipantIsMutedToggled" $ \o -> do
    is_muted <- o A..:? "is_muted"
    participant_id <- o A..:? "participant_id"
    return $ ChatEventVoiceChatParticipantIsMutedToggled { is_muted = is_muted, participant_id = participant_id }

   parseChatEventVoiceChatParticipantVolumeLevelChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventVoiceChatParticipantVolumeLevelChanged = A.withObject "ChatEventVoiceChatParticipantVolumeLevelChanged" $ \o -> do
    volume_level <- mconcat [ o A..:? "volume_level", readMaybe <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    participant_id <- o A..:? "participant_id"
    return $ ChatEventVoiceChatParticipantVolumeLevelChanged { volume_level = volume_level, participant_id = participant_id }

   parseChatEventVoiceChatMuteNewParticipantsToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventVoiceChatMuteNewParticipantsToggled = A.withObject "ChatEventVoiceChatMuteNewParticipantsToggled" $ \o -> do
    mute_new_participants <- o A..:? "mute_new_participants"
    return $ ChatEventVoiceChatMuteNewParticipantsToggled { mute_new_participants = mute_new_participants }