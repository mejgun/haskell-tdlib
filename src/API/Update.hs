-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Update where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthorizationState as AuthorizationState
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.Chat as Chat
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope
import {-# SOURCE #-} qualified API.ChatActionBar as ChatActionBar
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage
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
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting
import {-# SOURCE #-} qualified API.ChatList as ChatList
import {-# SOURCE #-} qualified API.OptionValue as OptionValue
import {-# SOURCE #-} qualified API.StickerSets as StickerSets
import {-# SOURCE #-} qualified API.Background as Background
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString
import {-# SOURCE #-} qualified API.ConnectionState as ConnectionState
import {-# SOURCE #-} qualified API.TermsOfService as TermsOfService
import {-# SOURCE #-} qualified API.ChatNearby as ChatNearby
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.CallbackQueryPayload as CallbackQueryPayload
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.Poll as Poll

data Update = 
 UpdateAuthorizationState { authorization_state :: Maybe AuthorizationState.AuthorizationState }  
 | UpdateNewMessage { message :: Maybe Message.Message }  
 | UpdateMessageSendAcknowledged { message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageSendSucceeded { old_message_id :: Maybe Int, message :: Maybe Message.Message }  
 | UpdateMessageSendFailed { error_message :: Maybe String, error_code :: Maybe Int, old_message_id :: Maybe Int, message :: Maybe Message.Message }  
 | UpdateMessageContent { new_content :: Maybe MessageContent.MessageContent, message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageEdited { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, edit_date :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageViews { views :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageContentOpened { message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageMentionRead { unread_mention_count :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateMessageLiveLocationViewed { message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateNewChat { chat :: Maybe Chat.Chat }  
 | UpdateChatChatList { chat_list :: Maybe ChatList.ChatList, chat_id :: Maybe Int }  
 | UpdateChatTitle { title :: Maybe String, chat_id :: Maybe Int }  
 | UpdateChatPhoto { photo :: Maybe ChatPhoto.ChatPhoto, chat_id :: Maybe Int }  
 | UpdateChatPermissions { permissions :: Maybe ChatPermissions.ChatPermissions, chat_id :: Maybe Int }  
 | UpdateChatLastMessage { order :: Maybe Int, last_message :: Maybe Message.Message, chat_id :: Maybe Int }  
 | UpdateChatOrder { order :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatIsPinned { order :: Maybe Int, is_pinned :: Maybe Bool, chat_id :: Maybe Int }  
 | UpdateChatIsMarkedAsUnread { is_marked_as_unread :: Maybe Bool, chat_id :: Maybe Int }  
 | UpdateChatIsSponsored { order :: Maybe Int, is_sponsored :: Maybe Bool, chat_id :: Maybe Int }  
 | UpdateChatHasScheduledMessages { has_scheduled_messages :: Maybe Bool, chat_id :: Maybe Int }  
 | UpdateChatDefaultDisableNotification { default_disable_notification :: Maybe Bool, chat_id :: Maybe Int }  
 | UpdateChatReadInbox { unread_count :: Maybe Int, last_read_inbox_message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatReadOutbox { last_read_outbox_message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatUnreadMentionCount { unread_mention_count :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatNotificationSettings { _notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, chat_id :: Maybe Int }  
 | UpdateScopeNotificationSettings { notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  
 | UpdateChatActionBar { action_bar :: Maybe ChatActionBar.ChatActionBar, chat_id :: Maybe Int }  
 | UpdateChatPinnedMessage { pinned_message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatReplyMarkup { reply_markup_message_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateChatDraftMessage { order :: Maybe Int, draft_message :: Maybe DraftMessage.DraftMessage, chat_id :: Maybe Int }  
 | UpdateChatOnlineMemberCount { online_member_count :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateNotification { notification :: Maybe Notification.Notification, notification_group_id :: Maybe Int }  
 | UpdateNotificationGroup { removed_notification_ids :: Maybe [Int], added_notifications :: Maybe [Notification.Notification], total_count :: Maybe Int, is_silent :: Maybe Bool, notification_settings_chat_id :: Maybe Int, chat_id :: Maybe Int, __type :: Maybe NotificationGroupType.NotificationGroupType, notification_group_id :: Maybe Int }  
 | UpdateActiveNotifications { groups :: Maybe [NotificationGroup.NotificationGroup] }  
 | UpdateHavePendingNotifications { have_unreceived_notifications :: Maybe Bool, have_delayed_notifications :: Maybe Bool }  
 | UpdateDeleteMessages { from_cache :: Maybe Bool, is_permanent :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  
 | UpdateUserChatAction { action :: Maybe ChatAction.ChatAction, user_id :: Maybe Int, chat_id :: Maybe Int }  
 | UpdateUserStatus { status :: Maybe UserStatus.UserStatus, user_id :: Maybe Int }  
 | UpdateUser { user :: Maybe User.User }  
 | UpdateBasicGroup { basic_group :: Maybe BasicGroup.BasicGroup }  
 | UpdateSupergroup { supergroup :: Maybe Supergroup.Supergroup }  
 | UpdateSecretChat { secret_chat :: Maybe SecretChat.SecretChat }  
 | UpdateUserFullInfo { user_full_info :: Maybe UserFullInfo.UserFullInfo, user_id :: Maybe Int }  
 | UpdateBasicGroupFullInfo { basic_group_full_info :: Maybe BasicGroupFullInfo.BasicGroupFullInfo, basic_group_id :: Maybe Int }  
 | UpdateSupergroupFullInfo { supergroup_full_info :: Maybe SupergroupFullInfo.SupergroupFullInfo, supergroup_id :: Maybe Int }  
 | UpdateServiceNotification { content :: Maybe MessageContent.MessageContent, _type :: Maybe String }  
 | UpdateFile { file :: Maybe File.File }  
 | UpdateFileGenerationStart { conversion :: Maybe String, destination_path :: Maybe String, original_path :: Maybe String, generation_id :: Maybe Int }  
 | UpdateFileGenerationStop { generation_id :: Maybe Int }  
 | UpdateCall { call :: Maybe Call.Call }  
 | UpdateUserPrivacySettingRules { rules :: Maybe UserPrivacySettingRules.UserPrivacySettingRules, setting :: Maybe UserPrivacySetting.UserPrivacySetting }  
 | UpdateUnreadMessageCount { unread_unmuted_count :: Maybe Int, unread_count :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  
 | UpdateUnreadChatCount { marked_as_unread_unmuted_count :: Maybe Int, marked_as_unread_count :: Maybe Int, unread_unmuted_count :: Maybe Int, unread_count :: Maybe Int, total_count :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  
 | UpdateOption { value :: Maybe OptionValue.OptionValue, name :: Maybe String }  
 | UpdateInstalledStickerSets { sticker_set_ids :: Maybe [Int], is_masks :: Maybe Bool }  
 | UpdateTrendingStickerSets { sticker_sets :: Maybe StickerSets.StickerSets }  
 | UpdateRecentStickers { sticker_ids :: Maybe [Int], is_attached :: Maybe Bool }  
 | UpdateFavoriteStickers { sticker_ids :: Maybe [Int] }  
 | UpdateSavedAnimations { animation_ids :: Maybe [Int] }  
 | UpdateSelectedBackground { background :: Maybe Background.Background, for_dark_theme :: Maybe Bool }  
 | UpdateLanguagePackStrings { strings :: Maybe [LanguagePackString.LanguagePackString], language_pack_id :: Maybe String, localization_target :: Maybe String }  
 | UpdateConnectionState { state :: Maybe ConnectionState.ConnectionState }  
 | UpdateTermsOfService { terms_of_service :: Maybe TermsOfService.TermsOfService, terms_of_service_id :: Maybe String }  
 | UpdateUsersNearby { users_nearby :: Maybe [ChatNearby.ChatNearby] }  
 | UpdateNewInlineQuery { offset :: Maybe String, query :: Maybe String, user_location :: Maybe Location.Location, sender_user_id :: Maybe Int, _id :: Maybe Int }  
 | UpdateNewChosenInlineResult { inline_message_id :: Maybe String, result_id :: Maybe String, query :: Maybe String, user_location :: Maybe Location.Location, sender_user_id :: Maybe Int }  
 | UpdateNewCallbackQuery { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int, sender_user_id :: Maybe Int, _id :: Maybe Int }  
 | UpdateNewInlineCallbackQuery { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Maybe Int, inline_message_id :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  
 | UpdateNewShippingQuery { shipping_address :: Maybe Address.Address, invoice_payload :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  
 | UpdateNewPreCheckoutQuery { order_info :: Maybe OrderInfo.OrderInfo, shipping_option_id :: Maybe String, invoice_payload :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String, sender_user_id :: Maybe Int, _id :: Maybe Int }  
 | UpdateNewCustomEvent { event :: Maybe String }  
 | UpdateNewCustomQuery { timeout :: Maybe Int, _data :: Maybe String, _id :: Maybe Int }  
 | UpdatePoll { poll :: Maybe Poll.Poll }  
 | UpdatePollAnswer { option_ids :: Maybe [Int], user_id :: Maybe Int, poll_id :: Maybe Int }  deriving (Show, Eq)

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

 toJSON (UpdateMessageViews { views = views, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageViews", "views" A..= views, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageContentOpened { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageContentOpened", "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageMentionRead { unread_mention_count = unread_mention_count, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageMentionRead", "unread_mention_count" A..= unread_mention_count, "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateMessageLiveLocationViewed { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateMessageLiveLocationViewed", "message_id" A..= message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateNewChat { chat = chat }) =
  A.object [ "@type" A..= T.String "updateNewChat", "chat" A..= chat ]

 toJSON (UpdateChatChatList { chat_list = chat_list, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatChatList", "chat_list" A..= chat_list, "chat_id" A..= chat_id ]

 toJSON (UpdateChatTitle { title = title, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatTitle", "title" A..= title, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPhoto { photo = photo, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPhoto", "photo" A..= photo, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPermissions { permissions = permissions, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPermissions", "permissions" A..= permissions, "chat_id" A..= chat_id ]

 toJSON (UpdateChatLastMessage { order = order, last_message = last_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatLastMessage", "order" A..= order, "last_message" A..= last_message, "chat_id" A..= chat_id ]

 toJSON (UpdateChatOrder { order = order, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatOrder", "order" A..= order, "chat_id" A..= chat_id ]

 toJSON (UpdateChatIsPinned { order = order, is_pinned = is_pinned, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatIsPinned", "order" A..= order, "is_pinned" A..= is_pinned, "chat_id" A..= chat_id ]

 toJSON (UpdateChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatIsMarkedAsUnread", "is_marked_as_unread" A..= is_marked_as_unread, "chat_id" A..= chat_id ]

 toJSON (UpdateChatIsSponsored { order = order, is_sponsored = is_sponsored, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatIsSponsored", "order" A..= order, "is_sponsored" A..= is_sponsored, "chat_id" A..= chat_id ]

 toJSON (UpdateChatHasScheduledMessages { has_scheduled_messages = has_scheduled_messages, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatHasScheduledMessages", "has_scheduled_messages" A..= has_scheduled_messages, "chat_id" A..= chat_id ]

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

 toJSON (UpdateChatActionBar { action_bar = action_bar, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatActionBar", "action_bar" A..= action_bar, "chat_id" A..= chat_id ]

 toJSON (UpdateChatPinnedMessage { pinned_message_id = pinned_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatPinnedMessage", "pinned_message_id" A..= pinned_message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateChatReplyMarkup { reply_markup_message_id = reply_markup_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatReplyMarkup", "reply_markup_message_id" A..= reply_markup_message_id, "chat_id" A..= chat_id ]

 toJSON (UpdateChatDraftMessage { order = order, draft_message = draft_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateChatDraftMessage", "order" A..= order, "draft_message" A..= draft_message, "chat_id" A..= chat_id ]

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

 toJSON (UpdateUserChatAction { action = action, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "updateUserChatAction", "action" A..= action, "user_id" A..= user_id, "chat_id" A..= chat_id ]

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

 toJSON (UpdateUserPrivacySettingRules { rules = rules, setting = setting }) =
  A.object [ "@type" A..= T.String "updateUserPrivacySettingRules", "rules" A..= rules, "setting" A..= setting ]

 toJSON (UpdateUnreadMessageCount { unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "updateUnreadMessageCount", "unread_unmuted_count" A..= unread_unmuted_count, "unread_count" A..= unread_count, "chat_list" A..= chat_list ]

 toJSON (UpdateUnreadChatCount { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count, marked_as_unread_count = marked_as_unread_count, unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, total_count = total_count, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "updateUnreadChatCount", "marked_as_unread_unmuted_count" A..= marked_as_unread_unmuted_count, "marked_as_unread_count" A..= marked_as_unread_count, "unread_unmuted_count" A..= unread_unmuted_count, "unread_count" A..= unread_count, "total_count" A..= total_count, "chat_list" A..= chat_list ]

 toJSON (UpdateOption { value = value, name = name }) =
  A.object [ "@type" A..= T.String "updateOption", "value" A..= value, "name" A..= name ]

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

 toJSON (UpdateLanguagePackStrings { strings = strings, language_pack_id = language_pack_id, localization_target = localization_target }) =
  A.object [ "@type" A..= T.String "updateLanguagePackStrings", "strings" A..= strings, "language_pack_id" A..= language_pack_id, "localization_target" A..= localization_target ]

 toJSON (UpdateConnectionState { state = state }) =
  A.object [ "@type" A..= T.String "updateConnectionState", "state" A..= state ]

 toJSON (UpdateTermsOfService { terms_of_service = terms_of_service, terms_of_service_id = terms_of_service_id }) =
  A.object [ "@type" A..= T.String "updateTermsOfService", "terms_of_service" A..= terms_of_service, "terms_of_service_id" A..= terms_of_service_id ]

 toJSON (UpdateUsersNearby { users_nearby = users_nearby }) =
  A.object [ "@type" A..= T.String "updateUsersNearby", "users_nearby" A..= users_nearby ]

 toJSON (UpdateNewInlineQuery { offset = offset, query = query, user_location = user_location, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "updateNewInlineQuery", "offset" A..= offset, "query" A..= query, "user_location" A..= user_location, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

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
   "updateMessageViews" -> parseUpdateMessageViews v
   "updateMessageContentOpened" -> parseUpdateMessageContentOpened v
   "updateMessageMentionRead" -> parseUpdateMessageMentionRead v
   "updateMessageLiveLocationViewed" -> parseUpdateMessageLiveLocationViewed v
   "updateNewChat" -> parseUpdateNewChat v
   "updateChatChatList" -> parseUpdateChatChatList v
   "updateChatTitle" -> parseUpdateChatTitle v
   "updateChatPhoto" -> parseUpdateChatPhoto v
   "updateChatPermissions" -> parseUpdateChatPermissions v
   "updateChatLastMessage" -> parseUpdateChatLastMessage v
   "updateChatOrder" -> parseUpdateChatOrder v
   "updateChatIsPinned" -> parseUpdateChatIsPinned v
   "updateChatIsMarkedAsUnread" -> parseUpdateChatIsMarkedAsUnread v
   "updateChatIsSponsored" -> parseUpdateChatIsSponsored v
   "updateChatHasScheduledMessages" -> parseUpdateChatHasScheduledMessages v
   "updateChatDefaultDisableNotification" -> parseUpdateChatDefaultDisableNotification v
   "updateChatReadInbox" -> parseUpdateChatReadInbox v
   "updateChatReadOutbox" -> parseUpdateChatReadOutbox v
   "updateChatUnreadMentionCount" -> parseUpdateChatUnreadMentionCount v
   "updateChatNotificationSettings" -> parseUpdateChatNotificationSettings v
   "updateScopeNotificationSettings" -> parseUpdateScopeNotificationSettings v
   "updateChatActionBar" -> parseUpdateChatActionBar v
   "updateChatPinnedMessage" -> parseUpdateChatPinnedMessage v
   "updateChatReplyMarkup" -> parseUpdateChatReplyMarkup v
   "updateChatDraftMessage" -> parseUpdateChatDraftMessage v
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
   "updateUserPrivacySettingRules" -> parseUpdateUserPrivacySettingRules v
   "updateUnreadMessageCount" -> parseUpdateUnreadMessageCount v
   "updateUnreadChatCount" -> parseUpdateUnreadChatCount v
   "updateOption" -> parseUpdateOption v
   "updateInstalledStickerSets" -> parseUpdateInstalledStickerSets v
   "updateTrendingStickerSets" -> parseUpdateTrendingStickerSets v
   "updateRecentStickers" -> parseUpdateRecentStickers v
   "updateFavoriteStickers" -> parseUpdateFavoriteStickers v
   "updateSavedAnimations" -> parseUpdateSavedAnimations v
   "updateSelectedBackground" -> parseUpdateSelectedBackground v
   "updateLanguagePackStrings" -> parseUpdateLanguagePackStrings v
   "updateConnectionState" -> parseUpdateConnectionState v
   "updateTermsOfService" -> parseUpdateTermsOfService v
   "updateUsersNearby" -> parseUpdateUsersNearby v
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
   _ -> mempty
  where
   parseUpdateAuthorizationState :: A.Value -> T.Parser Update
   parseUpdateAuthorizationState = A.withObject "UpdateAuthorizationState" $ \o -> do
    authorization_state <- optional $ o A..: "authorization_state"
    return $ UpdateAuthorizationState { authorization_state = authorization_state }

   parseUpdateNewMessage :: A.Value -> T.Parser Update
   parseUpdateNewMessage = A.withObject "UpdateNewMessage" $ \o -> do
    message <- optional $ o A..: "message"
    return $ UpdateNewMessage { message = message }

   parseUpdateMessageSendAcknowledged :: A.Value -> T.Parser Update
   parseUpdateMessageSendAcknowledged = A.withObject "UpdateMessageSendAcknowledged" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageSendAcknowledged { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageSendSucceeded :: A.Value -> T.Parser Update
   parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
    old_message_id <- optional $ o A..: "old_message_id"
    message <- optional $ o A..: "message"
    return $ UpdateMessageSendSucceeded { old_message_id = old_message_id, message = message }

   parseUpdateMessageSendFailed :: A.Value -> T.Parser Update
   parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
    error_message <- optional $ o A..: "error_message"
    error_code <- optional $ o A..: "error_code"
    old_message_id <- optional $ o A..: "old_message_id"
    message <- optional $ o A..: "message"
    return $ UpdateMessageSendFailed { error_message = error_message, error_code = error_code, old_message_id = old_message_id, message = message }

   parseUpdateMessageContent :: A.Value -> T.Parser Update
   parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
    new_content <- optional $ o A..: "new_content"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageContent { new_content = new_content, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageEdited :: A.Value -> T.Parser Update
   parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
    reply_markup <- optional $ o A..: "reply_markup"
    edit_date <- optional $ o A..: "edit_date"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageEdited { reply_markup = reply_markup, edit_date = edit_date, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageViews :: A.Value -> T.Parser Update
   parseUpdateMessageViews = A.withObject "UpdateMessageViews" $ \o -> do
    views <- optional $ o A..: "views"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageViews { views = views, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageContentOpened :: A.Value -> T.Parser Update
   parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageContentOpened { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageMentionRead :: A.Value -> T.Parser Update
   parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
    unread_mention_count <- optional $ o A..: "unread_mention_count"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageMentionRead { unread_mention_count = unread_mention_count, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageLiveLocationViewed :: A.Value -> T.Parser Update
   parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateMessageLiveLocationViewed { message_id = message_id, chat_id = chat_id }

   parseUpdateNewChat :: A.Value -> T.Parser Update
   parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
    chat <- optional $ o A..: "chat"
    return $ UpdateNewChat { chat = chat }

   parseUpdateChatChatList :: A.Value -> T.Parser Update
   parseUpdateChatChatList = A.withObject "UpdateChatChatList" $ \o -> do
    chat_list <- optional $ o A..: "chat_list"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatChatList { chat_list = chat_list, chat_id = chat_id }

   parseUpdateChatTitle :: A.Value -> T.Parser Update
   parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
    title <- optional $ o A..: "title"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatTitle { title = title, chat_id = chat_id }

   parseUpdateChatPhoto :: A.Value -> T.Parser Update
   parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
    photo <- optional $ o A..: "photo"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatPhoto { photo = photo, chat_id = chat_id }

   parseUpdateChatPermissions :: A.Value -> T.Parser Update
   parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
    permissions <- optional $ o A..: "permissions"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatPermissions { permissions = permissions, chat_id = chat_id }

   parseUpdateChatLastMessage :: A.Value -> T.Parser Update
   parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
    order <- optional $ o A..: "order"
    last_message <- optional $ o A..: "last_message"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatLastMessage { order = order, last_message = last_message, chat_id = chat_id }

   parseUpdateChatOrder :: A.Value -> T.Parser Update
   parseUpdateChatOrder = A.withObject "UpdateChatOrder" $ \o -> do
    order <- optional $ o A..: "order"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatOrder { order = order, chat_id = chat_id }

   parseUpdateChatIsPinned :: A.Value -> T.Parser Update
   parseUpdateChatIsPinned = A.withObject "UpdateChatIsPinned" $ \o -> do
    order <- optional $ o A..: "order"
    is_pinned <- optional $ o A..: "is_pinned"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatIsPinned { order = order, is_pinned = is_pinned, chat_id = chat_id }

   parseUpdateChatIsMarkedAsUnread :: A.Value -> T.Parser Update
   parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
    is_marked_as_unread <- optional $ o A..: "is_marked_as_unread"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }

   parseUpdateChatIsSponsored :: A.Value -> T.Parser Update
   parseUpdateChatIsSponsored = A.withObject "UpdateChatIsSponsored" $ \o -> do
    order <- optional $ o A..: "order"
    is_sponsored <- optional $ o A..: "is_sponsored"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatIsSponsored { order = order, is_sponsored = is_sponsored, chat_id = chat_id }

   parseUpdateChatHasScheduledMessages :: A.Value -> T.Parser Update
   parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
    has_scheduled_messages <- optional $ o A..: "has_scheduled_messages"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatHasScheduledMessages { has_scheduled_messages = has_scheduled_messages, chat_id = chat_id }

   parseUpdateChatDefaultDisableNotification :: A.Value -> T.Parser Update
   parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
    default_disable_notification <- optional $ o A..: "default_disable_notification"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }

   parseUpdateChatReadInbox :: A.Value -> T.Parser Update
   parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
    unread_count <- optional $ o A..: "unread_count"
    last_read_inbox_message_id <- optional $ o A..: "last_read_inbox_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatReadInbox { unread_count = unread_count, last_read_inbox_message_id = last_read_inbox_message_id, chat_id = chat_id }

   parseUpdateChatReadOutbox :: A.Value -> T.Parser Update
   parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
    last_read_outbox_message_id <- optional $ o A..: "last_read_outbox_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatReadOutbox { last_read_outbox_message_id = last_read_outbox_message_id, chat_id = chat_id }

   parseUpdateChatUnreadMentionCount :: A.Value -> T.Parser Update
   parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
    unread_mention_count <- optional $ o A..: "unread_mention_count"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatUnreadMentionCount { unread_mention_count = unread_mention_count, chat_id = chat_id }

   parseUpdateChatNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
    _notification_settings <- optional $ o A..: "notification_settings"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatNotificationSettings { _notification_settings = _notification_settings, chat_id = chat_id }

   parseUpdateScopeNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
    notification_settings <- optional $ o A..: "notification_settings"
    scope <- optional $ o A..: "scope"
    return $ UpdateScopeNotificationSettings { notification_settings = notification_settings, scope = scope }

   parseUpdateChatActionBar :: A.Value -> T.Parser Update
   parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
    action_bar <- optional $ o A..: "action_bar"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatActionBar { action_bar = action_bar, chat_id = chat_id }

   parseUpdateChatPinnedMessage :: A.Value -> T.Parser Update
   parseUpdateChatPinnedMessage = A.withObject "UpdateChatPinnedMessage" $ \o -> do
    pinned_message_id <- optional $ o A..: "pinned_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatPinnedMessage { pinned_message_id = pinned_message_id, chat_id = chat_id }

   parseUpdateChatReplyMarkup :: A.Value -> T.Parser Update
   parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
    reply_markup_message_id <- optional $ o A..: "reply_markup_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatReplyMarkup { reply_markup_message_id = reply_markup_message_id, chat_id = chat_id }

   parseUpdateChatDraftMessage :: A.Value -> T.Parser Update
   parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
    order <- optional $ o A..: "order"
    draft_message <- optional $ o A..: "draft_message"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatDraftMessage { order = order, draft_message = draft_message, chat_id = chat_id }

   parseUpdateChatOnlineMemberCount :: A.Value -> T.Parser Update
   parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
    online_member_count <- optional $ o A..: "online_member_count"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateChatOnlineMemberCount { online_member_count = online_member_count, chat_id = chat_id }

   parseUpdateNotification :: A.Value -> T.Parser Update
   parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
    notification <- optional $ o A..: "notification"
    notification_group_id <- optional $ o A..: "notification_group_id"
    return $ UpdateNotification { notification = notification, notification_group_id = notification_group_id }

   parseUpdateNotificationGroup :: A.Value -> T.Parser Update
   parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
    removed_notification_ids <- optional $ o A..: "removed_notification_ids"
    added_notifications <- optional $ o A..: "added_notifications"
    total_count <- optional $ o A..: "total_count"
    is_silent <- optional $ o A..: "is_silent"
    notification_settings_chat_id <- optional $ o A..: "notification_settings_chat_id"
    chat_id <- optional $ o A..: "chat_id"
    __type <- optional $ o A..: "type"
    notification_group_id <- optional $ o A..: "notification_group_id"
    return $ UpdateNotificationGroup { removed_notification_ids = removed_notification_ids, added_notifications = added_notifications, total_count = total_count, is_silent = is_silent, notification_settings_chat_id = notification_settings_chat_id, chat_id = chat_id, __type = __type, notification_group_id = notification_group_id }

   parseUpdateActiveNotifications :: A.Value -> T.Parser Update
   parseUpdateActiveNotifications = A.withObject "UpdateActiveNotifications" $ \o -> do
    groups <- optional $ o A..: "groups"
    return $ UpdateActiveNotifications { groups = groups }

   parseUpdateHavePendingNotifications :: A.Value -> T.Parser Update
   parseUpdateHavePendingNotifications = A.withObject "UpdateHavePendingNotifications" $ \o -> do
    have_unreceived_notifications <- optional $ o A..: "have_unreceived_notifications"
    have_delayed_notifications <- optional $ o A..: "have_delayed_notifications"
    return $ UpdateHavePendingNotifications { have_unreceived_notifications = have_unreceived_notifications, have_delayed_notifications = have_delayed_notifications }

   parseUpdateDeleteMessages :: A.Value -> T.Parser Update
   parseUpdateDeleteMessages = A.withObject "UpdateDeleteMessages" $ \o -> do
    from_cache <- optional $ o A..: "from_cache"
    is_permanent <- optional $ o A..: "is_permanent"
    message_ids <- optional $ o A..: "message_ids"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateDeleteMessages { from_cache = from_cache, is_permanent = is_permanent, message_ids = message_ids, chat_id = chat_id }

   parseUpdateUserChatAction :: A.Value -> T.Parser Update
   parseUpdateUserChatAction = A.withObject "UpdateUserChatAction" $ \o -> do
    action <- optional $ o A..: "action"
    user_id <- optional $ o A..: "user_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ UpdateUserChatAction { action = action, user_id = user_id, chat_id = chat_id }

   parseUpdateUserStatus :: A.Value -> T.Parser Update
   parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
    status <- optional $ o A..: "status"
    user_id <- optional $ o A..: "user_id"
    return $ UpdateUserStatus { status = status, user_id = user_id }

   parseUpdateUser :: A.Value -> T.Parser Update
   parseUpdateUser = A.withObject "UpdateUser" $ \o -> do
    user <- optional $ o A..: "user"
    return $ UpdateUser { user = user }

   parseUpdateBasicGroup :: A.Value -> T.Parser Update
   parseUpdateBasicGroup = A.withObject "UpdateBasicGroup" $ \o -> do
    basic_group <- optional $ o A..: "basic_group"
    return $ UpdateBasicGroup { basic_group = basic_group }

   parseUpdateSupergroup :: A.Value -> T.Parser Update
   parseUpdateSupergroup = A.withObject "UpdateSupergroup" $ \o -> do
    supergroup <- optional $ o A..: "supergroup"
    return $ UpdateSupergroup { supergroup = supergroup }

   parseUpdateSecretChat :: A.Value -> T.Parser Update
   parseUpdateSecretChat = A.withObject "UpdateSecretChat" $ \o -> do
    secret_chat <- optional $ o A..: "secret_chat"
    return $ UpdateSecretChat { secret_chat = secret_chat }

   parseUpdateUserFullInfo :: A.Value -> T.Parser Update
   parseUpdateUserFullInfo = A.withObject "UpdateUserFullInfo" $ \o -> do
    user_full_info <- optional $ o A..: "user_full_info"
    user_id <- optional $ o A..: "user_id"
    return $ UpdateUserFullInfo { user_full_info = user_full_info, user_id = user_id }

   parseUpdateBasicGroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
    basic_group_full_info <- optional $ o A..: "basic_group_full_info"
    basic_group_id <- optional $ o A..: "basic_group_id"
    return $ UpdateBasicGroupFullInfo { basic_group_full_info = basic_group_full_info, basic_group_id = basic_group_id }

   parseUpdateSupergroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
    supergroup_full_info <- optional $ o A..: "supergroup_full_info"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ UpdateSupergroupFullInfo { supergroup_full_info = supergroup_full_info, supergroup_id = supergroup_id }

   parseUpdateServiceNotification :: A.Value -> T.Parser Update
   parseUpdateServiceNotification = A.withObject "UpdateServiceNotification" $ \o -> do
    content <- optional $ o A..: "content"
    _type <- optional $ o A..: "type"
    return $ UpdateServiceNotification { content = content, _type = _type }

   parseUpdateFile :: A.Value -> T.Parser Update
   parseUpdateFile = A.withObject "UpdateFile" $ \o -> do
    file <- optional $ o A..: "file"
    return $ UpdateFile { file = file }

   parseUpdateFileGenerationStart :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStart = A.withObject "UpdateFileGenerationStart" $ \o -> do
    conversion <- optional $ o A..: "conversion"
    destination_path <- optional $ o A..: "destination_path"
    original_path <- optional $ o A..: "original_path"
    generation_id <- optional $ o A..: "generation_id"
    return $ UpdateFileGenerationStart { conversion = conversion, destination_path = destination_path, original_path = original_path, generation_id = generation_id }

   parseUpdateFileGenerationStop :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
    generation_id <- optional $ o A..: "generation_id"
    return $ UpdateFileGenerationStop { generation_id = generation_id }

   parseUpdateCall :: A.Value -> T.Parser Update
   parseUpdateCall = A.withObject "UpdateCall" $ \o -> do
    call <- optional $ o A..: "call"
    return $ UpdateCall { call = call }

   parseUpdateUserPrivacySettingRules :: A.Value -> T.Parser Update
   parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
    rules <- optional $ o A..: "rules"
    setting <- optional $ o A..: "setting"
    return $ UpdateUserPrivacySettingRules { rules = rules, setting = setting }

   parseUpdateUnreadMessageCount :: A.Value -> T.Parser Update
   parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
    unread_unmuted_count <- optional $ o A..: "unread_unmuted_count"
    unread_count <- optional $ o A..: "unread_count"
    chat_list <- optional $ o A..: "chat_list"
    return $ UpdateUnreadMessageCount { unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, chat_list = chat_list }

   parseUpdateUnreadChatCount :: A.Value -> T.Parser Update
   parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
    marked_as_unread_unmuted_count <- optional $ o A..: "marked_as_unread_unmuted_count"
    marked_as_unread_count <- optional $ o A..: "marked_as_unread_count"
    unread_unmuted_count <- optional $ o A..: "unread_unmuted_count"
    unread_count <- optional $ o A..: "unread_count"
    total_count <- optional $ o A..: "total_count"
    chat_list <- optional $ o A..: "chat_list"
    return $ UpdateUnreadChatCount { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count, marked_as_unread_count = marked_as_unread_count, unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, total_count = total_count, chat_list = chat_list }

   parseUpdateOption :: A.Value -> T.Parser Update
   parseUpdateOption = A.withObject "UpdateOption" $ \o -> do
    value <- optional $ o A..: "value"
    name <- optional $ o A..: "name"
    return $ UpdateOption { value = value, name = name }

   parseUpdateInstalledStickerSets :: A.Value -> T.Parser Update
   parseUpdateInstalledStickerSets = A.withObject "UpdateInstalledStickerSets" $ \o -> do
    sticker_set_ids <- optional $ o A..: "sticker_set_ids"
    is_masks <- optional $ o A..: "is_masks"
    return $ UpdateInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }

   parseUpdateTrendingStickerSets :: A.Value -> T.Parser Update
   parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
    sticker_sets <- optional $ o A..: "sticker_sets"
    return $ UpdateTrendingStickerSets { sticker_sets = sticker_sets }

   parseUpdateRecentStickers :: A.Value -> T.Parser Update
   parseUpdateRecentStickers = A.withObject "UpdateRecentStickers" $ \o -> do
    sticker_ids <- optional $ o A..: "sticker_ids"
    is_attached <- optional $ o A..: "is_attached"
    return $ UpdateRecentStickers { sticker_ids = sticker_ids, is_attached = is_attached }

   parseUpdateFavoriteStickers :: A.Value -> T.Parser Update
   parseUpdateFavoriteStickers = A.withObject "UpdateFavoriteStickers" $ \o -> do
    sticker_ids <- optional $ o A..: "sticker_ids"
    return $ UpdateFavoriteStickers { sticker_ids = sticker_ids }

   parseUpdateSavedAnimations :: A.Value -> T.Parser Update
   parseUpdateSavedAnimations = A.withObject "UpdateSavedAnimations" $ \o -> do
    animation_ids <- optional $ o A..: "animation_ids"
    return $ UpdateSavedAnimations { animation_ids = animation_ids }

   parseUpdateSelectedBackground :: A.Value -> T.Parser Update
   parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
    background <- optional $ o A..: "background"
    for_dark_theme <- optional $ o A..: "for_dark_theme"
    return $ UpdateSelectedBackground { background = background, for_dark_theme = for_dark_theme }

   parseUpdateLanguagePackStrings :: A.Value -> T.Parser Update
   parseUpdateLanguagePackStrings = A.withObject "UpdateLanguagePackStrings" $ \o -> do
    strings <- optional $ o A..: "strings"
    language_pack_id <- optional $ o A..: "language_pack_id"
    localization_target <- optional $ o A..: "localization_target"
    return $ UpdateLanguagePackStrings { strings = strings, language_pack_id = language_pack_id, localization_target = localization_target }

   parseUpdateConnectionState :: A.Value -> T.Parser Update
   parseUpdateConnectionState = A.withObject "UpdateConnectionState" $ \o -> do
    state <- optional $ o A..: "state"
    return $ UpdateConnectionState { state = state }

   parseUpdateTermsOfService :: A.Value -> T.Parser Update
   parseUpdateTermsOfService = A.withObject "UpdateTermsOfService" $ \o -> do
    terms_of_service <- optional $ o A..: "terms_of_service"
    terms_of_service_id <- optional $ o A..: "terms_of_service_id"
    return $ UpdateTermsOfService { terms_of_service = terms_of_service, terms_of_service_id = terms_of_service_id }

   parseUpdateUsersNearby :: A.Value -> T.Parser Update
   parseUpdateUsersNearby = A.withObject "UpdateUsersNearby" $ \o -> do
    users_nearby <- optional $ o A..: "users_nearby"
    return $ UpdateUsersNearby { users_nearby = users_nearby }

   parseUpdateNewInlineQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
    offset <- optional $ o A..: "offset"
    query <- optional $ o A..: "query"
    user_location <- optional $ o A..: "user_location"
    sender_user_id <- optional $ o A..: "sender_user_id"
    _id <- optional $ o A..: "id"
    return $ UpdateNewInlineQuery { offset = offset, query = query, user_location = user_location, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewChosenInlineResult :: A.Value -> T.Parser Update
   parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
    inline_message_id <- optional $ o A..: "inline_message_id"
    result_id <- optional $ o A..: "result_id"
    query <- optional $ o A..: "query"
    user_location <- optional $ o A..: "user_location"
    sender_user_id <- optional $ o A..: "sender_user_id"
    return $ UpdateNewChosenInlineResult { inline_message_id = inline_message_id, result_id = result_id, query = query, user_location = user_location, sender_user_id = sender_user_id }

   parseUpdateNewCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
    payload <- optional $ o A..: "payload"
    chat_instance <- optional $ o A..: "chat_instance"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    sender_user_id <- optional $ o A..: "sender_user_id"
    _id <- optional $ o A..: "id"
    return $ UpdateNewCallbackQuery { payload = payload, chat_instance = chat_instance, message_id = message_id, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewInlineCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
    payload <- optional $ o A..: "payload"
    chat_instance <- optional $ o A..: "chat_instance"
    inline_message_id <- optional $ o A..: "inline_message_id"
    sender_user_id <- optional $ o A..: "sender_user_id"
    _id <- optional $ o A..: "id"
    return $ UpdateNewInlineCallbackQuery { payload = payload, chat_instance = chat_instance, inline_message_id = inline_message_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewShippingQuery :: A.Value -> T.Parser Update
   parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
    shipping_address <- optional $ o A..: "shipping_address"
    invoice_payload <- optional $ o A..: "invoice_payload"
    sender_user_id <- optional $ o A..: "sender_user_id"
    _id <- optional $ o A..: "id"
    return $ UpdateNewShippingQuery { shipping_address = shipping_address, invoice_payload = invoice_payload, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewPreCheckoutQuery :: A.Value -> T.Parser Update
   parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
    order_info <- optional $ o A..: "order_info"
    shipping_option_id <- optional $ o A..: "shipping_option_id"
    invoice_payload <- optional $ o A..: "invoice_payload"
    total_amount <- optional $ o A..: "total_amount"
    currency <- optional $ o A..: "currency"
    sender_user_id <- optional $ o A..: "sender_user_id"
    _id <- optional $ o A..: "id"
    return $ UpdateNewPreCheckoutQuery { order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewCustomEvent :: A.Value -> T.Parser Update
   parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
    event <- optional $ o A..: "event"
    return $ UpdateNewCustomEvent { event = event }

   parseUpdateNewCustomQuery :: A.Value -> T.Parser Update
   parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
    timeout <- optional $ o A..: "timeout"
    _data <- optional $ o A..: "data"
    _id <- optional $ o A..: "id"
    return $ UpdateNewCustomQuery { timeout = timeout, _data = _data, _id = _id }

   parseUpdatePoll :: A.Value -> T.Parser Update
   parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
    poll <- optional $ o A..: "poll"
    return $ UpdatePoll { poll = poll }

   parseUpdatePollAnswer :: A.Value -> T.Parser Update
   parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
    option_ids <- optional $ o A..: "option_ids"
    user_id <- optional $ o A..: "user_id"
    poll_id <- optional $ o A..: "poll_id"
    return $ UpdatePollAnswer { option_ids = option_ids, user_id = user_id, poll_id = poll_id }