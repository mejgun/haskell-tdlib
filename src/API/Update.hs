-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Update where

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
 UpdateAuthorizationState { authorization_state :: AuthorizationState.AuthorizationState }  
 | UpdateNewMessage { message :: Message.Message }  
 | UpdateMessageSendAcknowledged { message_id :: Int, chat_id :: Int }  
 | UpdateMessageSendSucceeded { old_message_id :: Int, message :: Message.Message }  
 | UpdateMessageSendFailed { error_message :: String, error_code :: Int, old_message_id :: Int, message :: Message.Message }  
 | UpdateMessageContent { new_content :: MessageContent.MessageContent, message_id :: Int, chat_id :: Int }  
 | UpdateMessageEdited { reply_markup :: ReplyMarkup.ReplyMarkup, edit_date :: Int, message_id :: Int, chat_id :: Int }  
 | UpdateMessageViews { views :: Int, message_id :: Int, chat_id :: Int }  
 | UpdateMessageContentOpened { message_id :: Int, chat_id :: Int }  
 | UpdateMessageMentionRead { unread_mention_count :: Int, message_id :: Int, chat_id :: Int }  
 | UpdateMessageLiveLocationViewed { message_id :: Int, chat_id :: Int }  
 | UpdateNewChat { chat :: Chat.Chat }  
 | UpdateChatChatList { chat_list :: ChatList.ChatList, chat_id :: Int }  
 | UpdateChatTitle { title :: String, chat_id :: Int }  
 | UpdateChatPhoto { photo :: ChatPhoto.ChatPhoto, chat_id :: Int }  
 | UpdateChatPermissions { permissions :: ChatPermissions.ChatPermissions, chat_id :: Int }  
 | UpdateChatLastMessage { order :: Int, last_message :: Message.Message, chat_id :: Int }  
 | UpdateChatOrder { order :: Int, chat_id :: Int }  
 | UpdateChatIsPinned { order :: Int, is_pinned :: Bool, chat_id :: Int }  
 | UpdateChatIsMarkedAsUnread { is_marked_as_unread :: Bool, chat_id :: Int }  
 | UpdateChatIsSponsored { order :: Int, is_sponsored :: Bool, chat_id :: Int }  
 | UpdateChatHasScheduledMessages { has_scheduled_messages :: Bool, chat_id :: Int }  
 | UpdateChatDefaultDisableNotification { default_disable_notification :: Bool, chat_id :: Int }  
 | UpdateChatReadInbox { unread_count :: Int, last_read_inbox_message_id :: Int, chat_id :: Int }  
 | UpdateChatReadOutbox { last_read_outbox_message_id :: Int, chat_id :: Int }  
 | UpdateChatUnreadMentionCount { unread_mention_count :: Int, chat_id :: Int }  
 | UpdateChatNotificationSettings { _notification_settings :: ChatNotificationSettings.ChatNotificationSettings, chat_id :: Int }  
 | UpdateScopeNotificationSettings { notification_settings :: ScopeNotificationSettings.ScopeNotificationSettings, scope :: NotificationSettingsScope.NotificationSettingsScope }  
 | UpdateChatActionBar { action_bar :: ChatActionBar.ChatActionBar, chat_id :: Int }  
 | UpdateChatPinnedMessage { pinned_message_id :: Int, chat_id :: Int }  
 | UpdateChatReplyMarkup { reply_markup_message_id :: Int, chat_id :: Int }  
 | UpdateChatDraftMessage { order :: Int, draft_message :: DraftMessage.DraftMessage, chat_id :: Int }  
 | UpdateChatOnlineMemberCount { online_member_count :: Int, chat_id :: Int }  
 | UpdateNotification { notification :: Notification.Notification, notification_group_id :: Int }  
 | UpdateNotificationGroup { removed_notification_ids :: [Int], added_notifications :: [Notification.Notification], total_count :: Int, is_silent :: Bool, notification_settings_chat_id :: Int, chat_id :: Int, __type :: NotificationGroupType.NotificationGroupType, notification_group_id :: Int }  
 | UpdateActiveNotifications { groups :: [NotificationGroup.NotificationGroup] }  
 | UpdateHavePendingNotifications { have_unreceived_notifications :: Bool, have_delayed_notifications :: Bool }  
 | UpdateDeleteMessages { from_cache :: Bool, is_permanent :: Bool, message_ids :: [Int], chat_id :: Int }  
 | UpdateUserChatAction { action :: ChatAction.ChatAction, user_id :: Int, chat_id :: Int }  
 | UpdateUserStatus { status :: UserStatus.UserStatus, user_id :: Int }  
 | UpdateUser { user :: User.User }  
 | UpdateBasicGroup { basic_group :: BasicGroup.BasicGroup }  
 | UpdateSupergroup { supergroup :: Supergroup.Supergroup }  
 | UpdateSecretChat { secret_chat :: SecretChat.SecretChat }  
 | UpdateUserFullInfo { user_full_info :: UserFullInfo.UserFullInfo, user_id :: Int }  
 | UpdateBasicGroupFullInfo { basic_group_full_info :: BasicGroupFullInfo.BasicGroupFullInfo, basic_group_id :: Int }  
 | UpdateSupergroupFullInfo { supergroup_full_info :: SupergroupFullInfo.SupergroupFullInfo, supergroup_id :: Int }  
 | UpdateServiceNotification { content :: MessageContent.MessageContent, _type :: String }  
 | UpdateFile { file :: File.File }  
 | UpdateFileGenerationStart { conversion :: String, destination_path :: String, original_path :: String, generation_id :: Int }  
 | UpdateFileGenerationStop { generation_id :: Int }  
 | UpdateCall { call :: Call.Call }  
 | UpdateUserPrivacySettingRules { rules :: UserPrivacySettingRules.UserPrivacySettingRules, setting :: UserPrivacySetting.UserPrivacySetting }  
 | UpdateUnreadMessageCount { unread_unmuted_count :: Int, unread_count :: Int, chat_list :: ChatList.ChatList }  
 | UpdateUnreadChatCount { marked_as_unread_unmuted_count :: Int, marked_as_unread_count :: Int, unread_unmuted_count :: Int, unread_count :: Int, total_count :: Int, chat_list :: ChatList.ChatList }  
 | UpdateOption { value :: OptionValue.OptionValue, name :: String }  
 | UpdateInstalledStickerSets { sticker_set_ids :: [Int], is_masks :: Bool }  
 | UpdateTrendingStickerSets { sticker_sets :: StickerSets.StickerSets }  
 | UpdateRecentStickers { sticker_ids :: [Int], is_attached :: Bool }  
 | UpdateFavoriteStickers { sticker_ids :: [Int] }  
 | UpdateSavedAnimations { animation_ids :: [Int] }  
 | UpdateSelectedBackground { background :: Background.Background, for_dark_theme :: Bool }  
 | UpdateLanguagePackStrings { strings :: [LanguagePackString.LanguagePackString], language_pack_id :: String, localization_target :: String }  
 | UpdateConnectionState { state :: ConnectionState.ConnectionState }  
 | UpdateTermsOfService { terms_of_service :: TermsOfService.TermsOfService, terms_of_service_id :: String }  
 | UpdateUsersNearby { users_nearby :: [ChatNearby.ChatNearby] }  
 | UpdateNewInlineQuery { offset :: String, query :: String, user_location :: Location.Location, sender_user_id :: Int, _id :: Int }  
 | UpdateNewChosenInlineResult { inline_message_id :: String, result_id :: String, query :: String, user_location :: Location.Location, sender_user_id :: Int }  
 | UpdateNewCallbackQuery { payload :: CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Int, message_id :: Int, chat_id :: Int, sender_user_id :: Int, _id :: Int }  
 | UpdateNewInlineCallbackQuery { payload :: CallbackQueryPayload.CallbackQueryPayload, chat_instance :: Int, inline_message_id :: String, sender_user_id :: Int, _id :: Int }  
 | UpdateNewShippingQuery { shipping_address :: Address.Address, invoice_payload :: String, sender_user_id :: Int, _id :: Int }  
 | UpdateNewPreCheckoutQuery { order_info :: OrderInfo.OrderInfo, shipping_option_id :: String, invoice_payload :: String, total_amount :: Int, currency :: String, sender_user_id :: Int, _id :: Int }  
 | UpdateNewCustomEvent { event :: String }  
 | UpdateNewCustomQuery { timeout :: Int, _data :: String, _id :: Int }  
 | UpdatePoll { poll :: Poll.Poll }  
 | UpdatePollAnswer { option_ids :: [Int], user_id :: Int, poll_id :: Int }  deriving (Show)

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
    authorization_state <- o A..: "authorization_state"
    return $ UpdateAuthorizationState { authorization_state = authorization_state }

   parseUpdateNewMessage :: A.Value -> T.Parser Update
   parseUpdateNewMessage = A.withObject "UpdateNewMessage" $ \o -> do
    message <- o A..: "message"
    return $ UpdateNewMessage { message = message }

   parseUpdateMessageSendAcknowledged :: A.Value -> T.Parser Update
   parseUpdateMessageSendAcknowledged = A.withObject "UpdateMessageSendAcknowledged" $ \o -> do
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageSendAcknowledged { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageSendSucceeded :: A.Value -> T.Parser Update
   parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
    old_message_id <- o A..: "old_message_id"
    message <- o A..: "message"
    return $ UpdateMessageSendSucceeded { old_message_id = old_message_id, message = message }

   parseUpdateMessageSendFailed :: A.Value -> T.Parser Update
   parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
    error_message <- o A..: "error_message"
    error_code <- o A..: "error_code"
    old_message_id <- o A..: "old_message_id"
    message <- o A..: "message"
    return $ UpdateMessageSendFailed { error_message = error_message, error_code = error_code, old_message_id = old_message_id, message = message }

   parseUpdateMessageContent :: A.Value -> T.Parser Update
   parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
    new_content <- o A..: "new_content"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageContent { new_content = new_content, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageEdited :: A.Value -> T.Parser Update
   parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
    reply_markup <- o A..: "reply_markup"
    edit_date <- o A..: "edit_date"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageEdited { reply_markup = reply_markup, edit_date = edit_date, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageViews :: A.Value -> T.Parser Update
   parseUpdateMessageViews = A.withObject "UpdateMessageViews" $ \o -> do
    views <- o A..: "views"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageViews { views = views, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageContentOpened :: A.Value -> T.Parser Update
   parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageContentOpened { message_id = message_id, chat_id = chat_id }

   parseUpdateMessageMentionRead :: A.Value -> T.Parser Update
   parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
    unread_mention_count <- o A..: "unread_mention_count"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageMentionRead { unread_mention_count = unread_mention_count, message_id = message_id, chat_id = chat_id }

   parseUpdateMessageLiveLocationViewed :: A.Value -> T.Parser Update
   parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateMessageLiveLocationViewed { message_id = message_id, chat_id = chat_id }

   parseUpdateNewChat :: A.Value -> T.Parser Update
   parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
    chat <- o A..: "chat"
    return $ UpdateNewChat { chat = chat }

   parseUpdateChatChatList :: A.Value -> T.Parser Update
   parseUpdateChatChatList = A.withObject "UpdateChatChatList" $ \o -> do
    chat_list <- o A..: "chat_list"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatChatList { chat_list = chat_list, chat_id = chat_id }

   parseUpdateChatTitle :: A.Value -> T.Parser Update
   parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
    title <- o A..: "title"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatTitle { title = title, chat_id = chat_id }

   parseUpdateChatPhoto :: A.Value -> T.Parser Update
   parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
    photo <- o A..: "photo"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatPhoto { photo = photo, chat_id = chat_id }

   parseUpdateChatPermissions :: A.Value -> T.Parser Update
   parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
    permissions <- o A..: "permissions"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatPermissions { permissions = permissions, chat_id = chat_id }

   parseUpdateChatLastMessage :: A.Value -> T.Parser Update
   parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
    order <- o A..: "order"
    last_message <- o A..: "last_message"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatLastMessage { order = order, last_message = last_message, chat_id = chat_id }

   parseUpdateChatOrder :: A.Value -> T.Parser Update
   parseUpdateChatOrder = A.withObject "UpdateChatOrder" $ \o -> do
    order <- o A..: "order"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatOrder { order = order, chat_id = chat_id }

   parseUpdateChatIsPinned :: A.Value -> T.Parser Update
   parseUpdateChatIsPinned = A.withObject "UpdateChatIsPinned" $ \o -> do
    order <- o A..: "order"
    is_pinned <- o A..: "is_pinned"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatIsPinned { order = order, is_pinned = is_pinned, chat_id = chat_id }

   parseUpdateChatIsMarkedAsUnread :: A.Value -> T.Parser Update
   parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
    is_marked_as_unread <- o A..: "is_marked_as_unread"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }

   parseUpdateChatIsSponsored :: A.Value -> T.Parser Update
   parseUpdateChatIsSponsored = A.withObject "UpdateChatIsSponsored" $ \o -> do
    order <- o A..: "order"
    is_sponsored <- o A..: "is_sponsored"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatIsSponsored { order = order, is_sponsored = is_sponsored, chat_id = chat_id }

   parseUpdateChatHasScheduledMessages :: A.Value -> T.Parser Update
   parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
    has_scheduled_messages <- o A..: "has_scheduled_messages"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatHasScheduledMessages { has_scheduled_messages = has_scheduled_messages, chat_id = chat_id }

   parseUpdateChatDefaultDisableNotification :: A.Value -> T.Parser Update
   parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
    default_disable_notification <- o A..: "default_disable_notification"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }

   parseUpdateChatReadInbox :: A.Value -> T.Parser Update
   parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
    unread_count <- o A..: "unread_count"
    last_read_inbox_message_id <- o A..: "last_read_inbox_message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatReadInbox { unread_count = unread_count, last_read_inbox_message_id = last_read_inbox_message_id, chat_id = chat_id }

   parseUpdateChatReadOutbox :: A.Value -> T.Parser Update
   parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
    last_read_outbox_message_id <- o A..: "last_read_outbox_message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatReadOutbox { last_read_outbox_message_id = last_read_outbox_message_id, chat_id = chat_id }

   parseUpdateChatUnreadMentionCount :: A.Value -> T.Parser Update
   parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
    unread_mention_count <- o A..: "unread_mention_count"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatUnreadMentionCount { unread_mention_count = unread_mention_count, chat_id = chat_id }

   parseUpdateChatNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
    _notification_settings <- o A..: "notification_settings"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatNotificationSettings { _notification_settings = _notification_settings, chat_id = chat_id }

   parseUpdateScopeNotificationSettings :: A.Value -> T.Parser Update
   parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
    notification_settings <- o A..: "notification_settings"
    scope <- o A..: "scope"
    return $ UpdateScopeNotificationSettings { notification_settings = notification_settings, scope = scope }

   parseUpdateChatActionBar :: A.Value -> T.Parser Update
   parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
    action_bar <- o A..: "action_bar"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatActionBar { action_bar = action_bar, chat_id = chat_id }

   parseUpdateChatPinnedMessage :: A.Value -> T.Parser Update
   parseUpdateChatPinnedMessage = A.withObject "UpdateChatPinnedMessage" $ \o -> do
    pinned_message_id <- o A..: "pinned_message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatPinnedMessage { pinned_message_id = pinned_message_id, chat_id = chat_id }

   parseUpdateChatReplyMarkup :: A.Value -> T.Parser Update
   parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
    reply_markup_message_id <- o A..: "reply_markup_message_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatReplyMarkup { reply_markup_message_id = reply_markup_message_id, chat_id = chat_id }

   parseUpdateChatDraftMessage :: A.Value -> T.Parser Update
   parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
    order <- o A..: "order"
    draft_message <- o A..: "draft_message"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatDraftMessage { order = order, draft_message = draft_message, chat_id = chat_id }

   parseUpdateChatOnlineMemberCount :: A.Value -> T.Parser Update
   parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
    online_member_count <- o A..: "online_member_count"
    chat_id <- o A..: "chat_id"
    return $ UpdateChatOnlineMemberCount { online_member_count = online_member_count, chat_id = chat_id }

   parseUpdateNotification :: A.Value -> T.Parser Update
   parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
    notification <- o A..: "notification"
    notification_group_id <- o A..: "notification_group_id"
    return $ UpdateNotification { notification = notification, notification_group_id = notification_group_id }

   parseUpdateNotificationGroup :: A.Value -> T.Parser Update
   parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
    removed_notification_ids <- o A..: "removed_notification_ids"
    added_notifications <- o A..: "added_notifications"
    total_count <- o A..: "total_count"
    is_silent <- o A..: "is_silent"
    notification_settings_chat_id <- o A..: "notification_settings_chat_id"
    chat_id <- o A..: "chat_id"
    __type <- o A..: "type"
    notification_group_id <- o A..: "notification_group_id"
    return $ UpdateNotificationGroup { removed_notification_ids = removed_notification_ids, added_notifications = added_notifications, total_count = total_count, is_silent = is_silent, notification_settings_chat_id = notification_settings_chat_id, chat_id = chat_id, __type = __type, notification_group_id = notification_group_id }

   parseUpdateActiveNotifications :: A.Value -> T.Parser Update
   parseUpdateActiveNotifications = A.withObject "UpdateActiveNotifications" $ \o -> do
    groups <- o A..: "groups"
    return $ UpdateActiveNotifications { groups = groups }

   parseUpdateHavePendingNotifications :: A.Value -> T.Parser Update
   parseUpdateHavePendingNotifications = A.withObject "UpdateHavePendingNotifications" $ \o -> do
    have_unreceived_notifications <- o A..: "have_unreceived_notifications"
    have_delayed_notifications <- o A..: "have_delayed_notifications"
    return $ UpdateHavePendingNotifications { have_unreceived_notifications = have_unreceived_notifications, have_delayed_notifications = have_delayed_notifications }

   parseUpdateDeleteMessages :: A.Value -> T.Parser Update
   parseUpdateDeleteMessages = A.withObject "UpdateDeleteMessages" $ \o -> do
    from_cache <- o A..: "from_cache"
    is_permanent <- o A..: "is_permanent"
    message_ids <- o A..: "message_ids"
    chat_id <- o A..: "chat_id"
    return $ UpdateDeleteMessages { from_cache = from_cache, is_permanent = is_permanent, message_ids = message_ids, chat_id = chat_id }

   parseUpdateUserChatAction :: A.Value -> T.Parser Update
   parseUpdateUserChatAction = A.withObject "UpdateUserChatAction" $ \o -> do
    action <- o A..: "action"
    user_id <- o A..: "user_id"
    chat_id <- o A..: "chat_id"
    return $ UpdateUserChatAction { action = action, user_id = user_id, chat_id = chat_id }

   parseUpdateUserStatus :: A.Value -> T.Parser Update
   parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
    status <- o A..: "status"
    user_id <- o A..: "user_id"
    return $ UpdateUserStatus { status = status, user_id = user_id }

   parseUpdateUser :: A.Value -> T.Parser Update
   parseUpdateUser = A.withObject "UpdateUser" $ \o -> do
    user <- o A..: "user"
    return $ UpdateUser { user = user }

   parseUpdateBasicGroup :: A.Value -> T.Parser Update
   parseUpdateBasicGroup = A.withObject "UpdateBasicGroup" $ \o -> do
    basic_group <- o A..: "basic_group"
    return $ UpdateBasicGroup { basic_group = basic_group }

   parseUpdateSupergroup :: A.Value -> T.Parser Update
   parseUpdateSupergroup = A.withObject "UpdateSupergroup" $ \o -> do
    supergroup <- o A..: "supergroup"
    return $ UpdateSupergroup { supergroup = supergroup }

   parseUpdateSecretChat :: A.Value -> T.Parser Update
   parseUpdateSecretChat = A.withObject "UpdateSecretChat" $ \o -> do
    secret_chat <- o A..: "secret_chat"
    return $ UpdateSecretChat { secret_chat = secret_chat }

   parseUpdateUserFullInfo :: A.Value -> T.Parser Update
   parseUpdateUserFullInfo = A.withObject "UpdateUserFullInfo" $ \o -> do
    user_full_info <- o A..: "user_full_info"
    user_id <- o A..: "user_id"
    return $ UpdateUserFullInfo { user_full_info = user_full_info, user_id = user_id }

   parseUpdateBasicGroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
    basic_group_full_info <- o A..: "basic_group_full_info"
    basic_group_id <- o A..: "basic_group_id"
    return $ UpdateBasicGroupFullInfo { basic_group_full_info = basic_group_full_info, basic_group_id = basic_group_id }

   parseUpdateSupergroupFullInfo :: A.Value -> T.Parser Update
   parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
    supergroup_full_info <- o A..: "supergroup_full_info"
    supergroup_id <- o A..: "supergroup_id"
    return $ UpdateSupergroupFullInfo { supergroup_full_info = supergroup_full_info, supergroup_id = supergroup_id }

   parseUpdateServiceNotification :: A.Value -> T.Parser Update
   parseUpdateServiceNotification = A.withObject "UpdateServiceNotification" $ \o -> do
    content <- o A..: "content"
    _type <- o A..: "type"
    return $ UpdateServiceNotification { content = content, _type = _type }

   parseUpdateFile :: A.Value -> T.Parser Update
   parseUpdateFile = A.withObject "UpdateFile" $ \o -> do
    file <- o A..: "file"
    return $ UpdateFile { file = file }

   parseUpdateFileGenerationStart :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStart = A.withObject "UpdateFileGenerationStart" $ \o -> do
    conversion <- o A..: "conversion"
    destination_path <- o A..: "destination_path"
    original_path <- o A..: "original_path"
    generation_id <- o A..: "generation_id"
    return $ UpdateFileGenerationStart { conversion = conversion, destination_path = destination_path, original_path = original_path, generation_id = generation_id }

   parseUpdateFileGenerationStop :: A.Value -> T.Parser Update
   parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
    generation_id <- o A..: "generation_id"
    return $ UpdateFileGenerationStop { generation_id = generation_id }

   parseUpdateCall :: A.Value -> T.Parser Update
   parseUpdateCall = A.withObject "UpdateCall" $ \o -> do
    call <- o A..: "call"
    return $ UpdateCall { call = call }

   parseUpdateUserPrivacySettingRules :: A.Value -> T.Parser Update
   parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
    rules <- o A..: "rules"
    setting <- o A..: "setting"
    return $ UpdateUserPrivacySettingRules { rules = rules, setting = setting }

   parseUpdateUnreadMessageCount :: A.Value -> T.Parser Update
   parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
    unread_unmuted_count <- o A..: "unread_unmuted_count"
    unread_count <- o A..: "unread_count"
    chat_list <- o A..: "chat_list"
    return $ UpdateUnreadMessageCount { unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, chat_list = chat_list }

   parseUpdateUnreadChatCount :: A.Value -> T.Parser Update
   parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
    marked_as_unread_unmuted_count <- o A..: "marked_as_unread_unmuted_count"
    marked_as_unread_count <- o A..: "marked_as_unread_count"
    unread_unmuted_count <- o A..: "unread_unmuted_count"
    unread_count <- o A..: "unread_count"
    total_count <- o A..: "total_count"
    chat_list <- o A..: "chat_list"
    return $ UpdateUnreadChatCount { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count, marked_as_unread_count = marked_as_unread_count, unread_unmuted_count = unread_unmuted_count, unread_count = unread_count, total_count = total_count, chat_list = chat_list }

   parseUpdateOption :: A.Value -> T.Parser Update
   parseUpdateOption = A.withObject "UpdateOption" $ \o -> do
    value <- o A..: "value"
    name <- o A..: "name"
    return $ UpdateOption { value = value, name = name }

   parseUpdateInstalledStickerSets :: A.Value -> T.Parser Update
   parseUpdateInstalledStickerSets = A.withObject "UpdateInstalledStickerSets" $ \o -> do
    sticker_set_ids <- o A..: "sticker_set_ids"
    is_masks <- o A..: "is_masks"
    return $ UpdateInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }

   parseUpdateTrendingStickerSets :: A.Value -> T.Parser Update
   parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
    sticker_sets <- o A..: "sticker_sets"
    return $ UpdateTrendingStickerSets { sticker_sets = sticker_sets }

   parseUpdateRecentStickers :: A.Value -> T.Parser Update
   parseUpdateRecentStickers = A.withObject "UpdateRecentStickers" $ \o -> do
    sticker_ids <- o A..: "sticker_ids"
    is_attached <- o A..: "is_attached"
    return $ UpdateRecentStickers { sticker_ids = sticker_ids, is_attached = is_attached }

   parseUpdateFavoriteStickers :: A.Value -> T.Parser Update
   parseUpdateFavoriteStickers = A.withObject "UpdateFavoriteStickers" $ \o -> do
    sticker_ids <- o A..: "sticker_ids"
    return $ UpdateFavoriteStickers { sticker_ids = sticker_ids }

   parseUpdateSavedAnimations :: A.Value -> T.Parser Update
   parseUpdateSavedAnimations = A.withObject "UpdateSavedAnimations" $ \o -> do
    animation_ids <- o A..: "animation_ids"
    return $ UpdateSavedAnimations { animation_ids = animation_ids }

   parseUpdateSelectedBackground :: A.Value -> T.Parser Update
   parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
    background <- o A..: "background"
    for_dark_theme <- o A..: "for_dark_theme"
    return $ UpdateSelectedBackground { background = background, for_dark_theme = for_dark_theme }

   parseUpdateLanguagePackStrings :: A.Value -> T.Parser Update
   parseUpdateLanguagePackStrings = A.withObject "UpdateLanguagePackStrings" $ \o -> do
    strings <- o A..: "strings"
    language_pack_id <- o A..: "language_pack_id"
    localization_target <- o A..: "localization_target"
    return $ UpdateLanguagePackStrings { strings = strings, language_pack_id = language_pack_id, localization_target = localization_target }

   parseUpdateConnectionState :: A.Value -> T.Parser Update
   parseUpdateConnectionState = A.withObject "UpdateConnectionState" $ \o -> do
    state <- o A..: "state"
    return $ UpdateConnectionState { state = state }

   parseUpdateTermsOfService :: A.Value -> T.Parser Update
   parseUpdateTermsOfService = A.withObject "UpdateTermsOfService" $ \o -> do
    terms_of_service <- o A..: "terms_of_service"
    terms_of_service_id <- o A..: "terms_of_service_id"
    return $ UpdateTermsOfService { terms_of_service = terms_of_service, terms_of_service_id = terms_of_service_id }

   parseUpdateUsersNearby :: A.Value -> T.Parser Update
   parseUpdateUsersNearby = A.withObject "UpdateUsersNearby" $ \o -> do
    users_nearby <- o A..: "users_nearby"
    return $ UpdateUsersNearby { users_nearby = users_nearby }

   parseUpdateNewInlineQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
    offset <- o A..: "offset"
    query <- o A..: "query"
    user_location <- o A..: "user_location"
    sender_user_id <- o A..: "sender_user_id"
    _id <- o A..: "id"
    return $ UpdateNewInlineQuery { offset = offset, query = query, user_location = user_location, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewChosenInlineResult :: A.Value -> T.Parser Update
   parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
    inline_message_id <- o A..: "inline_message_id"
    result_id <- o A..: "result_id"
    query <- o A..: "query"
    user_location <- o A..: "user_location"
    sender_user_id <- o A..: "sender_user_id"
    return $ UpdateNewChosenInlineResult { inline_message_id = inline_message_id, result_id = result_id, query = query, user_location = user_location, sender_user_id = sender_user_id }

   parseUpdateNewCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
    payload <- o A..: "payload"
    chat_instance <- o A..: "chat_instance"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    sender_user_id <- o A..: "sender_user_id"
    _id <- o A..: "id"
    return $ UpdateNewCallbackQuery { payload = payload, chat_instance = chat_instance, message_id = message_id, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewInlineCallbackQuery :: A.Value -> T.Parser Update
   parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
    payload <- o A..: "payload"
    chat_instance <- o A..: "chat_instance"
    inline_message_id <- o A..: "inline_message_id"
    sender_user_id <- o A..: "sender_user_id"
    _id <- o A..: "id"
    return $ UpdateNewInlineCallbackQuery { payload = payload, chat_instance = chat_instance, inline_message_id = inline_message_id, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewShippingQuery :: A.Value -> T.Parser Update
   parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
    shipping_address <- o A..: "shipping_address"
    invoice_payload <- o A..: "invoice_payload"
    sender_user_id <- o A..: "sender_user_id"
    _id <- o A..: "id"
    return $ UpdateNewShippingQuery { shipping_address = shipping_address, invoice_payload = invoice_payload, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewPreCheckoutQuery :: A.Value -> T.Parser Update
   parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
    order_info <- o A..: "order_info"
    shipping_option_id <- o A..: "shipping_option_id"
    invoice_payload <- o A..: "invoice_payload"
    total_amount <- o A..: "total_amount"
    currency <- o A..: "currency"
    sender_user_id <- o A..: "sender_user_id"
    _id <- o A..: "id"
    return $ UpdateNewPreCheckoutQuery { order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, sender_user_id = sender_user_id, _id = _id }

   parseUpdateNewCustomEvent :: A.Value -> T.Parser Update
   parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
    event <- o A..: "event"
    return $ UpdateNewCustomEvent { event = event }

   parseUpdateNewCustomQuery :: A.Value -> T.Parser Update
   parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
    timeout <- o A..: "timeout"
    _data <- o A..: "data"
    _id <- o A..: "id"
    return $ UpdateNewCustomQuery { timeout = timeout, _data = _data, _id = _id }

   parseUpdatePoll :: A.Value -> T.Parser Update
   parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
    poll <- o A..: "poll"
    return $ UpdatePoll { poll = poll }

   parseUpdatePollAnswer :: A.Value -> T.Parser Update
   parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
    option_ids <- o A..: "option_ids"
    user_id <- o A..: "user_id"
    poll_id <- o A..: "poll_id"
    return $ UpdatePollAnswer { option_ids = option_ids, user_id = user_id, poll_id = poll_id }