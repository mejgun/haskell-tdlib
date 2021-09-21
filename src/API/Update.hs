-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Update where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthorizationState as AuthorizationState
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.MessageInteractionInfo as MessageInteractionInfo
import {-# SOURCE #-} qualified API.Chat as Chat
import {-# SOURCE #-} qualified API.ChatPhotoInfo as ChatPhotoInfo
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.VoiceChat as VoiceChat
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope
import {-# SOURCE #-} qualified API.ChatActionBar as ChatActionBar
import {-# SOURCE #-} qualified API.ChatPosition as ChatPosition
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage
import {-# SOURCE #-} qualified API.ChatFilterInfo as ChatFilterInfo
import {-# SOURCE #-} qualified API.Notification as Notification
import {-# SOURCE #-} qualified API.NotificationGroupType as NotificationGroupType
import {-# SOURCE #-} qualified API.NotificationGroup as NotificationGroup
import {-# SOURCE #-} qualified API.ChatAction as ChatAction
import {-# SOURCE #-} qualified API.UserStatus as UserStatus
import {-# SOURCE #-} qualified API.User as User
import {-# SOURCE #-} qualified API.BasicGroup as BasicGroup
import {-# SOURCE #-} qualified API.Supergroup as Supergroup
import {-# SOURCE #-} qualified API.SecretChat as SecretChat
import {-# SOURCE #-} qualified API.UserFullInfo as UserFullInfo
import {-# SOURCE #-} qualified API.BasicGroupFullInfo as BasicGroupFullInfo
import {-# SOURCE #-} qualified API.SupergroupFullInfo as SupergroupFullInfo
import {-# SOURCE #-} qualified API.MessageContent as MessageContent
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Call as Call
import {-# SOURCE #-} qualified API.GroupCall as GroupCall
import {-# SOURCE #-} qualified API.GroupCallParticipant as GroupCallParticipant
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting
import {-# SOURCE #-} qualified API.ChatList as ChatList
import {-# SOURCE #-} qualified API.OptionValue as OptionValue
import {-# SOURCE #-} qualified API.StickerSet as StickerSet
import {-# SOURCE #-} qualified API.StickerSets as StickerSets
import {-# SOURCE #-} qualified API.Background as Background
import {-# SOURCE #-} qualified API.ChatTheme as ChatTheme
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString
import {-# SOURCE #-} qualified API.ConnectionState as ConnectionState
import {-# SOURCE #-} qualified API.TermsOfService as TermsOfService
import {-# SOURCE #-} qualified API.ChatNearby as ChatNearby
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.SuggestedAction as SuggestedAction
import {-# SOURCE #-} qualified API.ChatType as ChatType
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.CallbackQueryPayload as CallbackQueryPayload
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.Poll as Poll
import {-# SOURCE #-} qualified API.ChatMember as ChatMember
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink

-- |
-- 
-- Contains notifications about data changes
data Update = 
 -- |
 -- 
 -- The user authorization state has changed 
 -- 
 -- __authorization_state__ New authorization state
 UpdateAuthorizationState { authorization_state :: Maybe AuthorizationState.AuthorizationState }  |
 -- |
 -- 
 -- A new message was received; can also be an outgoing message 
 -- 
 -- __message__ The new message
 UpdateNewMessage { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
 -- 
 -- __chat_id__ The chat identifier of the sent message
 -- 
 -- __message_id__ A temporary message identifier
 UpdateMessageSendAcknowledged { message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A message has been successfully sent 
 -- 
 -- __message__ Information about the sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change
 -- 
 -- __old_message_id__ The previous temporary message identifier
 UpdateMessageSendSucceeded { old_message_id :: Maybe Int, message :: Maybe Message.Message }  |
 -- |
 -- 
 -- A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
 -- 
 -- __message__ Contains information about the message which failed to send
 -- 
 -- __old_message_id__ The previous temporary message identifier
 -- 
 -- __error_code__ An error code
 -- 
 -- __error_message__ Error message
 UpdateMessageSendFailed { error_message :: Maybe String, error_code :: Maybe Int, old_message_id :: Maybe Int, message :: Maybe Message.Message }  |
 -- |
 -- 
 -- The message content has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 -- 
 -- __new_content__ New message content
 UpdateMessageContent { new_content :: Maybe MessageContent.MessageContent, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A message was edited. Changes in the message content will come in a separate updateMessageContent 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 -- 
 -- __edit_date__ Point in time (Unix timestamp) when the message was edited
 -- 
 -- __reply_markup__ New message reply markup; may be null
 UpdateMessageEdited { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, edit_date :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The message pinned state was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ The message identifier
 -- 
 -- __is_pinned__ True, if the message is pinned
 UpdateMessageIsPinned { is_pinned :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The information about interactions with a message has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 -- 
 -- __interaction_info__ New information about interactions with the message; may be null
 UpdateMessageInteractionInfo { interaction_info :: Maybe MessageInteractionInfo.MessageInteractionInfo, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 UpdateMessageContentOpened { message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A message with an unread mention was read 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 -- 
 -- __unread_mention_count__ The new number of unread mention messages left in the chat
 UpdateMessageMentionRead { unread_mention_count :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A message with a live location was viewed. When the update is received, the application is supposed to update the live location
 -- 
 -- __chat_id__ Identifier of the chat with the live location message
 -- 
 -- __message_id__ Identifier of the message with live location
 UpdateMessageLiveLocationViewed { message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates 
 -- 
 -- __chat__ The chat
 UpdateNewChat { chat :: Maybe Chat.Chat }  |
 -- |
 -- 
 -- The title of a chat was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __title__ The new chat title
 UpdateChatTitle { title :: Maybe String, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat photo was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __photo__ The new chat photo; may be null
 UpdateChatPhoto { photo :: Maybe ChatPhotoInfo.ChatPhotoInfo, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- Chat permissions was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __permissions__ The new chat permissions
 UpdateChatPermissions { permissions :: Maybe ChatPermissions.ChatPermissions, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __last_message__ The new last message in the chat; may be null
 -- 
 -- __positions__ The new chat positions in the chat lists
 UpdateChatLastMessage { positions :: Maybe [ChatPosition.ChatPosition], last_message :: Maybe Message.Message, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __position__ New chat position. If new order is 0, then the chat needs to be removed from the list
 UpdateChatPosition { position :: Maybe ChatPosition.ChatPosition, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat was marked as unread or was read 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __is_marked_as_unread__ New value of is_marked_as_unread
 UpdateChatIsMarkedAsUnread { is_marked_as_unread :: Maybe Bool, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat was blocked or unblocked 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __is_blocked__ New value of is_blocked
 UpdateChatIsBlocked { is_blocked :: Maybe Bool, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat's has_scheduled_messages field has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __has_scheduled_messages__ New value of has_scheduled_messages
 UpdateChatHasScheduledMessages { has_scheduled_messages :: Maybe Bool, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat voice chat state has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __voice_chat__ New value of voice_chat
 UpdateChatVoiceChat { voice_chat :: Maybe VoiceChat.VoiceChat, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The value of the default disable_notification parameter, used when a message is sent to the chat, was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __default_disable_notification__ The new default_disable_notification value
 UpdateChatDefaultDisableNotification { default_disable_notification :: Maybe Bool, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- Incoming messages were read or number of unread messages has been changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __last_read_inbox_message_id__ Identifier of the last read incoming message
 -- 
 -- __unread_count__ The number of unread messages left in the chat
 UpdateChatReadInbox { unread_count :: Maybe Int, last_read_inbox_message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- Outgoing messages were read 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __last_read_outbox_message_id__ Identifier of last read outgoing message
 UpdateChatReadOutbox { last_read_outbox_message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The chat unread_mention_count has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __unread_mention_count__ The number of unread mention messages left in the chat
 UpdateChatUnreadMentionCount { unread_mention_count :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- Notification settings for a chat were changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __notification_settings__ The new notification settings
 UpdateChatNotificationSettings { _notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- Notification settings for some type of chats were updated 
 -- 
 -- __scope__ Types of chats for which notification settings were updated
 -- 
 -- __notification_settings__ The new notification settings
 UpdateScopeNotificationSettings { notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  |
 -- |
 -- 
 -- The message Time To Live setting for a chat was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_ttl_setting__ New value of message_ttl_setting
 UpdateChatMessageTtlSetting { message_ttl_setting :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The chat action bar was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __action_bar__ The new value of the action bar; may be null
 UpdateChatActionBar { action_bar :: Maybe ChatActionBar.ChatActionBar, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The chat theme was changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __theme_name__ The new name of the chat theme; may be empty if theme was reset to default
 UpdateChatTheme { theme_name :: Maybe String, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __reply_markup_message_id__ Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
 UpdateChatReplyMarkup { reply_markup_message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __draft_message__ The new draft message; may be null
 -- 
 -- __positions__ The new chat positions in the chat lists
 UpdateChatDraftMessage { positions :: Maybe [ChatPosition.ChatPosition], draft_message :: Maybe DraftMessage.DraftMessage, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The list of chat filters or a chat filter has changed 
 -- 
 -- __chat_filters__ The new list of chat filters
 UpdateChatFilters { chat_filters :: Maybe [ChatFilterInfo.ChatFilterInfo] }  |
 -- |
 -- 
 -- The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed 
 -- 
 -- __chat_id__ Identifier of the chat
 -- 
 -- __online_member_count__ New number of online members in the chat, or 0 if unknown
 UpdateChatOnlineMemberCount { online_member_count :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A notification was changed 
 -- 
 -- __notification_group_id__ Unique notification group identifier
 -- 
 -- __notification__ Changed notification
 UpdateNotification { notification :: Maybe Notification.Notification, notification_group_id :: Maybe Int }  |
 -- |
 -- 
 -- A list of active notifications in a notification group has changed
 -- 
 -- __notification_group_id__ Unique notification group identifier
 -- 
 -- __type__ New type of the notification group
 -- 
 -- __chat_id__ Identifier of a chat to which all notifications in the group belong
 -- 
 -- __notification_settings_chat_id__ Chat identifier, which notification settings must be applied to the added notifications
 -- 
 -- __is_silent__ True, if the notifications should be shown without sound
 -- 
 -- __total_count__ Total number of unread notifications in the group, can be bigger than number of active notifications
 -- 
 -- __added_notifications__ List of added group notifications, sorted by notification ID
 -- 
 -- __removed_notification_ids__ Identifiers of removed group notifications, sorted by notification ID
 UpdateNotificationGroup { removed_notification_ids :: Maybe [Int], added_notifications :: Maybe [Notification.Notification], total_count :: Maybe Int, is_silent :: Maybe Bool, notification_settings_chat_id :: Maybe Int, chat_id :: Maybe Int, __type :: Maybe NotificationGroupType.NotificationGroupType, notification_group_id :: Maybe Int }  |
 -- |
 -- 
 -- Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update 
 -- 
 -- __groups__ Lists of active notification groups
 UpdateActiveNotifications { groups :: Maybe [NotificationGroup.NotificationGroup] }  |
 -- |
 -- 
 -- Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
 -- 
 -- __have_delayed_notifications__ True, if there are some delayed notification updates, which will be sent soon
 -- 
 -- __have_unreceived_notifications__ True, if there can be some yet unreceived notifications, which are being fetched from the server
 UpdateHavePendingNotifications { have_unreceived_notifications :: Maybe Bool, have_delayed_notifications :: Maybe Bool }  |
 -- |
 -- 
 -- Some messages were deleted 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_ids__ Identifiers of the deleted messages
 -- 
 -- __is_permanent__ True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
 -- 
 -- __from_cache__ True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
 UpdateDeleteMessages { from_cache :: Maybe Bool, is_permanent :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  |
 -- |
 -- 
 -- User activity in the chat has changed 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_thread_id__ If not 0, a message thread identifier in which the action was performed
 -- 
 -- __user_id__ Identifier of a user performing an action
 -- 
 -- __action__ The action description
 UpdateUserChatAction { action :: Maybe ChatAction.ChatAction, user_id :: Maybe Int, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The user went online or offline 
 -- 
 -- __user_id__ User identifier
 -- 
 -- __status__ New status of the user
 UpdateUserStatus { status :: Maybe UserStatus.UserStatus, user_id :: Maybe Int }  |
 -- |
 -- 
 -- Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application 
 -- 
 -- __user__ New data about the user
 UpdateUser { user :: Maybe User.User }  |
 -- |
 -- 
 -- Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application 
 -- 
 -- __basic_group__ New data about the group
 UpdateBasicGroup { basic_group :: Maybe BasicGroup.BasicGroup }  |
 -- |
 -- 
 -- Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application 
 -- 
 -- __supergroup__ New data about the supergroup
 UpdateSupergroup { supergroup :: Maybe Supergroup.Supergroup }  |
 -- |
 -- 
 -- Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application 
 -- 
 -- __secret_chat__ New data about the secret chat
 UpdateSecretChat { secret_chat :: Maybe SecretChat.SecretChat }  |
 -- |
 -- 
 -- Some data from userFullInfo has been changed 
 -- 
 -- __user_id__ User identifier
 -- 
 -- __user_full_info__ New full information about the user
 UpdateUserFullInfo { user_full_info :: Maybe UserFullInfo.UserFullInfo, user_id :: Maybe Int }  |
 -- |
 -- 
 -- Some data from basicGroupFullInfo has been changed 
 -- 
 -- __basic_group_id__ Identifier of a basic group
 -- 
 -- __basic_group_full_info__ New full information about the group
 UpdateBasicGroupFullInfo { basic_group_full_info :: Maybe BasicGroupFullInfo.BasicGroupFullInfo, basic_group_id :: Maybe Int }  |
 -- |
 -- 
 -- Some data from supergroupFullInfo has been changed 
 -- 
 -- __supergroup_id__ Identifier of the supergroup or channel
 -- 
 -- __supergroup_full_info__ New full information about the supergroup
 UpdateSupergroupFullInfo { supergroup_full_info :: Maybe SupergroupFullInfo.SupergroupFullInfo, supergroup_id :: Maybe Int }  |
 -- |
 -- 
 -- Service notification from the server. Upon receiving this the application must show a popup with the content of the notification
 -- 
 -- __type__ Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" should be shown under notification; if user presses the second, all local data should be destroyed using Destroy method
 -- 
 -- __content__ Notification content
 UpdateServiceNotification { content :: Maybe MessageContent.MessageContent, _type :: Maybe String }  |
 -- |
 -- 
 -- Information about a file was updated 
 -- 
 -- __file__ New data about the file
 UpdateFile { file :: Maybe File.File }  |
 -- |
 -- 
 -- The file generation process needs to be started by the application
 -- 
 -- __generation_id__ Unique identifier for the generation process
 -- 
 -- __original_path__ The path to a file from which a new file is generated; may be empty
 -- 
 -- __destination_path__ The path to a file that should be created and where the new file should be generated
 -- 
 -- __conversion__ String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which should be downloaded by the application
 UpdateFileGenerationStart { conversion :: Maybe String, destination_path :: Maybe String, original_path :: Maybe String, generation_id :: Maybe Int }  |
 -- |
 -- 
 -- File generation is no longer needed 
 -- 
 -- __generation_id__ Unique identifier for the generation process
 UpdateFileGenerationStop { generation_id :: Maybe Int }  |
 -- |
 -- 
 -- New call was created or information about a call was updated 
 -- 
 -- __call__ New data about a call
 UpdateCall { call :: Maybe Call.Call }  |
 -- |
 -- 
 -- Information about a group call was updated 
 -- 
 -- __group_call__ New data about a group call
 UpdateGroupCall { group_call :: Maybe GroupCall.GroupCall }  |
 -- |
 -- 
 -- Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
 -- 
 -- __group_call_id__ Identifier of group call
 -- 
 -- __participant__ New data about a participant
 UpdateGroupCallParticipant { participant :: Maybe GroupCallParticipant.GroupCallParticipant, group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- New call signaling data arrived 
 -- 
 -- __call_id__ The call identifier
 -- 
 -- __data__ The data
 UpdateNewCallSignalingData { _data :: Maybe String, call_id :: Maybe Int }  |
 -- |
 -- 
 -- Some privacy setting rules have been changed 
 -- 
 -- __setting__ The privacy setting
 -- 
 -- __rules__ New privacy rules
 UpdateUserPrivacySettingRules { rules :: Maybe UserPrivacySettingRules.UserPrivacySettingRules, setting :: Maybe UserPrivacySetting.UserPrivacySetting }  |
 -- |
 -- 
 -- Number of unread messages in a chat list has changed. This update is sent only if the message database is used 
 -- 
 -- __chat_list__ The chat list with changed number of unread messages
 -- 
 -- __unread_count__ Total number of unread messages
 -- 
 -- __unread_unmuted_count__ Total number of unread messages in unmuted chats
 UpdateUnreadMessageCount { unread_unmuted_count :: Maybe Int, unread_count :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  |
 -- |
 -- 
 -- Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
 -- 
 -- __chat_list__ The chat list with changed number of unread messages
 -- 
 -- __total_count__ Approximate total number of chats in the chat list
 -- 
 -- __unread_count__ Total number of unread chats
 -- 
 -- __unread_unmuted_count__ Total number of unread unmuted chats
 -- 
 -- __marked_as_unread_count__ Total number of chats marked as unread
 -- 
 -- __marked_as_unread_unmuted_count__ Total number of unmuted chats marked as unread
 UpdateUnreadChatCount { marked_as_unread_unmuted_count :: Maybe Int, marked_as_unread_count :: Maybe Int, unread_unmuted_count :: Maybe Int, unread_count :: Maybe Int, total_count :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  |
 -- |
 -- 
 -- An option changed its value 
 -- 
 -- __name__ The option name
 -- 
 -- __value__ The new option value
 UpdateOption { value :: Maybe OptionValue.OptionValue, name :: Maybe String }  |
 -- |
 -- 
 -- A sticker set has changed 
 -- 
 -- __sticker_set__ The sticker set
 UpdateStickerSet { sticker_set :: Maybe StickerSet.StickerSet }  |
 -- |
 -- 
 -- The list of installed sticker sets was updated 
 -- 
 -- __is_masks__ True, if the list of installed mask sticker sets was updated
 -- 
 -- __sticker_set_ids__ The new list of installed ordinary sticker sets
 UpdateInstalledStickerSets { sticker_set_ids :: Maybe [Int], is_masks :: Maybe Bool }  |
 -- |
 -- 
 -- The list of trending sticker sets was updated or some of them were viewed 
 -- 
 -- __sticker_sets__ The prefix of the list of trending sticker sets with the newest trending sticker sets
 UpdateTrendingStickerSets { sticker_sets :: Maybe StickerSets.StickerSets }  |
 -- |
 -- 
 -- The list of recently used stickers was updated 
 -- 
 -- __is_attached__ True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated
 -- 
 -- __sticker_ids__ The new list of file identifiers of recently used stickers
 UpdateRecentStickers { sticker_ids :: Maybe [Int], is_attached :: Maybe Bool }  |
 -- |
 -- 
 -- The list of favorite stickers was updated 
 -- 
 -- __sticker_ids__ The new list of file identifiers of favorite stickers
 UpdateFavoriteStickers { sticker_ids :: Maybe [Int] }  |
 -- |
 -- 
 -- The list of saved animations was updated 
 -- 
 -- __animation_ids__ The new list of file identifiers of saved animations
 UpdateSavedAnimations { animation_ids :: Maybe [Int] }  |
 -- |
 -- 
 -- The selected background has changed 
 -- 
 -- __for_dark_theme__ True, if background for dark theme has changed
 -- 
 -- __background__ The new selected background; may be null
 UpdateSelectedBackground { background :: Maybe Background.Background, for_dark_theme :: Maybe Bool }  |
 -- |
 -- 
 -- The list of available chat themes has changed 
 -- 
 -- __chat_themes__ The new list of chat themes
 UpdateChatThemes { chat_themes :: Maybe [ChatTheme.ChatTheme] }  |
 -- |
 -- 
 -- Some language pack strings have been updated 
 -- 
 -- __localization_target__ Localization target to which the language pack belongs
 -- 
 -- __language_pack_id__ Identifier of the updated language pack
 -- 
 -- __strings__ List of changed language pack strings
 UpdateLanguagePackStrings { strings :: Maybe [LanguagePackString.LanguagePackString], language_pack_id :: Maybe String, localization_target :: Maybe String }  |
 -- |
 -- 
 -- The connection state has changed. This update must be used only to show a human-readable description of the connection state 
 -- 
 -- __state__ The new connection state
 UpdateConnectionState { state :: Maybe ConnectionState.ConnectionState }  |
 -- |
 -- 
 -- New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method should be called with the reason "Decline ToS update" 
 -- 
 -- __terms_of_service_id__ Identifier of the terms of service
 -- 
 -- __terms_of_service__ The new terms of service
 UpdateTermsOfService { terms_of_service :: Maybe TermsOfService.TermsOfService, terms_of_service_id :: Maybe String }  |
 -- |
 -- 
 -- The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request 
 -- 
 -- __users_nearby__ The new list of users nearby
 UpdateUsersNearby { users_nearby :: Maybe [ChatNearby.ChatNearby] }  |
 -- |
 -- 
 -- The list of supported dice emojis has changed 
 -- 
 -- __emojis__ The new list of supported dice emojis
 UpdateDiceEmojis { emojis :: Maybe [String] }  |
 -- |
 -- 
 -- Some animated emoji message was clicked and a big animated sticker should be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __message_id__ Message identifier
 -- 
 -- __sticker__ The animated sticker to be played
 UpdateAnimatedEmojiMessageClicked { sticker :: Maybe Sticker.Sticker, message_id :: Maybe Int, chat_id :: Maybe Int }  |
 -- |
 -- 
 -- The parameters of animation search through GetOption("animation_search_bot_username") bot has changed 
 -- 
 -- __provider__ Name of the animation search provider
 -- 
 -- __emojis__ The new list of emojis suggested for searching
 UpdateAnimationSearchParameters { emojis :: Maybe [String], provider :: Maybe String }  |
 -- |
 -- 
 -- The list of suggested to the user actions has changed 
 -- 
 -- __added_actions__ Added suggested actions
 -- 
 -- __removed_actions__ Removed suggested actions
 UpdateSuggestedActions { removed_actions :: Maybe [SuggestedAction.SuggestedAction], added_actions :: Maybe [SuggestedAction.SuggestedAction] }  |
 -- |
 -- 
 -- A new incoming inline query; for bots only 
 -- 
 -- __id__ Unique query identifier
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __user_location__ User location; may be null
 -- 
 -- __chat_type__ Contains information about the type of the chat, from which the query originated; may be null if unknown
 -- 
 -- __query__ Text of the query
 -- 
 -- __offset__ Offset of the first entry to return
 UpdateNewInlineQuery { offset :: Maybe String, query :: Maybe String, chat_type :: Maybe ChatType.ChatType, user_location :: Maybe Location.Location, sender_user_id :: Maybe Int, _id :: Maybe Int }  |
 -- |
 -- 
 -- The user has chosen a result of an inline query; for bots only 
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __user_location__ User location; may be null
 -- 
 -- __query__ Text of the query
 -- 
 -- __result_id__ Identifier of the chosen result
 -- 
 -- __inline_message_id__ Identifier of the sent inline message, if known
 UpdateNewChosenInlineResult { inline_message_id :: Maybe String, result_id :: Maybe String, query :: Maybe String, user_location :: Maybe Location.Location, sender_user_id :: Maybe Int }  |
 -- |
 -- 
 -- A new incoming callback query; for bots only 
 -- 
 -- __id__ Unique query identifier
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __chat_id__ Identifier of the chat where the query was sent
 -- 
 -- __message_id__ Identifier of the message, from which the query originated
 -- 
 -- __chat_instance__ Identifier that uniquely corresponds to the chat to which the message was sent
 -- 
 -- __payload__ Query payload
 UpdateNewCallbackQuery { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int, sender_user_id :: Maybe Int, _id :: Maybe Int }  |
 -- |
 -- 
 -- A new incoming callback query from a message sent via a bot; for bots only 
 -- 
 -- __id__ Unique query identifier
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __inline_message_id__ Identifier of the inline message, from which the query originated
 -- 
 -- __chat_instance__ An identifier uniquely corresponding to the chat a message was sent to
 -- 
 -- __payload__ Query payload
 UpdateNewInlineCallbackQuery { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Maybe Int, inline_message_id :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  |
 -- |
 -- 
 -- A new incoming shipping query; for bots only. Only for invoices with flexible price 
 -- 
 -- __id__ Unique query identifier
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __invoice_payload__ Invoice payload
 -- 
 -- __shipping_address__ User shipping address
 UpdateNewShippingQuery { shipping_address :: Maybe Address.Address, invoice_payload :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  |
 -- |
 -- 
 -- A new incoming pre-checkout query; for bots only. Contains full information about a checkout 
 -- 
 -- __id__ Unique query identifier
 -- 
 -- __sender_user_id__ Identifier of the user who sent the query
 -- 
 -- __currency__ Currency for the product price
 -- 
 -- __total_amount__ Total price for the product, in the smallest units of the currency
 -- 
 -- __invoice_payload__ Invoice payload
 -- 
 -- __shipping_option_id__ Identifier of a shipping option chosen by the user; may be empty if not applicable
 -- 
 -- __order_info__ Information about the order; may be null
 UpdateNewPreCheckoutQuery { order_info :: Maybe OrderInfo.OrderInfo, shipping_option_id :: Maybe String, invoice_payload :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  |
 -- |
 -- 
 -- A new incoming event; for bots only 
 -- 
 -- __event__ A JSON-serialized event
 UpdateNewCustomEvent { event :: Maybe String }  |
 -- |
 -- 
 -- A new incoming query; for bots only 
 -- 
 -- __id__ The query identifier
 -- 
 -- __data__ JSON-serialized query data
 -- 
 -- __timeout__ Query timeout
 UpdateNewCustomQuery { timeout :: Maybe Int, _data :: Maybe String, _id :: Maybe Int }  |
 -- |
 -- 
 -- A poll was updated; for bots only 
 -- 
 -- __poll__ New data about the poll
 UpdatePoll { poll :: Maybe Poll.Poll }  |
 -- |
 -- 
 -- A user changed the answer to a poll; for bots only 
 -- 
 -- __poll_id__ Unique poll identifier
 -- 
 -- __user_id__ The user, who changed the answer to the poll
 -- 
 -- __option_ids__ 0-based identifiers of answer options, chosen by the user
 UpdatePollAnswer { option_ids :: Maybe [Int], user_id :: Maybe Int, poll_id :: Maybe Int }  |
 -- |
 -- 
 -- User rights changed in a chat; for bots only 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __actor_user_id__ Identifier of the user, changing the rights
 -- 
 -- __date__ Point in time (Unix timestamp) when the user rights was changed
 -- 
 -- __invite_link__ If user has joined the chat using an invite link, the invite link; may be null
 -- 
 -- __old_chat_member__ Previous chat member
 -- 
 -- __new_chat_member__ New chat member
 UpdateChatMember { new_chat_member :: Maybe ChatMember.ChatMember, old_chat_member :: Maybe ChatMember.ChatMember, invite_link :: Maybe ChatInviteLink.ChatInviteLink, date :: Maybe Int, actor_user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Update where
 toJSON (UpdateAuthorizationState { authorization_state = authorization_state }) =
  A.object [ "@type" A..= T.String "updateAuthorizationState", "authorization_state" A..= authorization_state ]

 toJSON (UpdateNewMessage { message = message }) =
  A.object [ "@type" A..= T.String "updateNewMessage", "message" A..= message ]

 toJSON (UpdateMessageSendAcknowledged { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageSendAcknowledged", "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageSendSucceeded { old_message_id = old_message_id, message = message }) =
  A.object [ "@type" A..= T.String "updateMessageSendSucceeded", "old_message_id" A..= old_message_id, "message" A..= message ]

 toJSON (UpdateMessageSendFailed { error_message = error_message, error_code = error_code, old_message_id = old_message_id, message = message }) =
  A.object [ "@type" A..= T.String "updateMessageSendFailed", "error_message" A..= error_message, "error_code" A..= error_code, "old_message_id" A..= old_message_id, "message" A..= message ]

 toJSON (UpdateMessageContent { new_content = new_content, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageContent", "new_content" A..= new_content, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageEdited { reply_markup = reply_markup, edit_date = edit_date, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageEdited", "reply_markup" A..= reply_markup, "edit_date" A..= edit_date, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageIsPinned { is_pinned = is_pinned, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageIsPinned", "is_pinned" A..= is_pinned, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageInteractionInfo { interaction_info = interaction_info, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageInteractionInfo", "interaction_info" A..= interaction_info, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageContentOpened { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageContentOpened", "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageMentionRead { unread_mention_count = unread_mention_count, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageMentionRead", "unread_mention_count" A..= unread_mention_count, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageLiveLocationViewed { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageLiveLocationViewed", "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateNewChat { chat = chat }) =
  A.object [ "@type" A..= T.String "updateNewChat", "chat" A..= chat ]

 toJSON (UpdateChatTitle { title = title, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatTitle", "title" A..= title, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPhoto { photo = photo, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPhoto", "photo" A..= photo, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPermissions { permissions = permissions, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPermissions", "permissions" A..= permissions, "chat_id" A..= chat_id ]

 toJSON (UpdateChatLastMessage { positions = positions, last_message = last_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatLastMessage", "positions" A..= positions, "last_message" A..= last_message, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPosition { position = position, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPosition", "position" A..= position, "chat_id" A..= chat_id ]

 toJSON (UpdateChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatIsMarkedAsUnread", "is_marked_as_unread" A..= is_marked_as_unread, "chat_id" A..= chat_id ]

 toJSON (UpdateChatIsBlocked { is_blocked = is_blocked, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatIsBlocked", "is_blocked" A..= is_blocked, "chat_id" A..= chat_id ]

 toJSON (UpdateChatHasScheduledMessages { has_scheduled_messages = has_scheduled_messages, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatHasScheduledMessages", "has_scheduled_messages" A..= has_scheduled_messages, "chat_id" A..= chat_id ]

 toJSON (UpdateChatVoiceChat { voice_chat = voice_chat, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatVoiceChat", "voice_chat" A..= voice_chat, "chat_id" A..= chat_id ]

 toJSON (UpdateChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatDefaultDisableNotification", "default_disable_notification" A..= default_disable_notification, "chat_id" A..= chat_id ]

 toJSON (UpdateChatReadInbox { unread_count = unread_count, last_read_inbox_message_id = last_read_inbox_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatReadInbox", "unread_count" A..= unread_count, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateChatReadOutbox { last_read_outbox_message_id = last_read_outbox_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatReadOutbox", "last_read_outbox_message_id" A..= last_read_outbox_message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateChatUnreadMentionCount { unread_mention_count = unread_mention_count, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatUnreadMentionCount", "unread_mention_count" A..= unread_mention_count, "chat_id" A..= chat_id ]

 toJSON (UpdateChatNotificationSettings { _notification_settings = _notification_settings, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatNotificationSettings", "notification_settings" A..= _notification_settings, "chat_id" A..= chat_id ]

 toJSON (UpdateScopeNotificationSettings { notification_settings = notification_settings, scope = scope }) =
  A.object [ "@type" A..= T.String "updateScopeNotificationSettings", "notification_settings" A..= notification_settings, "scope" A..= scope ]

 toJSON (UpdateChatMessageTtlSetting { message_ttl_setting = message_ttl_setting, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatMessageTtlSetting", "message_ttl_setting" A..= message_ttl_setting, "chat_id" A..= chat_id ]

 toJSON (UpdateChatActionBar { action_bar = action_bar, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatActionBar", "action_bar" A..= action_bar, "chat_id" A..= chat_id ]

 toJSON (UpdateChatTheme { theme_name = theme_name, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatTheme", "theme_name" A..= theme_name, "chat_id" A..= chat_id ]

 toJSON (UpdateChatReplyMarkup { reply_markup_message_id = reply_markup_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatReplyMarkup", "reply_markup_message_id" A..= reply_markup_message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateChatDraftMessage { positions = positions, draft_message = draft_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatDraftMessage", "positions" A..= positions, "draft_message" A..= draft_message, "chat_id" A..= chat_id ]

 toJSON (UpdateChatFilters { chat_filters = chat_filters }) =
  A.object [ "@type" A..= T.String "updateChatFilters", "chat_filters" A..= chat_filters ]

 toJSON (UpdateChatOnlineMemberCount { online_member_count = online_member_count, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatOnlineMemberCount", "online_member_count" A..= online_member_count, "chat_id" A..= chat_id ]

 toJSON (UpdateNotification { notification = notification, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "updateNotification", "notification" A..= notification, "notification_group_id" A..= notification_group_id ]

 toJSON (UpdateNotificationGroup { removed_notification_ids = removed_notification_ids, added_notifications = added_notifications, total_count = total_count, is_silent = is_silent, notification_settings_chat_id = notification_settings_chat_id, chat_id = chat_id, __type = __type, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "updateNotificationGroup", "removed_notification_ids" A..= removed_notification_ids, "added_notifications" A..= added_notifications, "total_count" A..= total_count, "is_silent" A..= is_silent, "notification_settings_chat_id" A..= notification_settings_chat_id, "chat_id" A..= chat_id, "type" A..= __type, "notification_group_id" A..= notification_group_id ]

 toJSON (UpdateActiveNotifications { groups = groups }) =
  A.object [ "@type" A..= T.String "updateActiveNotifications", "groups" A..= groups ]

 toJSON (UpdateHavePendingNotifications { have_unreceived_notifications = have_unreceived_notifications, have_delayed_notifications = have_delayed_notifications }) =
  A.object [ "@type" A..= T.String "updateHavePendingNotifications", "have_unreceived_notifications" A..= have_unreceived_notifications, "have_delayed_notifications" A..= have_delayed_notifications ]

 toJSON (UpdateDeleteMessages { from_cache = from_cache, is_permanent = is_permanent, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateDeleteMessages", "from_cache" A..= from_cache, "is_permanent" A..= is_permanent, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

 toJSON (UpdateUserChatAction { action = action, user_id = user_id, message_thread_id = message_thread_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateUserChatAction", "action" A..= action, "user_id" A..= user_id, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

 toJSON (UpdateUserStatus { status = status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "updateUserStatus", "status" A..= status, "user_id" A..= user_id ]

 toJSON (UpdateUser { user = user }) =
  A.object [ "@type" A..= T.String "updateUser", "user" A..= user ]

 toJSON (UpdateBasicGroup { basic_group = basic_group }) =
  A.object [ "@type" A..= T.String "updateBasicGroup", "basic_group" A..= basic_group ]

 toJSON (UpdateSupergroup { supergroup = supergroup }) =
  A.object [ "@type" A..= T.String "updateSupergroup", "supergroup" A..= supergroup ]

 toJSON (UpdateSecretChat { secret_chat = secret_chat }) =
  A.object [ "@type" A..= T.String "updateSecretChat", "secret_chat" A..= secret_chat ]

 toJSON (UpdateUserFullInfo { user_full_info = user_full_info, user_id = user_id }) =
  A.object [ "@type" A..= T.String "updateUserFullInfo", "user_full_info" A..= user_full_info, "user_id" A..= user_id ]

 toJSON (UpdateBasicGroupFullInfo { basic_group_full_info = basic_group_full_info, basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "updateBasicGroupFullInfo", "basic_group_full_info" A..= basic_group_full_info, "basic_group_id" A..= basic_group_id ]

 toJSON (UpdateSupergroupFullInfo { supergroup_full_info = supergroup_full_info, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "updateSupergroupFullInfo", "supergroup_full_info" A..= supergroup_full_info, "supergroup_id" A..= supergroup_id ]

 toJSON (UpdateServiceNotification { content = content, _type = _type }) =
  A.object [ "@type" A..= T.String "updateServiceNotification", "content" A..= content, "type" A..= _type ]

 toJSON (UpdateFile { file = file }) =
  A.object [ "@type" A..= T.String "updateFile", "file" A..= file ]

 toJSON (UpdateFileGenerationStart { conversion = conversion, destination_path = destination_path, original_path = original_path, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "updateFileGenerationStart", "conversion" A..= conversion, "destination_path" A..= destination_path, "original_path" A..= original_path, "generation_id" A..= generation_id ]

 toJSON (UpdateFileGenerationStop { generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "updateFileGenerationStop", "generation_id" A..= generation_id ]

 toJSON (UpdateCall { call = call }) =
  A.object [ "@type" A..= T.String "updateCall", "call" A..= call ]

 toJSON (UpdateGroupCall { group_call = group_call }) =
  A.object [ "@type" A..= T.String "updateGroupCall", "group_call" A..= group_call ]

 toJSON (UpdateGroupCallParticipant { participant = participant, group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "updateGroupCallParticipant", "participant" A..= participant, "group_call_id" A..= group_call_id ]

 toJSON (UpdateNewCallSignalingData { _data = _data, call_id = call_id }) =
  A.object [ "@type" A..= T.String "updateNewCallSignalingData", "data" A..= _data, "call_id" A..= call_id ]

 toJSON (UpdateUserPrivacySettingRules { rules = rules, setting = setting }) =
  A.object [ "@type" A..= T.String "updateUserPrivacySettingRules", "rules" A..= rules, "setting" A..= setting ]

 toJSON (UpdateUnreadMessageCount { unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "updateUnreadMessageCount", "unread_unmuted_count" A..= unread_unmuted_count, "unread_count" A..= unread_count, "chat_list" A..= chat_list ]

 toJSON (UpdateUnreadChatCount { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count, marked_as_unread_count = marked_as_unread_count, unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, total_count = total_count, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "updateUnreadChatCount", "marked_as_unread_unmuted_count" A..= marked_as_unread_unmuted_count, "marked_as_unread_count" A..= marked_as_unread_count, "unread_unmuted_count" A..= unread_unmuted_count, "unread_count" A..= unread_count, "total_count" A..= total_count, "chat_list" A..= chat_list ]

 toJSON (UpdateOption { value = value, name = name }) =
  A.object [ "@type" A..= T.String "updateOption", "value" A..= value, "name" A..= name ]

 toJSON (UpdateStickerSet { sticker_set = sticker_set }) =
  A.object [ "@type" A..= T.String "updateStickerSet", "sticker_set" A..= sticker_set ]

 toJSON (UpdateInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "updateInstalledStickerSets", "sticker_set_ids" A..= sticker_set_ids, "is_masks" A..= is_masks ]

 toJSON (UpdateTrendingStickerSets { sticker_sets = sticker_sets }) =
  A.object [ "@type" A..= T.String "updateTrendingStickerSets", "sticker_sets" A..= sticker_sets ]

 toJSON (UpdateRecentStickers { sticker_ids = sticker_ids, is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "updateRecentStickers", "sticker_ids" A..= sticker_ids, "is_attached" A..= is_attached ]

 toJSON (UpdateFavoriteStickers { sticker_ids = sticker_ids }) =
  A.object [ "@type" A..= T.String "updateFavoriteStickers", "sticker_ids" A..= sticker_ids ]

 toJSON (UpdateSavedAnimations { animation_ids = animation_ids }) =
  A.object [ "@type" A..= T.String "updateSavedAnimations", "animation_ids" A..= animation_ids ]

 toJSON (UpdateSelectedBackground { background = background, for_dark_theme = for_dark_theme }) =
  A.object [ "@type" A..= T.String "updateSelectedBackground", "background" A..= background, "for_dark_theme" A..= for_dark_theme ]

 toJSON (UpdateChatThemes { chat_themes = chat_themes }) =
  A.object [ "@type" A..= T.String "updateChatThemes", "chat_themes" A..= chat_themes ]

 toJSON (UpdateLanguagePackStrings { strings = strings, language_pack_id = language_pack_id, localization_target = localization_target }) =
  A.object [ "@type" A..= T.String "updateLanguagePackStrings", "strings" A..= strings, "language_pack_id" A..= language_pack_id, "localization_target" A..= localization_target ]

 toJSON (UpdateConnectionState { state = state }) =
  A.object [ "@type" A..= T.String "updateConnectionState", "state" A..= state ]

 toJSON (UpdateTermsOfService { terms_of_service = terms_of_service, terms_of_service_id = terms_of_service_id }) =
  A.object [ "@type" A..= T.String "updateTermsOfService", "terms_of_service" A..= terms_of_service, "terms_of_service_id" A..= terms_of_service_id ]

 toJSON (UpdateUsersNearby { users_nearby = users_nearby }) =
  A.object [ "@type" A..= T.String "updateUsersNearby", "users_nearby" A..= users_nearby ]

 toJSON (UpdateDiceEmojis { emojis = emojis }) =
  A.object [ "@type" A..= T.String "updateDiceEmojis", "emojis" A..= emojis ]

 toJSON (UpdateAnimatedEmojiMessageClicked { sticker = sticker, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateAnimatedEmojiMessageClicked", "sticker" A..= sticker, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateAnimationSearchParameters { emojis = emojis, provider = provider }) =
  A.object [ "@type" A..= T.String "updateAnimationSearchParameters", "emojis" A..= emojis, "provider" A..= provider ]

 toJSON (UpdateSuggestedActions { removed_actions = removed_actions, added_actions = added_actions }) =
  A.object [ "@type" A..= T.String "updateSuggestedActions", "removed_actions" A..= removed_actions, "added_actions" A..= added_actions ]

 toJSON (UpdateNewInlineQuery { offset = offset, query = query, chat_type = chat_type, user_location = user_location, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewInlineQuery", "offset" A..= offset, "query" A..= query, "chat_type" A..= chat_type, "user_location" A..= user_location, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

 toJSON (UpdateNewChosenInlineResult { inline_message_id = inline_message_id, result_id = result_id, query = query, user_location = user_location, sender_user_id = sender_user_id }) =
  A.object [ "@type" A..= T.String "updateNewChosenInlineResult", "inline_message_id" A..= inline_message_id, "result_id" A..= result_id, "query" A..= query, "user_location" A..= user_location, "sender_user_id" A..= sender_user_id ]

 toJSON (UpdateNewCallbackQuery { payload = payload, chat_instance = chat_instance, message_id = message_id, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewCallbackQuery", "payload" A..= payload, "chat_instance" A..= chat_instance, "message_id" A..= message_id, "chat_id" A..= chat_id, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

 toJSON (UpdateNewInlineCallbackQuery { payload = payload, chat_instance = chat_instance, inline_message_id = inline_message_id, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewInlineCallbackQuery", "payload" A..= payload, "chat_instance" A..= chat_instance, "inline_message_id" A..= inline_message_id, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

 toJSON (UpdateNewShippingQuery { shipping_address = shipping_address, invoice_payload = invoice_payload, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewShippingQuery", "shipping_address" A..= shipping_address, "invoice_payload" A..= invoice_payload, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

 toJSON (UpdateNewPreCheckoutQuery { order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewPreCheckoutQuery", "order_info" A..= order_info, "shipping_option_id" A..= shipping_option_id, "invoice_payload" A..= invoice_payload, "total_amount" A..= total_amount, "currency" A..= currency, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

 toJSON (UpdateNewCustomEvent { event = event }) =
  A.object [ "@type" A..= T.String "updateNewCustomEvent", "event" A..= event ]

 toJSON (UpdateNewCustomQuery { timeout = timeout, _data = _data, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewCustomQuery", "timeout" A..= timeout, "data" A..= _data, "id" A..= _id ]

 toJSON (UpdatePoll { poll = poll }) =
  A.object [ "@type" A..= T.String "updatePoll", "poll" A..= poll ]

 toJSON (UpdatePollAnswer { option_ids = option_ids, user_id = user_id, poll_id = poll_id }) =
  A.object [ "@type" A..= T.String "updatePollAnswer", "option_ids" A..= option_ids, "user_id" A..= user_id, "poll_id" A..= poll_id ]

 toJSON (UpdateChatMember { new_chat_member = new_chat_member, old_chat_member = old_chat_member, invite_link = invite_link, date = date, actor_user_id = actor_user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatMember", "new_chat_member" A..= new_chat_member, "old_chat_member" A..= old_chat_member, "invite_link" A..= invite_link, "date" A..= date, "actor_user_id" A..= actor_user_id, "chat_id" A..= chat_id ]

instance T.FromJSON Update where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "updateAuthorizationState" -> parseUpdateAuthorizationState v
   "updateNewMessage" -> parseUpdateNewMessage v
   "updateMessageSendAcknowledged" -> parseUpdateMessageSendAcknowledged v
   "updateMessageSendSucceeded" -> parseUpdateMessageSendSucceeded v
   "updateMessageSendFailed" -> parseUpdateMessageSendFailed v
   "updateMessageContent" -> parseUpdateMessageContent v
   "updateMessageEdited" -> parseUpdateMessageEdited v
   "updateMessageIsPinned" -> parseUpdateMessageIsPinned v
   "updateMessageInteractionInfo" -> parseUpdateMessageInteractionInfo v
   "updateMessageContentOpened" -> parseUpdateMessageContentOpened v
   "updateMessageMentionRead" -> parseUpdateMessageMentionRead v
   "updateMessageLiveLocationViewed" -> parseUpdateMessageLiveLocationViewed v
   "updateNewChat" -> parseUpdateNewChat v
   "updateChatTitle" -> parseUpdateChatTitle v
   "updateChatPhoto" -> parseUpdateChatPhoto v
   "updateChatPermissions" -> parseUpdateChatPermissions v
   "updateChatLastMessage" -> parseUpdateChatLastMessage v
   "updateChatPosition" -> parseUpdateChatPosition v
   "updateChatIsMarkedAsUnread" -> parseUpdateChatIsMarkedAsUnread v
   "updateChatIsBlocked" -> parseUpdateChatIsBlocked v
   "updateChatHasScheduledMessages" -> parseUpdateChatHasScheduledMessages v
   "updateChatVoiceChat" -> parseUpdateChatVoiceChat v
   "updateChatDefaultDisableNotification" -> parseUpdateChatDefaultDisableNotification v
   "updateChatReadInbox" -> parseUpdateChatReadInbox v
   "updateChatReadOutbox" -> parseUpdateChatReadOutbox v
   "updateChatUnreadMentionCount" -> parseUpdateChatUnreadMentionCount v
   "updateChatNotificationSettings" -> parseUpdateChatNotificationSettings v
   "updateScopeNotificationSettings" -> parseUpdateScopeNotificationSettings v
   "updateChatMessageTtlSetting" -> parseUpdateChatMessageTtlSetting v
   "updateChatActionBar" -> parseUpdateChatActionBar v
   "updateChatTheme" -> parseUpdateChatTheme v
   "updateChatReplyMarkup" -> parseUpdateChatReplyMarkup v
   "updateChatDraftMessage" -> parseUpdateChatDraftMessage v
   "updateChatFilters" -> parseUpdateChatFilters v
   "updateChatOnlineMemberCount" -> parseUpdateChatOnlineMemberCount v
   "updateNotification" -> parseUpdateNotification v
   "updateNotificationGroup" -> parseUpdateNotificationGroup v
   "updateActiveNotifications" -> parseUpdateActiveNotifications v
   "updateHavePendingNotifications" -> parseUpdateHavePendingNotifications v
   "updateDeleteMessages" -> parseUpdateDeleteMessages v
   "updateUserChatAction" -> parseUpdateUserChatAction v
   "updateUserStatus" -> parseUpdateUserStatus v
   "updateUser" -> parseUpdateUser v
   "updateBasicGroup" -> parseUpdateBasicGroup v
   "updateSupergroup" -> parseUpdateSupergroup v
   "updateSecretChat" -> parseUpdateSecretChat v
   "updateUserFullInfo" -> parseUpdateUserFullInfo v
   "updateBasicGroupFullInfo" -> parseUpdateBasicGroupFullInfo v
   "updateSupergroupFullInfo" -> parseUpdateSupergroupFullInfo v
   "updateServiceNotification" -> parseUpdateServiceNotification v
   "updateFile" -> parseUpdateFile v
   "updateFileGenerationStart" -> parseUpdateFileGenerationStart v
   "updateFileGenerationStop" -> parseUpdateFileGenerationStop v
   "updateCall" -> parseUpdateCall v
   "updateGroupCall" -> parseUpdateGroupCall v
   "updateGroupCallParticipant" -> parseUpdateGroupCallParticipant v
   "updateNewCallSignalingData" -> parseUpdateNewCallSignalingData v
   "updateUserPrivacySettingRules" -> parseUpdateUserPrivacySettingRules v
   "updateUnreadMessageCount" -> parseUpdateUnreadMessageCount v
   "updateUnreadChatCount" -> parseUpdateUnreadChatCount v
   "updateOption" -> parseUpdateOption v
   "updateStickerSet" -> parseUpdateStickerSet v
   "updateInstalledStickerSets" -> parseUpdateInstalledStickerSets v
   "updateTrendingStickerSets" -> parseUpdateTrendingStickerSets v
   "updateRecentStickers" -> parseUpdateRecentStickers v
   "updateFavoriteStickers" -> parseUpdateFavoriteStickers v
   "updateSavedAnimations" -> parseUpdateSavedAnimations v
   "updateSelectedBackground" -> parseUpdateSelectedBackground v
   "updateChatThemes" -> parseUpdateChatThemes v
   "updateLanguagePackStrings" -> parseUpdateLanguagePackStrings v
   "updateConnectionState" -> parseUpdateConnectionState v
   "updateTermsOfService" -> parseUpdateTermsOfService v
   "updateUsersNearby" -> parseUpdateUsersNearby v
   "updateDiceEmojis" -> parseUpdateDiceEmojis v
   "updateAnimatedEmojiMessageClicked" -> parseUpdateAnimatedEmojiMessageClicked v
   "updateAnimationSearchParameters" -> parseUpdateAnimationSearchParameters v
   "updateSuggestedActions" -> parseUpdateSuggestedActions v
   "updateNewInlineQuery" -> parseUpdateNewInlineQuery v
   "updateNewChosenInlineResult" -> parseUpdateNewChosenInlineResult v
   "updateNewCallbackQuery" -> parseUpdateNewCallbackQuery v
   "updateNewInlineCallbackQuery" -> parseUpdateNewInlineCallbackQuery v
   "updateNewShippingQuery" -> parseUpdateNewShippingQuery v
   "updateNewPreCheckoutQuery" -> parseUpdateNewPreCheckoutQuery v
   "updateNewCustomEvent" -> parseUpdateNewCustomEvent v
   "updateNewCustomQuery" -> parseUpdateNewCustomQuery v
   "updatePoll" -> parseUpdatePoll v
   "updatePollAnswer" -> parseUpdatePollAnswer v
   "updateChatMember" -> parseUpdateChatMember v
   _ -> mempty
  where
   parseUpdateAuthorizationState :: A.Value -> T.Parser Update
   parseUpdateAuthorizationState = A.withObject "UpdateAuthorizationState" $ \o -> do
    authorization_state <- o A..:? "authorization_state"
    return $ UpdateAuthorizationState { authorization_state = authorization_state }

   parseUpdateNewMessage :: A.Value -> T.Parser Update
   parseUpdateNewMessage = A.withObject "UpdateNewMessage" $ \o -> do
    message <- o A..:? "message"
    return $ UpdateNewMessage { message = message }

   parseUpdateMessageSendAcknowledged :: A.Value -> T.Parser Update
   parseUpdateMessageSendAcknowledged = A.withObject "UpdateMessageSendAcknowledged" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageSendAcknowledged { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageSendSucceeded :: A.Value -> T.Parser Update
   parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
    old_message_id <- mconcat [ o A..:? "old_message_id", readMaybe <$> (o A..: "old_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message <- o A..:? "message"
    return $ UpdateMessageSendSucceeded { old_message_id = old_message_id, message = message }

   parseUpdateMessageSendFailed :: A.Value -> T.Parser Update
   parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
    error_message <- o A..:? "error_message"
    error_code <- mconcat [ o A..:? "error_code", readMaybe <$> (o A..: "error_code" :: T.Parser String)] :: T.Parser (Maybe Int)
    old_message_id <- mconcat [ o A..:? "old_message_id", readMaybe <$> (o A..: "old_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message <- o A..:? "message"
    return $ UpdateMessageSendFailed { error_message = error_message, error_code = error_code, old_message_id = old_message_id, message = message }

   parseUpdateMessageContent :: A.Value -> T.Parser Update
   parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
    new_content <- o A..:? "new_content"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageContent { new_content = new_content, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageEdited :: A.Value -> T.Parser Update
   parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
    reply_markup <- o A..:? "reply_markup"
    edit_date <- mconcat [ o A..:? "edit_date", readMaybe <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageEdited { reply_markup = reply_markup, edit_date = edit_date, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageIsPinned :: A.Value -> T.Parser Update
   parseUpdateMessageIsPinned = A.withObject "UpdateMessageIsPinned" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageIsPinned { is_pinned = is_pinned, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageInteractionInfo :: A.Value -> T.Parser Update
   parseUpdateMessageInteractionInfo = A.withObject "UpdateMessageInteractionInfo" $ \o -> do
    interaction_info <- o A..:? "interaction_info"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageInteractionInfo { interaction_info = interaction_info, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageContentOpened :: A.Value -> T.Parser Update
   parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageContentOpened { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageMentionRead :: A.Value -> T.Parser Update
   parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
    unread_mention_count <- mconcat [ o A..:? "unread_mention_count", readMaybe <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageMentionRead { unread_mention_count = unread_mention_count, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageLiveLocationViewed :: A.Value -> T.Parser Update
   parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateMessageLiveLocationViewed { message_id = message_id, chat_id = chat_id }

   parseUpdateNewChat :: A.Value -> T.Parser Update
   parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
    chat <- o A..:? "chat"
    return $ UpdateNewChat { chat = chat }

   parseUpdateChatTitle :: A.Value -> T.Parser Update
   parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
    title <- o A..:? "title"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatTitle { title = title, chat_id = chat_id }

   parseUpdateChatPhoto :: A.Value -> T.Parser Update
   parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
    photo <- o A..:? "photo"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatPhoto { photo = photo, chat_id = chat_id }

   parseUpdateChatPermissions :: A.Value -> T.Parser Update
   parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
    permissions <- o A..:? "permissions"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatPermissions { permissions = permissions, chat_id = chat_id }

   parseUpdateChatLastMessage :: A.Value -> T.Parser Update
   parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
    positions <- o A..:? "positions"
    last_message <- o A..:? "last_message"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatLastMessage { positions = positions, last_message = last_message, chat_id = chat_id }

   parseUpdateChatPosition :: A.Value -> T.Parser Update
   parseUpdateChatPosition = A.withObject "UpdateChatPosition" $ \o -> do
    position <- o A..:? "position"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatPosition { position = position, chat_id = chat_id }

   parseUpdateChatIsMarkedAsUnread :: A.Value -> T.Parser Update
   parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
    is_marked_as_unread <- o A..:? "is_marked_as_unread"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }

   parseUpdateChatIsBlocked :: A.Value -> T.Parser Update
   parseUpdateChatIsBlocked = A.withObject "UpdateChatIsBlocked" $ \o -> do
    is_blocked <- o A..:? "is_blocked"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatIsBlocked { is_blocked = is_blocked, chat_id = chat_id }

   parseUpdateChatHasScheduledMessages :: A.Value -> T.Parser Update
   parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
    has_scheduled_messages <- o A..:? "has_scheduled_messages"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatHasScheduledMessages { has_scheduled_messages = has_scheduled_messages, chat_id = chat_id }

   parseUpdateChatVoiceChat :: A.Value -> T.Parser Update
   parseUpdateChatVoiceChat = A.withObject "UpdateChatVoiceChat" $ \o -> do
    voice_chat <- o A..:? "voice_chat"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatVoiceChat { voice_chat = voice_chat, chat_id = chat_id }

   parseUpdateChatDefaultDisableNotification :: A.Value -> T.Parser Update
   parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
    default_disable_notification <- o A..:? "default_disable_notification"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }

   parseUpdateChatReadInbox :: A.Value -> T.Parser Update
   parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
    unread_count <- mconcat [ o A..:? "unread_count", readMaybe <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    last_read_inbox_message_id <- mconcat [ o A..:? "last_read_inbox_message_id", readMaybe <$> (o A..: "last_read_inbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatReadInbox { unread_count = unread_count, last_read_inbox_message_id = last_read_inbox_message_id, chat_id = chat_id }

   parseUpdateChatReadOutbox :: A.Value -> T.Parser Update
   parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
    last_read_outbox_message_id <- mconcat [ o A..:? "last_read_outbox_message_id", readMaybe <$> (o A..: "last_read_outbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatReadOutbox { last_read_outbox_message_id = last_read_outbox_message_id, chat_id = chat_id }

   parseUpdateChatUnreadMentionCount :: A.Value -> T.Parser Update
   parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
    unread_mention_count <- mconcat [ o A..:? "unread_mention_count", readMaybe <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatUnreadMentionCount { unread_mention_count = unread_mention_count, chat_id = chat_id }

   parseUpdateChatNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
    _notification_settings <- o A..:? "notification_settings"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatNotificationSettings { _notification_settings = _notification_settings, chat_id = chat_id }

   parseUpdateScopeNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
    notification_settings <- o A..:? "notification_settings"
    scope <- o A..:? "scope"
    return $ UpdateScopeNotificationSettings { notification_settings = notification_settings, scope = scope }

   parseUpdateChatMessageTtlSetting :: A.Value -> T.Parser Update
   parseUpdateChatMessageTtlSetting = A.withObject "UpdateChatMessageTtlSetting" $ \o -> do
    message_ttl_setting <- mconcat [ o A..:? "message_ttl_setting", readMaybe <$> (o A..: "message_ttl_setting" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatMessageTtlSetting { message_ttl_setting = message_ttl_setting, chat_id = chat_id }

   parseUpdateChatActionBar :: A.Value -> T.Parser Update
   parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
    action_bar <- o A..:? "action_bar"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatActionBar { action_bar = action_bar, chat_id = chat_id }

   parseUpdateChatTheme :: A.Value -> T.Parser Update
   parseUpdateChatTheme = A.withObject "UpdateChatTheme" $ \o -> do
    theme_name <- o A..:? "theme_name"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatTheme { theme_name = theme_name, chat_id = chat_id }

   parseUpdateChatReplyMarkup :: A.Value -> T.Parser Update
   parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
    reply_markup_message_id <- mconcat [ o A..:? "reply_markup_message_id", readMaybe <$> (o A..: "reply_markup_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatReplyMarkup { reply_markup_message_id = reply_markup_message_id, chat_id = chat_id }

   parseUpdateChatDraftMessage :: A.Value -> T.Parser Update
   parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
    positions <- o A..:? "positions"
    draft_message <- o A..:? "draft_message"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatDraftMessage { positions = positions, draft_message = draft_message, chat_id = chat_id }

   parseUpdateChatFilters :: A.Value -> T.Parser Update
   parseUpdateChatFilters = A.withObject "UpdateChatFilters" $ \o -> do
    chat_filters <- o A..:? "chat_filters"
    return $ UpdateChatFilters { chat_filters = chat_filters }

   parseUpdateChatOnlineMemberCount :: A.Value -> T.Parser Update
   parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
    online_member_count <- mconcat [ o A..:? "online_member_count", readMaybe <$> (o A..: "online_member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatOnlineMemberCount { online_member_count = online_member_count, chat_id = chat_id }

   parseUpdateNotification :: A.Value -> T.Parser Update
   parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
    notification <- o A..:? "notification"
    notification_group_id <- mconcat [ o A..:? "notification_group_id", readMaybe <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNotification { notification = notification, notification_group_id = notification_group_id }

   parseUpdateNotificationGroup :: A.Value -> T.Parser Update
   parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
    removed_notification_ids <- o A..:? "removed_notification_ids"
    added_notifications <- o A..:? "added_notifications"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_silent <- o A..:? "is_silent"
    notification_settings_chat_id <- mconcat [ o A..:? "notification_settings_chat_id", readMaybe <$> (o A..: "notification_settings_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    __type <- o A..:? "type"
    notification_group_id <- mconcat [ o A..:? "notification_group_id", readMaybe <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNotificationGroup { removed_notification_ids = removed_notification_ids, added_notifications = added_notifications, total_count = total_count, is_silent = is_silent, notification_settings_chat_id = notification_settings_chat_id, chat_id = chat_id, __type = __type, notification_group_id = notification_group_id }

   parseUpdateActiveNotifications :: A.Value -> T.Parser Update
   parseUpdateActiveNotifications = A.withObject "UpdateActiveNotifications" $ \o -> do
    groups <- o A..:? "groups"
    return $ UpdateActiveNotifications { groups = groups }

   parseUpdateHavePendingNotifications :: A.Value -> T.Parser Update
   parseUpdateHavePendingNotifications = A.withObject "UpdateHavePendingNotifications" $ \o -> do
    have_unreceived_notifications <- o A..:? "have_unreceived_notifications"
    have_delayed_notifications <- o A..:? "have_delayed_notifications"
    return $ UpdateHavePendingNotifications { have_unreceived_notifications = have_unreceived_notifications, have_delayed_notifications = have_delayed_notifications }

   parseUpdateDeleteMessages :: A.Value -> T.Parser Update
   parseUpdateDeleteMessages = A.withObject "UpdateDeleteMessages" $ \o -> do
    from_cache <- o A..:? "from_cache"
    is_permanent <- o A..:? "is_permanent"
    message_ids <- o A..:? "message_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateDeleteMessages { from_cache = from_cache, is_permanent = is_permanent, message_ids = message_ids, chat_id = chat_id }

   parseUpdateUserChatAction :: A.Value -> T.Parser Update
   parseUpdateUserChatAction = A.withObject "UpdateUserChatAction" $ \o -> do
    action <- o A..:? "action"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateUserChatAction { action = action, user_id = user_id, message_thread_id = message_thread_id, chat_id = chat_id }

   parseUpdateUserStatus :: A.Value -> T.Parser Update
   parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
    status <- o A..:? "status"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateUserStatus { status = status, user_id = user_id }

   parseUpdateUser :: A.Value -> T.Parser Update
   parseUpdateUser = A.withObject "UpdateUser" $ \o -> do
    user <- o A..:? "user"
    return $ UpdateUser { user = user }

   parseUpdateBasicGroup :: A.Value -> T.Parser Update
   parseUpdateBasicGroup = A.withObject "UpdateBasicGroup" $ \o -> do
    basic_group <- o A..:? "basic_group"
    return $ UpdateBasicGroup { basic_group = basic_group }

   parseUpdateSupergroup :: A.Value -> T.Parser Update
   parseUpdateSupergroup = A.withObject "UpdateSupergroup" $ \o -> do
    supergroup <- o A..:? "supergroup"
    return $ UpdateSupergroup { supergroup = supergroup }

   parseUpdateSecretChat :: A.Value -> T.Parser Update
   parseUpdateSecretChat = A.withObject "UpdateSecretChat" $ \o -> do
    secret_chat <- o A..:? "secret_chat"
    return $ UpdateSecretChat { secret_chat = secret_chat }

   parseUpdateUserFullInfo :: A.Value -> T.Parser Update
   parseUpdateUserFullInfo = A.withObject "UpdateUserFullInfo" $ \o -> do
    user_full_info <- o A..:? "user_full_info"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateUserFullInfo { user_full_info = user_full_info, user_id = user_id }

   parseUpdateBasicGroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
    basic_group_full_info <- o A..:? "basic_group_full_info"
    basic_group_id <- mconcat [ o A..:? "basic_group_id", readMaybe <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateBasicGroupFullInfo { basic_group_full_info = basic_group_full_info, basic_group_id = basic_group_id }

   parseUpdateSupergroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
    supergroup_full_info <- o A..:? "supergroup_full_info"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateSupergroupFullInfo { supergroup_full_info = supergroup_full_info, supergroup_id = supergroup_id }

   parseUpdateServiceNotification :: A.Value -> T.Parser Update
   parseUpdateServiceNotification = A.withObject "UpdateServiceNotification" $ \o -> do
    content <- o A..:? "content"
    _type <- o A..:? "type"
    return $ UpdateServiceNotification { content = content, _type = _type }

   parseUpdateFile :: A.Value -> T.Parser Update
   parseUpdateFile = A.withObject "UpdateFile" $ \o -> do
    file <- o A..:? "file"
    return $ UpdateFile { file = file }

   parseUpdateFileGenerationStart :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStart = A.withObject "UpdateFileGenerationStart" $ \o -> do
    conversion <- o A..:? "conversion"
    destination_path <- o A..:? "destination_path"
    original_path <- o A..:? "original_path"
    generation_id <- mconcat [ o A..:? "generation_id", readMaybe <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateFileGenerationStart { conversion = conversion, destination_path = destination_path, original_path = original_path, generation_id = generation_id }

   parseUpdateFileGenerationStop :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
    generation_id <- mconcat [ o A..:? "generation_id", readMaybe <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateFileGenerationStop { generation_id = generation_id }

   parseUpdateCall :: A.Value -> T.Parser Update
   parseUpdateCall = A.withObject "UpdateCall" $ \o -> do
    call <- o A..:? "call"
    return $ UpdateCall { call = call }

   parseUpdateGroupCall :: A.Value -> T.Parser Update
   parseUpdateGroupCall = A.withObject "UpdateGroupCall" $ \o -> do
    group_call <- o A..:? "group_call"
    return $ UpdateGroupCall { group_call = group_call }

   parseUpdateGroupCallParticipant :: A.Value -> T.Parser Update
   parseUpdateGroupCallParticipant = A.withObject "UpdateGroupCallParticipant" $ \o -> do
    participant <- o A..:? "participant"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateGroupCallParticipant { participant = participant, group_call_id = group_call_id }

   parseUpdateNewCallSignalingData :: A.Value -> T.Parser Update
   parseUpdateNewCallSignalingData = A.withObject "UpdateNewCallSignalingData" $ \o -> do
    _data <- o A..:? "data"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewCallSignalingData { _data = _data, call_id = call_id }

   parseUpdateUserPrivacySettingRules :: A.Value -> T.Parser Update
   parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
    rules <- o A..:? "rules"
    setting <- o A..:? "setting"
    return $ UpdateUserPrivacySettingRules { rules = rules, setting = setting }

   parseUpdateUnreadMessageCount :: A.Value -> T.Parser Update
   parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
    unread_unmuted_count <- mconcat [ o A..:? "unread_unmuted_count", readMaybe <$> (o A..: "unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    unread_count <- mconcat [ o A..:? "unread_count", readMaybe <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_list <- o A..:? "chat_list"
    return $ UpdateUnreadMessageCount { unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, chat_list = chat_list }

   parseUpdateUnreadChatCount :: A.Value -> T.Parser Update
   parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
    marked_as_unread_unmuted_count <- mconcat [ o A..:? "marked_as_unread_unmuted_count", readMaybe <$> (o A..: "marked_as_unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    marked_as_unread_count <- mconcat [ o A..:? "marked_as_unread_count", readMaybe <$> (o A..: "marked_as_unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    unread_unmuted_count <- mconcat [ o A..:? "unread_unmuted_count", readMaybe <$> (o A..: "unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    unread_count <- mconcat [ o A..:? "unread_count", readMaybe <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_list <- o A..:? "chat_list"
    return $ UpdateUnreadChatCount { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count, marked_as_unread_count = marked_as_unread_count, unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, total_count = total_count, chat_list = chat_list }

   parseUpdateOption :: A.Value -> T.Parser Update
   parseUpdateOption = A.withObject "UpdateOption" $ \o -> do
    value <- o A..:? "value"
    name <- o A..:? "name"
    return $ UpdateOption { value = value, name = name }

   parseUpdateStickerSet :: A.Value -> T.Parser Update
   parseUpdateStickerSet = A.withObject "UpdateStickerSet" $ \o -> do
    sticker_set <- o A..:? "sticker_set"
    return $ UpdateStickerSet { sticker_set = sticker_set }

   parseUpdateInstalledStickerSets :: A.Value -> T.Parser Update
   parseUpdateInstalledStickerSets = A.withObject "UpdateInstalledStickerSets" $ \o -> do
    sticker_set_ids <- o A..:? "sticker_set_ids"
    is_masks <- o A..:? "is_masks"
    return $ UpdateInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }

   parseUpdateTrendingStickerSets :: A.Value -> T.Parser Update
   parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
    sticker_sets <- o A..:? "sticker_sets"
    return $ UpdateTrendingStickerSets { sticker_sets = sticker_sets }

   parseUpdateRecentStickers :: A.Value -> T.Parser Update
   parseUpdateRecentStickers = A.withObject "UpdateRecentStickers" $ \o -> do
    sticker_ids <- o A..:? "sticker_ids"
    is_attached <- o A..:? "is_attached"
    return $ UpdateRecentStickers { sticker_ids = sticker_ids, is_attached = is_attached }

   parseUpdateFavoriteStickers :: A.Value -> T.Parser Update
   parseUpdateFavoriteStickers = A.withObject "UpdateFavoriteStickers" $ \o -> do
    sticker_ids <- o A..:? "sticker_ids"
    return $ UpdateFavoriteStickers { sticker_ids = sticker_ids }

   parseUpdateSavedAnimations :: A.Value -> T.Parser Update
   parseUpdateSavedAnimations = A.withObject "UpdateSavedAnimations" $ \o -> do
    animation_ids <- o A..:? "animation_ids"
    return $ UpdateSavedAnimations { animation_ids = animation_ids }

   parseUpdateSelectedBackground :: A.Value -> T.Parser Update
   parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
    background <- o A..:? "background"
    for_dark_theme <- o A..:? "for_dark_theme"
    return $ UpdateSelectedBackground { background = background, for_dark_theme = for_dark_theme }

   parseUpdateChatThemes :: A.Value -> T.Parser Update
   parseUpdateChatThemes = A.withObject "UpdateChatThemes" $ \o -> do
    chat_themes <- o A..:? "chat_themes"
    return $ UpdateChatThemes { chat_themes = chat_themes }

   parseUpdateLanguagePackStrings :: A.Value -> T.Parser Update
   parseUpdateLanguagePackStrings = A.withObject "UpdateLanguagePackStrings" $ \o -> do
    strings <- o A..:? "strings"
    language_pack_id <- o A..:? "language_pack_id"
    localization_target <- o A..:? "localization_target"
    return $ UpdateLanguagePackStrings { strings = strings, language_pack_id = language_pack_id, localization_target = localization_target }

   parseUpdateConnectionState :: A.Value -> T.Parser Update
   parseUpdateConnectionState = A.withObject "UpdateConnectionState" $ \o -> do
    state <- o A..:? "state"
    return $ UpdateConnectionState { state = state }

   parseUpdateTermsOfService :: A.Value -> T.Parser Update
   parseUpdateTermsOfService = A.withObject "UpdateTermsOfService" $ \o -> do
    terms_of_service <- o A..:? "terms_of_service"
    terms_of_service_id <- o A..:? "terms_of_service_id"
    return $ UpdateTermsOfService { terms_of_service = terms_of_service, terms_of_service_id = terms_of_service_id }

   parseUpdateUsersNearby :: A.Value -> T.Parser Update
   parseUpdateUsersNearby = A.withObject "UpdateUsersNearby" $ \o -> do
    users_nearby <- o A..:? "users_nearby"
    return $ UpdateUsersNearby { users_nearby = users_nearby }

   parseUpdateDiceEmojis :: A.Value -> T.Parser Update
   parseUpdateDiceEmojis = A.withObject "UpdateDiceEmojis" $ \o -> do
    emojis <- o A..:? "emojis"
    return $ UpdateDiceEmojis { emojis = emojis }

   parseUpdateAnimatedEmojiMessageClicked :: A.Value -> T.Parser Update
   parseUpdateAnimatedEmojiMessageClicked = A.withObject "UpdateAnimatedEmojiMessageClicked" $ \o -> do
    sticker <- o A..:? "sticker"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateAnimatedEmojiMessageClicked { sticker = sticker, message_id = message_id, chat_id = chat_id }

   parseUpdateAnimationSearchParameters :: A.Value -> T.Parser Update
   parseUpdateAnimationSearchParameters = A.withObject "UpdateAnimationSearchParameters" $ \o -> do
    emojis <- o A..:? "emojis"
    provider <- o A..:? "provider"
    return $ UpdateAnimationSearchParameters { emojis = emojis, provider = provider }

   parseUpdateSuggestedActions :: A.Value -> T.Parser Update
   parseUpdateSuggestedActions = A.withObject "UpdateSuggestedActions" $ \o -> do
    removed_actions <- o A..:? "removed_actions"
    added_actions <- o A..:? "added_actions"
    return $ UpdateSuggestedActions { removed_actions = removed_actions, added_actions = added_actions }

   parseUpdateNewInlineQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
    offset <- o A..:? "offset"
    query <- o A..:? "query"
    chat_type <- o A..:? "chat_type"
    user_location <- o A..:? "user_location"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewInlineQuery { offset = offset, query = query, chat_type = chat_type, user_location = user_location, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewChosenInlineResult :: A.Value -> T.Parser Update
   parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
    inline_message_id <- o A..:? "inline_message_id"
    result_id <- o A..:? "result_id"
    query <- o A..:? "query"
    user_location <- o A..:? "user_location"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewChosenInlineResult { inline_message_id = inline_message_id, result_id = result_id, query = query, user_location = user_location, sender_user_id = sender_user_id }

   parseUpdateNewCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
    payload <- o A..:? "payload"
    chat_instance <- mconcat [ o A..:? "chat_instance", readMaybe <$> (o A..: "chat_instance" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewCallbackQuery { payload = payload, chat_instance = chat_instance, message_id = message_id, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewInlineCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
    payload <- o A..:? "payload"
    chat_instance <- mconcat [ o A..:? "chat_instance", readMaybe <$> (o A..: "chat_instance" :: T.Parser String)] :: T.Parser (Maybe Int)
    inline_message_id <- o A..:? "inline_message_id"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewInlineCallbackQuery { payload = payload, chat_instance = chat_instance, inline_message_id = inline_message_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewShippingQuery :: A.Value -> T.Parser Update
   parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
    shipping_address <- o A..:? "shipping_address"
    invoice_payload <- o A..:? "invoice_payload"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewShippingQuery { shipping_address = shipping_address, invoice_payload = invoice_payload, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewPreCheckoutQuery :: A.Value -> T.Parser Update
   parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
    order_info <- o A..:? "order_info"
    shipping_option_id <- o A..:? "shipping_option_id"
    invoice_payload <- o A..:? "invoice_payload"
    total_amount <- mconcat [ o A..:? "total_amount", readMaybe <$> (o A..: "total_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    currency <- o A..:? "currency"
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewPreCheckoutQuery { order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewCustomEvent :: A.Value -> T.Parser Update
   parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
    event <- o A..:? "event"
    return $ UpdateNewCustomEvent { event = event }

   parseUpdateNewCustomQuery :: A.Value -> T.Parser Update
   parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
    timeout <- mconcat [ o A..:? "timeout", readMaybe <$> (o A..: "timeout" :: T.Parser String)] :: T.Parser (Maybe Int)
    _data <- o A..:? "data"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateNewCustomQuery { timeout = timeout, _data = _data, _id = _id }

   parseUpdatePoll :: A.Value -> T.Parser Update
   parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
    poll <- o A..:? "poll"
    return $ UpdatePoll { poll = poll }

   parseUpdatePollAnswer :: A.Value -> T.Parser Update
   parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
    option_ids <- o A..:? "option_ids"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    poll_id <- mconcat [ o A..:? "poll_id", readMaybe <$> (o A..: "poll_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdatePollAnswer { option_ids = option_ids, user_id = user_id, poll_id = poll_id }

   parseUpdateChatMember :: A.Value -> T.Parser Update
   parseUpdateChatMember = A.withObject "UpdateChatMember" $ \o -> do
    new_chat_member <- o A..:? "new_chat_member"
    old_chat_member <- o A..:? "old_chat_member"
    invite_link <- o A..:? "invite_link"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    actor_user_id <- mconcat [ o A..:? "actor_user_id", readMaybe <$> (o A..: "actor_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpdateChatMember { new_chat_member = new_chat_member, old_chat_member = old_chat_member, invite_link = invite_link, date = date, actor_user_id = actor_user_id, chat_id = chat_id }