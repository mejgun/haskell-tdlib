{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Update where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Address as Address
import qualified TD.Data.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Data.AuthorizationState as AuthorizationState
import qualified TD.Data.AutosaveSettingsScope as AutosaveSettingsScope
import qualified TD.Data.Background as Background
import qualified TD.Data.BasicGroup as BasicGroup
import qualified TD.Data.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Data.Call as Call
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatAction as ChatAction
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.ChatActiveStories as ChatActiveStories
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.ChatFolderInfo as ChatFolderInfo
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
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo
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
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Data.SecretChat as SecretChat
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerSet as StickerSet
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Story as Story
import qualified TD.Data.StoryList as StoryList
import qualified TD.Data.SuggestedAction as SuggestedAction
import qualified TD.Data.Supergroup as Supergroup
import qualified TD.Data.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Data.TermsOfService as TermsOfService
import qualified TD.Data.TrendingStickerSets as TrendingStickerSets
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
  | -- | A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed.
    -- This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
    UpdateMessageSendAcknowledged
      { -- | A temporary message identifier
        message_id :: Maybe Int,
        -- | The chat identifier of the sent message
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
      { -- | Error message
        error_message :: Maybe String,
        -- | An error code
        error_code :: Maybe Int,
        -- | The previous temporary message identifier
        old_message_id :: Maybe Int,
        -- | The failed to send message
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
  | -- | A message was edited. Changes in the message content will come in a separate updateMessageContent
    UpdateMessageEdited
      { -- | New message reply markup; may be null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- | Point in time (Unix timestamp) when the message was edited
        edit_date :: Maybe Int,
        -- | Message identifier
        message_id :: Maybe Int,
        -- | Chat identifier
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
  | -- | The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the self-destruct timer @chat_id Chat identifier @message_id Message identifier
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
  | -- | The list of unread reactions added to a message was changed
    UpdateMessageUnreadReactions
      { -- | The new number of messages with unread reactions left in the chat
        unread_reaction_count :: Maybe Int,
        -- | The new list of unread reactions
        unread_reactions :: Maybe [UnreadReaction.UnreadReaction],
        -- | Message identifier
        message_id :: Maybe Int,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | A message with a live location was viewed. When the update is received, the application is supposed to update the live location
    UpdateMessageLiveLocationViewed
      { -- | Identifier of the message with live location
        message_id :: Maybe Int,
        -- | Identifier of the chat with the live location message
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
  | -- | The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
    UpdateChatLastMessage
      { -- | The new chat positions in the chat lists
        positions :: Maybe [ChatPosition.ChatPosition],
        -- | The new last message in the chat; may be null
        last_message :: Maybe Message.Message,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update
    UpdateChatPosition
      { -- | New chat position. If new order is 0, then the chat needs to be removed from the list
        position :: Maybe ChatPosition.ChatPosition,
        -- | Chat identifier
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
  | -- | The chat available reactions were changed @chat_id Chat identifier @available_reactions The new reactions, available in the chat
    UpdateChatAvailableReactions
      { -- |
        available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions,
        -- |
        chat_id :: Maybe Int
      }
  | -- | A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied
    UpdateChatDraftMessage
      { -- | The new chat positions in the chat lists
        positions :: Maybe [ChatPosition.ChatPosition],
        -- | The new draft message; may be null
        draft_message :: Maybe DraftMessage.DraftMessage,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | The message sender that is selected to send messages in a chat has changed @chat_id Chat identifier @message_sender_id New value of message_sender_id; may be null if the user can't change message sender
    UpdateChatMessageSender
      { -- |
        message_sender_id :: Maybe MessageSender.MessageSender,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The message auto-delete or self-destruct timer setting for a chat was changed @chat_id Chat identifier @message_auto_delete_time New value of message_auto_delete_time
    UpdateChatMessageAutoDeleteTime
      { -- |
        message_auto_delete_time :: Maybe Int,
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
      { -- | Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
        reply_markup_message_id :: Maybe Int,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | The chat background was changed @chat_id Chat identifier @background The new chat background; may be null if background was reset to default
    UpdateChatBackground
      { -- |
        background :: Maybe ChatBackground.ChatBackground,
        -- |
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
  | -- | Translation of chat messages was enabled or disabled @chat_id Chat identifier @is_translatable New value of is_translatable
    UpdateChatIsTranslatable
      { -- |
        is_translatable :: Maybe Bool,
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
  | -- | A chat was blocked or unblocked @chat_id Chat identifier @is_blocked New value of is_blocked
    UpdateChatIsBlocked
      { -- |
        is_blocked :: Maybe Bool,
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
  | -- | The list of chat folders or a chat folder has changed @chat_folders The new list of chat folders @main_chat_list_position Position of the main chat list among chat folders, 0-based
    UpdateChatFolders
      { -- |
        main_chat_list_position :: Maybe Int,
        -- |
        chat_folders :: Maybe [ChatFolderInfo.ChatFolderInfo]
      }
  | -- | The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats.
    -- There is no guarantee that it will be sent just after the number of online users has changed
    UpdateChatOnlineMemberCount
      { -- | New number of online members in the chat, or 0 if unknown
        online_member_count :: Maybe Int,
        -- | Identifier of the chat
        chat_id :: Maybe Int
      }
  | -- | Basic information about a topic in a forum chat was changed @chat_id Chat identifier @info New information about the topic
    UpdateForumTopicInfo
      { -- |
        info :: Maybe ForumTopicInfo.ForumTopicInfo,
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
      { -- | Identifiers of removed group notifications, sorted by notification ID
        removed_notification_ids :: Maybe [Int],
        -- | List of added group notifications, sorted by notification ID
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
  | -- | Some messages were deleted
    UpdateDeleteMessages
      { -- | True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
        from_cache :: Maybe Bool,
        -- | True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
        is_permanent :: Maybe Bool,
        -- | Identifiers of the deleted messages
        message_ids :: Maybe [Int],
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | A message sender activity in the chat has changed
    UpdateChatAction
      { -- | The action
        action :: Maybe ChatAction.ChatAction,
        -- | Identifier of a message sender performing the action
        sender_id :: Maybe MessageSender.MessageSender,
        -- | If not 0, a message thread identifier in which the action was performed
        message_thread_id :: Maybe Int,
        -- | Chat identifier
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
  | -- | A file download was changed. This update is sent only after file download list is loaded for the first time
    UpdateFileDownload
      { -- | New number of being downloaded and recently downloaded files found
        counts :: Maybe DownloadedFileCounts.DownloadedFileCounts,
        -- | True, if downloading of the file is paused
        is_paused :: Maybe Bool,
        -- | Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
        complete_date :: Maybe Int,
        -- | File identifier
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
      { -- | New data about a participant
        participant :: Maybe GroupCallParticipant.GroupCallParticipant,
        -- | Identifier of group call
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
  | -- | Number of unread messages in a chat list has changed. This update is sent only if the message database is used
    UpdateUnreadMessageCount
      { -- | Total number of unread messages in unmuted chats
        unread_unmuted_count :: Maybe Int,
        -- | Total number of unread messages
        unread_count :: Maybe Int,
        -- | The chat list with changed number of unread messages
        chat_list :: Maybe ChatList.ChatList
      }
  | -- | Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
    UpdateUnreadChatCount
      { -- | Total number of unmuted chats marked as unread
        marked_as_unread_unmuted_count :: Maybe Int,
        -- | Total number of chats marked as unread
        marked_as_unread_count :: Maybe Int,
        -- | Total number of unread unmuted chats
        unread_unmuted_count :: Maybe Int,
        -- | Total number of unread chats
        unread_count :: Maybe Int,
        -- | Approximate total number of chats in the chat list
        total_count :: Maybe Int,
        -- | The chat list with changed number of unread messages
        chat_list :: Maybe ChatList.ChatList
      }
  | -- | A story was changed @story The new information about the story
    UpdateStory
      { -- |
        story :: Maybe Story.Story
      }
  | -- | A story became inaccessible @story_sender_chat_id Identifier of the chat that posted the story @story_id Story identifier
    UpdateStoryDeleted
      { -- |
        story_id :: Maybe Int,
        -- |
        story_sender_chat_id :: Maybe Int
      }
  | -- | The list of active stories posted by a specific chat has changed
    UpdateChatActiveStories
      { -- | The new list of active stories
        active_stories :: Maybe ChatActiveStories.ChatActiveStories
      }
  | -- | Number of chats in a story list has changed @story_list The story list @chat_count Approximate total number of chats with active stories in the list
    UpdateStoryListChatCount
      { -- |
        chat_count :: Maybe Int,
        -- |
        story_list :: Maybe StoryList.StoryList
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
  | -- | The list of installed sticker sets was updated @sticker_type Type of the affected stickers @sticker_set_ids The new list of installed ordinary sticker sets
    UpdateInstalledStickerSets
      { -- |
        sticker_set_ids :: Maybe [Int],
        -- |
        sticker_type :: Maybe StickerType.StickerType
      }
  | -- | The list of trending sticker sets was updated or some of them were viewed @sticker_type Type of the affected stickers @sticker_sets The prefix of the list of trending sticker sets with the newest trending sticker sets
    UpdateTrendingStickerSets
      { -- |
        sticker_sets :: Maybe TrendingStickerSets.TrendingStickerSets,
        -- |
        sticker_type :: Maybe StickerType.StickerType
      }
  | -- | The list of recently used stickers was updated @is_attached True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated @sticker_ids The new list of file identifiers of recently used stickers
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
        _background :: Maybe Background.Background,
        -- |
        for_dark_theme :: Maybe Bool
      }
  | -- | The list of available chat themes has changed @chat_themes The new list of chat themes
    UpdateChatThemes
      { -- |
        chat_themes :: Maybe [ChatTheme.ChatTheme]
      }
  | -- | Some language pack strings have been updated @localization_target Localization target to which the language pack belongs @language_pack_id Identifier of the updated language pack @strings List of changed language pack strings; empty if all strings have changed
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
  | -- | The list of bots added to attachment menu has changed @bots The new list of bots added to attachment menu. The bots must not be shown on scheduled messages screen
    UpdateAttachmentMenuBots
      { -- |
        bots :: Maybe [AttachmentMenuBot.AttachmentMenuBot]
      }
  | -- | A message was sent by an opened Web App, so the Web App needs to be closed @web_app_launch_id Identifier of Web App launch
    UpdateWebAppMessageSent
      { -- |
        web_app_launch_id :: Maybe Int
      }
  | -- | The list of active emoji reactions has changed @emojis The new list of active emoji reactions
    UpdateActiveEmojiReactions
      { -- |
        emojis :: Maybe [String]
      }
  | -- | The type of default reaction has changed @reaction_type The new type of the default reaction
    UpdateDefaultReactionType
      { -- |
        reaction_type :: Maybe ReactionType.ReactionType
      }
  | -- | The list of supported dice emojis has changed @emojis The new list of supported dice emojis
    UpdateDiceEmojis
      { -- |
        emojis :: Maybe [String]
      }
  | -- | Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
    UpdateAnimatedEmojiMessageClicked
      { -- | The animated sticker to be played
        sticker :: Maybe Sticker.Sticker,
        -- | Message identifier
        message_id :: Maybe Int,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | The parameters of animation search through getOption("animation_search_bot_username") bot has changed @provider Name of the animation search provider @emojis The new list of emojis suggested for searching
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
  | -- | Adding users to a chat has failed because of their privacy settings. An invite link can be shared with the users if appropriate @chat_id Chat identifier @user_ids Identifiers of users, which weren't added because of their privacy settings
    UpdateAddChatMembersPrivacyForbidden
      { -- |
        user_ids :: Maybe [Int],
        -- |
        chat_id :: Maybe Int
      }
  | -- | Autosave settings for some type of chats were updated @scope Type of chats for which autosave settings were updated @settings The new autosave settings; may be null if the settings are reset to default
    UpdateAutosaveSettings
      { -- |
        settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings,
        -- |
        _scope :: Maybe AutosaveSettingsScope.AutosaveSettingsScope
      }
  | -- | A new incoming inline query; for bots only
    UpdateNewInlineQuery
      { -- | Offset of the first entry to return
        offset :: Maybe String,
        -- | Text of the query
        query :: Maybe String,
        -- | The type of the chat from which the query originated; may be null if unknown
        chat_type :: Maybe ChatType.ChatType,
        -- | User location; may be null
        user_location :: Maybe Location.Location,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int,
        -- | Unique query identifier
        _id :: Maybe Int
      }
  | -- | The user has chosen a result of an inline query; for bots only
    UpdateNewChosenInlineResult
      { -- | Identifier of the sent inline message, if known
        inline_message_id :: Maybe String,
        -- | Identifier of the chosen result
        result_id :: Maybe String,
        -- | Text of the query
        query :: Maybe String,
        -- | User location; may be null
        user_location :: Maybe Location.Location,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int
      }
  | -- | A new incoming callback query; for bots only
    UpdateNewCallbackQuery
      { -- | Query payload
        payload :: Maybe CallbackQueryPayload.CallbackQueryPayload,
        -- | Identifier that uniquely corresponds to the chat to which the message was sent
        chat_instance :: Maybe Int,
        -- | Identifier of the message from which the query originated
        message_id :: Maybe Int,
        -- | Identifier of the chat where the query was sent
        chat_id :: Maybe Int,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int,
        -- | Unique query identifier
        _id :: Maybe Int
      }
  | -- | A new incoming callback query from a message sent via a bot; for bots only
    UpdateNewInlineCallbackQuery
      { -- | Query payload
        payload :: Maybe CallbackQueryPayload.CallbackQueryPayload,
        -- | An identifier uniquely corresponding to the chat a message was sent to
        chat_instance :: Maybe Int,
        -- | Identifier of the inline message from which the query originated
        inline_message_id :: Maybe String,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int,
        -- | Unique query identifier
        _id :: Maybe Int
      }
  | -- | A new incoming shipping query; for bots only. Only for invoices with flexible price
    UpdateNewShippingQuery
      { -- | User shipping address
        shipping_address :: Maybe Address.Address,
        -- | Invoice payload
        invoice_payload :: Maybe String,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int,
        -- | Unique query identifier
        _id :: Maybe Int
      }
  | -- | A new incoming pre-checkout query; for bots only. Contains full information about a checkout
    UpdateNewPreCheckoutQuery
      { -- | Information about the order; may be null
        order_info :: Maybe OrderInfo.OrderInfo,
        -- | Identifier of a shipping option chosen by the user; may be empty if not applicable
        shipping_option_id :: Maybe String,
        -- | Invoice payload
        _invoice_payload :: Maybe String,
        -- | Total price for the product, in the smallest units of the currency
        total_amount :: Maybe Int,
        -- | Currency for the product price
        currency :: Maybe String,
        -- | Identifier of the user who sent the query
        sender_user_id :: Maybe Int,
        -- | Unique query identifier
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
        __data :: Maybe String,
        -- |
        _id :: Maybe Int
      }
  | -- | A poll was updated; for bots only @poll New data about the poll
    UpdatePoll
      { -- |
        poll :: Maybe Poll.Poll
      }
  | -- | A user changed the answer to a poll; for bots only
    UpdatePollAnswer
      { -- | 0-based identifiers of answer options, chosen by the user
        option_ids :: Maybe [Int],
        -- | Identifier of the message sender that changed the answer to the poll
        voter_id :: Maybe MessageSender.MessageSender,
        -- | Unique poll identifier
        poll_id :: Maybe Int
      }
  | -- | User rights changed in a chat; for bots only
    UpdateChatMember
      { -- | New chat member
        new_chat_member :: Maybe ChatMember.ChatMember,
        -- | Previous chat member
        old_chat_member :: Maybe ChatMember.ChatMember,
        -- | True, if the user has joined the chat using an invite link for a chat folder
        via_chat_folder_invite_link :: Maybe Bool,
        -- | If user has joined the chat using an invite link, the invite link; may be null
        invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- | Point in time (Unix timestamp) when the user rights was changed
        date :: Maybe Int,
        -- | Identifier of the user, changing the rights
        actor_user_id :: Maybe Int,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  | -- | A user sent a join request to a chat; for bots only
    UpdateNewChatJoinRequest
      { -- | The invite link, which was used to send join request; may be null
        invite_link :: Maybe ChatInviteLink.ChatInviteLink,
        -- | Chat identifier of the private chat with the user
        user_chat_id :: Maybe Int,
        -- | Join request
        request :: Maybe ChatJoinRequest.ChatJoinRequest,
        -- | Chat identifier
        chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show Update where
  show
    UpdateAuthorizationState
      { authorization_state = authorization_state_
      } =
      "UpdateAuthorizationState"
        ++ U.cc
          [ U.p "authorization_state" authorization_state_
          ]
  show
    UpdateNewMessage
      { message = message_
      } =
      "UpdateNewMessage"
        ++ U.cc
          [ U.p "message" message_
          ]
  show
    UpdateMessageSendAcknowledged
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageSendAcknowledged"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageSendSucceeded
      { old_message_id = old_message_id_,
        message = message_
      } =
      "UpdateMessageSendSucceeded"
        ++ U.cc
          [ U.p "old_message_id" old_message_id_,
            U.p "message" message_
          ]
  show
    UpdateMessageSendFailed
      { error_message = error_message_,
        error_code = error_code_,
        old_message_id = old_message_id_,
        message = message_
      } =
      "UpdateMessageSendFailed"
        ++ U.cc
          [ U.p "error_message" error_message_,
            U.p "error_code" error_code_,
            U.p "old_message_id" old_message_id_,
            U.p "message" message_
          ]
  show
    UpdateMessageContent
      { new_content = new_content_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageContent"
        ++ U.cc
          [ U.p "new_content" new_content_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageEdited
      { reply_markup = reply_markup_,
        edit_date = edit_date_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageEdited"
        ++ U.cc
          [ U.p "reply_markup" reply_markup_,
            U.p "edit_date" edit_date_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageIsPinned
      { is_pinned = is_pinned_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageInteractionInfo
      { interaction_info = interaction_info_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageInteractionInfo"
        ++ U.cc
          [ U.p "interaction_info" interaction_info_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageContentOpened
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageContentOpened"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageMentionRead
      { unread_mention_count = unread_mention_count_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageMentionRead"
        ++ U.cc
          [ U.p "unread_mention_count" unread_mention_count_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageUnreadReactions
      { unread_reaction_count = unread_reaction_count_,
        unread_reactions = unread_reactions_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageUnreadReactions"
        ++ U.cc
          [ U.p "unread_reaction_count" unread_reaction_count_,
            U.p "unread_reactions" unread_reactions_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateMessageLiveLocationViewed
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateMessageLiveLocationViewed"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateNewChat
      { chat = chat_
      } =
      "UpdateNewChat"
        ++ U.cc
          [ U.p "chat" chat_
          ]
  show
    UpdateChatTitle
      { title = title_,
        chat_id = chat_id_
      } =
      "UpdateChatTitle"
        ++ U.cc
          [ U.p "title" title_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatPhoto
      { photo = photo_,
        chat_id = chat_id_
      } =
      "UpdateChatPhoto"
        ++ U.cc
          [ U.p "photo" photo_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatPermissions
      { permissions = permissions_,
        chat_id = chat_id_
      } =
      "UpdateChatPermissions"
        ++ U.cc
          [ U.p "permissions" permissions_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatLastMessage
      { positions = positions_,
        last_message = last_message_,
        chat_id = chat_id_
      } =
      "UpdateChatLastMessage"
        ++ U.cc
          [ U.p "positions" positions_,
            U.p "last_message" last_message_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatPosition
      { position = position_,
        chat_id = chat_id_
      } =
      "UpdateChatPosition"
        ++ U.cc
          [ U.p "position" position_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatReadInbox
      { unread_count = unread_count_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        chat_id = chat_id_
      } =
      "UpdateChatReadInbox"
        ++ U.cc
          [ U.p "unread_count" unread_count_,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatReadOutbox
      { last_read_outbox_message_id = last_read_outbox_message_id_,
        chat_id = chat_id_
      } =
      "UpdateChatReadOutbox"
        ++ U.cc
          [ U.p "last_read_outbox_message_id" last_read_outbox_message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatActionBar
      { action_bar = action_bar_,
        chat_id = chat_id_
      } =
      "UpdateChatActionBar"
        ++ U.cc
          [ U.p "action_bar" action_bar_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatAvailableReactions
      { available_reactions = available_reactions_,
        chat_id = chat_id_
      } =
      "UpdateChatAvailableReactions"
        ++ U.cc
          [ U.p "available_reactions" available_reactions_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatDraftMessage
      { positions = positions_,
        draft_message = draft_message_,
        chat_id = chat_id_
      } =
      "UpdateChatDraftMessage"
        ++ U.cc
          [ U.p "positions" positions_,
            U.p "draft_message" draft_message_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatMessageSender
      { message_sender_id = message_sender_id_,
        chat_id = chat_id_
      } =
      "UpdateChatMessageSender"
        ++ U.cc
          [ U.p "message_sender_id" message_sender_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_,
        chat_id = chat_id_
      } =
      "UpdateChatMessageAutoDeleteTime"
        ++ U.cc
          [ U.p "message_auto_delete_time" message_auto_delete_time_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatNotificationSettings
      { notification_settings = notification_settings_,
        chat_id = chat_id_
      } =
      "UpdateChatNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatPendingJoinRequests
      { pending_join_requests = pending_join_requests_,
        chat_id = chat_id_
      } =
      "UpdateChatPendingJoinRequests"
        ++ U.cc
          [ U.p "pending_join_requests" pending_join_requests_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatReplyMarkup
      { reply_markup_message_id = reply_markup_message_id_,
        chat_id = chat_id_
      } =
      "UpdateChatReplyMarkup"
        ++ U.cc
          [ U.p "reply_markup_message_id" reply_markup_message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatBackground
      { background = background_,
        chat_id = chat_id_
      } =
      "UpdateChatBackground"
        ++ U.cc
          [ U.p "background" background_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatTheme
      { theme_name = theme_name_,
        chat_id = chat_id_
      } =
      "UpdateChatTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatUnreadMentionCount
      { unread_mention_count = unread_mention_count_,
        chat_id = chat_id_
      } =
      "UpdateChatUnreadMentionCount"
        ++ U.cc
          [ U.p "unread_mention_count" unread_mention_count_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatUnreadReactionCount
      { unread_reaction_count = unread_reaction_count_,
        chat_id = chat_id_
      } =
      "UpdateChatUnreadReactionCount"
        ++ U.cc
          [ U.p "unread_reaction_count" unread_reaction_count_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatVideoChat
      { video_chat = video_chat_,
        chat_id = chat_id_
      } =
      "UpdateChatVideoChat"
        ++ U.cc
          [ U.p "video_chat" video_chat_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification_,
        chat_id = chat_id_
      } =
      "UpdateChatDefaultDisableNotification"
        ++ U.cc
          [ U.p "default_disable_notification" default_disable_notification_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatHasProtectedContent
      { has_protected_content = has_protected_content_,
        chat_id = chat_id_
      } =
      "UpdateChatHasProtectedContent"
        ++ U.cc
          [ U.p "has_protected_content" has_protected_content_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatIsTranslatable
      { is_translatable = is_translatable_,
        chat_id = chat_id_
      } =
      "UpdateChatIsTranslatable"
        ++ U.cc
          [ U.p "is_translatable" is_translatable_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread_,
        chat_id = chat_id_
      } =
      "UpdateChatIsMarkedAsUnread"
        ++ U.cc
          [ U.p "is_marked_as_unread" is_marked_as_unread_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatIsBlocked
      { is_blocked = is_blocked_,
        chat_id = chat_id_
      } =
      "UpdateChatIsBlocked"
        ++ U.cc
          [ U.p "is_blocked" is_blocked_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatHasScheduledMessages
      { has_scheduled_messages = has_scheduled_messages_,
        chat_id = chat_id_
      } =
      "UpdateChatHasScheduledMessages"
        ++ U.cc
          [ U.p "has_scheduled_messages" has_scheduled_messages_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatFolders
      { main_chat_list_position = main_chat_list_position_,
        chat_folders = chat_folders_
      } =
      "UpdateChatFolders"
        ++ U.cc
          [ U.p "main_chat_list_position" main_chat_list_position_,
            U.p "chat_folders" chat_folders_
          ]
  show
    UpdateChatOnlineMemberCount
      { online_member_count = online_member_count_,
        chat_id = chat_id_
      } =
      "UpdateChatOnlineMemberCount"
        ++ U.cc
          [ U.p "online_member_count" online_member_count_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateForumTopicInfo
      { info = info_,
        chat_id = chat_id_
      } =
      "UpdateForumTopicInfo"
        ++ U.cc
          [ U.p "info" info_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateScopeNotificationSettings
      { _notification_settings = _notification_settings_,
        scope = scope_
      } =
      "UpdateScopeNotificationSettings"
        ++ U.cc
          [ U.p "_notification_settings" _notification_settings_,
            U.p "scope" scope_
          ]
  show
    UpdateNotification
      { notification = notification_,
        notification_group_id = notification_group_id_
      } =
      "UpdateNotification"
        ++ U.cc
          [ U.p "notification" notification_,
            U.p "notification_group_id" notification_group_id_
          ]
  show
    UpdateNotificationGroup
      { removed_notification_ids = removed_notification_ids_,
        added_notifications = added_notifications_,
        total_count = total_count_,
        notification_sound_id = notification_sound_id_,
        notification_settings_chat_id = notification_settings_chat_id_,
        chat_id = chat_id_,
        _type = _type_,
        notification_group_id = notification_group_id_
      } =
      "UpdateNotificationGroup"
        ++ U.cc
          [ U.p "removed_notification_ids" removed_notification_ids_,
            U.p "added_notifications" added_notifications_,
            U.p "total_count" total_count_,
            U.p "notification_sound_id" notification_sound_id_,
            U.p "notification_settings_chat_id" notification_settings_chat_id_,
            U.p "chat_id" chat_id_,
            U.p "_type" _type_,
            U.p "notification_group_id" notification_group_id_
          ]
  show
    UpdateActiveNotifications
      { groups = groups_
      } =
      "UpdateActiveNotifications"
        ++ U.cc
          [ U.p "groups" groups_
          ]
  show
    UpdateHavePendingNotifications
      { have_unreceived_notifications = have_unreceived_notifications_,
        have_delayed_notifications = have_delayed_notifications_
      } =
      "UpdateHavePendingNotifications"
        ++ U.cc
          [ U.p "have_unreceived_notifications" have_unreceived_notifications_,
            U.p "have_delayed_notifications" have_delayed_notifications_
          ]
  show
    UpdateDeleteMessages
      { from_cache = from_cache_,
        is_permanent = is_permanent_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      "UpdateDeleteMessages"
        ++ U.cc
          [ U.p "from_cache" from_cache_,
            U.p "is_permanent" is_permanent_,
            U.p "message_ids" message_ids_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateChatAction
      { action = action_,
        sender_id = sender_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "UpdateChatAction"
        ++ U.cc
          [ U.p "action" action_,
            U.p "sender_id" sender_id_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateUserStatus
      { status = status_,
        user_id = user_id_
      } =
      "UpdateUserStatus"
        ++ U.cc
          [ U.p "status" status_,
            U.p "user_id" user_id_
          ]
  show
    UpdateUser
      { user = user_
      } =
      "UpdateUser"
        ++ U.cc
          [ U.p "user" user_
          ]
  show
    UpdateBasicGroup
      { basic_group = basic_group_
      } =
      "UpdateBasicGroup"
        ++ U.cc
          [ U.p "basic_group" basic_group_
          ]
  show
    UpdateSupergroup
      { supergroup = supergroup_
      } =
      "UpdateSupergroup"
        ++ U.cc
          [ U.p "supergroup" supergroup_
          ]
  show
    UpdateSecretChat
      { secret_chat = secret_chat_
      } =
      "UpdateSecretChat"
        ++ U.cc
          [ U.p "secret_chat" secret_chat_
          ]
  show
    UpdateUserFullInfo
      { user_full_info = user_full_info_,
        user_id = user_id_
      } =
      "UpdateUserFullInfo"
        ++ U.cc
          [ U.p "user_full_info" user_full_info_,
            U.p "user_id" user_id_
          ]
  show
    UpdateBasicGroupFullInfo
      { basic_group_full_info = basic_group_full_info_,
        basic_group_id = basic_group_id_
      } =
      "UpdateBasicGroupFullInfo"
        ++ U.cc
          [ U.p "basic_group_full_info" basic_group_full_info_,
            U.p "basic_group_id" basic_group_id_
          ]
  show
    UpdateSupergroupFullInfo
      { supergroup_full_info = supergroup_full_info_,
        supergroup_id = supergroup_id_
      } =
      "UpdateSupergroupFullInfo"
        ++ U.cc
          [ U.p "supergroup_full_info" supergroup_full_info_,
            U.p "supergroup_id" supergroup_id_
          ]
  show
    UpdateServiceNotification
      { content = content_,
        __type = __type_
      } =
      "UpdateServiceNotification"
        ++ U.cc
          [ U.p "content" content_,
            U.p "__type" __type_
          ]
  show
    UpdateFile
      { file = file_
      } =
      "UpdateFile"
        ++ U.cc
          [ U.p "file" file_
          ]
  show
    UpdateFileGenerationStart
      { conversion = conversion_,
        destination_path = destination_path_,
        original_path = original_path_,
        generation_id = generation_id_
      } =
      "UpdateFileGenerationStart"
        ++ U.cc
          [ U.p "conversion" conversion_,
            U.p "destination_path" destination_path_,
            U.p "original_path" original_path_,
            U.p "generation_id" generation_id_
          ]
  show
    UpdateFileGenerationStop
      { generation_id = generation_id_
      } =
      "UpdateFileGenerationStop"
        ++ U.cc
          [ U.p "generation_id" generation_id_
          ]
  show
    UpdateFileDownloads
      { downloaded_size = downloaded_size_,
        total_count = total_count_,
        total_size = total_size_
      } =
      "UpdateFileDownloads"
        ++ U.cc
          [ U.p "downloaded_size" downloaded_size_,
            U.p "total_count" total_count_,
            U.p "total_size" total_size_
          ]
  show
    UpdateFileAddedToDownloads
      { counts = counts_,
        file_download = file_download_
      } =
      "UpdateFileAddedToDownloads"
        ++ U.cc
          [ U.p "counts" counts_,
            U.p "file_download" file_download_
          ]
  show
    UpdateFileDownload
      { counts = counts_,
        is_paused = is_paused_,
        complete_date = complete_date_,
        file_id = file_id_
      } =
      "UpdateFileDownload"
        ++ U.cc
          [ U.p "counts" counts_,
            U.p "is_paused" is_paused_,
            U.p "complete_date" complete_date_,
            U.p "file_id" file_id_
          ]
  show
    UpdateFileRemovedFromDownloads
      { counts = counts_,
        file_id = file_id_
      } =
      "UpdateFileRemovedFromDownloads"
        ++ U.cc
          [ U.p "counts" counts_,
            U.p "file_id" file_id_
          ]
  show
    UpdateCall
      { call = call_
      } =
      "UpdateCall"
        ++ U.cc
          [ U.p "call" call_
          ]
  show
    UpdateGroupCall
      { group_call = group_call_
      } =
      "UpdateGroupCall"
        ++ U.cc
          [ U.p "group_call" group_call_
          ]
  show
    UpdateGroupCallParticipant
      { participant = participant_,
        group_call_id = group_call_id_
      } =
      "UpdateGroupCallParticipant"
        ++ U.cc
          [ U.p "participant" participant_,
            U.p "group_call_id" group_call_id_
          ]
  show
    UpdateNewCallSignalingData
      { _data = _data_,
        call_id = call_id_
      } =
      "UpdateNewCallSignalingData"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "call_id" call_id_
          ]
  show
    UpdateUserPrivacySettingRules
      { rules = rules_,
        setting = setting_
      } =
      "UpdateUserPrivacySettingRules"
        ++ U.cc
          [ U.p "rules" rules_,
            U.p "setting" setting_
          ]
  show
    UpdateUnreadMessageCount
      { unread_unmuted_count = unread_unmuted_count_,
        unread_count = unread_count_,
        chat_list = chat_list_
      } =
      "UpdateUnreadMessageCount"
        ++ U.cc
          [ U.p "unread_unmuted_count" unread_unmuted_count_,
            U.p "unread_count" unread_count_,
            U.p "chat_list" chat_list_
          ]
  show
    UpdateUnreadChatCount
      { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_,
        marked_as_unread_count = marked_as_unread_count_,
        unread_unmuted_count = unread_unmuted_count_,
        unread_count = unread_count_,
        total_count = total_count_,
        chat_list = chat_list_
      } =
      "UpdateUnreadChatCount"
        ++ U.cc
          [ U.p "marked_as_unread_unmuted_count" marked_as_unread_unmuted_count_,
            U.p "marked_as_unread_count" marked_as_unread_count_,
            U.p "unread_unmuted_count" unread_unmuted_count_,
            U.p "unread_count" unread_count_,
            U.p "total_count" total_count_,
            U.p "chat_list" chat_list_
          ]
  show
    UpdateStory
      { story = story_
      } =
      "UpdateStory"
        ++ U.cc
          [ U.p "story" story_
          ]
  show
    UpdateStoryDeleted
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "UpdateStoryDeleted"
        ++ U.cc
          [ U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]
  show
    UpdateChatActiveStories
      { active_stories = active_stories_
      } =
      "UpdateChatActiveStories"
        ++ U.cc
          [ U.p "active_stories" active_stories_
          ]
  show
    UpdateStoryListChatCount
      { chat_count = chat_count_,
        story_list = story_list_
      } =
      "UpdateStoryListChatCount"
        ++ U.cc
          [ U.p "chat_count" chat_count_,
            U.p "story_list" story_list_
          ]
  show
    UpdateOption
      { value = value_,
        name = name_
      } =
      "UpdateOption"
        ++ U.cc
          [ U.p "value" value_,
            U.p "name" name_
          ]
  show
    UpdateStickerSet
      { sticker_set = sticker_set_
      } =
      "UpdateStickerSet"
        ++ U.cc
          [ U.p "sticker_set" sticker_set_
          ]
  show
    UpdateInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        sticker_type = sticker_type_
      } =
      "UpdateInstalledStickerSets"
        ++ U.cc
          [ U.p "sticker_set_ids" sticker_set_ids_,
            U.p "sticker_type" sticker_type_
          ]
  show
    UpdateTrendingStickerSets
      { sticker_sets = sticker_sets_,
        sticker_type = sticker_type_
      } =
      "UpdateTrendingStickerSets"
        ++ U.cc
          [ U.p "sticker_sets" sticker_sets_,
            U.p "sticker_type" sticker_type_
          ]
  show
    UpdateRecentStickers
      { sticker_ids = sticker_ids_,
        is_attached = is_attached_
      } =
      "UpdateRecentStickers"
        ++ U.cc
          [ U.p "sticker_ids" sticker_ids_,
            U.p "is_attached" is_attached_
          ]
  show
    UpdateFavoriteStickers
      { sticker_ids = sticker_ids_
      } =
      "UpdateFavoriteStickers"
        ++ U.cc
          [ U.p "sticker_ids" sticker_ids_
          ]
  show
    UpdateSavedAnimations
      { animation_ids = animation_ids_
      } =
      "UpdateSavedAnimations"
        ++ U.cc
          [ U.p "animation_ids" animation_ids_
          ]
  show
    UpdateSavedNotificationSounds
      { notification_sound_ids = notification_sound_ids_
      } =
      "UpdateSavedNotificationSounds"
        ++ U.cc
          [ U.p "notification_sound_ids" notification_sound_ids_
          ]
  show
    UpdateSelectedBackground
      { _background = _background_,
        for_dark_theme = for_dark_theme_
      } =
      "UpdateSelectedBackground"
        ++ U.cc
          [ U.p "_background" _background_,
            U.p "for_dark_theme" for_dark_theme_
          ]
  show
    UpdateChatThemes
      { chat_themes = chat_themes_
      } =
      "UpdateChatThemes"
        ++ U.cc
          [ U.p "chat_themes" chat_themes_
          ]
  show
    UpdateLanguagePackStrings
      { strings = strings_,
        language_pack_id = language_pack_id_,
        localization_target = localization_target_
      } =
      "UpdateLanguagePackStrings"
        ++ U.cc
          [ U.p "strings" strings_,
            U.p "language_pack_id" language_pack_id_,
            U.p "localization_target" localization_target_
          ]
  show
    UpdateConnectionState
      { state = state_
      } =
      "UpdateConnectionState"
        ++ U.cc
          [ U.p "state" state_
          ]
  show
    UpdateTermsOfService
      { terms_of_service = terms_of_service_,
        terms_of_service_id = terms_of_service_id_
      } =
      "UpdateTermsOfService"
        ++ U.cc
          [ U.p "terms_of_service" terms_of_service_,
            U.p "terms_of_service_id" terms_of_service_id_
          ]
  show
    UpdateUsersNearby
      { users_nearby = users_nearby_
      } =
      "UpdateUsersNearby"
        ++ U.cc
          [ U.p "users_nearby" users_nearby_
          ]
  show
    UpdateAttachmentMenuBots
      { bots = bots_
      } =
      "UpdateAttachmentMenuBots"
        ++ U.cc
          [ U.p "bots" bots_
          ]
  show
    UpdateWebAppMessageSent
      { web_app_launch_id = web_app_launch_id_
      } =
      "UpdateWebAppMessageSent"
        ++ U.cc
          [ U.p "web_app_launch_id" web_app_launch_id_
          ]
  show
    UpdateActiveEmojiReactions
      { emojis = emojis_
      } =
      "UpdateActiveEmojiReactions"
        ++ U.cc
          [ U.p "emojis" emojis_
          ]
  show
    UpdateDefaultReactionType
      { reaction_type = reaction_type_
      } =
      "UpdateDefaultReactionType"
        ++ U.cc
          [ U.p "reaction_type" reaction_type_
          ]
  show
    UpdateDiceEmojis
      { emojis = emojis_
      } =
      "UpdateDiceEmojis"
        ++ U.cc
          [ U.p "emojis" emojis_
          ]
  show
    UpdateAnimatedEmojiMessageClicked
      { sticker = sticker_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "UpdateAnimatedEmojiMessageClicked"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateAnimationSearchParameters
      { emojis = emojis_,
        provider = provider_
      } =
      "UpdateAnimationSearchParameters"
        ++ U.cc
          [ U.p "emojis" emojis_,
            U.p "provider" provider_
          ]
  show
    UpdateSuggestedActions
      { removed_actions = removed_actions_,
        added_actions = added_actions_
      } =
      "UpdateSuggestedActions"
        ++ U.cc
          [ U.p "removed_actions" removed_actions_,
            U.p "added_actions" added_actions_
          ]
  show
    UpdateAddChatMembersPrivacyForbidden
      { user_ids = user_ids_,
        chat_id = chat_id_
      } =
      "UpdateAddChatMembersPrivacyForbidden"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateAutosaveSettings
      { settings = settings_,
        _scope = _scope_
      } =
      "UpdateAutosaveSettings"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "_scope" _scope_
          ]
  show
    UpdateNewInlineQuery
      { offset = offset_,
        query = query_,
        chat_type = chat_type_,
        user_location = user_location_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      "UpdateNewInlineQuery"
        ++ U.cc
          [ U.p "offset" offset_,
            U.p "query" query_,
            U.p "chat_type" chat_type_,
            U.p "user_location" user_location_,
            U.p "sender_user_id" sender_user_id_,
            U.p "_id" _id_
          ]
  show
    UpdateNewChosenInlineResult
      { inline_message_id = inline_message_id_,
        result_id = result_id_,
        query = query_,
        user_location = user_location_,
        sender_user_id = sender_user_id_
      } =
      "UpdateNewChosenInlineResult"
        ++ U.cc
          [ U.p "inline_message_id" inline_message_id_,
            U.p "result_id" result_id_,
            U.p "query" query_,
            U.p "user_location" user_location_,
            U.p "sender_user_id" sender_user_id_
          ]
  show
    UpdateNewCallbackQuery
      { payload = payload_,
        chat_instance = chat_instance_,
        message_id = message_id_,
        chat_id = chat_id_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      "UpdateNewCallbackQuery"
        ++ U.cc
          [ U.p "payload" payload_,
            U.p "chat_instance" chat_instance_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_,
            U.p "sender_user_id" sender_user_id_,
            U.p "_id" _id_
          ]
  show
    UpdateNewInlineCallbackQuery
      { payload = payload_,
        chat_instance = chat_instance_,
        inline_message_id = inline_message_id_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      "UpdateNewInlineCallbackQuery"
        ++ U.cc
          [ U.p "payload" payload_,
            U.p "chat_instance" chat_instance_,
            U.p "inline_message_id" inline_message_id_,
            U.p "sender_user_id" sender_user_id_,
            U.p "_id" _id_
          ]
  show
    UpdateNewShippingQuery
      { shipping_address = shipping_address_,
        invoice_payload = invoice_payload_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      "UpdateNewShippingQuery"
        ++ U.cc
          [ U.p "shipping_address" shipping_address_,
            U.p "invoice_payload" invoice_payload_,
            U.p "sender_user_id" sender_user_id_,
            U.p "_id" _id_
          ]
  show
    UpdateNewPreCheckoutQuery
      { order_info = order_info_,
        shipping_option_id = shipping_option_id_,
        _invoice_payload = _invoice_payload_,
        total_amount = total_amount_,
        currency = currency_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      "UpdateNewPreCheckoutQuery"
        ++ U.cc
          [ U.p "order_info" order_info_,
            U.p "shipping_option_id" shipping_option_id_,
            U.p "_invoice_payload" _invoice_payload_,
            U.p "total_amount" total_amount_,
            U.p "currency" currency_,
            U.p "sender_user_id" sender_user_id_,
            U.p "_id" _id_
          ]
  show
    UpdateNewCustomEvent
      { event = event_
      } =
      "UpdateNewCustomEvent"
        ++ U.cc
          [ U.p "event" event_
          ]
  show
    UpdateNewCustomQuery
      { timeout = timeout_,
        __data = __data_,
        _id = _id_
      } =
      "UpdateNewCustomQuery"
        ++ U.cc
          [ U.p "timeout" timeout_,
            U.p "__data" __data_,
            U.p "_id" _id_
          ]
  show
    UpdatePoll
      { poll = poll_
      } =
      "UpdatePoll"
        ++ U.cc
          [ U.p "poll" poll_
          ]
  show
    UpdatePollAnswer
      { option_ids = option_ids_,
        voter_id = voter_id_,
        poll_id = poll_id_
      } =
      "UpdatePollAnswer"
        ++ U.cc
          [ U.p "option_ids" option_ids_,
            U.p "voter_id" voter_id_,
            U.p "poll_id" poll_id_
          ]
  show
    UpdateChatMember
      { new_chat_member = new_chat_member_,
        old_chat_member = old_chat_member_,
        via_chat_folder_invite_link = via_chat_folder_invite_link_,
        invite_link = invite_link_,
        date = date_,
        actor_user_id = actor_user_id_,
        chat_id = chat_id_
      } =
      "UpdateChatMember"
        ++ U.cc
          [ U.p "new_chat_member" new_chat_member_,
            U.p "old_chat_member" old_chat_member_,
            U.p "via_chat_folder_invite_link" via_chat_folder_invite_link_,
            U.p "invite_link" invite_link_,
            U.p "date" date_,
            U.p "actor_user_id" actor_user_id_,
            U.p "chat_id" chat_id_
          ]
  show
    UpdateNewChatJoinRequest
      { invite_link = invite_link_,
        user_chat_id = user_chat_id_,
        request = request_,
        chat_id = chat_id_
      } =
      "UpdateNewChatJoinRequest"
        ++ U.cc
          [ U.p "invite_link" invite_link_,
            U.p "user_chat_id" user_chat_id_,
            U.p "request" request_,
            U.p "chat_id" chat_id_
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
      "updateChatMessageAutoDeleteTime" -> parseUpdateChatMessageAutoDeleteTime v
      "updateChatNotificationSettings" -> parseUpdateChatNotificationSettings v
      "updateChatPendingJoinRequests" -> parseUpdateChatPendingJoinRequests v
      "updateChatReplyMarkup" -> parseUpdateChatReplyMarkup v
      "updateChatBackground" -> parseUpdateChatBackground v
      "updateChatTheme" -> parseUpdateChatTheme v
      "updateChatUnreadMentionCount" -> parseUpdateChatUnreadMentionCount v
      "updateChatUnreadReactionCount" -> parseUpdateChatUnreadReactionCount v
      "updateChatVideoChat" -> parseUpdateChatVideoChat v
      "updateChatDefaultDisableNotification" -> parseUpdateChatDefaultDisableNotification v
      "updateChatHasProtectedContent" -> parseUpdateChatHasProtectedContent v
      "updateChatIsTranslatable" -> parseUpdateChatIsTranslatable v
      "updateChatIsMarkedAsUnread" -> parseUpdateChatIsMarkedAsUnread v
      "updateChatIsBlocked" -> parseUpdateChatIsBlocked v
      "updateChatHasScheduledMessages" -> parseUpdateChatHasScheduledMessages v
      "updateChatFolders" -> parseUpdateChatFolders v
      "updateChatOnlineMemberCount" -> parseUpdateChatOnlineMemberCount v
      "updateForumTopicInfo" -> parseUpdateForumTopicInfo v
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
      "updateStory" -> parseUpdateStory v
      "updateStoryDeleted" -> parseUpdateStoryDeleted v
      "updateChatActiveStories" -> parseUpdateChatActiveStories v
      "updateStoryListChatCount" -> parseUpdateStoryListChatCount v
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
      "updateActiveEmojiReactions" -> parseUpdateActiveEmojiReactions v
      "updateDefaultReactionType" -> parseUpdateDefaultReactionType v
      "updateDiceEmojis" -> parseUpdateDiceEmojis v
      "updateAnimatedEmojiMessageClicked" -> parseUpdateAnimatedEmojiMessageClicked v
      "updateAnimationSearchParameters" -> parseUpdateAnimationSearchParameters v
      "updateSuggestedActions" -> parseUpdateSuggestedActions v
      "updateAddChatMembersPrivacyForbidden" -> parseUpdateAddChatMembersPrivacyForbidden v
      "updateAutosaveSettings" -> parseUpdateAutosaveSettings v
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
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageSendAcknowledged {message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageSendSucceeded :: A.Value -> T.Parser Update
      parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
        old_message_id_ <- o A..:? "old_message_id"
        message_ <- o A..:? "message"
        return $ UpdateMessageSendSucceeded {old_message_id = old_message_id_, message = message_}

      parseUpdateMessageSendFailed :: A.Value -> T.Parser Update
      parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
        error_message_ <- o A..:? "error_message"
        error_code_ <- o A..:? "error_code"
        old_message_id_ <- o A..:? "old_message_id"
        message_ <- o A..:? "message"
        return $ UpdateMessageSendFailed {error_message = error_message_, error_code = error_code_, old_message_id = old_message_id_, message = message_}

      parseUpdateMessageContent :: A.Value -> T.Parser Update
      parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
        new_content_ <- o A..:? "new_content"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageContent {new_content = new_content_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageEdited :: A.Value -> T.Parser Update
      parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
        reply_markup_ <- o A..:? "reply_markup"
        edit_date_ <- o A..:? "edit_date"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageEdited {reply_markup = reply_markup_, edit_date = edit_date_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageIsPinned :: A.Value -> T.Parser Update
      parseUpdateMessageIsPinned = A.withObject "UpdateMessageIsPinned" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageIsPinned {is_pinned = is_pinned_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageInteractionInfo :: A.Value -> T.Parser Update
      parseUpdateMessageInteractionInfo = A.withObject "UpdateMessageInteractionInfo" $ \o -> do
        interaction_info_ <- o A..:? "interaction_info"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageInteractionInfo {interaction_info = interaction_info_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageContentOpened :: A.Value -> T.Parser Update
      parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageContentOpened {message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageMentionRead :: A.Value -> T.Parser Update
      parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
        unread_mention_count_ <- o A..:? "unread_mention_count"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageMentionRead {unread_mention_count = unread_mention_count_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageUnreadReactions :: A.Value -> T.Parser Update
      parseUpdateMessageUnreadReactions = A.withObject "UpdateMessageUnreadReactions" $ \o -> do
        unread_reaction_count_ <- o A..:? "unread_reaction_count"
        unread_reactions_ <- o A..:? "unread_reactions"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageUnreadReactions {unread_reaction_count = unread_reaction_count_, unread_reactions = unread_reactions_, message_id = message_id_, chat_id = chat_id_}

      parseUpdateMessageLiveLocationViewed :: A.Value -> T.Parser Update
      parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateMessageLiveLocationViewed {message_id = message_id_, chat_id = chat_id_}

      parseUpdateNewChat :: A.Value -> T.Parser Update
      parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
        chat_ <- o A..:? "chat"
        return $ UpdateNewChat {chat = chat_}

      parseUpdateChatTitle :: A.Value -> T.Parser Update
      parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
        title_ <- o A..:? "title"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatTitle {title = title_, chat_id = chat_id_}

      parseUpdateChatPhoto :: A.Value -> T.Parser Update
      parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
        photo_ <- o A..:? "photo"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatPhoto {photo = photo_, chat_id = chat_id_}

      parseUpdateChatPermissions :: A.Value -> T.Parser Update
      parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
        permissions_ <- o A..:? "permissions"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatPermissions {permissions = permissions_, chat_id = chat_id_}

      parseUpdateChatLastMessage :: A.Value -> T.Parser Update
      parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
        positions_ <- o A..:? "positions"
        last_message_ <- o A..:? "last_message"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatLastMessage {positions = positions_, last_message = last_message_, chat_id = chat_id_}

      parseUpdateChatPosition :: A.Value -> T.Parser Update
      parseUpdateChatPosition = A.withObject "UpdateChatPosition" $ \o -> do
        position_ <- o A..:? "position"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatPosition {position = position_, chat_id = chat_id_}

      parseUpdateChatReadInbox :: A.Value -> T.Parser Update
      parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
        unread_count_ <- o A..:? "unread_count"
        last_read_inbox_message_id_ <- o A..:? "last_read_inbox_message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatReadInbox {unread_count = unread_count_, last_read_inbox_message_id = last_read_inbox_message_id_, chat_id = chat_id_}

      parseUpdateChatReadOutbox :: A.Value -> T.Parser Update
      parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
        last_read_outbox_message_id_ <- o A..:? "last_read_outbox_message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatReadOutbox {last_read_outbox_message_id = last_read_outbox_message_id_, chat_id = chat_id_}

      parseUpdateChatActionBar :: A.Value -> T.Parser Update
      parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
        action_bar_ <- o A..:? "action_bar"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatActionBar {action_bar = action_bar_, chat_id = chat_id_}

      parseUpdateChatAvailableReactions :: A.Value -> T.Parser Update
      parseUpdateChatAvailableReactions = A.withObject "UpdateChatAvailableReactions" $ \o -> do
        available_reactions_ <- o A..:? "available_reactions"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatAvailableReactions {available_reactions = available_reactions_, chat_id = chat_id_}

      parseUpdateChatDraftMessage :: A.Value -> T.Parser Update
      parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
        positions_ <- o A..:? "positions"
        draft_message_ <- o A..:? "draft_message"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatDraftMessage {positions = positions_, draft_message = draft_message_, chat_id = chat_id_}

      parseUpdateChatMessageSender :: A.Value -> T.Parser Update
      parseUpdateChatMessageSender = A.withObject "UpdateChatMessageSender" $ \o -> do
        message_sender_id_ <- o A..:? "message_sender_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatMessageSender {message_sender_id = message_sender_id_, chat_id = chat_id_}

      parseUpdateChatMessageAutoDeleteTime :: A.Value -> T.Parser Update
      parseUpdateChatMessageAutoDeleteTime = A.withObject "UpdateChatMessageAutoDeleteTime" $ \o -> do
        message_auto_delete_time_ <- o A..:? "message_auto_delete_time"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatMessageAutoDeleteTime {message_auto_delete_time = message_auto_delete_time_, chat_id = chat_id_}

      parseUpdateChatNotificationSettings :: A.Value -> T.Parser Update
      parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
        notification_settings_ <- o A..:? "notification_settings"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatNotificationSettings {notification_settings = notification_settings_, chat_id = chat_id_}

      parseUpdateChatPendingJoinRequests :: A.Value -> T.Parser Update
      parseUpdateChatPendingJoinRequests = A.withObject "UpdateChatPendingJoinRequests" $ \o -> do
        pending_join_requests_ <- o A..:? "pending_join_requests"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatPendingJoinRequests {pending_join_requests = pending_join_requests_, chat_id = chat_id_}

      parseUpdateChatReplyMarkup :: A.Value -> T.Parser Update
      parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
        reply_markup_message_id_ <- o A..:? "reply_markup_message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatReplyMarkup {reply_markup_message_id = reply_markup_message_id_, chat_id = chat_id_}

      parseUpdateChatBackground :: A.Value -> T.Parser Update
      parseUpdateChatBackground = A.withObject "UpdateChatBackground" $ \o -> do
        background_ <- o A..:? "background"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatBackground {background = background_, chat_id = chat_id_}

      parseUpdateChatTheme :: A.Value -> T.Parser Update
      parseUpdateChatTheme = A.withObject "UpdateChatTheme" $ \o -> do
        theme_name_ <- o A..:? "theme_name"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatTheme {theme_name = theme_name_, chat_id = chat_id_}

      parseUpdateChatUnreadMentionCount :: A.Value -> T.Parser Update
      parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
        unread_mention_count_ <- o A..:? "unread_mention_count"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatUnreadMentionCount {unread_mention_count = unread_mention_count_, chat_id = chat_id_}

      parseUpdateChatUnreadReactionCount :: A.Value -> T.Parser Update
      parseUpdateChatUnreadReactionCount = A.withObject "UpdateChatUnreadReactionCount" $ \o -> do
        unread_reaction_count_ <- o A..:? "unread_reaction_count"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatUnreadReactionCount {unread_reaction_count = unread_reaction_count_, chat_id = chat_id_}

      parseUpdateChatVideoChat :: A.Value -> T.Parser Update
      parseUpdateChatVideoChat = A.withObject "UpdateChatVideoChat" $ \o -> do
        video_chat_ <- o A..:? "video_chat"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatVideoChat {video_chat = video_chat_, chat_id = chat_id_}

      parseUpdateChatDefaultDisableNotification :: A.Value -> T.Parser Update
      parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
        default_disable_notification_ <- o A..:? "default_disable_notification"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatDefaultDisableNotification {default_disable_notification = default_disable_notification_, chat_id = chat_id_}

      parseUpdateChatHasProtectedContent :: A.Value -> T.Parser Update
      parseUpdateChatHasProtectedContent = A.withObject "UpdateChatHasProtectedContent" $ \o -> do
        has_protected_content_ <- o A..:? "has_protected_content"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatHasProtectedContent {has_protected_content = has_protected_content_, chat_id = chat_id_}

      parseUpdateChatIsTranslatable :: A.Value -> T.Parser Update
      parseUpdateChatIsTranslatable = A.withObject "UpdateChatIsTranslatable" $ \o -> do
        is_translatable_ <- o A..:? "is_translatable"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatIsTranslatable {is_translatable = is_translatable_, chat_id = chat_id_}

      parseUpdateChatIsMarkedAsUnread :: A.Value -> T.Parser Update
      parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
        is_marked_as_unread_ <- o A..:? "is_marked_as_unread"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatIsMarkedAsUnread {is_marked_as_unread = is_marked_as_unread_, chat_id = chat_id_}

      parseUpdateChatIsBlocked :: A.Value -> T.Parser Update
      parseUpdateChatIsBlocked = A.withObject "UpdateChatIsBlocked" $ \o -> do
        is_blocked_ <- o A..:? "is_blocked"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatIsBlocked {is_blocked = is_blocked_, chat_id = chat_id_}

      parseUpdateChatHasScheduledMessages :: A.Value -> T.Parser Update
      parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
        has_scheduled_messages_ <- o A..:? "has_scheduled_messages"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatHasScheduledMessages {has_scheduled_messages = has_scheduled_messages_, chat_id = chat_id_}

      parseUpdateChatFolders :: A.Value -> T.Parser Update
      parseUpdateChatFolders = A.withObject "UpdateChatFolders" $ \o -> do
        main_chat_list_position_ <- o A..:? "main_chat_list_position"
        chat_folders_ <- o A..:? "chat_folders"
        return $ UpdateChatFolders {main_chat_list_position = main_chat_list_position_, chat_folders = chat_folders_}

      parseUpdateChatOnlineMemberCount :: A.Value -> T.Parser Update
      parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
        online_member_count_ <- o A..:? "online_member_count"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatOnlineMemberCount {online_member_count = online_member_count_, chat_id = chat_id_}

      parseUpdateForumTopicInfo :: A.Value -> T.Parser Update
      parseUpdateForumTopicInfo = A.withObject "UpdateForumTopicInfo" $ \o -> do
        info_ <- o A..:? "info"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateForumTopicInfo {info = info_, chat_id = chat_id_}

      parseUpdateScopeNotificationSettings :: A.Value -> T.Parser Update
      parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
        _notification_settings_ <- o A..:? "notification_settings"
        scope_ <- o A..:? "scope"
        return $ UpdateScopeNotificationSettings {_notification_settings = _notification_settings_, scope = scope_}

      parseUpdateNotification :: A.Value -> T.Parser Update
      parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
        notification_ <- o A..:? "notification"
        notification_group_id_ <- o A..:? "notification_group_id"
        return $ UpdateNotification {notification = notification_, notification_group_id = notification_group_id_}

      parseUpdateNotificationGroup :: A.Value -> T.Parser Update
      parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
        removed_notification_ids_ <- o A..:? "removed_notification_ids"
        added_notifications_ <- o A..:? "added_notifications"
        total_count_ <- o A..:? "total_count"
        notification_sound_id_ <- U.rm <$> (o A..:? "notification_sound_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        notification_settings_chat_id_ <- o A..:? "notification_settings_chat_id"
        chat_id_ <- o A..:? "chat_id"
        _type_ <- o A..:? "type"
        notification_group_id_ <- o A..:? "notification_group_id"
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
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateDeleteMessages {from_cache = from_cache_, is_permanent = is_permanent_, message_ids = message_ids_, chat_id = chat_id_}

      parseUpdateChatAction :: A.Value -> T.Parser Update
      parseUpdateChatAction = A.withObject "UpdateChatAction" $ \o -> do
        action_ <- o A..:? "action"
        sender_id_ <- o A..:? "sender_id"
        message_thread_id_ <- o A..:? "message_thread_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatAction {action = action_, sender_id = sender_id_, message_thread_id = message_thread_id_, chat_id = chat_id_}

      parseUpdateUserStatus :: A.Value -> T.Parser Update
      parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
        status_ <- o A..:? "status"
        user_id_ <- o A..:? "user_id"
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
        user_id_ <- o A..:? "user_id"
        return $ UpdateUserFullInfo {user_full_info = user_full_info_, user_id = user_id_}

      parseUpdateBasicGroupFullInfo :: A.Value -> T.Parser Update
      parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
        basic_group_full_info_ <- o A..:? "basic_group_full_info"
        basic_group_id_ <- o A..:? "basic_group_id"
        return $ UpdateBasicGroupFullInfo {basic_group_full_info = basic_group_full_info_, basic_group_id = basic_group_id_}

      parseUpdateSupergroupFullInfo :: A.Value -> T.Parser Update
      parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
        supergroup_full_info_ <- o A..:? "supergroup_full_info"
        supergroup_id_ <- o A..:? "supergroup_id"
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
        generation_id_ <- U.rm <$> (o A..:? "generation_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateFileGenerationStart {conversion = conversion_, destination_path = destination_path_, original_path = original_path_, generation_id = generation_id_}

      parseUpdateFileGenerationStop :: A.Value -> T.Parser Update
      parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
        generation_id_ <- U.rm <$> (o A..:? "generation_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateFileGenerationStop {generation_id = generation_id_}

      parseUpdateFileDownloads :: A.Value -> T.Parser Update
      parseUpdateFileDownloads = A.withObject "UpdateFileDownloads" $ \o -> do
        downloaded_size_ <- o A..:? "downloaded_size"
        total_count_ <- o A..:? "total_count"
        total_size_ <- o A..:? "total_size"
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
        complete_date_ <- o A..:? "complete_date"
        file_id_ <- o A..:? "file_id"
        return $ UpdateFileDownload {counts = counts_, is_paused = is_paused_, complete_date = complete_date_, file_id = file_id_}

      parseUpdateFileRemovedFromDownloads :: A.Value -> T.Parser Update
      parseUpdateFileRemovedFromDownloads = A.withObject "UpdateFileRemovedFromDownloads" $ \o -> do
        counts_ <- o A..:? "counts"
        file_id_ <- o A..:? "file_id"
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
        group_call_id_ <- o A..:? "group_call_id"
        return $ UpdateGroupCallParticipant {participant = participant_, group_call_id = group_call_id_}

      parseUpdateNewCallSignalingData :: A.Value -> T.Parser Update
      parseUpdateNewCallSignalingData = A.withObject "UpdateNewCallSignalingData" $ \o -> do
        _data_ <- o A..:? "data"
        call_id_ <- o A..:? "call_id"
        return $ UpdateNewCallSignalingData {_data = _data_, call_id = call_id_}

      parseUpdateUserPrivacySettingRules :: A.Value -> T.Parser Update
      parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
        rules_ <- o A..:? "rules"
        setting_ <- o A..:? "setting"
        return $ UpdateUserPrivacySettingRules {rules = rules_, setting = setting_}

      parseUpdateUnreadMessageCount :: A.Value -> T.Parser Update
      parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
        unread_unmuted_count_ <- o A..:? "unread_unmuted_count"
        unread_count_ <- o A..:? "unread_count"
        chat_list_ <- o A..:? "chat_list"
        return $ UpdateUnreadMessageCount {unread_unmuted_count = unread_unmuted_count_, unread_count = unread_count_, chat_list = chat_list_}

      parseUpdateUnreadChatCount :: A.Value -> T.Parser Update
      parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
        marked_as_unread_unmuted_count_ <- o A..:? "marked_as_unread_unmuted_count"
        marked_as_unread_count_ <- o A..:? "marked_as_unread_count"
        unread_unmuted_count_ <- o A..:? "unread_unmuted_count"
        unread_count_ <- o A..:? "unread_count"
        total_count_ <- o A..:? "total_count"
        chat_list_ <- o A..:? "chat_list"
        return $ UpdateUnreadChatCount {marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_, marked_as_unread_count = marked_as_unread_count_, unread_unmuted_count = unread_unmuted_count_, unread_count = unread_count_, total_count = total_count_, chat_list = chat_list_}

      parseUpdateStory :: A.Value -> T.Parser Update
      parseUpdateStory = A.withObject "UpdateStory" $ \o -> do
        story_ <- o A..:? "story"
        return $ UpdateStory {story = story_}

      parseUpdateStoryDeleted :: A.Value -> T.Parser Update
      parseUpdateStoryDeleted = A.withObject "UpdateStoryDeleted" $ \o -> do
        story_id_ <- o A..:? "story_id"
        story_sender_chat_id_ <- o A..:? "story_sender_chat_id"
        return $ UpdateStoryDeleted {story_id = story_id_, story_sender_chat_id = story_sender_chat_id_}

      parseUpdateChatActiveStories :: A.Value -> T.Parser Update
      parseUpdateChatActiveStories = A.withObject "UpdateChatActiveStories" $ \o -> do
        active_stories_ <- o A..:? "active_stories"
        return $ UpdateChatActiveStories {active_stories = active_stories_}

      parseUpdateStoryListChatCount :: A.Value -> T.Parser Update
      parseUpdateStoryListChatCount = A.withObject "UpdateStoryListChatCount" $ \o -> do
        chat_count_ <- o A..:? "chat_count"
        story_list_ <- o A..:? "story_list"
        return $ UpdateStoryListChatCount {chat_count = chat_count_, story_list = story_list_}

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
        sticker_set_ids_ <- U.rl <$> (o A..:? "sticker_set_ids" :: T.Parser (Maybe [String])) :: T.Parser (Maybe [Int])
        sticker_type_ <- o A..:? "sticker_type"
        return $ UpdateInstalledStickerSets {sticker_set_ids = sticker_set_ids_, sticker_type = sticker_type_}

      parseUpdateTrendingStickerSets :: A.Value -> T.Parser Update
      parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
        sticker_sets_ <- o A..:? "sticker_sets"
        sticker_type_ <- o A..:? "sticker_type"
        return $ UpdateTrendingStickerSets {sticker_sets = sticker_sets_, sticker_type = sticker_type_}

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
        notification_sound_ids_ <- U.rl <$> (o A..:? "notification_sound_ids" :: T.Parser (Maybe [String])) :: T.Parser (Maybe [Int])
        return $ UpdateSavedNotificationSounds {notification_sound_ids = notification_sound_ids_}

      parseUpdateSelectedBackground :: A.Value -> T.Parser Update
      parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
        _background_ <- o A..:? "background"
        for_dark_theme_ <- o A..:? "for_dark_theme"
        return $ UpdateSelectedBackground {_background = _background_, for_dark_theme = for_dark_theme_}

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
        web_app_launch_id_ <- U.rm <$> (o A..:? "web_app_launch_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateWebAppMessageSent {web_app_launch_id = web_app_launch_id_}

      parseUpdateActiveEmojiReactions :: A.Value -> T.Parser Update
      parseUpdateActiveEmojiReactions = A.withObject "UpdateActiveEmojiReactions" $ \o -> do
        emojis_ <- o A..:? "emojis"
        return $ UpdateActiveEmojiReactions {emojis = emojis_}

      parseUpdateDefaultReactionType :: A.Value -> T.Parser Update
      parseUpdateDefaultReactionType = A.withObject "UpdateDefaultReactionType" $ \o -> do
        reaction_type_ <- o A..:? "reaction_type"
        return $ UpdateDefaultReactionType {reaction_type = reaction_type_}

      parseUpdateDiceEmojis :: A.Value -> T.Parser Update
      parseUpdateDiceEmojis = A.withObject "UpdateDiceEmojis" $ \o -> do
        emojis_ <- o A..:? "emojis"
        return $ UpdateDiceEmojis {emojis = emojis_}

      parseUpdateAnimatedEmojiMessageClicked :: A.Value -> T.Parser Update
      parseUpdateAnimatedEmojiMessageClicked = A.withObject "UpdateAnimatedEmojiMessageClicked" $ \o -> do
        sticker_ <- o A..:? "sticker"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
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

      parseUpdateAddChatMembersPrivacyForbidden :: A.Value -> T.Parser Update
      parseUpdateAddChatMembersPrivacyForbidden = A.withObject "UpdateAddChatMembersPrivacyForbidden" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateAddChatMembersPrivacyForbidden {user_ids = user_ids_, chat_id = chat_id_}

      parseUpdateAutosaveSettings :: A.Value -> T.Parser Update
      parseUpdateAutosaveSettings = A.withObject "UpdateAutosaveSettings" $ \o -> do
        settings_ <- o A..:? "settings"
        _scope_ <- o A..:? "scope"
        return $ UpdateAutosaveSettings {settings = settings_, _scope = _scope_}

      parseUpdateNewInlineQuery :: A.Value -> T.Parser Update
      parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
        offset_ <- o A..:? "offset"
        query_ <- o A..:? "query"
        chat_type_ <- o A..:? "chat_type"
        user_location_ <- o A..:? "user_location"
        sender_user_id_ <- o A..:? "sender_user_id"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewInlineQuery {offset = offset_, query = query_, chat_type = chat_type_, user_location = user_location_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewChosenInlineResult :: A.Value -> T.Parser Update
      parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
        inline_message_id_ <- o A..:? "inline_message_id"
        result_id_ <- o A..:? "result_id"
        query_ <- o A..:? "query"
        user_location_ <- o A..:? "user_location"
        sender_user_id_ <- o A..:? "sender_user_id"
        return $ UpdateNewChosenInlineResult {inline_message_id = inline_message_id_, result_id = result_id_, query = query_, user_location = user_location_, sender_user_id = sender_user_id_}

      parseUpdateNewCallbackQuery :: A.Value -> T.Parser Update
      parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
        payload_ <- o A..:? "payload"
        chat_instance_ <- U.rm <$> (o A..:? "chat_instance" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        sender_user_id_ <- o A..:? "sender_user_id"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewCallbackQuery {payload = payload_, chat_instance = chat_instance_, message_id = message_id_, chat_id = chat_id_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewInlineCallbackQuery :: A.Value -> T.Parser Update
      parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
        payload_ <- o A..:? "payload"
        chat_instance_ <- U.rm <$> (o A..:? "chat_instance" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        inline_message_id_ <- o A..:? "inline_message_id"
        sender_user_id_ <- o A..:? "sender_user_id"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewInlineCallbackQuery {payload = payload_, chat_instance = chat_instance_, inline_message_id = inline_message_id_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewShippingQuery :: A.Value -> T.Parser Update
      parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
        shipping_address_ <- o A..:? "shipping_address"
        invoice_payload_ <- o A..:? "invoice_payload"
        sender_user_id_ <- o A..:? "sender_user_id"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewShippingQuery {shipping_address = shipping_address_, invoice_payload = invoice_payload_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewPreCheckoutQuery :: A.Value -> T.Parser Update
      parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
        order_info_ <- o A..:? "order_info"
        shipping_option_id_ <- o A..:? "shipping_option_id"
        _invoice_payload_ <- o A..:? "invoice_payload"
        total_amount_ <- o A..:? "total_amount"
        currency_ <- o A..:? "currency"
        sender_user_id_ <- o A..:? "sender_user_id"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewPreCheckoutQuery {order_info = order_info_, shipping_option_id = shipping_option_id_, _invoice_payload = _invoice_payload_, total_amount = total_amount_, currency = currency_, sender_user_id = sender_user_id_, _id = _id_}

      parseUpdateNewCustomEvent :: A.Value -> T.Parser Update
      parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
        event_ <- o A..:? "event"
        return $ UpdateNewCustomEvent {event = event_}

      parseUpdateNewCustomQuery :: A.Value -> T.Parser Update
      parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
        timeout_ <- o A..:? "timeout"
        __data_ <- o A..:? "data"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdateNewCustomQuery {timeout = timeout_, __data = __data_, _id = _id_}

      parseUpdatePoll :: A.Value -> T.Parser Update
      parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
        poll_ <- o A..:? "poll"
        return $ UpdatePoll {poll = poll_}

      parseUpdatePollAnswer :: A.Value -> T.Parser Update
      parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
        option_ids_ <- o A..:? "option_ids"
        voter_id_ <- o A..:? "voter_id"
        poll_id_ <- U.rm <$> (o A..:? "poll_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ UpdatePollAnswer {option_ids = option_ids_, voter_id = voter_id_, poll_id = poll_id_}

      parseUpdateChatMember :: A.Value -> T.Parser Update
      parseUpdateChatMember = A.withObject "UpdateChatMember" $ \o -> do
        new_chat_member_ <- o A..:? "new_chat_member"
        old_chat_member_ <- o A..:? "old_chat_member"
        via_chat_folder_invite_link_ <- o A..:? "via_chat_folder_invite_link"
        invite_link_ <- o A..:? "invite_link"
        date_ <- o A..:? "date"
        actor_user_id_ <- o A..:? "actor_user_id"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateChatMember {new_chat_member = new_chat_member_, old_chat_member = old_chat_member_, via_chat_folder_invite_link = via_chat_folder_invite_link_, invite_link = invite_link_, date = date_, actor_user_id = actor_user_id_, chat_id = chat_id_}

      parseUpdateNewChatJoinRequest :: A.Value -> T.Parser Update
      parseUpdateNewChatJoinRequest = A.withObject "UpdateNewChatJoinRequest" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        user_chat_id_ <- o A..:? "user_chat_id"
        request_ <- o A..:? "request"
        chat_id_ <- o A..:? "chat_id"
        return $ UpdateNewChatJoinRequest {invite_link = invite_link_, user_chat_id = user_chat_id_, request = request_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON Update where
  toJSON
    UpdateAuthorizationState
      { authorization_state = authorization_state_
      } =
      A.object
        [ "@type" A..= T.String "updateAuthorizationState",
          "authorization_state" A..= authorization_state_
        ]
  toJSON
    UpdateNewMessage
      { message = message_
      } =
      A.object
        [ "@type" A..= T.String "updateNewMessage",
          "message" A..= message_
        ]
  toJSON
    UpdateMessageSendAcknowledged
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendAcknowledged",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageSendSucceeded
      { old_message_id = old_message_id_,
        message = message_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendSucceeded",
          "old_message_id" A..= old_message_id_,
          "message" A..= message_
        ]
  toJSON
    UpdateMessageSendFailed
      { error_message = error_message_,
        error_code = error_code_,
        old_message_id = old_message_id_,
        message = message_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageSendFailed",
          "error_message" A..= error_message_,
          "error_code" A..= error_code_,
          "old_message_id" A..= old_message_id_,
          "message" A..= message_
        ]
  toJSON
    UpdateMessageContent
      { new_content = new_content_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageContent",
          "new_content" A..= new_content_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageEdited
      { reply_markup = reply_markup_,
        edit_date = edit_date_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageEdited",
          "reply_markup" A..= reply_markup_,
          "edit_date" A..= edit_date_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageIsPinned
      { is_pinned = is_pinned_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageIsPinned",
          "is_pinned" A..= is_pinned_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageInteractionInfo
      { interaction_info = interaction_info_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageInteractionInfo",
          "interaction_info" A..= interaction_info_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageContentOpened
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageContentOpened",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageMentionRead
      { unread_mention_count = unread_mention_count_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageMentionRead",
          "unread_mention_count" A..= unread_mention_count_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageUnreadReactions
      { unread_reaction_count = unread_reaction_count_,
        unread_reactions = unread_reactions_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageUnreadReactions",
          "unread_reaction_count" A..= unread_reaction_count_,
          "unread_reactions" A..= unread_reactions_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateMessageLiveLocationViewed
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateMessageLiveLocationViewed",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateNewChat
      { chat = chat_
      } =
      A.object
        [ "@type" A..= T.String "updateNewChat",
          "chat" A..= chat_
        ]
  toJSON
    UpdateChatTitle
      { title = title_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatTitle",
          "title" A..= title_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatPhoto
      { photo = photo_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatPhoto",
          "photo" A..= photo_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatPermissions
      { permissions = permissions_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatPermissions",
          "permissions" A..= permissions_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatLastMessage
      { positions = positions_,
        last_message = last_message_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatLastMessage",
          "positions" A..= positions_,
          "last_message" A..= last_message_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatPosition
      { position = position_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatPosition",
          "position" A..= position_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatReadInbox
      { unread_count = unread_count_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatReadInbox",
          "unread_count" A..= unread_count_,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatReadOutbox
      { last_read_outbox_message_id = last_read_outbox_message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatReadOutbox",
          "last_read_outbox_message_id" A..= last_read_outbox_message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatActionBar
      { action_bar = action_bar_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatActionBar",
          "action_bar" A..= action_bar_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatAvailableReactions
      { available_reactions = available_reactions_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatAvailableReactions",
          "available_reactions" A..= available_reactions_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatDraftMessage
      { positions = positions_,
        draft_message = draft_message_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatDraftMessage",
          "positions" A..= positions_,
          "draft_message" A..= draft_message_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatMessageSender
      { message_sender_id = message_sender_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatMessageSender",
          "message_sender_id" A..= message_sender_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatMessageAutoDeleteTime",
          "message_auto_delete_time" A..= message_auto_delete_time_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatNotificationSettings
      { notification_settings = notification_settings_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatNotificationSettings",
          "notification_settings" A..= notification_settings_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatPendingJoinRequests
      { pending_join_requests = pending_join_requests_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatPendingJoinRequests",
          "pending_join_requests" A..= pending_join_requests_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatReplyMarkup
      { reply_markup_message_id = reply_markup_message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatReplyMarkup",
          "reply_markup_message_id" A..= reply_markup_message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatBackground
      { background = background_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatBackground",
          "background" A..= background_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatTheme
      { theme_name = theme_name_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatTheme",
          "theme_name" A..= theme_name_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatUnreadMentionCount
      { unread_mention_count = unread_mention_count_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatUnreadMentionCount",
          "unread_mention_count" A..= unread_mention_count_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatUnreadReactionCount
      { unread_reaction_count = unread_reaction_count_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatUnreadReactionCount",
          "unread_reaction_count" A..= unread_reaction_count_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatVideoChat
      { video_chat = video_chat_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatVideoChat",
          "video_chat" A..= video_chat_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatDefaultDisableNotification",
          "default_disable_notification" A..= default_disable_notification_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatHasProtectedContent
      { has_protected_content = has_protected_content_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatHasProtectedContent",
          "has_protected_content" A..= has_protected_content_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatIsTranslatable
      { is_translatable = is_translatable_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatIsTranslatable",
          "is_translatable" A..= is_translatable_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatIsMarkedAsUnread",
          "is_marked_as_unread" A..= is_marked_as_unread_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatIsBlocked
      { is_blocked = is_blocked_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatIsBlocked",
          "is_blocked" A..= is_blocked_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatHasScheduledMessages
      { has_scheduled_messages = has_scheduled_messages_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatHasScheduledMessages",
          "has_scheduled_messages" A..= has_scheduled_messages_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatFolders
      { main_chat_list_position = main_chat_list_position_,
        chat_folders = chat_folders_
      } =
      A.object
        [ "@type" A..= T.String "updateChatFolders",
          "main_chat_list_position" A..= main_chat_list_position_,
          "chat_folders" A..= chat_folders_
        ]
  toJSON
    UpdateChatOnlineMemberCount
      { online_member_count = online_member_count_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatOnlineMemberCount",
          "online_member_count" A..= online_member_count_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateForumTopicInfo
      { info = info_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateForumTopicInfo",
          "info" A..= info_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateScopeNotificationSettings
      { _notification_settings = _notification_settings_,
        scope = scope_
      } =
      A.object
        [ "@type" A..= T.String "updateScopeNotificationSettings",
          "notification_settings" A..= _notification_settings_,
          "scope" A..= scope_
        ]
  toJSON
    UpdateNotification
      { notification = notification_,
        notification_group_id = notification_group_id_
      } =
      A.object
        [ "@type" A..= T.String "updateNotification",
          "notification" A..= notification_,
          "notification_group_id" A..= notification_group_id_
        ]
  toJSON
    UpdateNotificationGroup
      { removed_notification_ids = removed_notification_ids_,
        added_notifications = added_notifications_,
        total_count = total_count_,
        notification_sound_id = notification_sound_id_,
        notification_settings_chat_id = notification_settings_chat_id_,
        chat_id = chat_id_,
        _type = _type_,
        notification_group_id = notification_group_id_
      } =
      A.object
        [ "@type" A..= T.String "updateNotificationGroup",
          "removed_notification_ids" A..= removed_notification_ids_,
          "added_notifications" A..= added_notifications_,
          "total_count" A..= total_count_,
          "notification_sound_id" A..= U.toS notification_sound_id_,
          "notification_settings_chat_id" A..= notification_settings_chat_id_,
          "chat_id" A..= chat_id_,
          "type" A..= _type_,
          "notification_group_id" A..= notification_group_id_
        ]
  toJSON
    UpdateActiveNotifications
      { groups = groups_
      } =
      A.object
        [ "@type" A..= T.String "updateActiveNotifications",
          "groups" A..= groups_
        ]
  toJSON
    UpdateHavePendingNotifications
      { have_unreceived_notifications = have_unreceived_notifications_,
        have_delayed_notifications = have_delayed_notifications_
      } =
      A.object
        [ "@type" A..= T.String "updateHavePendingNotifications",
          "have_unreceived_notifications" A..= have_unreceived_notifications_,
          "have_delayed_notifications" A..= have_delayed_notifications_
        ]
  toJSON
    UpdateDeleteMessages
      { from_cache = from_cache_,
        is_permanent = is_permanent_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateDeleteMessages",
          "from_cache" A..= from_cache_,
          "is_permanent" A..= is_permanent_,
          "message_ids" A..= message_ids_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateChatAction
      { action = action_,
        sender_id = sender_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatAction",
          "action" A..= action_,
          "sender_id" A..= sender_id_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateUserStatus
      { status = status_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "updateUserStatus",
          "status" A..= status_,
          "user_id" A..= user_id_
        ]
  toJSON
    UpdateUser
      { user = user_
      } =
      A.object
        [ "@type" A..= T.String "updateUser",
          "user" A..= user_
        ]
  toJSON
    UpdateBasicGroup
      { basic_group = basic_group_
      } =
      A.object
        [ "@type" A..= T.String "updateBasicGroup",
          "basic_group" A..= basic_group_
        ]
  toJSON
    UpdateSupergroup
      { supergroup = supergroup_
      } =
      A.object
        [ "@type" A..= T.String "updateSupergroup",
          "supergroup" A..= supergroup_
        ]
  toJSON
    UpdateSecretChat
      { secret_chat = secret_chat_
      } =
      A.object
        [ "@type" A..= T.String "updateSecretChat",
          "secret_chat" A..= secret_chat_
        ]
  toJSON
    UpdateUserFullInfo
      { user_full_info = user_full_info_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "updateUserFullInfo",
          "user_full_info" A..= user_full_info_,
          "user_id" A..= user_id_
        ]
  toJSON
    UpdateBasicGroupFullInfo
      { basic_group_full_info = basic_group_full_info_,
        basic_group_id = basic_group_id_
      } =
      A.object
        [ "@type" A..= T.String "updateBasicGroupFullInfo",
          "basic_group_full_info" A..= basic_group_full_info_,
          "basic_group_id" A..= basic_group_id_
        ]
  toJSON
    UpdateSupergroupFullInfo
      { supergroup_full_info = supergroup_full_info_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "updateSupergroupFullInfo",
          "supergroup_full_info" A..= supergroup_full_info_,
          "supergroup_id" A..= supergroup_id_
        ]
  toJSON
    UpdateServiceNotification
      { content = content_,
        __type = __type_
      } =
      A.object
        [ "@type" A..= T.String "updateServiceNotification",
          "content" A..= content_,
          "type" A..= __type_
        ]
  toJSON
    UpdateFile
      { file = file_
      } =
      A.object
        [ "@type" A..= T.String "updateFile",
          "file" A..= file_
        ]
  toJSON
    UpdateFileGenerationStart
      { conversion = conversion_,
        destination_path = destination_path_,
        original_path = original_path_,
        generation_id = generation_id_
      } =
      A.object
        [ "@type" A..= T.String "updateFileGenerationStart",
          "conversion" A..= conversion_,
          "destination_path" A..= destination_path_,
          "original_path" A..= original_path_,
          "generation_id" A..= U.toS generation_id_
        ]
  toJSON
    UpdateFileGenerationStop
      { generation_id = generation_id_
      } =
      A.object
        [ "@type" A..= T.String "updateFileGenerationStop",
          "generation_id" A..= U.toS generation_id_
        ]
  toJSON
    UpdateFileDownloads
      { downloaded_size = downloaded_size_,
        total_count = total_count_,
        total_size = total_size_
      } =
      A.object
        [ "@type" A..= T.String "updateFileDownloads",
          "downloaded_size" A..= downloaded_size_,
          "total_count" A..= total_count_,
          "total_size" A..= total_size_
        ]
  toJSON
    UpdateFileAddedToDownloads
      { counts = counts_,
        file_download = file_download_
      } =
      A.object
        [ "@type" A..= T.String "updateFileAddedToDownloads",
          "counts" A..= counts_,
          "file_download" A..= file_download_
        ]
  toJSON
    UpdateFileDownload
      { counts = counts_,
        is_paused = is_paused_,
        complete_date = complete_date_,
        file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "updateFileDownload",
          "counts" A..= counts_,
          "is_paused" A..= is_paused_,
          "complete_date" A..= complete_date_,
          "file_id" A..= file_id_
        ]
  toJSON
    UpdateFileRemovedFromDownloads
      { counts = counts_,
        file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "updateFileRemovedFromDownloads",
          "counts" A..= counts_,
          "file_id" A..= file_id_
        ]
  toJSON
    UpdateCall
      { call = call_
      } =
      A.object
        [ "@type" A..= T.String "updateCall",
          "call" A..= call_
        ]
  toJSON
    UpdateGroupCall
      { group_call = group_call_
      } =
      A.object
        [ "@type" A..= T.String "updateGroupCall",
          "group_call" A..= group_call_
        ]
  toJSON
    UpdateGroupCallParticipant
      { participant = participant_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "updateGroupCallParticipant",
          "participant" A..= participant_,
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    UpdateNewCallSignalingData
      { _data = _data_,
        call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewCallSignalingData",
          "data" A..= _data_,
          "call_id" A..= call_id_
        ]
  toJSON
    UpdateUserPrivacySettingRules
      { rules = rules_,
        setting = setting_
      } =
      A.object
        [ "@type" A..= T.String "updateUserPrivacySettingRules",
          "rules" A..= rules_,
          "setting" A..= setting_
        ]
  toJSON
    UpdateUnreadMessageCount
      { unread_unmuted_count = unread_unmuted_count_,
        unread_count = unread_count_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "updateUnreadMessageCount",
          "unread_unmuted_count" A..= unread_unmuted_count_,
          "unread_count" A..= unread_count_,
          "chat_list" A..= chat_list_
        ]
  toJSON
    UpdateUnreadChatCount
      { marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_,
        marked_as_unread_count = marked_as_unread_count_,
        unread_unmuted_count = unread_unmuted_count_,
        unread_count = unread_count_,
        total_count = total_count_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "updateUnreadChatCount",
          "marked_as_unread_unmuted_count" A..= marked_as_unread_unmuted_count_,
          "marked_as_unread_count" A..= marked_as_unread_count_,
          "unread_unmuted_count" A..= unread_unmuted_count_,
          "unread_count" A..= unread_count_,
          "total_count" A..= total_count_,
          "chat_list" A..= chat_list_
        ]
  toJSON
    UpdateStory
      { story = story_
      } =
      A.object
        [ "@type" A..= T.String "updateStory",
          "story" A..= story_
        ]
  toJSON
    UpdateStoryDeleted
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateStoryDeleted",
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
  toJSON
    UpdateChatActiveStories
      { active_stories = active_stories_
      } =
      A.object
        [ "@type" A..= T.String "updateChatActiveStories",
          "active_stories" A..= active_stories_
        ]
  toJSON
    UpdateStoryListChatCount
      { chat_count = chat_count_,
        story_list = story_list_
      } =
      A.object
        [ "@type" A..= T.String "updateStoryListChatCount",
          "chat_count" A..= chat_count_,
          "story_list" A..= story_list_
        ]
  toJSON
    UpdateOption
      { value = value_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "updateOption",
          "value" A..= value_,
          "name" A..= name_
        ]
  toJSON
    UpdateStickerSet
      { sticker_set = sticker_set_
      } =
      A.object
        [ "@type" A..= T.String "updateStickerSet",
          "sticker_set" A..= sticker_set_
        ]
  toJSON
    UpdateInstalledStickerSets
      { sticker_set_ids = sticker_set_ids_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "updateInstalledStickerSets",
          "sticker_set_ids" A..= U.toLS sticker_set_ids_,
          "sticker_type" A..= sticker_type_
        ]
  toJSON
    UpdateTrendingStickerSets
      { sticker_sets = sticker_sets_,
        sticker_type = sticker_type_
      } =
      A.object
        [ "@type" A..= T.String "updateTrendingStickerSets",
          "sticker_sets" A..= sticker_sets_,
          "sticker_type" A..= sticker_type_
        ]
  toJSON
    UpdateRecentStickers
      { sticker_ids = sticker_ids_,
        is_attached = is_attached_
      } =
      A.object
        [ "@type" A..= T.String "updateRecentStickers",
          "sticker_ids" A..= sticker_ids_,
          "is_attached" A..= is_attached_
        ]
  toJSON
    UpdateFavoriteStickers
      { sticker_ids = sticker_ids_
      } =
      A.object
        [ "@type" A..= T.String "updateFavoriteStickers",
          "sticker_ids" A..= sticker_ids_
        ]
  toJSON
    UpdateSavedAnimations
      { animation_ids = animation_ids_
      } =
      A.object
        [ "@type" A..= T.String "updateSavedAnimations",
          "animation_ids" A..= animation_ids_
        ]
  toJSON
    UpdateSavedNotificationSounds
      { notification_sound_ids = notification_sound_ids_
      } =
      A.object
        [ "@type" A..= T.String "updateSavedNotificationSounds",
          "notification_sound_ids" A..= U.toLS notification_sound_ids_
        ]
  toJSON
    UpdateSelectedBackground
      { _background = _background_,
        for_dark_theme = for_dark_theme_
      } =
      A.object
        [ "@type" A..= T.String "updateSelectedBackground",
          "background" A..= _background_,
          "for_dark_theme" A..= for_dark_theme_
        ]
  toJSON
    UpdateChatThemes
      { chat_themes = chat_themes_
      } =
      A.object
        [ "@type" A..= T.String "updateChatThemes",
          "chat_themes" A..= chat_themes_
        ]
  toJSON
    UpdateLanguagePackStrings
      { strings = strings_,
        language_pack_id = language_pack_id_,
        localization_target = localization_target_
      } =
      A.object
        [ "@type" A..= T.String "updateLanguagePackStrings",
          "strings" A..= strings_,
          "language_pack_id" A..= language_pack_id_,
          "localization_target" A..= localization_target_
        ]
  toJSON
    UpdateConnectionState
      { state = state_
      } =
      A.object
        [ "@type" A..= T.String "updateConnectionState",
          "state" A..= state_
        ]
  toJSON
    UpdateTermsOfService
      { terms_of_service = terms_of_service_,
        terms_of_service_id = terms_of_service_id_
      } =
      A.object
        [ "@type" A..= T.String "updateTermsOfService",
          "terms_of_service" A..= terms_of_service_,
          "terms_of_service_id" A..= terms_of_service_id_
        ]
  toJSON
    UpdateUsersNearby
      { users_nearby = users_nearby_
      } =
      A.object
        [ "@type" A..= T.String "updateUsersNearby",
          "users_nearby" A..= users_nearby_
        ]
  toJSON
    UpdateAttachmentMenuBots
      { bots = bots_
      } =
      A.object
        [ "@type" A..= T.String "updateAttachmentMenuBots",
          "bots" A..= bots_
        ]
  toJSON
    UpdateWebAppMessageSent
      { web_app_launch_id = web_app_launch_id_
      } =
      A.object
        [ "@type" A..= T.String "updateWebAppMessageSent",
          "web_app_launch_id" A..= U.toS web_app_launch_id_
        ]
  toJSON
    UpdateActiveEmojiReactions
      { emojis = emojis_
      } =
      A.object
        [ "@type" A..= T.String "updateActiveEmojiReactions",
          "emojis" A..= emojis_
        ]
  toJSON
    UpdateDefaultReactionType
      { reaction_type = reaction_type_
      } =
      A.object
        [ "@type" A..= T.String "updateDefaultReactionType",
          "reaction_type" A..= reaction_type_
        ]
  toJSON
    UpdateDiceEmojis
      { emojis = emojis_
      } =
      A.object
        [ "@type" A..= T.String "updateDiceEmojis",
          "emojis" A..= emojis_
        ]
  toJSON
    UpdateAnimatedEmojiMessageClicked
      { sticker = sticker_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateAnimatedEmojiMessageClicked",
          "sticker" A..= sticker_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateAnimationSearchParameters
      { emojis = emojis_,
        provider = provider_
      } =
      A.object
        [ "@type" A..= T.String "updateAnimationSearchParameters",
          "emojis" A..= emojis_,
          "provider" A..= provider_
        ]
  toJSON
    UpdateSuggestedActions
      { removed_actions = removed_actions_,
        added_actions = added_actions_
      } =
      A.object
        [ "@type" A..= T.String "updateSuggestedActions",
          "removed_actions" A..= removed_actions_,
          "added_actions" A..= added_actions_
        ]
  toJSON
    UpdateAddChatMembersPrivacyForbidden
      { user_ids = user_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateAddChatMembersPrivacyForbidden",
          "user_ids" A..= user_ids_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateAutosaveSettings
      { settings = settings_,
        _scope = _scope_
      } =
      A.object
        [ "@type" A..= T.String "updateAutosaveSettings",
          "settings" A..= settings_,
          "scope" A..= _scope_
        ]
  toJSON
    UpdateNewInlineQuery
      { offset = offset_,
        query = query_,
        chat_type = chat_type_,
        user_location = user_location_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewInlineQuery",
          "offset" A..= offset_,
          "query" A..= query_,
          "chat_type" A..= chat_type_,
          "user_location" A..= user_location_,
          "sender_user_id" A..= sender_user_id_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdateNewChosenInlineResult
      { inline_message_id = inline_message_id_,
        result_id = result_id_,
        query = query_,
        user_location = user_location_,
        sender_user_id = sender_user_id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewChosenInlineResult",
          "inline_message_id" A..= inline_message_id_,
          "result_id" A..= result_id_,
          "query" A..= query_,
          "user_location" A..= user_location_,
          "sender_user_id" A..= sender_user_id_
        ]
  toJSON
    UpdateNewCallbackQuery
      { payload = payload_,
        chat_instance = chat_instance_,
        message_id = message_id_,
        chat_id = chat_id_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewCallbackQuery",
          "payload" A..= payload_,
          "chat_instance" A..= U.toS chat_instance_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_,
          "sender_user_id" A..= sender_user_id_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdateNewInlineCallbackQuery
      { payload = payload_,
        chat_instance = chat_instance_,
        inline_message_id = inline_message_id_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewInlineCallbackQuery",
          "payload" A..= payload_,
          "chat_instance" A..= U.toS chat_instance_,
          "inline_message_id" A..= inline_message_id_,
          "sender_user_id" A..= sender_user_id_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdateNewShippingQuery
      { shipping_address = shipping_address_,
        invoice_payload = invoice_payload_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewShippingQuery",
          "shipping_address" A..= shipping_address_,
          "invoice_payload" A..= invoice_payload_,
          "sender_user_id" A..= sender_user_id_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdateNewPreCheckoutQuery
      { order_info = order_info_,
        shipping_option_id = shipping_option_id_,
        _invoice_payload = _invoice_payload_,
        total_amount = total_amount_,
        currency = currency_,
        sender_user_id = sender_user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewPreCheckoutQuery",
          "order_info" A..= order_info_,
          "shipping_option_id" A..= shipping_option_id_,
          "invoice_payload" A..= _invoice_payload_,
          "total_amount" A..= total_amount_,
          "currency" A..= currency_,
          "sender_user_id" A..= sender_user_id_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdateNewCustomEvent
      { event = event_
      } =
      A.object
        [ "@type" A..= T.String "updateNewCustomEvent",
          "event" A..= event_
        ]
  toJSON
    UpdateNewCustomQuery
      { timeout = timeout_,
        __data = __data_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewCustomQuery",
          "timeout" A..= timeout_,
          "data" A..= __data_,
          "id" A..= U.toS _id_
        ]
  toJSON
    UpdatePoll
      { poll = poll_
      } =
      A.object
        [ "@type" A..= T.String "updatePoll",
          "poll" A..= poll_
        ]
  toJSON
    UpdatePollAnswer
      { option_ids = option_ids_,
        voter_id = voter_id_,
        poll_id = poll_id_
      } =
      A.object
        [ "@type" A..= T.String "updatePollAnswer",
          "option_ids" A..= option_ids_,
          "voter_id" A..= voter_id_,
          "poll_id" A..= U.toS poll_id_
        ]
  toJSON
    UpdateChatMember
      { new_chat_member = new_chat_member_,
        old_chat_member = old_chat_member_,
        via_chat_folder_invite_link = via_chat_folder_invite_link_,
        invite_link = invite_link_,
        date = date_,
        actor_user_id = actor_user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateChatMember",
          "new_chat_member" A..= new_chat_member_,
          "old_chat_member" A..= old_chat_member_,
          "via_chat_folder_invite_link" A..= via_chat_folder_invite_link_,
          "invite_link" A..= invite_link_,
          "date" A..= date_,
          "actor_user_id" A..= actor_user_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    UpdateNewChatJoinRequest
      { invite_link = invite_link_,
        user_chat_id = user_chat_id_,
        request = request_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "updateNewChatJoinRequest",
          "invite_link" A..= invite_link_,
          "user_chat_id" A..= user_chat_id_,
          "request" A..= request_,
          "chat_id" A..= chat_id_
        ]
