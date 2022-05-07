{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Update where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Address as Address
import qualified TD.Data.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Data.AuthorizationState as AuthorizationState
import qualified TD.Data.Background as Background
import qualified TD.Data.BasicGroup as BasicGroup
import qualified TD.Data.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Data.Call as Call
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatAction as ChatAction
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.ChatFilterInfo as ChatFilterInfo
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest
import qualified TD.Data.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatNearby as ChatNearby
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatPosition as ChatPosition
import qualified TD.Data.ChatTheme as ChatTheme
import qualified TD.Data.ChatType as ChatType
import qualified TD.Data.ConnectionState as ConnectionState
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.File as File
import qualified TD.Data.FileDownload as FileDownload
import qualified TD.Data.GroupCall as GroupCall
import qualified TD.Data.GroupCallParticipant as GroupCallParticipant
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified TD.Data.Location as Location
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.Notification as Notification
import qualified TD.Data.NotificationGroup as NotificationGroup
import qualified TD.Data.NotificationGroupType as NotificationGroupType
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Data.OptionValue as OptionValue
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.Poll as Poll
import qualified TD.Data.Reaction as Reaction
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Data.SecretChat as SecretChat
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerSet as StickerSet
import qualified TD.Data.StickerSets as StickerSets
import qualified TD.Data.SuggestedAction as SuggestedAction
import qualified TD.Data.Supergroup as Supergroup
import qualified TD.Data.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Data.TermsOfService as TermsOfService
import qualified TD.Data.UnreadReaction as UnreadReaction
import qualified TD.Data.User as User
import qualified TD.Data.UserFullInfo as UserFullInfo
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.VideoChat as VideoChat
import qualified Utils as U

-- | Contains notifications about data changes
data Update
  = -- | The user authorization state has changed @authorization_state New authorization state
    UpdateAuthorizationState
      { -- |
        authorization_state :: Maybe AuthorizationState.AuthorizationState
      }
  | -- | A new message was received; can also be an outgoing message @message The new message
    UpdateNewMessage
      { -- |
        message :: Maybe Message.Message
      }
  | -- | A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
    UpdateMessageSendAcknowledged
      { -- |
        message_id :: Maybe Int,
        -- | The chat identifier of the sent message @message_id A temporary message identifier
        chat_id :: Maybe Int
      }
  | -- | A message has been successfully sent @message The sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change @old_message_id The previous temporary message identifier
    UpdateMessageSendSucceeded
      { -- |
        old_message_id :: Maybe Int,
        -- |
        message :: Maybe Message.Message
      }
  | -- | A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
    UpdateMessageSendFailed
      { -- |
        error_message :: Maybe String,
        -- |
        error_code :: Maybe Int,
        -- |
        old_message_id :: Maybe Int,
        -- | The failed to send message @old_message_id The previous temporary message identifier @error_code An error code @error_message Error message
        message :: Maybe Message.Message
      }
  | -- | The message content has changed @chat_id Chat identifier @message_id Message identifier @new_content New message content
    UpdateMessageContent
      { -- |
        new_content :: Maybe MessageContent.MessageContent,
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A message was edited. Changes in the message content will come in a separate updateMessageContent @chat_id Chat identifier @message_id Message identifier @edit_date Point in time (Unix timestamp) when the message was edited @reply_markup New message reply markup; may be null
    UpdateMessageEdited
      { -- |
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        edit_date :: Maybe Int,
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The message pinned state was changed @chat_id Chat identifier @message_id The message identifier @is_pinned True, if the message is pinned
    UpdateMessageIsPinned
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The information about interactions with a message has changed @chat_id Chat identifier @message_id Message identifier @interaction_info New information about interactions with the message; may be null
    UpdateMessageInteractionInfo
      { -- |
        interaction_info :: Maybe MessageInteractionInfo.MessageInteractionInfo,
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages @chat_id Chat identifier @message_id Message identifier
    UpdateMessageContentOpened
      { -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A message with an unread mention was read @chat_id Chat identifier @message_id Message identifier @unread_mention_count The new number of unread mention messages left in the chat
    UpdateMessageMentionRead
      { -- |
        unread_mention_count :: Maybe Int,
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The list of unread reactions added to a message was changed @chat_id Chat identifier @message_id Message identifier @unread_reactions The new list of unread reactions @unread_reaction_count The new number of messages with unread reactions left in the chat
    UpdateMessageUnreadReactions
      { -- |
        unread_reaction_count :: Maybe Int,
        -- |
        unread_reactions :: Maybe [UnreadReaction.UnreadReaction],
        -- |
        message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A message with a live location was viewed. When the update is received, the application is supposed to update the live location
    UpdateMessageLiveLocationViewed
      { -- |
        message_id :: Maybe Int,
        -- | Identifier of the chat with the live location message @message_id Identifier of the message with live location
        chat_id :: Maybe Int
      }
  | -- | A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates @chat The chat
    UpdateNewChat
      { -- |
        chat :: Maybe Chat.Chat
      }
  | -- | The title of a chat was changed @chat_id Chat identifier @title The new chat title
    UpdateChatTitle
      { -- |
        title :: Maybe String,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat photo was changed @chat_id Chat identifier @photo The new chat photo; may be null
    UpdateChatPhoto
      { -- |
        photo :: Maybe ChatPhotoInfo.ChatPhotoInfo,
        -- |
        chat_id :: Maybe Int
      }
  | -- | Chat permissions was changed @chat_id Chat identifier @permissions The new chat permissions
    UpdateChatPermissions
      { -- |
        permissions :: Maybe ChatPermissions.ChatPermissions,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case @chat_id Chat identifier @last_message The new last message in the chat; may be null @positions The new chat positions in the chat lists
    UpdateChatLastMessage
      { -- |
        positions :: Maybe [ChatPosition.ChatPosition],
        -- |
        last_message :: Maybe Message.Message,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent @chat_id Chat identifier @position New chat position. If new order is 0, then the chat needs to be removed from the list
    UpdateChatPosition
      { -- |
        position :: Maybe ChatPosition.ChatPosition,
        -- |
        chat_id :: Maybe Int
      }
  | -- | Incoming messages were read or the number of unread messages has been changed @chat_id Chat identifier @last_read_inbox_message_id Identifier of the last read incoming message @unread_count The number of unread messages left in the chat
    UpdateChatReadInbox
      { -- |
        unread_count :: Maybe Int,
        -- |
        last_read_inbox_message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | Outgoing messages were read @chat_id Chat identifier @last_read_outbox_message_id Identifier of last read outgoing message
    UpdateChatReadOutbox
      { -- |
        last_read_outbox_message_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The chat action bar was changed @chat_id Chat identifier @action_bar The new value of the action bar; may be null
    UpdateChatActionBar
      { -- |
        action_bar :: Maybe ChatActionBar.ChatActionBar,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The chat available reactions were changed @chat_id Chat identifier @available_reactions The new list of reactions, available in the chat
    UpdateChatAvailableReactions
      { -- |
        available_reactions :: Maybe [String],
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied @chat_id Chat identifier @draft_message The new draft message; may be null @positions The new chat positions in the chat lists
    UpdateChatDraftMessage
      { -- |
        positions :: Maybe [ChatPosition.ChatPosition],
        -- |
        draft_message :: Maybe DraftMessage.DraftMessage,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The message sender that is selected to send messages in a chat has changed @chat_id Chat identifier @message_sender_id New value of message_sender_id; may be null if the user can't change message sender
    UpdateChatMessageSender
      { -- |
        message_sender_id :: Maybe MessageSender.MessageSender,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The message Time To Live setting for a chat was changed @chat_id Chat identifier @message_ttl New value of message_ttl
    UpdateChatMessageTtl
      { -- |
        message_ttl :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | Notification settings for a chat were changed @chat_id Chat identifier @notification_settings The new notification settings
    UpdateChatNotificationSettings
      { -- |
        notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The chat pending join requests were changed @chat_id Chat identifier @pending_join_requests The new data about pending join requests; may be null
    UpdateChatPendingJoinRequests
      { -- |
        pending_join_requests :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
    UpdateChatReplyMarkup
      { -- |
        reply_markup_message_id :: Maybe Int,
        -- | Chat identifier @reply_markup_message_id Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
        chat_id :: Maybe Int
      }
  | -- | The chat theme was changed @chat_id Chat identifier @theme_name The new name of the chat theme; may be empty if theme was reset to default
    UpdateChatTheme
      { -- |
        theme_name :: Maybe String,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The chat unread_mention_count has changed @chat_id Chat identifier @unread_mention_count The number of unread mention messages left in the chat
    UpdateChatUnreadMentionCount
      { -- |
        unread_mention_count :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The chat unread_reaction_count has changed @chat_id Chat identifier @unread_reaction_count The number of messages with unread reactions left in the chat
    UpdateChatUnreadReactionCount
      { -- |
        unread_reaction_count :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat video chat state has changed @chat_id Chat identifier @video_chat New value of video_chat
    UpdateChatVideoChat
      { -- |
        video_chat :: Maybe VideoChat.VideoChat,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The value of the default disable_notification parameter, used when a message is sent to the chat, was changed @chat_id Chat identifier @default_disable_notification The new default_disable_notification value
    UpdateChatDefaultDisableNotification
      { -- |
        default_disable_notification :: Maybe Bool,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat content was allowed or restricted for saving @chat_id Chat identifier @has_protected_content New value of has_protected_content
    UpdateChatHasProtectedContent
      { -- |
        has_protected_content :: Maybe Bool,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat's has_scheduled_messages field has changed @chat_id Chat identifier @has_scheduled_messages New value of has_scheduled_messages
    UpdateChatHasScheduledMessages
      { -- |
        has_scheduled_messages :: Maybe Bool,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat was blocked or unblocked @chat_id Chat identifier @is_blocked New value of is_blocked
    UpdateChatIsBlocked
      { -- |
        is_blocked :: Maybe Bool,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat was marked as unread or was read @chat_id Chat identifier @is_marked_as_unread New value of is_marked_as_unread
    UpdateChatIsMarkedAsUnread
      { -- |
        is_marked_as_unread :: Maybe Bool,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The list of chat filters or a chat filter has changed @chat_filters The new list of chat filters
    UpdateChatFilters
      { -- |
        chat_filters :: Maybe [ChatFilterInfo.ChatFilterInfo]
      }
  | -- | The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats. There is no guarantee that it will be sent just after the number of online users has changed @chat_id Identifier of the chat @online_member_count New number of online members in the chat, or 0 if unknown
    UpdateChatOnlineMemberCount
      { -- |
        online_member_count :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | Notification settings for some type of chats were updated @scope Types of chats for which notification settings were updated @notification_settings The new notification settings
    UpdateScopeNotificationSettings
      { -- |
        _notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings,
        -- |
        scope :: Maybe NotificationSettingsScope.NotificationSettingsScope
      }
  | -- | A notification was changed @notification_group_id Unique notification group identifier @notification Changed notification
    UpdateNotification
      { -- |
        notification :: Maybe Notification.Notification,
        -- |
        notification_group_id :: Maybe Int
      }
  | -- | A list of active notifications in a notification group has changed
    UpdateNotificationGroup
      { -- |
        removed_notification_ids :: Maybe [Int],
        -- | List of added group notifications, sorted by notification ID @removed_notification_ids Identifiers of removed group notifications, sorted by notification ID
        added_notifications :: Maybe [Notification.Notification],
        -- | Total number of unread notifications in the group, can be bigger than number of active notifications
        total_count :: Maybe Int,
        -- | Identifier of the notification sound to be played; 0 if sound is disabled
        notification_sound_id :: Maybe Int,
        -- | Chat identifier, which notification settings must be applied to the added notifications
        notification_settings_chat_id :: Maybe Int,
        -- | Identifier of a chat to which all notifications in the group belong
        chat_id :: Maybe Int,
        -- | New type of the notification group
        _type :: Maybe NotificationGroupType.NotificationGroupType,
        -- | Unique notification group identifier
        notification_group_id :: Maybe Int
      }
  | -- | Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update @groups Lists of active notification groups
    UpdateActiveNotifications
      { -- |
        groups :: Maybe [NotificationGroup.NotificationGroup]
      }
  | -- | Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
    UpdateHavePendingNotifications
      { -- | True, if there can be some yet unreceived notifications, which are being fetched from the server
        have_unreceived_notifications :: Maybe Bool,
        -- | True, if there are some delayed notification updates, which will be sent soon
        have_delayed_notifications :: Maybe Bool
      }
  | -- | Some messages were deleted @chat_id Chat identifier @message_ids Identifiers of the deleted messages
    UpdateDeleteMessages
      { -- | True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
        from_cache :: Maybe Bool,
        -- | True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
        is_permanent :: Maybe Bool,
        -- |
        message_ids :: Maybe [Int],
        -- |
        chat_id :: Maybe Int
      }
  | -- | A message sender activity in the chat has changed @chat_id Chat identifier @message_thread_id If not 0, a message thread identifier in which the action was performed @sender_id Identifier of a message sender performing the action @action The action
    UpdateChatAction
      { -- |
        action :: Maybe ChatAction.ChatAction,
        -- |
        sender_id :: Maybe MessageSender.MessageSender,
        -- |
        message_thread_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The user went online or offline @user_id User identifier @status New status of the user
    UpdateUserStatus
      { -- |
        status :: Maybe UserStatus.UserStatus,
        -- |
        user_id :: Maybe Int
      }
  | -- | Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application @user New data about the user
    UpdateUser
      { -- |
        user :: Maybe User.User
      }
  | -- | Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application @basic_group New data about the group
    UpdateBasicGroup
      { -- |
        basic_group :: Maybe BasicGroup.BasicGroup
      }
  | -- | Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application @supergroup New data about the supergroup
    UpdateSupergroup
      { -- |
        supergroup :: Maybe Supergroup.Supergroup
      }
  | -- | Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application @secret_chat New data about the secret chat
    UpdateSecretChat
      { -- |
        secret_chat :: Maybe SecretChat.SecretChat
      }
  | -- | Some data in userFullInfo has been changed @user_id User identifier @user_full_info New full information about the user
    UpdateUserFullInfo
      { -- |
        user_full_info :: Maybe UserFullInfo.UserFullInfo,
        -- |
        user_id :: Maybe Int
      }
  | -- | Some data in basicGroupFullInfo has been changed @basic_group_id Identifier of a basic group @basic_group_full_info New full information about the group
    UpdateBasicGroupFullInfo
      { -- |
        basic_group_full_info :: Maybe BasicGroupFullInfo.BasicGroupFullInfo,
        -- |
        basic_group_id :: Maybe Int
      }
  | -- | Some data in supergroupFullInfo has been changed @supergroup_id Identifier of the supergroup or channel @supergroup_full_info New full information about the supergroup
    UpdateSupergroupFullInfo
      { -- |
        supergroup_full_info :: Maybe SupergroupFullInfo.SupergroupFullInfo,
        -- |
        supergroup_id :: Maybe Int
      }
  | -- | A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification
    UpdateServiceNotification
      { -- | Notification content
        content :: Maybe MessageContent.MessageContent,
        -- | Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
        __type :: Maybe String
      }
  | -- | Information about a file was updated @file New data about the file
    UpdateFile
      { -- |
        file :: Maybe File.File
      }
  | -- | The file generation process needs to be started by the application
    UpdateFileGenerationStart
      { -- | String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which must be downloaded by the application
        conversion :: Maybe String,
        -- | The path to a file that must be created and where the new file is generated
        destination_path :: Maybe String,
        -- | The path to a file from which a new file is generated; may be empty
        original_path :: Maybe String,
        -- | Unique identifier for the generation process
        generation_id :: Maybe Int
      }
  | -- | File generation is no longer needed @generation_id Unique identifier for the generation process
    UpdateFileGenerationStop
      { -- |
        generation_id :: Maybe Int
      }
  | -- | The state of the file download list has changed
    UpdateFileDownloads
      { -- | Total downloaded size of files in the file download list, in bytes
        downloaded_size :: Maybe Int,
        -- | Total number of files in the file download list
        total_count :: Maybe Int,
        -- | Total size of files in the file download list, in bytes
        total_size :: Maybe Int
      }
  | -- | A file was added to the file download list. This update is sent only after file download list is loaded for the first time @file_download The added file download @counts New number of being downloaded and recently downloaded files found
    UpdateFileAddedToDownloads
      { -- |
        counts :: Maybe DownloadedFileCounts.DownloadedFileCounts,
        -- |
        file_download :: Maybe FileDownload.FileDownload
      }
  | -- | A file download was changed. This update is sent only after file download list is loaded for the first time @file_id File identifier
    UpdateFileDownload
      { -- | New number of being downloaded and recently downloaded files found
        counts :: Maybe DownloadedFileCounts.DownloadedFileCounts,
        -- | True, if downloading of the file is paused
        is_paused :: Maybe Bool,
        -- | Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
        complete_date :: Maybe Int,
        -- |
        file_id :: Maybe Int
      }
  | -- | A file was removed from the file download list. This update is sent only after file download list is loaded for the first time @file_id File identifier @counts New number of being downloaded and recently downloaded files found
    UpdateFileRemovedFromDownloads
      { -- |
        counts :: Maybe DownloadedFileCounts.DownloadedFileCounts,
        -- |
        file_id :: Maybe Int
      }
  | -- | New call was created or information about a call was updated @call New data about a call
    UpdateCall
      { -- |
        call :: Maybe Call.Call
      }
  | -- | Information about a group call was updated @group_call New data about a group call
    UpdateGroupCall
      { -- |
        group_call :: Maybe GroupCall.GroupCall
      }
  | -- | Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
    UpdateGroupCallParticipant
      { -- |
        participant :: Maybe GroupCallParticipant.GroupCallParticipant,
        -- | Identifier of group call @participant New data about a participant
        group_call_id :: Maybe Int
      }
  | -- | New call signaling data arrived @call_id The call identifier @data The data
    UpdateNewCallSignalingData
      { -- |
        _data :: Maybe String,
        -- |
        call_id :: Maybe Int
      }
  | -- | Some privacy setting rules have been changed @setting The privacy setting @rules New privacy rules
    UpdateUserPrivacySettingRules
      { -- |
        rules :: Maybe UserPrivacySettingRules.UserPrivacySettingRules,
        -- |
        setting :: Maybe UserPrivacySetting.UserPrivacySetting
      }
  | -- | Number of unread messages in a chat list has changed. This update is sent only if the message database is used @chat_list The chat list with changed number of unread messages
    UpdateUnreadMessageCount
      { -- |
        unread_unmuted_count :: Maybe Int,
        -- | Total number of unread messages @unread_unmuted_count Total number of unread messages in unmuted chats
        unread_count :: Maybe Int,
        -- |
        chat_list :: Maybe ChatList.ChatList
      }
  | -- | Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
    UpdateUnreadChatCount
      { -- |
        marked_as_unread_unmuted_count :: Maybe Int,
        -- | Total number of chats marked as unread @marked_as_unread_unmuted_count Total number of unmuted chats marked as unread
        marked_as_unread_count :: Maybe Int,
        -- |
        unread_unmuted_count :: Maybe Int,
        -- | Total number of unread chats @unread_unmuted_count Total number of unread unmuted chats
        unread_count :: Maybe Int,
        -- | Approximate total number of chats in the chat list
        total_count :: Maybe Int,
        -- | The chat list with changed number of unread messages
        chat_list :: Maybe ChatList.ChatList
      }
  | -- | An option changed its value @name The option name @value The new option value
    UpdateOption
      { -- |
        value :: Maybe OptionValue.OptionValue,
        -- |
        name :: Maybe String
      }
  | -- | A sticker set has changed @sticker_set The sticker set
    UpdateStickerSet
      { -- |
        sticker_set :: Maybe StickerSet.StickerSet
      }
  | -- | The list of installed sticker sets was updated @is_masks True, if the list of installed mask sticker sets was updated @sticker_set_ids The new list of installed ordinary sticker sets
    UpdateInstalledStickerSets
      { -- |
        sticker_set_ids :: Maybe [Int],
        -- |
        is_masks :: Maybe Bool
      }
  | -- | The list of trending sticker sets was updated or some of them were viewed @sticker_sets The prefix of the list of trending sticker sets with the newest trending sticker sets
    UpdateTrendingStickerSets
      { -- |
        sticker_sets :: Maybe StickerSets.StickerSets
      }
  | -- | The list of recently used stickers was updated @is_attached True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated @sticker_ids The new list of file identifiers of recently used stickers
    UpdateRecentStickers
      { -- |
        sticker_ids :: Maybe [Int],
        -- |
        is_attached :: Maybe Bool
      }
  | -- | The list of favorite stickers was updated @sticker_ids The new list of file identifiers of favorite stickers
    UpdateFavoriteStickers
      { -- |
        sticker_ids :: Maybe [Int]
      }
  | -- | The list of saved animations was updated @animation_ids The new list of file identifiers of saved animations
    UpdateSavedAnimations
      { -- |
        animation_ids :: Maybe [Int]
      }
  | -- | The list of saved notifications sounds was updated. This update may not be sent until information about a notification sound was requested for the first time @notification_sound_ids The new list of identifiers of saved notification sounds
    UpdateSavedNotificationSounds
      { -- |
        notification_sound_ids :: Maybe [Int]
      }
  | -- | The selected background has changed @for_dark_theme True, if background for dark theme has changed @background The new selected background; may be null
    UpdateSelectedBackground
      { -- |
        background :: Maybe Background.Background,
        -- |
        for_dark_theme :: Maybe Bool
      }
  | -- | The list of available chat themes has changed @chat_themes The new list of chat themes
    UpdateChatThemes
      { -- |
        chat_themes :: Maybe [ChatTheme.ChatTheme]
      }
  | -- | Some language pack strings have been updated @localization_target Localization target to which the language pack belongs @language_pack_id Identifier of the updated language pack @strings List of changed language pack strings
    UpdateLanguagePackStrings
      { -- |
        strings :: Maybe [LanguagePackString.LanguagePackString],
        -- |
        language_pack_id :: Maybe String,
        -- |
        localization_target :: Maybe String
      }
  | -- | The connection state has changed. This update must be used only to show a human-readable description of the connection state @state The new connection state
    UpdateConnectionState
      { -- |
        state :: Maybe ConnectionState.ConnectionState
      }
  | -- | New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update" @terms_of_service_id Identifier of the terms of service @terms_of_service The new terms of service
    UpdateTermsOfService
      { -- |
        terms_of_service :: Maybe TermsOfService.TermsOfService,
        -- |
        terms_of_service_id :: Maybe String
      }
  | -- | The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request @users_nearby The new list of users nearby
    UpdateUsersNearby
      { -- |
        users_nearby :: Maybe [ChatNearby.ChatNearby]
      }
  | -- | The list of bots added to attachment menu has changed @bots The new list of bots added to attachment menu. The bots must be shown in attachment menu only in private chats. The bots must not be shown on scheduled messages screen
    UpdateAttachmentMenuBots
      { -- |
        bots :: Maybe [AttachmentMenuBot.AttachmentMenuBot]
      }
  | -- | A message was sent by an opened web app, so the web app needs to be closed @web_app_launch_id Identifier of web app launch
    UpdateWebAppMessageSent
      { -- |
        web_app_launch_id :: Maybe Int
      }
  | -- | The list of supported reactions has changed @reactions The new list of supported reactions
    UpdateReactions
      { -- |
        reactions :: Maybe [Reaction.Reaction]
      }
  | -- | The list of supported dice emojis has changed @emojis The new list of supported dice emojis
    UpdateDiceEmojis
      { -- |
        emojis :: Maybe [String]
      }
  | -- | Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
    UpdateAnimatedEmojiMessageClicked
      { -- |
        sticker :: Maybe Sticker.Sticker,
        -- |
        message_id :: Maybe Int,
        -- | Chat identifier @message_id Message identifier @sticker The animated sticker to be played
        chat_id :: Maybe Int
      }
  | -- | The parameters of animation search through GetOption("animation_search_bot_username") bot has changed @provider Name of the animation search provider @emojis The new list of emojis suggested for searching
    UpdateAnimationSearchParameters
      { -- |
        emojis :: Maybe [String],
        -- |
        provider :: Maybe String
      }
  | -- | The list of suggested to the user actions has changed @added_actions Added suggested actions @removed_actions Removed suggested actions
    UpdateSuggestedActions
      { -- |
        removed_actions :: Maybe [SuggestedAction.SuggestedAction],
        -- |
        added_actions :: Maybe [SuggestedAction.SuggestedAction]
      }
  | -- | A new incoming inline query; for bots only @id Unique query identifier @sender_user_id Identifier of the user who sent the query @user_location User location; may be null
    UpdateNewInlineQuery
      { -- |
        offset :: Maybe String,
        -- |
        query :: Maybe String,
        -- | The type of the chat from which the query originated; may be null if unknown @query Text of the query @offset Offset of the first entry to return
        chat_type :: Maybe ChatType.ChatType,
        -- |
        user_location :: Maybe Location.Location,
        -- |
        sender_user_id :: Maybe Int,
        -- |
        _id :: Maybe Int
      }
  | -- | The user has chosen a result of an inline query; for bots only @sender_user_id Identifier of the user who sent the query @user_location User location; may be null
    UpdateNewChosenInlineResult
      { -- |
        inline_message_id :: Maybe String,
        -- |
        result_id :: Maybe String,
        -- | Text of the query @result_id Identifier of the chosen result @inline_message_id Identifier of the sent inline message, if known
        query :: Maybe String,
        -- |
        user_location :: Maybe Location.Location,
        -- |
        sender_user_id :: Maybe Int
      }
  | -- | A new incoming callback query; for bots only @id Unique query identifier @sender_user_id Identifier of the user who sent the query
    UpdateNewCallbackQuery
      { -- |
        payload :: Maybe CallbackQueryPayload.CallbackQueryPayload,
        -- | Identifier that uniquely corresponds to the chat to which the message was sent @payload Query payload
        chat_instance :: Maybe Int,
        -- |
        message_id :: Maybe Int,
        -- | Identifier of the chat where the query was sent @message_id Identifier of the message from which the query originated
        chat_id :: Maybe Int,
        -- |
        sender_user_id :: Maybe Int,
        -- |
        _id :: Maybe Int
      }
  | -- | A new incoming callback query from a message sent via a bot; for bots only @id Unique query identifier @sender_user_id Identifier of the user who sent the query @inline_message_id Identifier of the inline message from which the query originated
    UpdateNewInlineCallbackQuery
      { -- |
        payload :: Maybe CallbackQueryPayload.CallbackQueryPayload,
        -- | An identifier uniquely corresponding to the chat a message was sent to @payload Query payload
        chat_instance :: Maybe Int,
        -- |
        inline_message_id :: Maybe String,
        -- |
        sender_user_id :: Maybe Int,
        -- |
        _id :: Maybe Int
      }
  | -- | A new incoming shipping query; for bots only. Only for invoices with flexible price @id Unique query identifier @sender_user_id Identifier of the user who sent the query @invoice_payload Invoice payload @shipping_address User shipping address
    UpdateNewShippingQuery
      { -- |
        shipping_address :: Maybe Address.Address,
        -- |
        invoice_payload :: Maybe String,
        -- |
        sender_user_id :: Maybe Int,
        -- |
        _id :: Maybe Int
      }
  | -- | A new incoming pre-checkout query; for bots only. Contains full information about a checkout @id Unique query identifier @sender_user_id Identifier of the user who sent the query @currency Currency for the product price @total_amount Total price for the product, in the smallest units of the currency
    UpdateNewPreCheckoutQuery
      { -- |
        order_info :: Maybe OrderInfo.OrderInfo,
        -- |
        shipping_option_id :: Maybe String,
        -- | Invoice payload @shipping_option_id Identifier of a shipping option chosen by the user; may be empty if not applicable @order_info Information about the order; may be null
        invoice_payload :: Maybe String,
        -- |
        total_amount :: Maybe Int,
        -- |
        currency :: Maybe String,
        -- |
        sender_user_id :: Maybe Int,
        -- |
        _id :: Maybe Int
      }
  | -- | A new incoming event; for bots only @event A JSON-serialized event
    UpdateNewCustomEvent
      { -- |
        event :: Maybe String
      }
  | -- | A new incoming query; for bots only @id The query identifier @data JSON-serialized query data @timeout Query timeout
    UpdateNewCustomQuery
      { -- |
        timeout :: Maybe Int,
        -- |
        _data :: Maybe String,
        -- |
        _id :: Maybe Int
      }
  | -- | A poll was updated; for bots only @poll New data about the poll
    UpdatePoll
      { -- |
        poll :: Maybe Poll.Poll
      }
  | -- | A user changed the answer to a poll; for bots only @poll_id Unique poll identifier @user_id The user, who changed the answer to the poll @option_ids 0-based identifiers of answer options, chosen by the user
    UpdatePollAnswer
      { -- |
        option_ids :: Maybe [Int],
        -- |
        user_id :: Maybe Int,
        -- |
        poll_id :: Maybe Int
      }
  | -- | User rights changed in a chat; for bots only @chat_id Chat identifier @actor_user_id Identifier of the user, changing the rights
    UpdateChatMember
      { -- |
        new_chat_member :: Maybe ChatMember.ChatMember,
        -- | Previous chat member @new_chat_member New chat member
        old_chat_member :: Maybe ChatMember.ChatMember,
        -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- | Point in time (Unix timestamp) when the user rights was changed @invite_link If user has joined the chat using an invite link, the invite link; may be null
        date :: Maybe Int,
        -- |
        actor_user_id :: Maybe Int,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A user sent a join request to a chat; for bots only @chat_id Chat identifier @request Join request @invite_link The invite link, which was used to send join request; may be null
    UpdateNewChatJoinRequest
      { -- |
        invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- |
        request :: Maybe ChatJoinRequest.ChatJoinRequest,
        -- |
        chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show Update where
  show
    UpdateAuthorizationState
      { authorization_state = authorization_state
      } =
      "UpdateAuthorizationState"
        ++ U.cc
          [ U.p "authorization_state" authorization_state
          ]
  show
    UpdateNewMessage
      { message = message
      } =
      "UpdateNewMessage"
        ++ U.cc
          [ U.p "message" message
          ]
  show
    UpdateMessageSendAcknowledged
      { message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageSendAcknowledged"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageSendSucceeded
      { old_message_id = old_message_id,
        message = message
      } =
      "UpdateMessageSendSucceeded"
        ++ U.cc
          [ U.p "old_message_id" old_message_id,
            U.p "message" message
          ]
  show
    UpdateMessageSendFailed
      { error_message = error_message,
        error_code = error_code,
        old_message_id = old_message_id,
        message = message
      } =
      "UpdateMessageSendFailed"
        ++ U.cc
          [ U.p "error_message" error_message,
            U.p "error_code" error_code,
            U.p "old_message_id" old_message_id,
            U.p "message" message
          ]
  show
    UpdateMessageContent
      { new_content = new_content,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageContent"
        ++ U.cc
          [ U.p "new_content" new_content,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageEdited
      { reply_markup = reply_markup,
        edit_date = edit_date,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageEdited"
        ++ U.cc
          [ U.p "reply_markup" reply_markup,
            U.p "edit_date" edit_date,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageIsPinned
      { is_pinned = is_pinned,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageInteractionInfo
      { interaction_info = interaction_info,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageInteractionInfo"
        ++ U.cc
          [ U.p "interaction_info" interaction_info,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageContentOpened
      { message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageContentOpened"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageMentionRead
      { unread_mention_count = unread_mention_count,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageMentionRead"
        ++ U.cc
          [ U.p "unread_mention_count" unread_mention_count,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageUnreadReactions
      { unread_reaction_count = unread_reaction_count,
        unread_reactions = unread_reactions,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageUnreadReactions"
        ++ U.cc
          [ U.p "unread_reaction_count" unread_reaction_count,
            U.p "unread_reactions" unread_reactions,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateMessageLiveLocationViewed
      { message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateMessageLiveLocationViewed"
        ++ U.cc
          [ U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateNewChat
      { chat = chat
      } =
      "UpdateNewChat"
        ++ U.cc
          [ U.p "chat" chat
          ]
  show
    UpdateChatTitle
      { title = title,
        chat_id = chat_id
      } =
      "UpdateChatTitle"
        ++ U.cc
          [ U.p "title" title,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatPhoto
      { photo = photo,
        chat_id = chat_id
      } =
      "UpdateChatPhoto"
        ++ U.cc
          [ U.p "photo" photo,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatPermissions
      { permissions = permissions,
        chat_id = chat_id
      } =
      "UpdateChatPermissions"
        ++ U.cc
          [ U.p "permissions" permissions,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatLastMessage
      { positions = positions,
        last_message = last_message,
        chat_id = chat_id
      } =
      "UpdateChatLastMessage"
        ++ U.cc
          [ U.p "positions" positions,
            U.p "last_message" last_message,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatPosition
      { position = position,
        chat_id = chat_id
      } =
      "UpdateChatPosition"
        ++ U.cc
          [ U.p "position" position,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatReadInbox
      { unread_count = unread_count,
        last_read_inbox_message_id = last_read_inbox_message_id,
        chat_id = chat_id
      } =
      "UpdateChatReadInbox"
        ++ U.cc
          [ U.p "unread_count" unread_count,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatReadOutbox
      { last_read_outbox_message_id = last_read_outbox_message_id,
        chat_id = chat_id
      } =
      "UpdateChatReadOutbox"
        ++ U.cc
          [ U.p "last_read_outbox_message_id" last_read_outbox_message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatActionBar
      { action_bar = action_bar,
        chat_id = chat_id
      } =
      "UpdateChatActionBar"
        ++ U.cc
          [ U.p "action_bar" action_bar,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatAvailableReactions
      { available_reactions = available_reactions,
        chat_id = chat_id
      } =
      "UpdateChatAvailableReactions"
        ++ U.cc
          [ U.p "available_reactions" available_reactions,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatDraftMessage
      { positions = positions,
        draft_message = draft_message,
        chat_id = chat_id
      } =
      "UpdateChatDraftMessage"
        ++ U.cc
          [ U.p "positions" positions,
            U.p "draft_message" draft_message,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatMessageSender
      { message_sender_id = message_sender_id,
        chat_id = chat_id
      } =
      "UpdateChatMessageSender"
        ++ U.cc
          [ U.p "message_sender_id" message_sender_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatMessageTtl
      { message_ttl = message_ttl,
        chat_id = chat_id
      } =
      "UpdateChatMessageTtl"
        ++ U.cc
          [ U.p "message_ttl" message_ttl,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatNotificationSettings
      { notification_settings = notification_settings,
        chat_id = chat_id
      } =
      "UpdateChatNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatPendingJoinRequests
      { pending_join_requests = pending_join_requests,
        chat_id = chat_id
      } =
      "UpdateChatPendingJoinRequests"
        ++ U.cc
          [ U.p "pending_join_requests" pending_join_requests,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatReplyMarkup
      { reply_markup_message_id = reply_markup_message_id,
        chat_id = chat_id
      } =
      "UpdateChatReplyMarkup"
        ++ U.cc
          [ U.p "reply_markup_message_id" reply_markup_message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatTheme
      { theme_name = theme_name,
        chat_id = chat_id
      } =
      "UpdateChatTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatUnreadMentionCount
      { unread_mention_count = unread_mention_count,
        chat_id = chat_id
      } =
      "UpdateChatUnreadMentionCount"
        ++ U.cc
          [ U.p "unread_mention_count" unread_mention_count,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatUnreadReactionCount
      { unread_reaction_count = unread_reaction_count,
        chat_id = chat_id
      } =
      "UpdateChatUnreadReactionCount"
        ++ U.cc
          [ U.p "unread_reaction_count" unread_reaction_count,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatVideoChat
      { video_chat = video_chat,
        chat_id = chat_id
      } =
      "UpdateChatVideoChat"
        ++ U.cc
          [ U.p "video_chat" video_chat,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification,
        chat_id = chat_id
      } =
      "UpdateChatDefaultDisableNotification"
        ++ U.cc
          [ U.p "default_disable_notification" default_disable_notification,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatHasProtectedContent
      { has_protected_content = has_protected_content,
        chat_id = chat_id
      } =
      "UpdateChatHasProtectedContent"
        ++ U.cc
          [ U.p "has_protected_content" has_protected_content,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatHasScheduledMessages
      { has_scheduled_messages = has_scheduled_messages,
        chat_id = chat_id
      } =
      "UpdateChatHasScheduledMessages"
        ++ U.cc
          [ U.p "has_scheduled_messages" has_scheduled_messages,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatIsBlocked
      { is_blocked = is_blocked,
        chat_id = chat_id
      } =
      "UpdateChatIsBlocked"
        ++ U.cc
          [ U.p "is_blocked" is_blocked,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread,
        chat_id = chat_id
      } =
      "UpdateChatIsMarkedAsUnread"
        ++ U.cc
          [ U.p "is_marked_as_unread" is_marked_as_unread,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatFilters
      { chat_filters = chat_filters
      } =
      "UpdateChatFilters"
        ++ U.cc
          [ U.p "chat_filters" chat_filters
          ]
  show
    UpdateChatOnlineMemberCount
      { online_member_count = online_member_count,
        chat_id = chat_id
      } =
      "UpdateChatOnlineMemberCount"
        ++ U.cc
          [ U.p "online_member_count" online_member_count,
            U.p "chat_id" chat_id
          ]
  show
    UpdateScopeNotificationSettings
      { _notification_settings = _notification_settings,
        scope = scope
      } =
      "UpdateScopeNotificationSettings"
        ++ U.cc
          [ U.p "_notification_settings" _notification_settings,
            U.p "scope" scope
          ]
  show
    UpdateNotification
      { notification = notification,
        notification_group_id = notification_group_id
      } =
      "UpdateNotification"
        ++ U.cc
          [ U.p "notification" notification,
            U.p "notification_group_id" notification_group_id
          ]
  show
    UpdateNotificationGroup
      { removed_notification_ids = removed_notification_ids,
        added_notifications = added_notifications,
        total_count = total_count,
        notification_sound_id = notification_sound_id,
        notification_settings_chat_id = notification_settings_chat_id,
        chat_id = chat_id,
        _type = _type,
        notification_group_id = notification_group_id
      } =
      "UpdateNotificationGroup"
        ++ U.cc
          [ U.p "removed_notification_ids" removed_notification_ids,
            U.p "added_notifications" added_notifications,
            U.p "total_count" total_count,
            U.p "notification_sound_id" notification_sound_id,
            U.p "notification_settings_chat_id" notification_settings_chat_id,
            U.p "chat_id" chat_id,
            U.p "_type" _type,
            U.p "notification_group_id" notification_group_id
          ]
  show
    UpdateActiveNotifications
      { groups = groups
      } =
      "UpdateActiveNotifications"
        ++ U.cc
          [ U.p "groups" groups
          ]
  show
    UpdateHavePendingNotifications
      { have_unreceived_notifications = have_unreceived_notifications,
        have_delayed_notifications = have_delayed_notifications
      } =
      "UpdateHavePendingNotifications"
        ++ U.cc
          [ U.p "have_unreceived_notifications" have_unreceived_notifications,
            U.p "have_delayed_notifications" have_delayed_notifications
          ]
  show
    UpdateDeleteMessages
      { from_cache = from_cache,
        is_permanent = is_permanent,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      "UpdateDeleteMessages"
        ++ U.cc
          [ U.p "from_cache" from_cache,
            U.p "is_permanent" is_permanent,
            U.p "message_ids" message_ids,
            U.p "chat_id" chat_id
          ]
  show
    UpdateChatAction
      { action = action,
        sender_id = sender_id,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      "UpdateChatAction"
        ++ U.cc
          [ U.p "action" action,
            U.p "sender_id" sender_id,
            U.p "message_thread_id" message_thread_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateUserStatus
      { status = status,
        user_id = user_id
      } =
      "UpdateUserStatus"
        ++ U.cc
          [ U.p "status" status,
            U.p "user_id" user_id
          ]
  show
    UpdateUser
      { user = user
      } =
      "UpdateUser"
        ++ U.cc
          [ U.p "user" user
          ]
  show
    UpdateBasicGroup
      { basic_group = basic_group
      } =
      "UpdateBasicGroup"
        ++ U.cc
          [ U.p "basic_group" basic_group
          ]
  show
    UpdateSupergroup
      { supergroup = supergroup
      } =
      "UpdateSupergroup"
        ++ U.cc
          [ U.p "supergroup" supergroup
          ]
  show
    UpdateSecretChat
      { secret_chat = secret_chat
      } =
      "UpdateSecretChat"
        ++ U.cc
          [ U.p "secret_chat" secret_chat
          ]
  show
    UpdateUserFullInfo
      { user_full_info = user_full_info,
        user_id = user_id
      } =
      "UpdateUserFullInfo"
        ++ U.cc
          [ U.p "user_full_info" user_full_info,
            U.p "user_id" user_id
          ]
  show
    UpdateBasicGroupFullInfo
      { basic_group_full_info = basic_group_full_info,
        basic_group_id = basic_group_id
      } =
      "UpdateBasicGroupFullInfo"
        ++ U.cc
          [ U.p "basic_group_full_info" basic_group_full_info,
            U.p "basic_group_id" basic_group_id
          ]
  show
    UpdateSupergroupFullInfo
      { supergroup_full_info = supergroup_full_info,
        supergroup_id = supergroup_id
      } =
      "UpdateSupergroupFullInfo"
        ++ U.cc
          [ U.p "supergroup_full_info" supergroup_full_info,
            U.p "supergroup_id" supergroup_id
          ]
  show
    UpdateServiceNotification
      { content = content,
        __type = __type
      } =
      "UpdateServiceNotification"
        ++ U.cc
          [ U.p "content" content,
            U.p "__type" __type
          ]
  show
    UpdateFile
      { file = file
      } =
      "UpdateFile"
        ++ U.cc
          [ U.p "file" file
          ]
  show
    UpdateFileGenerationStart
      { conversion = conversion,
        destination_path = destination_path,
        original_path = original_path,
        generation_id = generation_id
      } =
      "UpdateFileGenerationStart"
        ++ U.cc
          [ U.p "conversion" conversion,
            U.p "destination_path" destination_path,
            U.p "original_path" original_path,
            U.p "generation_id" generation_id
          ]
  show
    UpdateFileGenerationStop
      { generation_id = generation_id
      } =
      "UpdateFileGenerationStop"
        ++ U.cc
          [ U.p "generation_id" generation_id
          ]
  show
    UpdateFileDownloads
      { downloaded_size = downloaded_size,
        total_count = total_count,
        total_size = total_size
      } =
      "UpdateFileDownloads"
        ++ U.cc
          [ U.p "downloaded_size" downloaded_size,
            U.p "total_count" total_count,
            U.p "total_size" total_size
          ]
  show
    UpdateFileAddedToDownloads
      { counts = counts,
        file_download = file_download
      } =
      "UpdateFileAddedToDownloads"
        ++ U.cc
          [ U.p "counts" counts,
            U.p "file_download" file_download
          ]
  show
    UpdateFileDownload
      { counts = counts,
        is_paused = is_paused,
        complete_date = complete_date,
        file_id = file_id
      } =
      "UpdateFileDownload"
        ++ U.cc
          [ U.p "counts" counts,
            U.p "is_paused" is_paused,
            U.p "complete_date" complete_date,
            U.p "file_id" file_id
          ]
  show
    UpdateFileRemovedFromDownloads
      { counts = counts,
        file_id = file_id
      } =
      "UpdateFileRemovedFromDownloads"
        ++ U.cc
          [ U.p "counts" counts,
            U.p "file_id" file_id
          ]
  show
    UpdateCall
      { call = call
      } =
      "UpdateCall"
        ++ U.cc
          [ U.p "call" call
          ]
  show
    UpdateGroupCall
      { group_call = group_call
      } =
      "UpdateGroupCall"
        ++ U.cc
          [ U.p "group_call" group_call
          ]
  show
    UpdateGroupCallParticipant
      { participant = participant,
        group_call_id = group_call_id
      } =
      "UpdateGroupCallParticipant"
        ++ U.cc
          [ U.p "participant" participant,
            U.p "group_call_id" group_call_id
          ]
  show
    UpdateNewCallSignalingData
      { _data = _data,
        call_id = call_id
      } =
      "UpdateNewCallSignalingData"
        ++ U.cc
          [ U.p "_data" _data,
            U.p "call_id" call_id
          ]
  show
    UpdateUserPrivacySettingRules
      { rules = rules,
        setting = setting
      } =
      "UpdateUserPrivacySettingRules"
        ++ U.cc
          [ U.p "rules" rules,
            U.p "setting" setting
          ]
  show
    UpdateUnreadMessageCount
      { unread_unmuted_count = unread_unmuted_count,
        unread_count = unread_count,
        chat_list = chat_list
      } =
      "UpdateUnreadMessageCount"
        ++ U.cc
          [ U.p "unread_unmuted_count" unread_unmuted_count,
            U.p "unread_count" unread_count,
            U.p "chat_list" chat_list
          ]
  show
    UpdateUnreadChatCount
      { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count,
        marked_as_unread_count = marked_as_unread_count,
        unread_unmuted_count = unread_unmuted_count,
        unread_count = unread_count,
        total_count = total_count,
        chat_list = chat_list
      } =
      "UpdateUnreadChatCount"
        ++ U.cc
          [ U.p "marked_as_unread_unmuted_count" marked_as_unread_unmuted_count,
            U.p "marked_as_unread_count" marked_as_unread_count,
            U.p "unread_unmuted_count" unread_unmuted_count,
            U.p "unread_count" unread_count,
            U.p "total_count" total_count,
            U.p "chat_list" chat_list
          ]
  show
    UpdateOption
      { value = value,
        name = name
      } =
      "UpdateOption"
        ++ U.cc
          [ U.p "value" value,
            U.p "name" name
          ]
  show
    UpdateStickerSet
      { sticker_set = sticker_set
      } =
      "UpdateStickerSet"
        ++ U.cc
          [ U.p "sticker_set" sticker_set
          ]
  show
    UpdateInstalledStickerSets
      { sticker_set_ids = sticker_set_ids,
        is_masks = is_masks
      } =
      "UpdateInstalledStickerSets"
        ++ U.cc
          [ U.p "sticker_set_ids" sticker_set_ids,
            U.p "is_masks" is_masks
          ]
  show
    UpdateTrendingStickerSets
      { sticker_sets = sticker_sets
      } =
      "UpdateTrendingStickerSets"
        ++ U.cc
          [ U.p "sticker_sets" sticker_sets
          ]
  show
    UpdateRecentStickers
      { sticker_ids = sticker_ids,
        is_attached = is_attached
      } =
      "UpdateRecentStickers"
        ++ U.cc
          [ U.p "sticker_ids" sticker_ids,
            U.p "is_attached" is_attached
          ]
  show
    UpdateFavoriteStickers
      { sticker_ids = sticker_ids
      } =
      "UpdateFavoriteStickers"
        ++ U.cc
          [ U.p "sticker_ids" sticker_ids
          ]
  show
    UpdateSavedAnimations
      { animation_ids = animation_ids
      } =
      "UpdateSavedAnimations"
        ++ U.cc
          [ U.p "animation_ids" animation_ids
          ]
  show
    UpdateSavedNotificationSounds
      { notification_sound_ids = notification_sound_ids
      } =
      "UpdateSavedNotificationSounds"
        ++ U.cc
          [ U.p "notification_sound_ids" notification_sound_ids
          ]
  show
    UpdateSelectedBackground
      { background = background,
        for_dark_theme = for_dark_theme
      } =
      "UpdateSelectedBackground"
        ++ U.cc
          [ U.p "background" background,
            U.p "for_dark_theme" for_dark_theme
          ]
  show
    UpdateChatThemes
      { chat_themes = chat_themes
      } =
      "UpdateChatThemes"
        ++ U.cc
          [ U.p "chat_themes" chat_themes
          ]
  show
    UpdateLanguagePackStrings
      { strings = strings,
        language_pack_id = language_pack_id,
        localization_target = localization_target
      } =
      "UpdateLanguagePackStrings"
        ++ U.cc
          [ U.p "strings" strings,
            U.p "language_pack_id" language_pack_id,
            U.p "localization_target" localization_target
          ]
  show
    UpdateConnectionState
      { state = state
      } =
      "UpdateConnectionState"
        ++ U.cc
          [ U.p "state" state
          ]
  show
    UpdateTermsOfService
      { terms_of_service = terms_of_service,
        terms_of_service_id = terms_of_service_id
      } =
      "UpdateTermsOfService"
        ++ U.cc
          [ U.p "terms_of_service" terms_of_service,
            U.p "terms_of_service_id" terms_of_service_id
          ]
  show
    UpdateUsersNearby
      { users_nearby = users_nearby
      } =
      "UpdateUsersNearby"
        ++ U.cc
          [ U.p "users_nearby" users_nearby
          ]
  show
    UpdateAttachmentMenuBots
      { bots = bots
      } =
      "UpdateAttachmentMenuBots"
        ++ U.cc
          [ U.p "bots" bots
          ]
  show
    UpdateWebAppMessageSent
      { web_app_launch_id = web_app_launch_id
      } =
      "UpdateWebAppMessageSent"
        ++ U.cc
          [ U.p "web_app_launch_id" web_app_launch_id
          ]
  show
    UpdateReactions
      { reactions = reactions
      } =
      "UpdateReactions"
        ++ U.cc
          [ U.p "reactions" reactions
          ]
  show
    UpdateDiceEmojis
      { emojis = emojis
      } =
      "UpdateDiceEmojis"
        ++ U.cc
          [ U.p "emojis" emojis
          ]
  show
    UpdateAnimatedEmojiMessageClicked
      { sticker = sticker,
        message_id = message_id,
        chat_id = chat_id
      } =
      "UpdateAnimatedEmojiMessageClicked"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateAnimationSearchParameters
      { emojis = emojis,
        provider = provider
      } =
      "UpdateAnimationSearchParameters"
        ++ U.cc
          [ U.p "emojis" emojis,
            U.p "provider" provider
          ]
  show
    UpdateSuggestedActions
      { removed_actions = removed_actions,
        added_actions = added_actions
      } =
      "UpdateSuggestedActions"
        ++ U.cc
          [ U.p "removed_actions" removed_actions,
            U.p "added_actions" added_actions
          ]
  show
    UpdateNewInlineQuery
      { offset = offset,
        query = query,
        chat_type = chat_type,
        user_location = user_location,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      "UpdateNewInlineQuery"
        ++ U.cc
          [ U.p "offset" offset,
            U.p "query" query,
            U.p "chat_type" chat_type,
            U.p "user_location" user_location,
            U.p "sender_user_id" sender_user_id,
            U.p "_id" _id
          ]
  show
    UpdateNewChosenInlineResult
      { inline_message_id = inline_message_id,
        result_id = result_id,
        query = query,
        user_location = user_location,
        sender_user_id = sender_user_id
      } =
      "UpdateNewChosenInlineResult"
        ++ U.cc
          [ U.p "inline_message_id" inline_message_id,
            U.p "result_id" result_id,
            U.p "query" query,
            U.p "user_location" user_location,
            U.p "sender_user_id" sender_user_id
          ]
  show
    UpdateNewCallbackQuery
      { payload = payload,
        chat_instance = chat_instance,
        message_id = message_id,
        chat_id = chat_id,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      "UpdateNewCallbackQuery"
        ++ U.cc
          [ U.p "payload" payload,
            U.p "chat_instance" chat_instance,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id,
            U.p "sender_user_id" sender_user_id,
            U.p "_id" _id
          ]
  show
    UpdateNewInlineCallbackQuery
      { payload = payload,
        chat_instance = chat_instance,
        inline_message_id = inline_message_id,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      "UpdateNewInlineCallbackQuery"
        ++ U.cc
          [ U.p "payload" payload,
            U.p "chat_instance" chat_instance,
            U.p "inline_message_id" inline_message_id,
            U.p "sender_user_id" sender_user_id,
            U.p "_id" _id
          ]
  show
    UpdateNewShippingQuery
      { shipping_address = shipping_address,
        invoice_payload = invoice_payload,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      "UpdateNewShippingQuery"
        ++ U.cc
          [ U.p "shipping_address" shipping_address,
            U.p "invoice_payload" invoice_payload,
            U.p "sender_user_id" sender_user_id,
            U.p "_id" _id
          ]
  show
    UpdateNewPreCheckoutQuery
      { order_info = order_info,
        shipping_option_id = shipping_option_id,
        invoice_payload = invoice_payload,
        total_amount = total_amount,
        currency = currency,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      "UpdateNewPreCheckoutQuery"
        ++ U.cc
          [ U.p "order_info" order_info,
            U.p "shipping_option_id" shipping_option_id,
            U.p "invoice_payload" invoice_payload,
            U.p "total_amount" total_amount,
            U.p "currency" currency,
            U.p "sender_user_id" sender_user_id,
            U.p "_id" _id
          ]
  show
    UpdateNewCustomEvent
      { event = event
      } =
      "UpdateNewCustomEvent"
        ++ U.cc
          [ U.p "event" event
          ]
  show
    UpdateNewCustomQuery
      { timeout = timeout,
        _data = _data,
        _id = _id
      } =
      "UpdateNewCustomQuery"
        ++ U.cc
          [ U.p "timeout" timeout,
            U.p "_data" _data,
            U.p "_id" _id
          ]
  show
    UpdatePoll
      { poll = poll
      } =
      "UpdatePoll"
        ++ U.cc
          [ U.p "poll" poll
          ]
  show
    UpdatePollAnswer
      { option_ids = option_ids,
        user_id = user_id,
        poll_id = poll_id
      } =
      "UpdatePollAnswer"
        ++ U.cc
          [ U.p "option_ids" option_ids,
            U.p "user_id" user_id,
            U.p "poll_id" poll_id
          ]
  show
    UpdateChatMember
      { new_chat_member = new_chat_member,
        old_chat_member = old_chat_member,
        invite_link = invite_link,
        date = date,
        actor_user_id = actor_user_id,
        chat_id = chat_id
      } =
      "UpdateChatMember"
        ++ U.cc
          [ U.p "new_chat_member" new_chat_member,
            U.p "old_chat_member" old_chat_member,
            U.p "invite_link" invite_link,
            U.p "date" date,
            U.p "actor_user_id" actor_user_id,
            U.p "chat_id" chat_id
          ]
  show
    UpdateNewChatJoinRequest
      { invite_link = invite_link,
        request = request,
        chat_id = chat_id
      } =
      "UpdateNewChatJoinRequest"
        ++ U.cc
          [ U.p "invite_link" invite_link,
            U.p "request" request,
            U.p "chat_id" chat_id
          ]

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
      "updateMessageUnreadReactions" -> parseUpdateMessageUnreadReactions v
      "updateMessageLiveLocationViewed" -> parseUpdateMessageLiveLocationViewed v
      "updateNewChat" -> parseUpdateNewChat v
      "updateChatTitle" -> parseUpdateChatTitle v
      "updateChatPhoto" -> parseUpdateChatPhoto v
      "updateChatPermissions" -> parseUpdateChatPermissions v
      "updateChatLastMessage" -> parseUpdateChatLastMessage v
      "updateChatPosition" -> parseUpdateChatPosition v
      "updateChatReadInbox" -> parseUpdateChatReadInbox v
      "updateChatReadOutbox" -> parseUpdateChatReadOutbox v
      "updateChatActionBar" -> parseUpdateChatActionBar v
      "updateChatAvailableReactions" -> parseUpdateChatAvailableReactions v
      "updateChatDraftMessage" -> parseUpdateChatDraftMessage v
      "updateChatMessageSender" -> parseUpdateChatMessageSender v
      "updateChatMessageTtl" -> parseUpdateChatMessageTtl v
      "updateChatNotificationSettings" -> parseUpdateChatNotificationSettings v
      "updateChatPendingJoinRequests" -> parseUpdateChatPendingJoinRequests v
      "updateChatReplyMarkup" -> parseUpdateChatReplyMarkup v
      "updateChatTheme" -> parseUpdateChatTheme v
      "updateChatUnreadMentionCount" -> parseUpdateChatUnreadMentionCount v
      "updateChatUnreadReactionCount" -> parseUpdateChatUnreadReactionCount v
      "updateChatVideoChat" -> parseUpdateChatVideoChat v
      "updateChatDefaultDisableNotification" -> parseUpdateChatDefaultDisableNotification v
      "updateChatHasProtectedContent" -> parseUpdateChatHasProtectedContent v
      "updateChatHasScheduledMessages" -> parseUpdateChatHasScheduledMessages v
      "updateChatIsBlocked" -> parseUpdateChatIsBlocked v
      "updateChatIsMarkedAsUnread" -> parseUpdateChatIsMarkedAsUnread v
      "updateChatFilters" -> parseUpdateChatFilters v
      "updateChatOnlineMemberCount" -> parseUpdateChatOnlineMemberCount v
      "updateScopeNotificationSettings" -> parseUpdateScopeNotificationSettings v
      "updateNotification" -> parseUpdateNotification v
      "updateNotificationGroup" -> parseUpdateNotificationGroup v
      "updateActiveNotifications" -> parseUpdateActiveNotifications v
      "updateHavePendingNotifications" -> parseUpdateHavePendingNotifications v
      "updateDeleteMessages" -> parseUpdateDeleteMessages v
      "updateChatAction" -> parseUpdateChatAction v
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
      "updateFileDownloads" -> parseUpdateFileDownloads v
      "updateFileAddedToDownloads" -> parseUpdateFileAddedToDownloads v
      "updateFileDownload" -> parseUpdateFileDownload v
      "updateFileRemovedFromDownloads" -> parseUpdateFileRemovedFromDownloads v
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
      "updateSavedNotificationSounds" -> parseUpdateSavedNotificationSounds v
      "updateSelectedBackground" -> parseUpdateSelectedBackground v
      "updateChatThemes" -> parseUpdateChatThemes v
      "updateLanguagePackStrings" -> parseUpdateLanguagePackStrings v
      "updateConnectionState" -> parseUpdateConnectionState v
      "updateTermsOfService" -> parseUpdateTermsOfService v
      "updateUsersNearby" -> parseUpdateUsersNearby v
      "updateAttachmentMenuBots" -> parseUpdateAttachmentMenuBots v
      "updateWebAppMessageSent" -> parseUpdateWebAppMessageSent v
      "updateReactions" -> parseUpdateReactions v
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
      "updateNewChatJoinRequest" -> parseUpdateNewChatJoinRequest v
      _ -> mempty
    where
      parseUpdateAuthorizationState :: A.Value -> T.Parser Update
      parseUpdateAuthorizationState = A.withObject "UpdateAuthorizationState" $ \o -> do
        authorization_state_ <- o A..:? "authorization_state"
        return $ UpdateAuthorizationState {authorization_state = authorization_state_}

      parseUpdateNewMessage :: A.Value -> T.Parser Update
      parseUpdateNewMessage = A.withObject "UpdateNewMessage" $ \o -> do
        message_ <- o A..:? "message"
        return $ UpdateNewMessage {message = message_}

      parseUpdateMessageSendAcknowledged :: A.Value -> T.Parser Update
      parseUpdateMessageSendAcknowledged = A.withObject "UpdateMessageSendAcknowledged" $ \o -> do
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageSendAcknowledged {message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageSendSucceeded :: A.Value -> T.Parser Update
      parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
        old_message_id_ <- mconcat [o A..:? "old_message_id", U.rm <$> (o A..: "old_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_ <- o A..:? "message"
        return $ UpdateMessageSendSucceeded {old_message_id = old_message_id_, message = message_}

      parseUpdateMessageSendFailed :: A.Value -> T.Parser Update
      parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
        error_message_ <- o A..:? "error_message"
        error_code_ <- mconcat [o A..:? "error_code", U.rm <$> (o A..: "error_code" :: T.Parser String)] :: T.Parser (Maybe Int)
        old_message_id_ <- mconcat [o A..:? "old_message_id", U.rm <$> (o A..: "old_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_ <- o A..:? "message"
        return $ UpdateMessageSendFailed {error_message = error_message_, error_code = error_code_, old_message_id = old_message_id_, message = message_}

      parseUpdateMessageContent :: A.Value -> T.Parser Update
      parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
        new_content_ <- o A..:? "new_content"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageContent {new_content = new_content_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageEdited :: A.Value -> T.Parser Update
      parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
        reply_markup_ <- o A..:? "reply_markup"
        edit_date_ <- mconcat [o A..:? "edit_date", U.rm <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageEdited {reply_markup = reply_markup_, edit_date = edit_date_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageIsPinned :: A.Value -> T.Parser Update
      parseUpdateMessageIsPinned = A.withObject "UpdateMessageIsPinned" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageIsPinned {is_pinned = is_pinned_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageInteractionInfo :: A.Value -> T.Parser Update
      parseUpdateMessageInteractionInfo = A.withObject "UpdateMessageInteractionInfo" $ \o -> do
        interaction_info_ <- o A..:? "interaction_info"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageInteractionInfo {interaction_info = interaction_info_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageContentOpened :: A.Value -> T.Parser Update
      parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageContentOpened {message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageMentionRead :: A.Value -> T.Parser Update
      parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
        unread_mention_count_ <- mconcat [o A..:? "unread_mention_count", U.rm <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageMentionRead {unread_mention_count = unread_mention_count_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageUnreadReactions :: A.Value -> T.Parser Update
      parseUpdateMessageUnreadReactions = A.withObject "UpdateMessageUnreadReactions" $ \o -> do
        unread_reaction_count_ <- mconcat [o A..:? "unread_reaction_count", U.rm <$> (o A..: "unread_reaction_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_reactions_ <- o A..:? "unread_reactions"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageUnreadReactions {unread_reaction_count = unread_reaction_count_, unread_reactions = unread_reactions_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageLiveLocationViewed :: A.Value -> T.Parser Update
      parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateMessageLiveLocationViewed {message_id = message_id_, chat_id = chat_id_}

      parseUpdateNewChat :: A.Value -> T.Parser Update
      parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
        chat_ <- o A..:? "chat"
        return $ UpdateNewChat {chat = chat_}

      parseUpdateChatTitle :: A.Value -> T.Parser Update
      parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
        title_ <- o A..:? "title"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatTitle {title = title_, chat_id = chat_id_}

      parseUpdateChatPhoto :: A.Value -> T.Parser Update
      parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
        photo_ <- o A..:? "photo"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatPhoto {photo = photo_, chat_id = chat_id_}

      parseUpdateChatPermissions :: A.Value -> T.Parser Update
      parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
        permissions_ <- o A..:? "permissions"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatPermissions {permissions = permissions_, chat_id = chat_id_}

      parseUpdateChatLastMessage :: A.Value -> T.Parser Update
      parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
        positions_ <- o A..:? "positions"
        last_message_ <- o A..:? "last_message"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatLastMessage {positions = positions_, last_message = last_message_, chat_id = chat_id_}

      parseUpdateChatPosition :: A.Value -> T.Parser Update
      parseUpdateChatPosition = A.withObject "UpdateChatPosition" $ \o -> do
        position_ <- o A..:? "position"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatPosition {position = position_, chat_id = chat_id_}

      parseUpdateChatReadInbox :: A.Value -> T.Parser Update
      parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
        unread_count_ <- mconcat [o A..:? "unread_count", U.rm <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        last_read_inbox_message_id_ <- mconcat [o A..:? "last_read_inbox_message_id", U.rm <$> (o A..: "last_read_inbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatReadInbox {unread_count = unread_count_, last_read_inbox_message_id = last_read_inbox_message_id_, chat_id = chat_id_}

      parseUpdateChatReadOutbox :: A.Value -> T.Parser Update
      parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
        last_read_outbox_message_id_ <- mconcat [o A..:? "last_read_outbox_message_id", U.rm <$> (o A..: "last_read_outbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatReadOutbox {last_read_outbox_message_id = last_read_outbox_message_id_, chat_id = chat_id_}

      parseUpdateChatActionBar :: A.Value -> T.Parser Update
      parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
        action_bar_ <- o A..:? "action_bar"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatActionBar {action_bar = action_bar_, chat_id = chat_id_}

      parseUpdateChatAvailableReactions :: A.Value -> T.Parser Update
      parseUpdateChatAvailableReactions = A.withObject "UpdateChatAvailableReactions" $ \o -> do
        available_reactions_ <- o A..:? "available_reactions"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatAvailableReactions {available_reactions = available_reactions_, chat_id = chat_id_}

      parseUpdateChatDraftMessage :: A.Value -> T.Parser Update
      parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
        positions_ <- o A..:? "positions"
        draft_message_ <- o A..:? "draft_message"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatDraftMessage {positions = positions_, draft_message = draft_message_, chat_id = chat_id_}

      parseUpdateChatMessageSender :: A.Value -> T.Parser Update
      parseUpdateChatMessageSender = A.withObject "UpdateChatMessageSender" $ \o -> do
        message_sender_id_ <- o A..:? "message_sender_id"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatMessageSender {message_sender_id = message_sender_id_, chat_id = chat_id_}

      parseUpdateChatMessageTtl :: A.Value -> T.Parser Update
      parseUpdateChatMessageTtl = A.withObject "UpdateChatMessageTtl" $ \o -> do
        message_ttl_ <- mconcat [o A..:? "message_ttl", U.rm <$> (o A..: "message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatMessageTtl {message_ttl = message_ttl_, chat_id = chat_id_}

      parseUpdateChatNotificationSettings :: A.Value -> T.Parser Update
      parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
        notification_settings_ <- o A..:? "notification_settings"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatNotificationSettings {notification_settings = notification_settings_, chat_id = chat_id_}

      parseUpdateChatPendingJoinRequests :: A.Value -> T.Parser Update
      parseUpdateChatPendingJoinRequests = A.withObject "UpdateChatPendingJoinRequests" $ \o -> do
        pending_join_requests_ <- o A..:? "pending_join_requests"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatPendingJoinRequests {pending_join_requests = pending_join_requests_, chat_id = chat_id_}

      parseUpdateChatReplyMarkup :: A.Value -> T.Parser Update
      parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
        reply_markup_message_id_ <- mconcat [o A..:? "reply_markup_message_id", U.rm <$> (o A..: "reply_markup_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatReplyMarkup {reply_markup_message_id = reply_markup_message_id_, chat_id = chat_id_}

      parseUpdateChatTheme :: A.Value -> T.Parser Update
      parseUpdateChatTheme = A.withObject "UpdateChatTheme" $ \o -> do
        theme_name_ <- o A..:? "theme_name"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatTheme {theme_name = theme_name_, chat_id = chat_id_}

      parseUpdateChatUnreadMentionCount :: A.Value -> T.Parser Update
      parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
        unread_mention_count_ <- mconcat [o A..:? "unread_mention_count", U.rm <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatUnreadMentionCount {unread_mention_count = unread_mention_count_, chat_id = chat_id_}

      parseUpdateChatUnreadReactionCount :: A.Value -> T.Parser Update
      parseUpdateChatUnreadReactionCount = A.withObject "UpdateChatUnreadReactionCount" $ \o -> do
        unread_reaction_count_ <- mconcat [o A..:? "unread_reaction_count", U.rm <$> (o A..: "unread_reaction_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatUnreadReactionCount {unread_reaction_count = unread_reaction_count_, chat_id = chat_id_}

      parseUpdateChatVideoChat :: A.Value -> T.Parser Update
      parseUpdateChatVideoChat = A.withObject "UpdateChatVideoChat" $ \o -> do
        video_chat_ <- o A..:? "video_chat"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatVideoChat {video_chat = video_chat_, chat_id = chat_id_}

      parseUpdateChatDefaultDisableNotification :: A.Value -> T.Parser Update
      parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
        default_disable_notification_ <- o A..:? "default_disable_notification"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatDefaultDisableNotification {default_disable_notification = default_disable_notification_, chat_id = chat_id_}

      parseUpdateChatHasProtectedContent :: A.Value -> T.Parser Update
      parseUpdateChatHasProtectedContent = A.withObject "UpdateChatHasProtectedContent" $ \o -> do
        has_protected_content_ <- o A..:? "has_protected_content"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatHasProtectedContent {has_protected_content = has_protected_content_, chat_id = chat_id_}

      parseUpdateChatHasScheduledMessages :: A.Value -> T.Parser Update
      parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
        has_scheduled_messages_ <- o A..:? "has_scheduled_messages"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatHasScheduledMessages {has_scheduled_messages = has_scheduled_messages_, chat_id = chat_id_}

      parseUpdateChatIsBlocked :: A.Value -> T.Parser Update
      parseUpdateChatIsBlocked = A.withObject "UpdateChatIsBlocked" $ \o -> do
        is_blocked_ <- o A..:? "is_blocked"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatIsBlocked {is_blocked = is_blocked_, chat_id = chat_id_}

      parseUpdateChatIsMarkedAsUnread :: A.Value -> T.Parser Update
      parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
        is_marked_as_unread_ <- o A..:? "is_marked_as_unread"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatIsMarkedAsUnread {is_marked_as_unread = is_marked_as_unread_, chat_id = chat_id_}

      parseUpdateChatFilters :: A.Value -> T.Parser Update
      parseUpdateChatFilters = A.withObject "UpdateChatFilters" $ \o -> do
        chat_filters_ <- o A..:? "chat_filters"
        return $ UpdateChatFilters {chat_filters = chat_filters_}

      parseUpdateChatOnlineMemberCount :: A.Value -> T.Parser Update
      parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
        online_member_count_ <- mconcat [o A..:? "online_member_count", U.rm <$> (o A..: "online_member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatOnlineMemberCount {online_member_count = online_member_count_, chat_id = chat_id_}

      parseUpdateScopeNotificationSettings :: A.Value -> T.Parser Update
      parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
        _notification_settings_ <- o A..:? "notification_settings"
        scope_ <- o A..:? "scope"
        return $ UpdateScopeNotificationSettings {_notification_settings = _notification_settings_, scope = scope_}

      parseUpdateNotification :: A.Value -> T.Parser Update
      parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
        notification_ <- o A..:? "notification"
        notification_group_id_ <- mconcat [o A..:? "notification_group_id", U.rm <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNotification {notification = notification_, notification_group_id = notification_group_id_}

      parseUpdateNotificationGroup :: A.Value -> T.Parser Update
      parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
        removed_notification_ids_ <- o A..:? "removed_notification_ids"
        added_notifications_ <- o A..:? "added_notifications"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        notification_sound_id_ <- mconcat [o A..:? "notification_sound_id", U.rm <$> (o A..: "notification_sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        notification_settings_chat_id_ <- mconcat [o A..:? "notification_settings_chat_id", U.rm <$> (o A..: "notification_settings_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _type_ <- o A..:? "type"
        notification_group_id_ <- mconcat [o A..:? "notification_group_id", U.rm <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNotificationGroup {removed_notification_ids = removed_notification_ids_, added_notifications = added_notifications_, total_count = total_count_, notification_sound_id = notification_sound_id_, notification_settings_chat_id = notification_settings_chat_id_, chat_id = chat_id_, _type = _type_, notification_group_id = notification_group_id_}

      parseUpdateActiveNotifications :: A.Value -> T.Parser Update
      parseUpdateActiveNotifications = A.withObject "UpdateActiveNotifications" $ \o -> do
        groups_ <- o A..:? "groups"
        return $ UpdateActiveNotifications {groups = groups_}

      parseUpdateHavePendingNotifications :: A.Value -> T.Parser Update
      parseUpdateHavePendingNotifications = A.withObject "UpdateHavePendingNotifications" $ \o -> do
        have_unreceived_notifications_ <- o A..:? "have_unreceived_notifications"
        have_delayed_notifications_ <- o A..:? "have_delayed_notifications"
        return $ UpdateHavePendingNotifications {have_unreceived_notifications = have_unreceived_notifications_, have_delayed_notifications = have_delayed_notifications_}

      parseUpdateDeleteMessages :: A.Value -> T.Parser Update
      parseUpdateDeleteMessages = A.withObject "UpdateDeleteMessages" $ \o -> do
        from_cache_ <- o A..:? "from_cache"
        is_permanent_ <- o A..:? "is_permanent"
        message_ids_ <- o A..:? "message_ids"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateDeleteMessages {from_cache = from_cache_, is_permanent = is_permanent_, message_ids = message_ids_, chat_id = chat_id_}

      parseUpdateChatAction :: A.Value -> T.Parser Update
      parseUpdateChatAction = A.withObject "UpdateChatAction" $ \o -> do
        action_ <- o A..:? "action"
        sender_id_ <- o A..:? "sender_id"
        message_thread_id_ <- mconcat [o A..:? "message_thread_id", U.rm <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatAction {action = action_, sender_id = sender_id_, message_thread_id = message_thread_id_, chat_id = chat_id_}

      parseUpdateUserStatus :: A.Value -> T.Parser Update
      parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
        status_ <- o A..:? "status"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateUserStatus {status = status_, user_id = user_id_}

      parseUpdateUser :: A.Value -> T.Parser Update
      parseUpdateUser = A.withObject "UpdateUser" $ \o -> do
        user_ <- o A..:? "user"
        return $ UpdateUser {user = user_}

      parseUpdateBasicGroup :: A.Value -> T.Parser Update
      parseUpdateBasicGroup = A.withObject "UpdateBasicGroup" $ \o -> do
        basic_group_ <- o A..:? "basic_group"
        return $ UpdateBasicGroup {basic_group = basic_group_}

      parseUpdateSupergroup :: A.Value -> T.Parser Update
      parseUpdateSupergroup = A.withObject "UpdateSupergroup" $ \o -> do
        supergroup_ <- o A..:? "supergroup"
        return $ UpdateSupergroup {supergroup = supergroup_}

      parseUpdateSecretChat :: A.Value -> T.Parser Update
      parseUpdateSecretChat = A.withObject "UpdateSecretChat" $ \o -> do
        secret_chat_ <- o A..:? "secret_chat"
        return $ UpdateSecretChat {secret_chat = secret_chat_}

      parseUpdateUserFullInfo :: A.Value -> T.Parser Update
      parseUpdateUserFullInfo = A.withObject "UpdateUserFullInfo" $ \o -> do
        user_full_info_ <- o A..:? "user_full_info"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateUserFullInfo {user_full_info = user_full_info_, user_id = user_id_}

      parseUpdateBasicGroupFullInfo :: A.Value -> T.Parser Update
      parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
        basic_group_full_info_ <- o A..:? "basic_group_full_info"
        basic_group_id_ <- mconcat [o A..:? "basic_group_id", U.rm <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateBasicGroupFullInfo {basic_group_full_info = basic_group_full_info_, basic_group_id = basic_group_id_}

      parseUpdateSupergroupFullInfo :: A.Value -> T.Parser Update
      parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
        supergroup_full_info_ <- o A..:? "supergroup_full_info"
        supergroup_id_ <- mconcat [o A..:? "supergroup_id", U.rm <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateSupergroupFullInfo {supergroup_full_info = supergroup_full_info_, supergroup_id = supergroup_id_}

      parseUpdateServiceNotification :: A.Value -> T.Parser Update
      parseUpdateServiceNotification = A.withObject "UpdateServiceNotification" $ \o -> do
        content_ <- o A..:? "content"
        __type_ <- o A..:? "type"
        return $ UpdateServiceNotification {content = content_, __type = __type_}

      parseUpdateFile :: A.Value -> T.Parser Update
      parseUpdateFile = A.withObject "UpdateFile" $ \o -> do
        file_ <- o A..:? "file"
        return $ UpdateFile {file = file_}

      parseUpdateFileGenerationStart :: A.Value -> T.Parser Update
      parseUpdateFileGenerationStart = A.withObject "UpdateFileGenerationStart" $ \o -> do
        conversion_ <- o A..:? "conversion"
        destination_path_ <- o A..:? "destination_path"
        original_path_ <- o A..:? "original_path"
        generation_id_ <- mconcat [o A..:? "generation_id", U.rm <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateFileGenerationStart {conversion = conversion_, destination_path = destination_path_, original_path = original_path_, generation_id = generation_id_}

      parseUpdateFileGenerationStop :: A.Value -> T.Parser Update
      parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
        generation_id_ <- mconcat [o A..:? "generation_id", U.rm <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateFileGenerationStop {generation_id = generation_id_}

      parseUpdateFileDownloads :: A.Value -> T.Parser Update
      parseUpdateFileDownloads = A.withObject "UpdateFileDownloads" $ \o -> do
        downloaded_size_ <- mconcat [o A..:? "downloaded_size", U.rm <$> (o A..: "downloaded_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        total_size_ <- mconcat [o A..:? "total_size", U.rm <$> (o A..: "total_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateFileDownloads {downloaded_size = downloaded_size_, total_count = total_count_, total_size = total_size_}

      parseUpdateFileAddedToDownloads :: A.Value -> T.Parser Update
      parseUpdateFileAddedToDownloads = A.withObject "UpdateFileAddedToDownloads" $ \o -> do
        counts_ <- o A..:? "counts"
        file_download_ <- o A..:? "file_download"
        return $ UpdateFileAddedToDownloads {counts = counts_, file_download = file_download_}

      parseUpdateFileDownload :: A.Value -> T.Parser Update
      parseUpdateFileDownload = A.withObject "UpdateFileDownload" $ \o -> do
        counts_ <- o A..:? "counts"
        is_paused_ <- o A..:? "is_paused"
        complete_date_ <- mconcat [o A..:? "complete_date", U.rm <$> (o A..: "complete_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        file_id_ <- mconcat [o A..:? "file_id", U.rm <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateFileDownload {counts = counts_, is_paused = is_paused_, complete_date = complete_date_, file_id = file_id_}

      parseUpdateFileRemovedFromDownloads :: A.Value -> T.Parser Update
      parseUpdateFileRemovedFromDownloads = A.withObject "UpdateFileRemovedFromDownloads" $ \o -> do
        counts_ <- o A..:? "counts"
        file_id_ <- mconcat [o A..:? "file_id", U.rm <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateFileRemovedFromDownloads {counts = counts_, file_id = file_id_}

      parseUpdateCall :: A.Value -> T.Parser Update
      parseUpdateCall = A.withObject "UpdateCall" $ \o -> do
        call_ <- o A..:? "call"
        return $ UpdateCall {call = call_}

      parseUpdateGroupCall :: A.Value -> T.Parser Update
      parseUpdateGroupCall = A.withObject "UpdateGroupCall" $ \o -> do
        group_call_ <- o A..:? "group_call"
        return $ UpdateGroupCall {group_call = group_call_}

      parseUpdateGroupCallParticipant :: A.Value -> T.Parser Update
      parseUpdateGroupCallParticipant = A.withObject "UpdateGroupCallParticipant" $ \o -> do
        participant_ <- o A..:? "participant"
        group_call_id_ <- mconcat [o A..:? "group_call_id", U.rm <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateGroupCallParticipant {participant = participant_, group_call_id = group_call_id_}

      parseUpdateNewCallSignalingData :: A.Value -> T.Parser Update
      parseUpdateNewCallSignalingData = A.withObject "UpdateNewCallSignalingData" $ \o -> do
        _data_ <- o A..:? "data"
        call_id_ <- mconcat [o A..:? "call_id", U.rm <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewCallSignalingData {_data = _data_, call_id = call_id_}

      parseUpdateUserPrivacySettingRules :: A.Value -> T.Parser Update
      parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
        rules_ <- o A..:? "rules"
        setting_ <- o A..:? "setting"
        return $ UpdateUserPrivacySettingRules {rules = rules_, setting = setting_}

      parseUpdateUnreadMessageCount :: A.Value -> T.Parser Update
      parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
        unread_unmuted_count_ <- mconcat [o A..:? "unread_unmuted_count", U.rm <$> (o A..: "unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_count_ <- mconcat [o A..:? "unread_count", U.rm <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_list_ <- o A..:? "chat_list"
        return $ UpdateUnreadMessageCount {unread_unmuted_count = unread_unmuted_count_, unread_count = unread_count_, chat_list = chat_list_}

      parseUpdateUnreadChatCount :: A.Value -> T.Parser Update
      parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
        marked_as_unread_unmuted_count_ <- mconcat [o A..:? "marked_as_unread_unmuted_count", U.rm <$> (o A..: "marked_as_unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        marked_as_unread_count_ <- mconcat [o A..:? "marked_as_unread_count", U.rm <$> (o A..: "marked_as_unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_unmuted_count_ <- mconcat [o A..:? "unread_unmuted_count", U.rm <$> (o A..: "unread_unmuted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_count_ <- mconcat [o A..:? "unread_count", U.rm <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_list_ <- o A..:? "chat_list"
        return $ UpdateUnreadChatCount {marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_, marked_as_unread_count = marked_as_unread_count_, unread_unmuted_count = unread_unmuted_count_, unread_count = unread_count_, total_count = total_count_, chat_list = chat_list_}

      parseUpdateOption :: A.Value -> T.Parser Update
      parseUpdateOption = A.withObject "UpdateOption" $ \o -> do
        value_ <- o A..:? "value"
        name_ <- o A..:? "name"
        return $ UpdateOption {value = value_, name = name_}

      parseUpdateStickerSet :: A.Value -> T.Parser Update
      parseUpdateStickerSet = A.withObject "UpdateStickerSet" $ \o -> do
        sticker_set_ <- o A..:? "sticker_set"
        return $ UpdateStickerSet {sticker_set = sticker_set_}

      parseUpdateInstalledStickerSets :: A.Value -> T.Parser Update
      parseUpdateInstalledStickerSets = A.withObject "UpdateInstalledStickerSets" $ \o -> do
        sticker_set_ids_ <- o A..:? "sticker_set_ids"
        is_masks_ <- o A..:? "is_masks"
        return $ UpdateInstalledStickerSets {sticker_set_ids = sticker_set_ids_, is_masks = is_masks_}

      parseUpdateTrendingStickerSets :: A.Value -> T.Parser Update
      parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
        sticker_sets_ <- o A..:? "sticker_sets"
        return $ UpdateTrendingStickerSets {sticker_sets = sticker_sets_}

      parseUpdateRecentStickers :: A.Value -> T.Parser Update
      parseUpdateRecentStickers = A.withObject "UpdateRecentStickers" $ \o -> do
        sticker_ids_ <- o A..:? "sticker_ids"
        is_attached_ <- o A..:? "is_attached"
        return $ UpdateRecentStickers {sticker_ids = sticker_ids_, is_attached = is_attached_}

      parseUpdateFavoriteStickers :: A.Value -> T.Parser Update
      parseUpdateFavoriteStickers = A.withObject "UpdateFavoriteStickers" $ \o -> do
        sticker_ids_ <- o A..:? "sticker_ids"
        return $ UpdateFavoriteStickers {sticker_ids = sticker_ids_}

      parseUpdateSavedAnimations :: A.Value -> T.Parser Update
      parseUpdateSavedAnimations = A.withObject "UpdateSavedAnimations" $ \o -> do
        animation_ids_ <- o A..:? "animation_ids"
        return $ UpdateSavedAnimations {animation_ids = animation_ids_}

      parseUpdateSavedNotificationSounds :: A.Value -> T.Parser Update
      parseUpdateSavedNotificationSounds = A.withObject "UpdateSavedNotificationSounds" $ \o -> do
        notification_sound_ids_ <- o A..:? "notification_sound_ids"
        return $ UpdateSavedNotificationSounds {notification_sound_ids = notification_sound_ids_}

      parseUpdateSelectedBackground :: A.Value -> T.Parser Update
      parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
        background_ <- o A..:? "background"
        for_dark_theme_ <- o A..:? "for_dark_theme"
        return $ UpdateSelectedBackground {background = background_, for_dark_theme = for_dark_theme_}

      parseUpdateChatThemes :: A.Value -> T.Parser Update
      parseUpdateChatThemes = A.withObject "UpdateChatThemes" $ \o -> do
        chat_themes_ <- o A..:? "chat_themes"
        return $ UpdateChatThemes {chat_themes = chat_themes_}

      parseUpdateLanguagePackStrings :: A.Value -> T.Parser Update
      parseUpdateLanguagePackStrings = A.withObject "UpdateLanguagePackStrings" $ \o -> do
        strings_ <- o A..:? "strings"
        language_pack_id_ <- o A..:? "language_pack_id"
        localization_target_ <- o A..:? "localization_target"
        return $ UpdateLanguagePackStrings {strings = strings_, language_pack_id = language_pack_id_, localization_target = localization_target_}

      parseUpdateConnectionState :: A.Value -> T.Parser Update
      parseUpdateConnectionState = A.withObject "UpdateConnectionState" $ \o -> do
        state_ <- o A..:? "state"
        return $ UpdateConnectionState {state = state_}

      parseUpdateTermsOfService :: A.Value -> T.Parser Update
      parseUpdateTermsOfService = A.withObject "UpdateTermsOfService" $ \o -> do
        terms_of_service_ <- o A..:? "terms_of_service"
        terms_of_service_id_ <- o A..:? "terms_of_service_id"
        return $ UpdateTermsOfService {terms_of_service = terms_of_service_, terms_of_service_id = terms_of_service_id_}

      parseUpdateUsersNearby :: A.Value -> T.Parser Update
      parseUpdateUsersNearby = A.withObject "UpdateUsersNearby" $ \o -> do
        users_nearby_ <- o A..:? "users_nearby"
        return $ UpdateUsersNearby {users_nearby = users_nearby_}

      parseUpdateAttachmentMenuBots :: A.Value -> T.Parser Update
      parseUpdateAttachmentMenuBots = A.withObject "UpdateAttachmentMenuBots" $ \o -> do
        bots_ <- o A..:? "bots"
        return $ UpdateAttachmentMenuBots {bots = bots_}

      parseUpdateWebAppMessageSent :: A.Value -> T.Parser Update
      parseUpdateWebAppMessageSent = A.withObject "UpdateWebAppMessageSent" $ \o -> do
        web_app_launch_id_ <- mconcat [o A..:? "web_app_launch_id", U.rm <$> (o A..: "web_app_launch_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateWebAppMessageSent {web_app_launch_id = web_app_launch_id_}

      parseUpdateReactions :: A.Value -> T.Parser Update
      parseUpdateReactions = A.withObject "UpdateReactions" $ \o -> do
        reactions_ <- o A..:? "reactions"
        return $ UpdateReactions {reactions = reactions_}

      parseUpdateDiceEmojis :: A.Value -> T.Parser Update
      parseUpdateDiceEmojis = A.withObject "UpdateDiceEmojis" $ \o -> do
        emojis_ <- o A..:? "emojis"
        return $ UpdateDiceEmojis {emojis = emojis_}

      parseUpdateAnimatedEmojiMessageClicked :: A.Value -> T.Parser Update
      parseUpdateAnimatedEmojiMessageClicked = A.withObject "UpdateAnimatedEmojiMessageClicked" $ \o -> do
        sticker_ <- o A..:? "sticker"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateAnimatedEmojiMessageClicked {sticker = sticker_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateAnimationSearchParameters :: A.Value -> T.Parser Update
      parseUpdateAnimationSearchParameters = A.withObject "UpdateAnimationSearchParameters" $ \o -> do
        emojis_ <- o A..:? "emojis"
        provider_ <- o A..:? "provider"
        return $ UpdateAnimationSearchParameters {emojis = emojis_, provider = provider_}

      parseUpdateSuggestedActions :: A.Value -> T.Parser Update
      parseUpdateSuggestedActions = A.withObject "UpdateSuggestedActions" $ \o -> do
        removed_actions_ <- o A..:? "removed_actions"
        added_actions_ <- o A..:? "added_actions"
        return $ UpdateSuggestedActions {removed_actions = removed_actions_, added_actions = added_actions_}

      parseUpdateNewInlineQuery :: A.Value -> T.Parser Update
      parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
        offset_ <- o A..:? "offset"
        query_ <- o A..:? "query"
        chat_type_ <- o A..:? "chat_type"
        user_location_ <- o A..:? "user_location"
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewInlineQuery {offset = offset_, query = query_, chat_type = chat_type_, user_location = user_location_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewChosenInlineResult :: A.Value -> T.Parser Update
      parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
        inline_message_id_ <- o A..:? "inline_message_id"
        result_id_ <- o A..:? "result_id"
        query_ <- o A..:? "query"
        user_location_ <- o A..:? "user_location"
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewChosenInlineResult {inline_message_id = inline_message_id_, result_id = result_id_, query = query_, user_location = user_location_, sender_user_id = sender_user_id_}

      parseUpdateNewCallbackQuery :: A.Value -> T.Parser Update
      parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
        payload_ <- o A..:? "payload"
        chat_instance_ <- mconcat [o A..:? "chat_instance", U.rm <$> (o A..: "chat_instance" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewCallbackQuery {payload = payload_, chat_instance = chat_instance_, message_id = message_id_, chat_id = chat_id_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewInlineCallbackQuery :: A.Value -> T.Parser Update
      parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
        payload_ <- o A..:? "payload"
        chat_instance_ <- mconcat [o A..:? "chat_instance", U.rm <$> (o A..: "chat_instance" :: T.Parser String)] :: T.Parser (Maybe Int)
        inline_message_id_ <- o A..:? "inline_message_id"
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewInlineCallbackQuery {payload = payload_, chat_instance = chat_instance_, inline_message_id = inline_message_id_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewShippingQuery :: A.Value -> T.Parser Update
      parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
        shipping_address_ <- o A..:? "shipping_address"
        invoice_payload_ <- o A..:? "invoice_payload"
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewShippingQuery {shipping_address = shipping_address_, invoice_payload = invoice_payload_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewPreCheckoutQuery :: A.Value -> T.Parser Update
      parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
        order_info_ <- o A..:? "order_info"
        shipping_option_id_ <- o A..:? "shipping_option_id"
        invoice_payload_ <- o A..:? "invoice_payload"
        total_amount_ <- mconcat [o A..:? "total_amount", U.rm <$> (o A..: "total_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
        currency_ <- o A..:? "currency"
        sender_user_id_ <- mconcat [o A..:? "sender_user_id", U.rm <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewPreCheckoutQuery {order_info = order_info_, shipping_option_id = shipping_option_id_, invoice_payload = invoice_payload_, total_amount = total_amount_, currency = currency_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewCustomEvent :: A.Value -> T.Parser Update
      parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
        event_ <- o A..:? "event"
        return $ UpdateNewCustomEvent {event = event_}

      parseUpdateNewCustomQuery :: A.Value -> T.Parser Update
      parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
        timeout_ <- mconcat [o A..:? "timeout", U.rm <$> (o A..: "timeout" :: T.Parser String)] :: T.Parser (Maybe Int)
        _data_ <- o A..:? "data"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewCustomQuery {timeout = timeout_, _data = _data_, _id = _id_}

      parseUpdatePoll :: A.Value -> T.Parser Update
      parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
        poll_ <- o A..:? "poll"
        return $ UpdatePoll {poll = poll_}

      parseUpdatePollAnswer :: A.Value -> T.Parser Update
      parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
        option_ids_ <- o A..:? "option_ids"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        poll_id_ <- mconcat [o A..:? "poll_id", U.rm <$> (o A..: "poll_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdatePollAnswer {option_ids = option_ids_, user_id = user_id_, poll_id = poll_id_}

      parseUpdateChatMember :: A.Value -> T.Parser Update
      parseUpdateChatMember = A.withObject "UpdateChatMember" $ \o -> do
        new_chat_member_ <- o A..:? "new_chat_member"
        old_chat_member_ <- o A..:? "old_chat_member"
        invite_link_ <- o A..:? "invite_link"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        actor_user_id_ <- mconcat [o A..:? "actor_user_id", U.rm <$> (o A..: "actor_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateChatMember {new_chat_member = new_chat_member_, old_chat_member = old_chat_member_, invite_link = invite_link_, date = date_, actor_user_id = actor_user_id_, chat_id = chat_id_}

      parseUpdateNewChatJoinRequest :: A.Value -> T.Parser Update
      parseUpdateNewChatJoinRequest = A.withObject "UpdateNewChatJoinRequest" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        request_ <- o A..:? "request"
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UpdateNewChatJoinRequest {invite_link = invite_link_, request = request_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON Update where
  toJSON
    UpdateAuthorizationState
      { authorization_state = authorization_state
      } =
      A.object
        [ "@type" A..= T.String "updateAuthorizationState",
          "authorization_state" A..= authorization_state
        ]
  toJSON
    UpdateNewMessage
      { message = message
      } =
      A.object
        [ "@type" A..= T.String "updateNewMessage",
          "message" A..= message
        ]
  toJSON
    UpdateMessageSendAcknowledged
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendAcknowledged",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageSendSucceeded
      { old_message_id = old_message_id,
        message = message
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendSucceeded",
          "old_message_id" A..= old_message_id,
          "message" A..= message
        ]
  toJSON
    UpdateMessageSendFailed
      { error_message = error_message,
        error_code = error_code,
        old_message_id = old_message_id,
        message = message
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendFailed",
          "error_message" A..= error_message,
          "error_code" A..= error_code,
          "old_message_id" A..= old_message_id,
          "message" A..= message
        ]
  toJSON
    UpdateMessageContent
      { new_content = new_content,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageContent",
          "new_content" A..= new_content,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageEdited
      { reply_markup = reply_markup,
        edit_date = edit_date,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageEdited",
          "reply_markup" A..= reply_markup,
          "edit_date" A..= edit_date,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageIsPinned
      { is_pinned = is_pinned,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageIsPinned",
          "is_pinned" A..= is_pinned,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageInteractionInfo
      { interaction_info = interaction_info,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageInteractionInfo",
          "interaction_info" A..= interaction_info,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageContentOpened
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageContentOpened",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageMentionRead
      { unread_mention_count = unread_mention_count,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageMentionRead",
          "unread_mention_count" A..= unread_mention_count,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageUnreadReactions
      { unread_reaction_count = unread_reaction_count,
        unread_reactions = unread_reactions,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageUnreadReactions",
          "unread_reaction_count" A..= unread_reaction_count,
          "unread_reactions" A..= unread_reactions,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateMessageLiveLocationViewed
      { message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateMessageLiveLocationViewed",
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateNewChat
      { chat = chat
      } =
      A.object
        [ "@type" A..= T.String "updateNewChat",
          "chat" A..= chat
        ]
  toJSON
    UpdateChatTitle
      { title = title,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatTitle",
          "title" A..= title,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatPhoto
      { photo = photo,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatPhoto",
          "photo" A..= photo,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatPermissions
      { permissions = permissions,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatPermissions",
          "permissions" A..= permissions,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatLastMessage
      { positions = positions,
        last_message = last_message,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatLastMessage",
          "positions" A..= positions,
          "last_message" A..= last_message,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatPosition
      { position = position,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatPosition",
          "position" A..= position,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatReadInbox
      { unread_count = unread_count,
        last_read_inbox_message_id = last_read_inbox_message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatReadInbox",
          "unread_count" A..= unread_count,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatReadOutbox
      { last_read_outbox_message_id = last_read_outbox_message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatReadOutbox",
          "last_read_outbox_message_id" A..= last_read_outbox_message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatActionBar
      { action_bar = action_bar,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatActionBar",
          "action_bar" A..= action_bar,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatAvailableReactions
      { available_reactions = available_reactions,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatAvailableReactions",
          "available_reactions" A..= available_reactions,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatDraftMessage
      { positions = positions,
        draft_message = draft_message,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatDraftMessage",
          "positions" A..= positions,
          "draft_message" A..= draft_message,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatMessageSender
      { message_sender_id = message_sender_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatMessageSender",
          "message_sender_id" A..= message_sender_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatMessageTtl
      { message_ttl = message_ttl,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatMessageTtl",
          "message_ttl" A..= message_ttl,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatNotificationSettings
      { notification_settings = notification_settings,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatNotificationSettings",
          "notification_settings" A..= notification_settings,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatPendingJoinRequests
      { pending_join_requests = pending_join_requests,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatPendingJoinRequests",
          "pending_join_requests" A..= pending_join_requests,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatReplyMarkup
      { reply_markup_message_id = reply_markup_message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatReplyMarkup",
          "reply_markup_message_id" A..= reply_markup_message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatTheme
      { theme_name = theme_name,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatTheme",
          "theme_name" A..= theme_name,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatUnreadMentionCount
      { unread_mention_count = unread_mention_count,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatUnreadMentionCount",
          "unread_mention_count" A..= unread_mention_count,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatUnreadReactionCount
      { unread_reaction_count = unread_reaction_count,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatUnreadReactionCount",
          "unread_reaction_count" A..= unread_reaction_count,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatVideoChat
      { video_chat = video_chat,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatVideoChat",
          "video_chat" A..= video_chat,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatDefaultDisableNotification",
          "default_disable_notification" A..= default_disable_notification,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatHasProtectedContent
      { has_protected_content = has_protected_content,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatHasProtectedContent",
          "has_protected_content" A..= has_protected_content,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatHasScheduledMessages
      { has_scheduled_messages = has_scheduled_messages,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatHasScheduledMessages",
          "has_scheduled_messages" A..= has_scheduled_messages,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatIsBlocked
      { is_blocked = is_blocked,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatIsBlocked",
          "is_blocked" A..= is_blocked,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatIsMarkedAsUnread",
          "is_marked_as_unread" A..= is_marked_as_unread,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatFilters
      { chat_filters = chat_filters
      } =
      A.object
        [ "@type" A..= T.String "updateChatFilters",
          "chat_filters" A..= chat_filters
        ]
  toJSON
    UpdateChatOnlineMemberCount
      { online_member_count = online_member_count,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatOnlineMemberCount",
          "online_member_count" A..= online_member_count,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateScopeNotificationSettings
      { _notification_settings = _notification_settings,
        scope = scope
      } =
      A.object
        [ "@type" A..= T.String "updateScopeNotificationSettings",
          "notification_settings" A..= _notification_settings,
          "scope" A..= scope
        ]
  toJSON
    UpdateNotification
      { notification = notification,
        notification_group_id = notification_group_id
      } =
      A.object
        [ "@type" A..= T.String "updateNotification",
          "notification" A..= notification,
          "notification_group_id" A..= notification_group_id
        ]
  toJSON
    UpdateNotificationGroup
      { removed_notification_ids = removed_notification_ids,
        added_notifications = added_notifications,
        total_count = total_count,
        notification_sound_id = notification_sound_id,
        notification_settings_chat_id = notification_settings_chat_id,
        chat_id = chat_id,
        _type = _type,
        notification_group_id = notification_group_id
      } =
      A.object
        [ "@type" A..= T.String "updateNotificationGroup",
          "removed_notification_ids" A..= removed_notification_ids,
          "added_notifications" A..= added_notifications,
          "total_count" A..= total_count,
          "notification_sound_id" A..= notification_sound_id,
          "notification_settings_chat_id" A..= notification_settings_chat_id,
          "chat_id" A..= chat_id,
          "type" A..= _type,
          "notification_group_id" A..= notification_group_id
        ]
  toJSON
    UpdateActiveNotifications
      { groups = groups
      } =
      A.object
        [ "@type" A..= T.String "updateActiveNotifications",
          "groups" A..= groups
        ]
  toJSON
    UpdateHavePendingNotifications
      { have_unreceived_notifications = have_unreceived_notifications,
        have_delayed_notifications = have_delayed_notifications
      } =
      A.object
        [ "@type" A..= T.String "updateHavePendingNotifications",
          "have_unreceived_notifications" A..= have_unreceived_notifications,
          "have_delayed_notifications" A..= have_delayed_notifications
        ]
  toJSON
    UpdateDeleteMessages
      { from_cache = from_cache,
        is_permanent = is_permanent,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateDeleteMessages",
          "from_cache" A..= from_cache,
          "is_permanent" A..= is_permanent,
          "message_ids" A..= message_ids,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateChatAction
      { action = action,
        sender_id = sender_id,
        message_thread_id = message_thread_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatAction",
          "action" A..= action,
          "sender_id" A..= sender_id,
          "message_thread_id" A..= message_thread_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateUserStatus
      { status = status,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "updateUserStatus",
          "status" A..= status,
          "user_id" A..= user_id
        ]
  toJSON
    UpdateUser
      { user = user
      } =
      A.object
        [ "@type" A..= T.String "updateUser",
          "user" A..= user
        ]
  toJSON
    UpdateBasicGroup
      { basic_group = basic_group
      } =
      A.object
        [ "@type" A..= T.String "updateBasicGroup",
          "basic_group" A..= basic_group
        ]
  toJSON
    UpdateSupergroup
      { supergroup = supergroup
      } =
      A.object
        [ "@type" A..= T.String "updateSupergroup",
          "supergroup" A..= supergroup
        ]
  toJSON
    UpdateSecretChat
      { secret_chat = secret_chat
      } =
      A.object
        [ "@type" A..= T.String "updateSecretChat",
          "secret_chat" A..= secret_chat
        ]
  toJSON
    UpdateUserFullInfo
      { user_full_info = user_full_info,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "updateUserFullInfo",
          "user_full_info" A..= user_full_info,
          "user_id" A..= user_id
        ]
  toJSON
    UpdateBasicGroupFullInfo
      { basic_group_full_info = basic_group_full_info,
        basic_group_id = basic_group_id
      } =
      A.object
        [ "@type" A..= T.String "updateBasicGroupFullInfo",
          "basic_group_full_info" A..= basic_group_full_info,
          "basic_group_id" A..= basic_group_id
        ]
  toJSON
    UpdateSupergroupFullInfo
      { supergroup_full_info = supergroup_full_info,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "updateSupergroupFullInfo",
          "supergroup_full_info" A..= supergroup_full_info,
          "supergroup_id" A..= supergroup_id
        ]
  toJSON
    UpdateServiceNotification
      { content = content,
        __type = __type
      } =
      A.object
        [ "@type" A..= T.String "updateServiceNotification",
          "content" A..= content,
          "type" A..= __type
        ]
  toJSON
    UpdateFile
      { file = file
      } =
      A.object
        [ "@type" A..= T.String "updateFile",
          "file" A..= file
        ]
  toJSON
    UpdateFileGenerationStart
      { conversion = conversion,
        destination_path = destination_path,
        original_path = original_path,
        generation_id = generation_id
      } =
      A.object
        [ "@type" A..= T.String "updateFileGenerationStart",
          "conversion" A..= conversion,
          "destination_path" A..= destination_path,
          "original_path" A..= original_path,
          "generation_id" A..= generation_id
        ]
  toJSON
    UpdateFileGenerationStop
      { generation_id = generation_id
      } =
      A.object
        [ "@type" A..= T.String "updateFileGenerationStop",
          "generation_id" A..= generation_id
        ]
  toJSON
    UpdateFileDownloads
      { downloaded_size = downloaded_size,
        total_count = total_count,
        total_size = total_size
      } =
      A.object
        [ "@type" A..= T.String "updateFileDownloads",
          "downloaded_size" A..= downloaded_size,
          "total_count" A..= total_count,
          "total_size" A..= total_size
        ]
  toJSON
    UpdateFileAddedToDownloads
      { counts = counts,
        file_download = file_download
      } =
      A.object
        [ "@type" A..= T.String "updateFileAddedToDownloads",
          "counts" A..= counts,
          "file_download" A..= file_download
        ]
  toJSON
    UpdateFileDownload
      { counts = counts,
        is_paused = is_paused,
        complete_date = complete_date,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "updateFileDownload",
          "counts" A..= counts,
          "is_paused" A..= is_paused,
          "complete_date" A..= complete_date,
          "file_id" A..= file_id
        ]
  toJSON
    UpdateFileRemovedFromDownloads
      { counts = counts,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "updateFileRemovedFromDownloads",
          "counts" A..= counts,
          "file_id" A..= file_id
        ]
  toJSON
    UpdateCall
      { call = call
      } =
      A.object
        [ "@type" A..= T.String "updateCall",
          "call" A..= call
        ]
  toJSON
    UpdateGroupCall
      { group_call = group_call
      } =
      A.object
        [ "@type" A..= T.String "updateGroupCall",
          "group_call" A..= group_call
        ]
  toJSON
    UpdateGroupCallParticipant
      { participant = participant,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "updateGroupCallParticipant",
          "participant" A..= participant,
          "group_call_id" A..= group_call_id
        ]
  toJSON
    UpdateNewCallSignalingData
      { _data = _data,
        call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "updateNewCallSignalingData",
          "data" A..= _data,
          "call_id" A..= call_id
        ]
  toJSON
    UpdateUserPrivacySettingRules
      { rules = rules,
        setting = setting
      } =
      A.object
        [ "@type" A..= T.String "updateUserPrivacySettingRules",
          "rules" A..= rules,
          "setting" A..= setting
        ]
  toJSON
    UpdateUnreadMessageCount
      { unread_unmuted_count = unread_unmuted_count,
        unread_count = unread_count,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "updateUnreadMessageCount",
          "unread_unmuted_count" A..= unread_unmuted_count,
          "unread_count" A..= unread_count,
          "chat_list" A..= chat_list
        ]
  toJSON
    UpdateUnreadChatCount
      { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count,
        marked_as_unread_count = marked_as_unread_count,
        unread_unmuted_count = unread_unmuted_count,
        unread_count = unread_count,
        total_count = total_count,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "updateUnreadChatCount",
          "marked_as_unread_unmuted_count" A..= marked_as_unread_unmuted_count,
          "marked_as_unread_count" A..= marked_as_unread_count,
          "unread_unmuted_count" A..= unread_unmuted_count,
          "unread_count" A..= unread_count,
          "total_count" A..= total_count,
          "chat_list" A..= chat_list
        ]
  toJSON
    UpdateOption
      { value = value,
        name = name
      } =
      A.object
        [ "@type" A..= T.String "updateOption",
          "value" A..= value,
          "name" A..= name
        ]
  toJSON
    UpdateStickerSet
      { sticker_set = sticker_set
      } =
      A.object
        [ "@type" A..= T.String "updateStickerSet",
          "sticker_set" A..= sticker_set
        ]
  toJSON
    UpdateInstalledStickerSets
      { sticker_set_ids = sticker_set_ids,
        is_masks = is_masks
      } =
      A.object
        [ "@type" A..= T.String "updateInstalledStickerSets",
          "sticker_set_ids" A..= sticker_set_ids,
          "is_masks" A..= is_masks
        ]
  toJSON
    UpdateTrendingStickerSets
      { sticker_sets = sticker_sets
      } =
      A.object
        [ "@type" A..= T.String "updateTrendingStickerSets",
          "sticker_sets" A..= sticker_sets
        ]
  toJSON
    UpdateRecentStickers
      { sticker_ids = sticker_ids,
        is_attached = is_attached
      } =
      A.object
        [ "@type" A..= T.String "updateRecentStickers",
          "sticker_ids" A..= sticker_ids,
          "is_attached" A..= is_attached
        ]
  toJSON
    UpdateFavoriteStickers
      { sticker_ids = sticker_ids
      } =
      A.object
        [ "@type" A..= T.String "updateFavoriteStickers",
          "sticker_ids" A..= sticker_ids
        ]
  toJSON
    UpdateSavedAnimations
      { animation_ids = animation_ids
      } =
      A.object
        [ "@type" A..= T.String "updateSavedAnimations",
          "animation_ids" A..= animation_ids
        ]
  toJSON
    UpdateSavedNotificationSounds
      { notification_sound_ids = notification_sound_ids
      } =
      A.object
        [ "@type" A..= T.String "updateSavedNotificationSounds",
          "notification_sound_ids" A..= notification_sound_ids
        ]
  toJSON
    UpdateSelectedBackground
      { background = background,
        for_dark_theme = for_dark_theme
      } =
      A.object
        [ "@type" A..= T.String "updateSelectedBackground",
          "background" A..= background,
          "for_dark_theme" A..= for_dark_theme
        ]
  toJSON
    UpdateChatThemes
      { chat_themes = chat_themes
      } =
      A.object
        [ "@type" A..= T.String "updateChatThemes",
          "chat_themes" A..= chat_themes
        ]
  toJSON
    UpdateLanguagePackStrings
      { strings = strings,
        language_pack_id = language_pack_id,
        localization_target = localization_target
      } =
      A.object
        [ "@type" A..= T.String "updateLanguagePackStrings",
          "strings" A..= strings,
          "language_pack_id" A..= language_pack_id,
          "localization_target" A..= localization_target
        ]
  toJSON
    UpdateConnectionState
      { state = state
      } =
      A.object
        [ "@type" A..= T.String "updateConnectionState",
          "state" A..= state
        ]
  toJSON
    UpdateTermsOfService
      { terms_of_service = terms_of_service,
        terms_of_service_id = terms_of_service_id
      } =
      A.object
        [ "@type" A..= T.String "updateTermsOfService",
          "terms_of_service" A..= terms_of_service,
          "terms_of_service_id" A..= terms_of_service_id
        ]
  toJSON
    UpdateUsersNearby
      { users_nearby = users_nearby
      } =
      A.object
        [ "@type" A..= T.String "updateUsersNearby",
          "users_nearby" A..= users_nearby
        ]
  toJSON
    UpdateAttachmentMenuBots
      { bots = bots
      } =
      A.object
        [ "@type" A..= T.String "updateAttachmentMenuBots",
          "bots" A..= bots
        ]
  toJSON
    UpdateWebAppMessageSent
      { web_app_launch_id = web_app_launch_id
      } =
      A.object
        [ "@type" A..= T.String "updateWebAppMessageSent",
          "web_app_launch_id" A..= web_app_launch_id
        ]
  toJSON
    UpdateReactions
      { reactions = reactions
      } =
      A.object
        [ "@type" A..= T.String "updateReactions",
          "reactions" A..= reactions
        ]
  toJSON
    UpdateDiceEmojis
      { emojis = emojis
      } =
      A.object
        [ "@type" A..= T.String "updateDiceEmojis",
          "emojis" A..= emojis
        ]
  toJSON
    UpdateAnimatedEmojiMessageClicked
      { sticker = sticker,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateAnimatedEmojiMessageClicked",
          "sticker" A..= sticker,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateAnimationSearchParameters
      { emojis = emojis,
        provider = provider
      } =
      A.object
        [ "@type" A..= T.String "updateAnimationSearchParameters",
          "emojis" A..= emojis,
          "provider" A..= provider
        ]
  toJSON
    UpdateSuggestedActions
      { removed_actions = removed_actions,
        added_actions = added_actions
      } =
      A.object
        [ "@type" A..= T.String "updateSuggestedActions",
          "removed_actions" A..= removed_actions,
          "added_actions" A..= added_actions
        ]
  toJSON
    UpdateNewInlineQuery
      { offset = offset,
        query = query,
        chat_type = chat_type,
        user_location = user_location,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewInlineQuery",
          "offset" A..= offset,
          "query" A..= query,
          "chat_type" A..= chat_type,
          "user_location" A..= user_location,
          "sender_user_id" A..= sender_user_id,
          "id" A..= _id
        ]
  toJSON
    UpdateNewChosenInlineResult
      { inline_message_id = inline_message_id,
        result_id = result_id,
        query = query,
        user_location = user_location,
        sender_user_id = sender_user_id
      } =
      A.object
        [ "@type" A..= T.String "updateNewChosenInlineResult",
          "inline_message_id" A..= inline_message_id,
          "result_id" A..= result_id,
          "query" A..= query,
          "user_location" A..= user_location,
          "sender_user_id" A..= sender_user_id
        ]
  toJSON
    UpdateNewCallbackQuery
      { payload = payload,
        chat_instance = chat_instance,
        message_id = message_id,
        chat_id = chat_id,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewCallbackQuery",
          "payload" A..= payload,
          "chat_instance" A..= chat_instance,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id,
          "sender_user_id" A..= sender_user_id,
          "id" A..= _id
        ]
  toJSON
    UpdateNewInlineCallbackQuery
      { payload = payload,
        chat_instance = chat_instance,
        inline_message_id = inline_message_id,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewInlineCallbackQuery",
          "payload" A..= payload,
          "chat_instance" A..= chat_instance,
          "inline_message_id" A..= inline_message_id,
          "sender_user_id" A..= sender_user_id,
          "id" A..= _id
        ]
  toJSON
    UpdateNewShippingQuery
      { shipping_address = shipping_address,
        invoice_payload = invoice_payload,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewShippingQuery",
          "shipping_address" A..= shipping_address,
          "invoice_payload" A..= invoice_payload,
          "sender_user_id" A..= sender_user_id,
          "id" A..= _id
        ]
  toJSON
    UpdateNewPreCheckoutQuery
      { order_info = order_info,
        shipping_option_id = shipping_option_id,
        invoice_payload = invoice_payload,
        total_amount = total_amount,
        currency = currency,
        sender_user_id = sender_user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewPreCheckoutQuery",
          "order_info" A..= order_info,
          "shipping_option_id" A..= shipping_option_id,
          "invoice_payload" A..= invoice_payload,
          "total_amount" A..= total_amount,
          "currency" A..= currency,
          "sender_user_id" A..= sender_user_id,
          "id" A..= _id
        ]
  toJSON
    UpdateNewCustomEvent
      { event = event
      } =
      A.object
        [ "@type" A..= T.String "updateNewCustomEvent",
          "event" A..= event
        ]
  toJSON
    UpdateNewCustomQuery
      { timeout = timeout,
        _data = _data,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "updateNewCustomQuery",
          "timeout" A..= timeout,
          "data" A..= _data,
          "id" A..= _id
        ]
  toJSON
    UpdatePoll
      { poll = poll
      } =
      A.object
        [ "@type" A..= T.String "updatePoll",
          "poll" A..= poll
        ]
  toJSON
    UpdatePollAnswer
      { option_ids = option_ids,
        user_id = user_id,
        poll_id = poll_id
      } =
      A.object
        [ "@type" A..= T.String "updatePollAnswer",
          "option_ids" A..= option_ids,
          "user_id" A..= user_id,
          "poll_id" A..= poll_id
        ]
  toJSON
    UpdateChatMember
      { new_chat_member = new_chat_member,
        old_chat_member = old_chat_member,
        invite_link = invite_link,
        date = date,
        actor_user_id = actor_user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateChatMember",
          "new_chat_member" A..= new_chat_member,
          "old_chat_member" A..= old_chat_member,
          "invite_link" A..= invite_link,
          "date" A..= date,
          "actor_user_id" A..= actor_user_id,
          "chat_id" A..= chat_id
        ]
  toJSON
    UpdateNewChatJoinRequest
      { invite_link = invite_link,
        request = request,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "updateNewChatJoinRequest",
          "invite_link" A..= invite_link,
          "request" A..= request,
          "chat_id" A..= chat_id
        ]
