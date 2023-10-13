module TD.Data.Update (Update(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AuthorizationState as AuthorizationState
import qualified TD.Data.Message as Message
import qualified Data.Text as T
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Data.UnreadReaction as UnreadReaction
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPosition as ChatPosition
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.VideoChat as VideoChat
import qualified TD.Data.ChatFolderInfo as ChatFolderInfo
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Data.Notification as Notification
import qualified TD.Data.NotificationGroupType as NotificationGroupType
import qualified TD.Data.NotificationGroup as NotificationGroup
import qualified TD.Data.ChatAction as ChatAction
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.User as User
import qualified TD.Data.BasicGroup as BasicGroup
import qualified TD.Data.Supergroup as Supergroup
import qualified TD.Data.SecretChat as SecretChat
import qualified TD.Data.UserFullInfo as UserFullInfo
import qualified TD.Data.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Data.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Data.File as File
import qualified TD.Data.FileDownload as FileDownload
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.Call as Call
import qualified TD.Data.GroupCall as GroupCall
import qualified TD.Data.GroupCallParticipant as GroupCallParticipant
import qualified Data.ByteString as BS
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.Story as Story
import qualified TD.Data.ChatActiveStories as ChatActiveStories
import qualified TD.Data.StoryList as StoryList
import qualified TD.Data.OptionValue as OptionValue
import qualified TD.Data.StickerSet as StickerSet
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.TrendingStickerSets as TrendingStickerSets
import qualified TD.Data.Background as Background
import qualified TD.Data.ChatTheme as ChatTheme
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified TD.Data.ConnectionState as ConnectionState
import qualified TD.Data.TermsOfService as TermsOfService
import qualified TD.Data.ChatNearby as ChatNearby
import qualified TD.Data.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.SuggestedAction as SuggestedAction
import qualified TD.Data.AutosaveSettingsScope as AutosaveSettingsScope
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified TD.Data.Location as Location
import qualified TD.Data.ChatType as ChatType
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload
import qualified TD.Data.Address as Address
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.Poll as Poll
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest

data Update -- ^ Contains notifications about data changes
  = UpdateAuthorizationState -- ^ The user authorization state has changed
    { authorization_state :: Maybe AuthorizationState.AuthorizationState -- ^ New authorization state
    }
  | UpdateNewMessage -- ^ A new message was received; can also be an outgoing message
    { message :: Maybe Message.Message -- ^ The new message
    }
  | UpdateMessageSendAcknowledged -- ^ A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
    { chat_id    :: Maybe Int -- ^ The chat identifier of the sent message
    , message_id :: Maybe Int -- ^ A temporary message identifier
    }
  | UpdateMessageSendSucceeded -- ^ A message has been successfully sent
    { message        :: Maybe Message.Message -- ^ The sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change
    , old_message_id :: Maybe Int             -- ^ The previous temporary message identifier
    }
  | UpdateMessageSendFailed -- ^ A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
    { message        :: Maybe Message.Message -- ^ The failed to send message
    , old_message_id :: Maybe Int             -- ^ The previous temporary message identifier
    , error_code     :: Maybe Int             -- ^ An error code
    , error_message  :: Maybe T.Text          -- ^ Error message
    }
  | UpdateMessageContent -- ^ The message content has changed
    { chat_id     :: Maybe Int                           -- ^ Chat identifier
    , message_id  :: Maybe Int                           -- ^ Message identifier
    , new_content :: Maybe MessageContent.MessageContent -- ^ New message content
    }
  | UpdateMessageEdited -- ^ A message was edited. Changes in the message content will come in a separate updateMessageContent
    { chat_id      :: Maybe Int                     -- ^ Chat identifier
    , message_id   :: Maybe Int                     -- ^ Message identifier
    , edit_date    :: Maybe Int                     -- ^ Point in time (Unix timestamp) when the message was edited
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup -- ^ New message reply markup; may be null
    }
  | UpdateMessageIsPinned -- ^ The message pinned state was changed
    { chat_id    :: Maybe Int  -- ^ Chat identifier
    , message_id :: Maybe Int  -- ^ The message identifier
    , is_pinned  :: Maybe Bool -- ^ True, if the message is pinned
    }
  | UpdateMessageInteractionInfo -- ^ The information about interactions with a message has changed
    { chat_id          :: Maybe Int                                           -- ^ Chat identifier
    , message_id       :: Maybe Int                                           -- ^ Message identifier
    , interaction_info :: Maybe MessageInteractionInfo.MessageInteractionInfo -- ^ New information about interactions with the message; may be null
    }
  | UpdateMessageContentOpened -- ^ The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the self-destruct timer
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Message identifier
    }
  | UpdateMessageMentionRead -- ^ A message with an unread mention was read
    { chat_id              :: Maybe Int -- ^ Chat identifier
    , message_id           :: Maybe Int -- ^ Message identifier
    , unread_mention_count :: Maybe Int -- ^ The new number of unread mention messages left in the chat
    }
  | UpdateMessageUnreadReactions -- ^ The list of unread reactions added to a message was changed
    { chat_id               :: Maybe Int                             -- ^ Chat identifier
    , message_id            :: Maybe Int                             -- ^ Message identifier
    , unread_reactions      :: Maybe [UnreadReaction.UnreadReaction] -- ^ The new list of unread reactions
    , unread_reaction_count :: Maybe Int                             -- ^ The new number of messages with unread reactions left in the chat
    }
  | UpdateMessageLiveLocationViewed -- ^ A message with a live location was viewed. When the update is received, the application is supposed to update the live location
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the live location message
    , message_id :: Maybe Int -- ^ Identifier of the message with live location
    }
  | UpdateNewChat -- ^ A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
    { chat :: Maybe Chat.Chat -- ^ The chat
    }
  | UpdateChatTitle -- ^ The title of a chat was changed
    { chat_id :: Maybe Int    -- ^ Chat identifier
    , title   :: Maybe T.Text -- ^ The new chat title
    }
  | UpdateChatPhoto -- ^ A chat photo was changed
    { chat_id :: Maybe Int                         -- ^ Chat identifier
    , photo   :: Maybe ChatPhotoInfo.ChatPhotoInfo -- ^ The new chat photo; may be null
    }
  | UpdateChatPermissions -- ^ Chat permissions was changed
    { chat_id     :: Maybe Int                             -- ^ Chat identifier
    , permissions :: Maybe ChatPermissions.ChatPermissions -- ^ The new chat permissions
    }
  | UpdateChatLastMessage -- ^ The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
    { chat_id      :: Maybe Int                         -- ^ Chat identifier
    , last_message :: Maybe Message.Message             -- ^ The new last message in the chat; may be null
    , positions    :: Maybe [ChatPosition.ChatPosition] -- ^ The new chat positions in the chat lists
    }
  | UpdateChatPosition -- ^ The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update
    { chat_id  :: Maybe Int                       -- ^ Chat identifier
    , position :: Maybe ChatPosition.ChatPosition -- ^ New chat position. If new order is 0, then the chat needs to be removed from the list
    }
  | UpdateChatReadInbox -- ^ Incoming messages were read or the number of unread messages has been changed
    { chat_id                    :: Maybe Int -- ^ Chat identifier
    , last_read_inbox_message_id :: Maybe Int -- ^ Identifier of the last read incoming message
    , unread_count               :: Maybe Int -- ^ The number of unread messages left in the chat
    }
  | UpdateChatReadOutbox -- ^ Outgoing messages were read
    { chat_id                     :: Maybe Int -- ^ Chat identifier
    , last_read_outbox_message_id :: Maybe Int -- ^ Identifier of last read outgoing message
    }
  | UpdateChatActionBar -- ^ The chat action bar was changed
    { chat_id    :: Maybe Int                         -- ^ Chat identifier
    , action_bar :: Maybe ChatActionBar.ChatActionBar -- ^ The new value of the action bar; may be null
    }
  | UpdateChatAvailableReactions -- ^ The chat available reactions were changed
    { chat_id             :: Maybe Int                                           -- ^ Chat identifier
    , available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions -- ^ The new reactions, available in the chat
    }
  | UpdateChatDraftMessage -- ^ A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied
    { chat_id       :: Maybe Int                         -- ^ Chat identifier
    , draft_message :: Maybe DraftMessage.DraftMessage   -- ^ The new draft message; may be null
    , positions     :: Maybe [ChatPosition.ChatPosition] -- ^ The new chat positions in the chat lists
    }
  | UpdateChatMessageSender -- ^ The message sender that is selected to send messages in a chat has changed
    { chat_id           :: Maybe Int                         -- ^ Chat identifier
    , message_sender_id :: Maybe MessageSender.MessageSender -- ^ New value of message_sender_id; may be null if the user can't change message sender
    }
  | UpdateChatMessageAutoDeleteTime -- ^ The message auto-delete or self-destruct timer setting for a chat was changed
    { chat_id                  :: Maybe Int -- ^ Chat identifier
    , message_auto_delete_time :: Maybe Int -- ^ New value of message_auto_delete_time
    }
  | UpdateChatNotificationSettings -- ^ Notification settings for a chat were changed
    { chat_id               :: Maybe Int                                               -- ^ Chat identifier
    , notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ The new notification settings
    }
  | UpdateChatPendingJoinRequests -- ^ The chat pending join requests were changed
    { chat_id               :: Maybe Int                                       -- ^ Chat identifier
    , pending_join_requests :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo -- ^ The new data about pending join requests; may be null
    }
  | UpdateChatReplyMarkup -- ^ The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
    { chat_id                 :: Maybe Int -- ^ Chat identifier
    , reply_markup_message_id :: Maybe Int -- ^ Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    }
  | UpdateChatBackground -- ^ The chat background was changed
    { chat_id    :: Maybe Int                           -- ^ Chat identifier
    , background :: Maybe ChatBackground.ChatBackground -- ^ The new chat background; may be null if background was reset to default
    }
  | UpdateChatTheme -- ^ The chat theme was changed
    { chat_id    :: Maybe Int    -- ^ Chat identifier
    , theme_name :: Maybe T.Text -- ^ The new name of the chat theme; may be empty if theme was reset to default
    }
  | UpdateChatUnreadMentionCount -- ^ The chat unread_mention_count has changed
    { chat_id              :: Maybe Int -- ^ Chat identifier
    , unread_mention_count :: Maybe Int -- ^ The number of unread mention messages left in the chat
    }
  | UpdateChatUnreadReactionCount -- ^ The chat unread_reaction_count has changed
    { chat_id               :: Maybe Int -- ^ Chat identifier
    , unread_reaction_count :: Maybe Int -- ^ The number of messages with unread reactions left in the chat
    }
  | UpdateChatVideoChat -- ^ A chat video chat state has changed
    { chat_id    :: Maybe Int                 -- ^ Chat identifier
    , video_chat :: Maybe VideoChat.VideoChat -- ^ New value of video_chat
    }
  | UpdateChatDefaultDisableNotification -- ^ The value of the default disable_notification parameter, used when a message is sent to the chat, was changed
    { chat_id                      :: Maybe Int  -- ^ Chat identifier
    , default_disable_notification :: Maybe Bool -- ^ The new default_disable_notification value
    }
  | UpdateChatHasProtectedContent -- ^ A chat content was allowed or restricted for saving
    { chat_id               :: Maybe Int  -- ^ Chat identifier
    , has_protected_content :: Maybe Bool -- ^ New value of has_protected_content
    }
  | UpdateChatIsTranslatable -- ^ Translation of chat messages was enabled or disabled
    { chat_id         :: Maybe Int  -- ^ Chat identifier
    , is_translatable :: Maybe Bool -- ^ New value of is_translatable
    }
  | UpdateChatIsMarkedAsUnread -- ^ A chat was marked as unread or was read
    { chat_id             :: Maybe Int  -- ^ Chat identifier
    , is_marked_as_unread :: Maybe Bool -- ^ New value of is_marked_as_unread
    }
  | UpdateChatIsBlocked -- ^ A chat was blocked or unblocked
    { chat_id    :: Maybe Int  -- ^ Chat identifier
    , is_blocked :: Maybe Bool -- ^ New value of is_blocked
    }
  | UpdateChatHasScheduledMessages -- ^ A chat's has_scheduled_messages field has changed
    { chat_id                :: Maybe Int  -- ^ Chat identifier
    , has_scheduled_messages :: Maybe Bool -- ^ New value of has_scheduled_messages
    }
  | UpdateChatFolders -- ^ The list of chat folders or a chat folder has changed
    { chat_folders            :: Maybe [ChatFolderInfo.ChatFolderInfo] -- ^ The new list of chat folders
    , main_chat_list_position :: Maybe Int                             -- ^ Position of the main chat list among chat folders, 0-based
    }
  | UpdateChatOnlineMemberCount -- ^ The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats. There is no guarantee that it will be sent just after the number of online users has changed
    { chat_id             :: Maybe Int -- ^ Identifier of the chat
    , online_member_count :: Maybe Int -- ^ New number of online members in the chat, or 0 if unknown
    }
  | UpdateForumTopicInfo -- ^ Basic information about a topic in a forum chat was changed
    { chat_id :: Maybe Int                           -- ^ Chat identifier
    , info    :: Maybe ForumTopicInfo.ForumTopicInfo -- ^ New information about the topic
    }
  | UpdateScopeNotificationSettings -- ^ Notification settings for some type of chats were updated
    { scope                  :: Maybe NotificationSettingsScope.NotificationSettingsScope -- ^ Types of chats for which notification settings were updated
    , _notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings -- ^ The new notification settings
    }
  | UpdateNotification -- ^ A notification was changed
    { notification_group_id :: Maybe Int                       -- ^ Unique notification group identifier
    , notification          :: Maybe Notification.Notification -- ^ Changed notification
    }
  | UpdateNotificationGroup -- ^ A list of active notifications in a notification group has changed
    { notification_group_id         :: Maybe Int                                         -- ^ Unique notification group identifier
    , _type                         :: Maybe NotificationGroupType.NotificationGroupType -- ^ New type of the notification group
    , chat_id                       :: Maybe Int                                         -- ^ Identifier of a chat to which all notifications in the group belong
    , notification_settings_chat_id :: Maybe Int                                         -- ^ Chat identifier, which notification settings must be applied to the added notifications
    , notification_sound_id         :: Maybe Int                                         -- ^ Identifier of the notification sound to be played; 0 if sound is disabled
    , total_count                   :: Maybe Int                                         -- ^ Total number of unread notifications in the group, can be bigger than number of active notifications
    , added_notifications           :: Maybe [Notification.Notification]                 -- ^ List of added group notifications, sorted by notification ID
    , removed_notification_ids      :: Maybe [Int]                                       -- ^ Identifiers of removed group notifications, sorted by notification ID
    }
  | UpdateActiveNotifications -- ^ Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update
    { groups :: Maybe [NotificationGroup.NotificationGroup] -- ^ Lists of active notification groups
    }
  | UpdateHavePendingNotifications -- ^ Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
    { have_delayed_notifications    :: Maybe Bool -- ^ True, if there are some delayed notification updates, which will be sent soon
    , have_unreceived_notifications :: Maybe Bool -- ^ True, if there can be some yet unreceived notifications, which are being fetched from the server
    }
  | UpdateDeleteMessages -- ^ Some messages were deleted
    { chat_id      :: Maybe Int   -- ^ Chat identifier
    , message_ids  :: Maybe [Int] -- ^ Identifiers of the deleted messages
    , is_permanent :: Maybe Bool  -- ^ True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
    , from_cache   :: Maybe Bool  -- ^ True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
    }
  | UpdateChatAction -- ^ A message sender activity in the chat has changed
    { chat_id           :: Maybe Int                         -- ^ Chat identifier
    , message_thread_id :: Maybe Int                         -- ^ If not 0, a message thread identifier in which the action was performed
    , sender_id         :: Maybe MessageSender.MessageSender -- ^ Identifier of a message sender performing the action
    , action            :: Maybe ChatAction.ChatAction       -- ^ The action
    }
  | UpdateUserStatus -- ^ The user went online or offline
    { user_id :: Maybe Int                   -- ^ User identifier
    , status  :: Maybe UserStatus.UserStatus -- ^ New status of the user
    }
  | UpdateUser -- ^ Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
    { user :: Maybe User.User -- ^ New data about the user
    }
  | UpdateBasicGroup -- ^ Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
    { basic_group :: Maybe BasicGroup.BasicGroup -- ^ New data about the group
    }
  | UpdateSupergroup -- ^ Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
    { supergroup :: Maybe Supergroup.Supergroup -- ^ New data about the supergroup
    }
  | UpdateSecretChat -- ^ Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application
    { secret_chat :: Maybe SecretChat.SecretChat -- ^ New data about the secret chat
    }
  | UpdateUserFullInfo -- ^ Some data in userFullInfo has been changed
    { user_id        :: Maybe Int                       -- ^ User identifier
    , user_full_info :: Maybe UserFullInfo.UserFullInfo -- ^ New full information about the user
    }
  | UpdateBasicGroupFullInfo -- ^ Some data in basicGroupFullInfo has been changed
    { basic_group_id        :: Maybe Int                                   -- ^ Identifier of a basic group
    , basic_group_full_info :: Maybe BasicGroupFullInfo.BasicGroupFullInfo -- ^ New full information about the group
    }
  | UpdateSupergroupFullInfo -- ^ Some data in supergroupFullInfo has been changed
    { supergroup_id        :: Maybe Int                                   -- ^ Identifier of the supergroup or channel
    , supergroup_full_info :: Maybe SupergroupFullInfo.SupergroupFullInfo -- ^ New full information about the supergroup
    }
  | UpdateServiceNotification -- ^ A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification
    { __type  :: Maybe T.Text                        -- ^ Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
    , content :: Maybe MessageContent.MessageContent -- ^ Notification content
    }
  | UpdateFile -- ^ Information about a file was updated
    { file :: Maybe File.File -- ^ New data about the file
    }
  | UpdateFileGenerationStart -- ^ The file generation process needs to be started by the application
    { generation_id    :: Maybe Int    -- ^ Unique identifier for the generation process
    , original_path    :: Maybe T.Text -- ^ The path to a file from which a new file is generated; may be empty
    , destination_path :: Maybe T.Text -- ^ The path to a file that must be created and where the new file is generated
    , conversion       :: Maybe T.Text -- ^ String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which must be downloaded by the application
    }
  | UpdateFileGenerationStop -- ^ File generation is no longer needed
    { generation_id :: Maybe Int -- ^ Unique identifier for the generation process
    }
  | UpdateFileDownloads -- ^ The state of the file download list has changed
    { total_size      :: Maybe Int -- ^ Total size of files in the file download list, in bytes
    , total_count     :: Maybe Int -- ^ Total number of files in the file download list
    , downloaded_size :: Maybe Int -- ^ Total downloaded size of files in the file download list, in bytes
    }
  | UpdateFileAddedToDownloads -- ^ A file was added to the file download list. This update is sent only after file download list is loaded for the first time
    { file_download :: Maybe FileDownload.FileDownload                 -- ^ The added file download
    , counts        :: Maybe DownloadedFileCounts.DownloadedFileCounts -- ^ New number of being downloaded and recently downloaded files found
    }
  | UpdateFileDownload -- ^ A file download was changed. This update is sent only after file download list is loaded for the first time
    { file_id       :: Maybe Int                                       -- ^ File identifier
    , complete_date :: Maybe Int                                       -- ^ Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
    , is_paused     :: Maybe Bool                                      -- ^ True, if downloading of the file is paused
    , counts        :: Maybe DownloadedFileCounts.DownloadedFileCounts -- ^ New number of being downloaded and recently downloaded files found
    }
  | UpdateFileRemovedFromDownloads -- ^ A file was removed from the file download list. This update is sent only after file download list is loaded for the first time
    { file_id :: Maybe Int                                       -- ^ File identifier
    , counts  :: Maybe DownloadedFileCounts.DownloadedFileCounts -- ^ New number of being downloaded and recently downloaded files found
    }
  | UpdateCall -- ^ New call was created or information about a call was updated
    { call :: Maybe Call.Call -- ^ New data about a call
    }
  | UpdateGroupCall -- ^ Information about a group call was updated
    { group_call :: Maybe GroupCall.GroupCall -- ^ New data about a group call
    }
  | UpdateGroupCallParticipant -- ^ Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
    { group_call_id :: Maybe Int                                       -- ^ Identifier of group call
    , participant   :: Maybe GroupCallParticipant.GroupCallParticipant -- ^ New data about a participant
    }
  | UpdateNewCallSignalingData -- ^ New call signaling data arrived
    { call_id :: Maybe Int           -- ^ The call identifier
    , _data   :: Maybe BS.ByteString -- ^ The data
    }
  | UpdateUserPrivacySettingRules -- ^ Some privacy setting rules have been changed
    { setting :: Maybe UserPrivacySetting.UserPrivacySetting           -- ^ The privacy setting
    , rules   :: Maybe UserPrivacySettingRules.UserPrivacySettingRules -- ^ New privacy rules
    }
  | UpdateUnreadMessageCount -- ^ Number of unread messages in a chat list has changed. This update is sent only if the message database is used
    { chat_list            :: Maybe ChatList.ChatList -- ^ The chat list with changed number of unread messages
    , unread_count         :: Maybe Int               -- ^ Total number of unread messages
    , unread_unmuted_count :: Maybe Int               -- ^ Total number of unread messages in unmuted chats
    }
  | UpdateUnreadChatCount -- ^ Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
    { chat_list                      :: Maybe ChatList.ChatList -- ^ The chat list with changed number of unread messages
    , total_count                    :: Maybe Int               -- ^ Approximate total number of chats in the chat list
    , unread_count                   :: Maybe Int               -- ^ Total number of unread chats
    , unread_unmuted_count           :: Maybe Int               -- ^ Total number of unread unmuted chats
    , marked_as_unread_count         :: Maybe Int               -- ^ Total number of chats marked as unread
    , marked_as_unread_unmuted_count :: Maybe Int               -- ^ Total number of unmuted chats marked as unread
    }
  | UpdateStory -- ^ A story was changed
    { story :: Maybe Story.Story -- ^ The new information about the story
    }
  | UpdateStoryDeleted -- ^ A story became inaccessible
    { story_sender_chat_id :: Maybe Int -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int -- ^ Story identifier
    }
  | UpdateChatActiveStories -- ^ The list of active stories posted by a specific chat has changed
    { active_stories :: Maybe ChatActiveStories.ChatActiveStories -- ^ The new list of active stories
    }
  | UpdateStoryListChatCount -- ^ Number of chats in a story list has changed
    { story_list :: Maybe StoryList.StoryList -- ^ The story list
    , chat_count :: Maybe Int                 -- ^ Approximate total number of chats with active stories in the list
    }
  | UpdateOption -- ^ An option changed its value
    { name  :: Maybe T.Text                  -- ^ The option name
    , value :: Maybe OptionValue.OptionValue -- ^ The new option value
    }
  | UpdateStickerSet -- ^ A sticker set has changed
    { sticker_set :: Maybe StickerSet.StickerSet -- ^ The sticker set
    }
  | UpdateInstalledStickerSets -- ^ The list of installed sticker sets was updated
    { sticker_type    :: Maybe StickerType.StickerType -- ^ Type of the affected stickers
    , sticker_set_ids :: Maybe [Int]                   -- ^ The new list of installed ordinary sticker sets
    }
  | UpdateTrendingStickerSets -- ^ The list of trending sticker sets was updated or some of them were viewed
    { sticker_type :: Maybe StickerType.StickerType                 -- ^ Type of the affected stickers
    , sticker_sets :: Maybe TrendingStickerSets.TrendingStickerSets -- ^ The prefix of the list of trending sticker sets with the newest trending sticker sets
    }
  | UpdateRecentStickers -- ^ The list of recently used stickers was updated
    { is_attached :: Maybe Bool  -- ^ True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated
    , sticker_ids :: Maybe [Int] -- ^ The new list of file identifiers of recently used stickers
    }
  | UpdateFavoriteStickers -- ^ The list of favorite stickers was updated
    { sticker_ids :: Maybe [Int] -- ^ The new list of file identifiers of favorite stickers
    }
  | UpdateSavedAnimations -- ^ The list of saved animations was updated
    { animation_ids :: Maybe [Int] -- ^ The new list of file identifiers of saved animations
    }
  | UpdateSavedNotificationSounds -- ^ The list of saved notifications sounds was updated. This update may not be sent until information about a notification sound was requested for the first time
    { notification_sound_ids :: Maybe [Int] -- ^ The new list of identifiers of saved notification sounds
    }
  | UpdateSelectedBackground -- ^ The selected background has changed
    { for_dark_theme :: Maybe Bool                  -- ^ True, if background for dark theme has changed
    , _background    :: Maybe Background.Background -- ^ The new selected background; may be null
    }
  | UpdateChatThemes -- ^ The list of available chat themes has changed
    { chat_themes :: Maybe [ChatTheme.ChatTheme] -- ^ The new list of chat themes
    }
  | UpdateLanguagePackStrings -- ^ Some language pack strings have been updated
    { localization_target :: Maybe T.Text                                  -- ^ Localization target to which the language pack belongs
    , language_pack_id    :: Maybe T.Text                                  -- ^ Identifier of the updated language pack
    , strings             :: Maybe [LanguagePackString.LanguagePackString] -- ^ List of changed language pack strings; empty if all strings have changed
    }
  | UpdateConnectionState -- ^ The connection state has changed. This update must be used only to show a human-readable description of the connection state
    { state :: Maybe ConnectionState.ConnectionState -- ^ The new connection state
    }
  | UpdateTermsOfService -- ^ New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update"
    { terms_of_service_id :: Maybe T.Text                        -- ^ Identifier of the terms of service
    , terms_of_service    :: Maybe TermsOfService.TermsOfService -- ^ The new terms of service
    }
  | UpdateUsersNearby -- ^ The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request
    { users_nearby :: Maybe [ChatNearby.ChatNearby] -- ^ The new list of users nearby
    }
  | UpdateAttachmentMenuBots -- ^ The list of bots added to attachment menu has changed
    { bots :: Maybe [AttachmentMenuBot.AttachmentMenuBot] -- ^ The new list of bots added to attachment menu. The bots must not be shown on scheduled messages screen
    }
  | UpdateWebAppMessageSent -- ^ A message was sent by an opened Web App, so the Web App needs to be closed
    { web_app_launch_id :: Maybe Int -- ^ Identifier of Web App launch
    }
  | UpdateActiveEmojiReactions -- ^ The list of active emoji reactions has changed
    { emojis :: Maybe [T.Text] -- ^ The new list of active emoji reactions
    }
  | UpdateDefaultReactionType -- ^ The type of default reaction has changed
    { reaction_type :: Maybe ReactionType.ReactionType -- ^ The new type of the default reaction
    }
  | UpdateDiceEmojis -- ^ The list of supported dice emojis has changed
    { emojis :: Maybe [T.Text] -- ^ The new list of supported dice emojis
    }
  | UpdateAnimatedEmojiMessageClicked -- ^ Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
    { chat_id    :: Maybe Int             -- ^ Chat identifier
    , message_id :: Maybe Int             -- ^ Message identifier
    , sticker    :: Maybe Sticker.Sticker -- ^ The animated sticker to be played
    }
  | UpdateAnimationSearchParameters -- ^ The parameters of animation search through getOption("animation_search_bot_username") bot has changed
    { provider :: Maybe T.Text   -- ^ Name of the animation search provider
    , emojis   :: Maybe [T.Text] -- ^ The new list of emojis suggested for searching
    }
  | UpdateSuggestedActions -- ^ The list of suggested to the user actions has changed
    { added_actions   :: Maybe [SuggestedAction.SuggestedAction] -- ^ Added suggested actions
    , removed_actions :: Maybe [SuggestedAction.SuggestedAction] -- ^ Removed suggested actions
    }
  | UpdateAddChatMembersPrivacyForbidden -- ^ Adding users to a chat has failed because of their privacy settings. An invite link can be shared with the users if appropriate
    { chat_id  :: Maybe Int   -- ^ Chat identifier
    , user_ids :: Maybe [Int] -- ^ Identifiers of users, which weren't added because of their privacy settings
    }
  | UpdateAutosaveSettings -- ^ Autosave settings for some type of chats were updated
    { _scope   :: Maybe AutosaveSettingsScope.AutosaveSettingsScope -- ^ Type of chats for which autosave settings were updated
    , settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings -- ^ The new autosave settings; may be null if the settings are reset to default
    }
  | UpdateNewInlineQuery -- ^ A new incoming inline query; for bots only
    { _id            :: Maybe Int               -- ^ Unique query identifier
    , sender_user_id :: Maybe Int               -- ^ Identifier of the user who sent the query
    , user_location  :: Maybe Location.Location -- ^ User location; may be null
    , chat_type      :: Maybe ChatType.ChatType -- ^ The type of the chat from which the query originated; may be null if unknown
    , query          :: Maybe T.Text            -- ^ Text of the query
    , offset         :: Maybe T.Text            -- ^ Offset of the first entry to return
    }
  | UpdateNewChosenInlineResult -- ^ The user has chosen a result of an inline query; for bots only
    { sender_user_id    :: Maybe Int               -- ^ Identifier of the user who sent the query
    , user_location     :: Maybe Location.Location -- ^ User location; may be null
    , query             :: Maybe T.Text            -- ^ Text of the query
    , result_id         :: Maybe T.Text            -- ^ Identifier of the chosen result
    , inline_message_id :: Maybe T.Text            -- ^ Identifier of the sent inline message, if known
    }
  | UpdateNewCallbackQuery -- ^ A new incoming callback query; for bots only
    { _id            :: Maybe Int                                       -- ^ Unique query identifier
    , sender_user_id :: Maybe Int                                       -- ^ Identifier of the user who sent the query
    , chat_id        :: Maybe Int                                       -- ^ Identifier of the chat where the query was sent
    , message_id     :: Maybe Int                                       -- ^ Identifier of the message from which the query originated
    , chat_instance  :: Maybe Int                                       -- ^ Identifier that uniquely corresponds to the chat to which the message was sent
    , payload        :: Maybe CallbackQueryPayload.CallbackQueryPayload -- ^ Query payload
    }
  | UpdateNewInlineCallbackQuery -- ^ A new incoming callback query from a message sent via a bot; for bots only
    { _id               :: Maybe Int                                       -- ^ Unique query identifier
    , sender_user_id    :: Maybe Int                                       -- ^ Identifier of the user who sent the query
    , inline_message_id :: Maybe T.Text                                    -- ^ Identifier of the inline message from which the query originated
    , chat_instance     :: Maybe Int                                       -- ^ An identifier uniquely corresponding to the chat a message was sent to
    , payload           :: Maybe CallbackQueryPayload.CallbackQueryPayload -- ^ Query payload
    }
  | UpdateNewShippingQuery -- ^ A new incoming shipping query; for bots only. Only for invoices with flexible price
    { _id              :: Maybe Int             -- ^ Unique query identifier
    , sender_user_id   :: Maybe Int             -- ^ Identifier of the user who sent the query
    , invoice_payload  :: Maybe T.Text          -- ^ Invoice payload
    , shipping_address :: Maybe Address.Address -- ^ User shipping address
    }
  | UpdateNewPreCheckoutQuery -- ^ A new incoming pre-checkout query; for bots only. Contains full information about a checkout
    { _id                :: Maybe Int                 -- ^ Unique query identifier
    , sender_user_id     :: Maybe Int                 -- ^ Identifier of the user who sent the query
    , currency           :: Maybe T.Text              -- ^ Currency for the product price
    , total_amount       :: Maybe Int                 -- ^ Total price for the product, in the smallest units of the currency
    , _invoice_payload   :: Maybe BS.ByteString       -- ^ Invoice payload
    , shipping_option_id :: Maybe T.Text              -- ^ Identifier of a shipping option chosen by the user; may be empty if not applicable
    , order_info         :: Maybe OrderInfo.OrderInfo -- ^ Information about the order; may be null
    }
  | UpdateNewCustomEvent -- ^ A new incoming event; for bots only
    { event :: Maybe T.Text -- ^ A JSON-serialized event
    }
  | UpdateNewCustomQuery -- ^ A new incoming query; for bots only
    { _id     :: Maybe Int    -- ^ The query identifier
    , __data  :: Maybe T.Text -- ^ JSON-serialized query data
    , timeout :: Maybe Int    -- ^ Query timeout
    }
  | UpdatePoll -- ^ A poll was updated; for bots only
    { poll :: Maybe Poll.Poll -- ^ New data about the poll
    }
  | UpdatePollAnswer -- ^ A user changed the answer to a poll; for bots only
    { poll_id    :: Maybe Int                         -- ^ Unique poll identifier
    , voter_id   :: Maybe MessageSender.MessageSender -- ^ Identifier of the message sender that changed the answer to the poll
    , option_ids :: Maybe [Int]                       -- ^ 0-based identifiers of answer options, chosen by the user
    }
  | UpdateChatMember -- ^ User rights changed in a chat; for bots only
    { chat_id                     :: Maybe Int                           -- ^ Chat identifier
    , actor_user_id               :: Maybe Int                           -- ^ Identifier of the user, changing the rights
    , date                        :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the user rights was changed
    , invite_link                 :: Maybe ChatInviteLink.ChatInviteLink -- ^ If user has joined the chat using an invite link, the invite link; may be null
    , via_chat_folder_invite_link :: Maybe Bool                          -- ^ True, if the user has joined the chat using an invite link for a chat folder
    , old_chat_member             :: Maybe ChatMember.ChatMember         -- ^ Previous chat member
    , new_chat_member             :: Maybe ChatMember.ChatMember         -- ^ New chat member
    }
  | UpdateNewChatJoinRequest -- ^ A user sent a join request to a chat; for bots only
    { chat_id      :: Maybe Int                             -- ^ Chat identifier
    , request      :: Maybe ChatJoinRequest.ChatJoinRequest -- ^ Join request
    , user_chat_id :: Maybe Int                             -- ^ Chat identifier of the private chat with the user
    , invite_link  :: Maybe ChatInviteLink.ChatInviteLink   -- ^ The invite link, which was used to send join request; may be null
    }
  deriving (Eq)

instance Show Update where
  show UpdateAuthorizationState
    { authorization_state = authorization_state_
    }
      = "UpdateAuthorizationState"
        ++ I.cc
        [ "authorization_state" `I.p` authorization_state_
        ]
  show UpdateNewMessage
    { message = message_
    }
      = "UpdateNewMessage"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  show UpdateMessageSendAcknowledged
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "UpdateMessageSendAcknowledged"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  show UpdateMessageSendSucceeded
    { message        = message_
    , old_message_id = old_message_id_
    }
      = "UpdateMessageSendSucceeded"
        ++ I.cc
        [ "message"        `I.p` message_
        , "old_message_id" `I.p` old_message_id_
        ]
  show UpdateMessageSendFailed
    { message        = message_
    , old_message_id = old_message_id_
    , error_code     = error_code_
    , error_message  = error_message_
    }
      = "UpdateMessageSendFailed"
        ++ I.cc
        [ "message"        `I.p` message_
        , "old_message_id" `I.p` old_message_id_
        , "error_code"     `I.p` error_code_
        , "error_message"  `I.p` error_message_
        ]
  show UpdateMessageContent
    { chat_id     = chat_id_
    , message_id  = message_id_
    , new_content = new_content_
    }
      = "UpdateMessageContent"
        ++ I.cc
        [ "chat_id"     `I.p` chat_id_
        , "message_id"  `I.p` message_id_
        , "new_content" `I.p` new_content_
        ]
  show UpdateMessageEdited
    { chat_id      = chat_id_
    , message_id   = message_id_
    , edit_date    = edit_date_
    , reply_markup = reply_markup_
    }
      = "UpdateMessageEdited"
        ++ I.cc
        [ "chat_id"      `I.p` chat_id_
        , "message_id"   `I.p` message_id_
        , "edit_date"    `I.p` edit_date_
        , "reply_markup" `I.p` reply_markup_
        ]
  show UpdateMessageIsPinned
    { chat_id    = chat_id_
    , message_id = message_id_
    , is_pinned  = is_pinned_
    }
      = "UpdateMessageIsPinned"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        , "is_pinned"  `I.p` is_pinned_
        ]
  show UpdateMessageInteractionInfo
    { chat_id          = chat_id_
    , message_id       = message_id_
    , interaction_info = interaction_info_
    }
      = "UpdateMessageInteractionInfo"
        ++ I.cc
        [ "chat_id"          `I.p` chat_id_
        , "message_id"       `I.p` message_id_
        , "interaction_info" `I.p` interaction_info_
        ]
  show UpdateMessageContentOpened
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "UpdateMessageContentOpened"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  show UpdateMessageMentionRead
    { chat_id              = chat_id_
    , message_id           = message_id_
    , unread_mention_count = unread_mention_count_
    }
      = "UpdateMessageMentionRead"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "message_id"           `I.p` message_id_
        , "unread_mention_count" `I.p` unread_mention_count_
        ]
  show UpdateMessageUnreadReactions
    { chat_id               = chat_id_
    , message_id            = message_id_
    , unread_reactions      = unread_reactions_
    , unread_reaction_count = unread_reaction_count_
    }
      = "UpdateMessageUnreadReactions"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "message_id"            `I.p` message_id_
        , "unread_reactions"      `I.p` unread_reactions_
        , "unread_reaction_count" `I.p` unread_reaction_count_
        ]
  show UpdateMessageLiveLocationViewed
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "UpdateMessageLiveLocationViewed"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  show UpdateNewChat
    { chat = chat_
    }
      = "UpdateNewChat"
        ++ I.cc
        [ "chat" `I.p` chat_
        ]
  show UpdateChatTitle
    { chat_id = chat_id_
    , title   = title_
    }
      = "UpdateChatTitle"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "title"   `I.p` title_
        ]
  show UpdateChatPhoto
    { chat_id = chat_id_
    , photo   = photo_
    }
      = "UpdateChatPhoto"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "photo"   `I.p` photo_
        ]
  show UpdateChatPermissions
    { chat_id     = chat_id_
    , permissions = permissions_
    }
      = "UpdateChatPermissions"
        ++ I.cc
        [ "chat_id"     `I.p` chat_id_
        , "permissions" `I.p` permissions_
        ]
  show UpdateChatLastMessage
    { chat_id      = chat_id_
    , last_message = last_message_
    , positions    = positions_
    }
      = "UpdateChatLastMessage"
        ++ I.cc
        [ "chat_id"      `I.p` chat_id_
        , "last_message" `I.p` last_message_
        , "positions"    `I.p` positions_
        ]
  show UpdateChatPosition
    { chat_id  = chat_id_
    , position = position_
    }
      = "UpdateChatPosition"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "position" `I.p` position_
        ]
  show UpdateChatReadInbox
    { chat_id                    = chat_id_
    , last_read_inbox_message_id = last_read_inbox_message_id_
    , unread_count               = unread_count_
    }
      = "UpdateChatReadInbox"
        ++ I.cc
        [ "chat_id"                    `I.p` chat_id_
        , "last_read_inbox_message_id" `I.p` last_read_inbox_message_id_
        , "unread_count"               `I.p` unread_count_
        ]
  show UpdateChatReadOutbox
    { chat_id                     = chat_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    }
      = "UpdateChatReadOutbox"
        ++ I.cc
        [ "chat_id"                     `I.p` chat_id_
        , "last_read_outbox_message_id" `I.p` last_read_outbox_message_id_
        ]
  show UpdateChatActionBar
    { chat_id    = chat_id_
    , action_bar = action_bar_
    }
      = "UpdateChatActionBar"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "action_bar" `I.p` action_bar_
        ]
  show UpdateChatAvailableReactions
    { chat_id             = chat_id_
    , available_reactions = available_reactions_
    }
      = "UpdateChatAvailableReactions"
        ++ I.cc
        [ "chat_id"             `I.p` chat_id_
        , "available_reactions" `I.p` available_reactions_
        ]
  show UpdateChatDraftMessage
    { chat_id       = chat_id_
    , draft_message = draft_message_
    , positions     = positions_
    }
      = "UpdateChatDraftMessage"
        ++ I.cc
        [ "chat_id"       `I.p` chat_id_
        , "draft_message" `I.p` draft_message_
        , "positions"     `I.p` positions_
        ]
  show UpdateChatMessageSender
    { chat_id           = chat_id_
    , message_sender_id = message_sender_id_
    }
      = "UpdateChatMessageSender"
        ++ I.cc
        [ "chat_id"           `I.p` chat_id_
        , "message_sender_id" `I.p` message_sender_id_
        ]
  show UpdateChatMessageAutoDeleteTime
    { chat_id                  = chat_id_
    , message_auto_delete_time = message_auto_delete_time_
    }
      = "UpdateChatMessageAutoDeleteTime"
        ++ I.cc
        [ "chat_id"                  `I.p` chat_id_
        , "message_auto_delete_time" `I.p` message_auto_delete_time_
        ]
  show UpdateChatNotificationSettings
    { chat_id               = chat_id_
    , notification_settings = notification_settings_
    }
      = "UpdateChatNotificationSettings"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "notification_settings" `I.p` notification_settings_
        ]
  show UpdateChatPendingJoinRequests
    { chat_id               = chat_id_
    , pending_join_requests = pending_join_requests_
    }
      = "UpdateChatPendingJoinRequests"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "pending_join_requests" `I.p` pending_join_requests_
        ]
  show UpdateChatReplyMarkup
    { chat_id                 = chat_id_
    , reply_markup_message_id = reply_markup_message_id_
    }
      = "UpdateChatReplyMarkup"
        ++ I.cc
        [ "chat_id"                 `I.p` chat_id_
        , "reply_markup_message_id" `I.p` reply_markup_message_id_
        ]
  show UpdateChatBackground
    { chat_id    = chat_id_
    , background = background_
    }
      = "UpdateChatBackground"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "background" `I.p` background_
        ]
  show UpdateChatTheme
    { chat_id    = chat_id_
    , theme_name = theme_name_
    }
      = "UpdateChatTheme"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "theme_name" `I.p` theme_name_
        ]
  show UpdateChatUnreadMentionCount
    { chat_id              = chat_id_
    , unread_mention_count = unread_mention_count_
    }
      = "UpdateChatUnreadMentionCount"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "unread_mention_count" `I.p` unread_mention_count_
        ]
  show UpdateChatUnreadReactionCount
    { chat_id               = chat_id_
    , unread_reaction_count = unread_reaction_count_
    }
      = "UpdateChatUnreadReactionCount"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "unread_reaction_count" `I.p` unread_reaction_count_
        ]
  show UpdateChatVideoChat
    { chat_id    = chat_id_
    , video_chat = video_chat_
    }
      = "UpdateChatVideoChat"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "video_chat" `I.p` video_chat_
        ]
  show UpdateChatDefaultDisableNotification
    { chat_id                      = chat_id_
    , default_disable_notification = default_disable_notification_
    }
      = "UpdateChatDefaultDisableNotification"
        ++ I.cc
        [ "chat_id"                      `I.p` chat_id_
        , "default_disable_notification" `I.p` default_disable_notification_
        ]
  show UpdateChatHasProtectedContent
    { chat_id               = chat_id_
    , has_protected_content = has_protected_content_
    }
      = "UpdateChatHasProtectedContent"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "has_protected_content" `I.p` has_protected_content_
        ]
  show UpdateChatIsTranslatable
    { chat_id         = chat_id_
    , is_translatable = is_translatable_
    }
      = "UpdateChatIsTranslatable"
        ++ I.cc
        [ "chat_id"         `I.p` chat_id_
        , "is_translatable" `I.p` is_translatable_
        ]
  show UpdateChatIsMarkedAsUnread
    { chat_id             = chat_id_
    , is_marked_as_unread = is_marked_as_unread_
    }
      = "UpdateChatIsMarkedAsUnread"
        ++ I.cc
        [ "chat_id"             `I.p` chat_id_
        , "is_marked_as_unread" `I.p` is_marked_as_unread_
        ]
  show UpdateChatIsBlocked
    { chat_id    = chat_id_
    , is_blocked = is_blocked_
    }
      = "UpdateChatIsBlocked"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "is_blocked" `I.p` is_blocked_
        ]
  show UpdateChatHasScheduledMessages
    { chat_id                = chat_id_
    , has_scheduled_messages = has_scheduled_messages_
    }
      = "UpdateChatHasScheduledMessages"
        ++ I.cc
        [ "chat_id"                `I.p` chat_id_
        , "has_scheduled_messages" `I.p` has_scheduled_messages_
        ]
  show UpdateChatFolders
    { chat_folders            = chat_folders_
    , main_chat_list_position = main_chat_list_position_
    }
      = "UpdateChatFolders"
        ++ I.cc
        [ "chat_folders"            `I.p` chat_folders_
        , "main_chat_list_position" `I.p` main_chat_list_position_
        ]
  show UpdateChatOnlineMemberCount
    { chat_id             = chat_id_
    , online_member_count = online_member_count_
    }
      = "UpdateChatOnlineMemberCount"
        ++ I.cc
        [ "chat_id"             `I.p` chat_id_
        , "online_member_count" `I.p` online_member_count_
        ]
  show UpdateForumTopicInfo
    { chat_id = chat_id_
    , info    = info_
    }
      = "UpdateForumTopicInfo"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "info"    `I.p` info_
        ]
  show UpdateScopeNotificationSettings
    { scope                  = scope_
    , _notification_settings = _notification_settings_
    }
      = "UpdateScopeNotificationSettings"
        ++ I.cc
        [ "scope"                  `I.p` scope_
        , "_notification_settings" `I.p` _notification_settings_
        ]
  show UpdateNotification
    { notification_group_id = notification_group_id_
    , notification          = notification_
    }
      = "UpdateNotification"
        ++ I.cc
        [ "notification_group_id" `I.p` notification_group_id_
        , "notification"          `I.p` notification_
        ]
  show UpdateNotificationGroup
    { notification_group_id         = notification_group_id_
    , _type                         = _type_
    , chat_id                       = chat_id_
    , notification_settings_chat_id = notification_settings_chat_id_
    , notification_sound_id         = notification_sound_id_
    , total_count                   = total_count_
    , added_notifications           = added_notifications_
    , removed_notification_ids      = removed_notification_ids_
    }
      = "UpdateNotificationGroup"
        ++ I.cc
        [ "notification_group_id"         `I.p` notification_group_id_
        , "_type"                         `I.p` _type_
        , "chat_id"                       `I.p` chat_id_
        , "notification_settings_chat_id" `I.p` notification_settings_chat_id_
        , "notification_sound_id"         `I.p` notification_sound_id_
        , "total_count"                   `I.p` total_count_
        , "added_notifications"           `I.p` added_notifications_
        , "removed_notification_ids"      `I.p` removed_notification_ids_
        ]
  show UpdateActiveNotifications
    { groups = groups_
    }
      = "UpdateActiveNotifications"
        ++ I.cc
        [ "groups" `I.p` groups_
        ]
  show UpdateHavePendingNotifications
    { have_delayed_notifications    = have_delayed_notifications_
    , have_unreceived_notifications = have_unreceived_notifications_
    }
      = "UpdateHavePendingNotifications"
        ++ I.cc
        [ "have_delayed_notifications"    `I.p` have_delayed_notifications_
        , "have_unreceived_notifications" `I.p` have_unreceived_notifications_
        ]
  show UpdateDeleteMessages
    { chat_id      = chat_id_
    , message_ids  = message_ids_
    , is_permanent = is_permanent_
    , from_cache   = from_cache_
    }
      = "UpdateDeleteMessages"
        ++ I.cc
        [ "chat_id"      `I.p` chat_id_
        , "message_ids"  `I.p` message_ids_
        , "is_permanent" `I.p` is_permanent_
        , "from_cache"   `I.p` from_cache_
        ]
  show UpdateChatAction
    { chat_id           = chat_id_
    , message_thread_id = message_thread_id_
    , sender_id         = sender_id_
    , action            = action_
    }
      = "UpdateChatAction"
        ++ I.cc
        [ "chat_id"           `I.p` chat_id_
        , "message_thread_id" `I.p` message_thread_id_
        , "sender_id"         `I.p` sender_id_
        , "action"            `I.p` action_
        ]
  show UpdateUserStatus
    { user_id = user_id_
    , status  = status_
    }
      = "UpdateUserStatus"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "status"  `I.p` status_
        ]
  show UpdateUser
    { user = user_
    }
      = "UpdateUser"
        ++ I.cc
        [ "user" `I.p` user_
        ]
  show UpdateBasicGroup
    { basic_group = basic_group_
    }
      = "UpdateBasicGroup"
        ++ I.cc
        [ "basic_group" `I.p` basic_group_
        ]
  show UpdateSupergroup
    { supergroup = supergroup_
    }
      = "UpdateSupergroup"
        ++ I.cc
        [ "supergroup" `I.p` supergroup_
        ]
  show UpdateSecretChat
    { secret_chat = secret_chat_
    }
      = "UpdateSecretChat"
        ++ I.cc
        [ "secret_chat" `I.p` secret_chat_
        ]
  show UpdateUserFullInfo
    { user_id        = user_id_
    , user_full_info = user_full_info_
    }
      = "UpdateUserFullInfo"
        ++ I.cc
        [ "user_id"        `I.p` user_id_
        , "user_full_info" `I.p` user_full_info_
        ]
  show UpdateBasicGroupFullInfo
    { basic_group_id        = basic_group_id_
    , basic_group_full_info = basic_group_full_info_
    }
      = "UpdateBasicGroupFullInfo"
        ++ I.cc
        [ "basic_group_id"        `I.p` basic_group_id_
        , "basic_group_full_info" `I.p` basic_group_full_info_
        ]
  show UpdateSupergroupFullInfo
    { supergroup_id        = supergroup_id_
    , supergroup_full_info = supergroup_full_info_
    }
      = "UpdateSupergroupFullInfo"
        ++ I.cc
        [ "supergroup_id"        `I.p` supergroup_id_
        , "supergroup_full_info" `I.p` supergroup_full_info_
        ]
  show UpdateServiceNotification
    { __type  = __type_
    , content = content_
    }
      = "UpdateServiceNotification"
        ++ I.cc
        [ "__type"  `I.p` __type_
        , "content" `I.p` content_
        ]
  show UpdateFile
    { file = file_
    }
      = "UpdateFile"
        ++ I.cc
        [ "file" `I.p` file_
        ]
  show UpdateFileGenerationStart
    { generation_id    = generation_id_
    , original_path    = original_path_
    , destination_path = destination_path_
    , conversion       = conversion_
    }
      = "UpdateFileGenerationStart"
        ++ I.cc
        [ "generation_id"    `I.p` generation_id_
        , "original_path"    `I.p` original_path_
        , "destination_path" `I.p` destination_path_
        , "conversion"       `I.p` conversion_
        ]
  show UpdateFileGenerationStop
    { generation_id = generation_id_
    }
      = "UpdateFileGenerationStop"
        ++ I.cc
        [ "generation_id" `I.p` generation_id_
        ]
  show UpdateFileDownloads
    { total_size      = total_size_
    , total_count     = total_count_
    , downloaded_size = downloaded_size_
    }
      = "UpdateFileDownloads"
        ++ I.cc
        [ "total_size"      `I.p` total_size_
        , "total_count"     `I.p` total_count_
        , "downloaded_size" `I.p` downloaded_size_
        ]
  show UpdateFileAddedToDownloads
    { file_download = file_download_
    , counts        = counts_
    }
      = "UpdateFileAddedToDownloads"
        ++ I.cc
        [ "file_download" `I.p` file_download_
        , "counts"        `I.p` counts_
        ]
  show UpdateFileDownload
    { file_id       = file_id_
    , complete_date = complete_date_
    , is_paused     = is_paused_
    , counts        = counts_
    }
      = "UpdateFileDownload"
        ++ I.cc
        [ "file_id"       `I.p` file_id_
        , "complete_date" `I.p` complete_date_
        , "is_paused"     `I.p` is_paused_
        , "counts"        `I.p` counts_
        ]
  show UpdateFileRemovedFromDownloads
    { file_id = file_id_
    , counts  = counts_
    }
      = "UpdateFileRemovedFromDownloads"
        ++ I.cc
        [ "file_id" `I.p` file_id_
        , "counts"  `I.p` counts_
        ]
  show UpdateCall
    { call = call_
    }
      = "UpdateCall"
        ++ I.cc
        [ "call" `I.p` call_
        ]
  show UpdateGroupCall
    { group_call = group_call_
    }
      = "UpdateGroupCall"
        ++ I.cc
        [ "group_call" `I.p` group_call_
        ]
  show UpdateGroupCallParticipant
    { group_call_id = group_call_id_
    , participant   = participant_
    }
      = "UpdateGroupCallParticipant"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "participant"   `I.p` participant_
        ]
  show UpdateNewCallSignalingData
    { call_id = call_id_
    , _data   = _data_
    }
      = "UpdateNewCallSignalingData"
        ++ I.cc
        [ "call_id" `I.p` call_id_
        , "_data"   `I.p` _data_
        ]
  show UpdateUserPrivacySettingRules
    { setting = setting_
    , rules   = rules_
    }
      = "UpdateUserPrivacySettingRules"
        ++ I.cc
        [ "setting" `I.p` setting_
        , "rules"   `I.p` rules_
        ]
  show UpdateUnreadMessageCount
    { chat_list            = chat_list_
    , unread_count         = unread_count_
    , unread_unmuted_count = unread_unmuted_count_
    }
      = "UpdateUnreadMessageCount"
        ++ I.cc
        [ "chat_list"            `I.p` chat_list_
        , "unread_count"         `I.p` unread_count_
        , "unread_unmuted_count" `I.p` unread_unmuted_count_
        ]
  show UpdateUnreadChatCount
    { chat_list                      = chat_list_
    , total_count                    = total_count_
    , unread_count                   = unread_count_
    , unread_unmuted_count           = unread_unmuted_count_
    , marked_as_unread_count         = marked_as_unread_count_
    , marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_
    }
      = "UpdateUnreadChatCount"
        ++ I.cc
        [ "chat_list"                      `I.p` chat_list_
        , "total_count"                    `I.p` total_count_
        , "unread_count"                   `I.p` unread_count_
        , "unread_unmuted_count"           `I.p` unread_unmuted_count_
        , "marked_as_unread_count"         `I.p` marked_as_unread_count_
        , "marked_as_unread_unmuted_count" `I.p` marked_as_unread_unmuted_count_
        ]
  show UpdateStory
    { story = story_
    }
      = "UpdateStory"
        ++ I.cc
        [ "story" `I.p` story_
        ]
  show UpdateStoryDeleted
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = "UpdateStoryDeleted"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        ]
  show UpdateChatActiveStories
    { active_stories = active_stories_
    }
      = "UpdateChatActiveStories"
        ++ I.cc
        [ "active_stories" `I.p` active_stories_
        ]
  show UpdateStoryListChatCount
    { story_list = story_list_
    , chat_count = chat_count_
    }
      = "UpdateStoryListChatCount"
        ++ I.cc
        [ "story_list" `I.p` story_list_
        , "chat_count" `I.p` chat_count_
        ]
  show UpdateOption
    { name  = name_
    , value = value_
    }
      = "UpdateOption"
        ++ I.cc
        [ "name"  `I.p` name_
        , "value" `I.p` value_
        ]
  show UpdateStickerSet
    { sticker_set = sticker_set_
    }
      = "UpdateStickerSet"
        ++ I.cc
        [ "sticker_set" `I.p` sticker_set_
        ]
  show UpdateInstalledStickerSets
    { sticker_type    = sticker_type_
    , sticker_set_ids = sticker_set_ids_
    }
      = "UpdateInstalledStickerSets"
        ++ I.cc
        [ "sticker_type"    `I.p` sticker_type_
        , "sticker_set_ids" `I.p` sticker_set_ids_
        ]
  show UpdateTrendingStickerSets
    { sticker_type = sticker_type_
    , sticker_sets = sticker_sets_
    }
      = "UpdateTrendingStickerSets"
        ++ I.cc
        [ "sticker_type" `I.p` sticker_type_
        , "sticker_sets" `I.p` sticker_sets_
        ]
  show UpdateRecentStickers
    { is_attached = is_attached_
    , sticker_ids = sticker_ids_
    }
      = "UpdateRecentStickers"
        ++ I.cc
        [ "is_attached" `I.p` is_attached_
        , "sticker_ids" `I.p` sticker_ids_
        ]
  show UpdateFavoriteStickers
    { sticker_ids = sticker_ids_
    }
      = "UpdateFavoriteStickers"
        ++ I.cc
        [ "sticker_ids" `I.p` sticker_ids_
        ]
  show UpdateSavedAnimations
    { animation_ids = animation_ids_
    }
      = "UpdateSavedAnimations"
        ++ I.cc
        [ "animation_ids" `I.p` animation_ids_
        ]
  show UpdateSavedNotificationSounds
    { notification_sound_ids = notification_sound_ids_
    }
      = "UpdateSavedNotificationSounds"
        ++ I.cc
        [ "notification_sound_ids" `I.p` notification_sound_ids_
        ]
  show UpdateSelectedBackground
    { for_dark_theme = for_dark_theme_
    , _background    = _background_
    }
      = "UpdateSelectedBackground"
        ++ I.cc
        [ "for_dark_theme" `I.p` for_dark_theme_
        , "_background"    `I.p` _background_
        ]
  show UpdateChatThemes
    { chat_themes = chat_themes_
    }
      = "UpdateChatThemes"
        ++ I.cc
        [ "chat_themes" `I.p` chat_themes_
        ]
  show UpdateLanguagePackStrings
    { localization_target = localization_target_
    , language_pack_id    = language_pack_id_
    , strings             = strings_
    }
      = "UpdateLanguagePackStrings"
        ++ I.cc
        [ "localization_target" `I.p` localization_target_
        , "language_pack_id"    `I.p` language_pack_id_
        , "strings"             `I.p` strings_
        ]
  show UpdateConnectionState
    { state = state_
    }
      = "UpdateConnectionState"
        ++ I.cc
        [ "state" `I.p` state_
        ]
  show UpdateTermsOfService
    { terms_of_service_id = terms_of_service_id_
    , terms_of_service    = terms_of_service_
    }
      = "UpdateTermsOfService"
        ++ I.cc
        [ "terms_of_service_id" `I.p` terms_of_service_id_
        , "terms_of_service"    `I.p` terms_of_service_
        ]
  show UpdateUsersNearby
    { users_nearby = users_nearby_
    }
      = "UpdateUsersNearby"
        ++ I.cc
        [ "users_nearby" `I.p` users_nearby_
        ]
  show UpdateAttachmentMenuBots
    { bots = bots_
    }
      = "UpdateAttachmentMenuBots"
        ++ I.cc
        [ "bots" `I.p` bots_
        ]
  show UpdateWebAppMessageSent
    { web_app_launch_id = web_app_launch_id_
    }
      = "UpdateWebAppMessageSent"
        ++ I.cc
        [ "web_app_launch_id" `I.p` web_app_launch_id_
        ]
  show UpdateActiveEmojiReactions
    { emojis = emojis_
    }
      = "UpdateActiveEmojiReactions"
        ++ I.cc
        [ "emojis" `I.p` emojis_
        ]
  show UpdateDefaultReactionType
    { reaction_type = reaction_type_
    }
      = "UpdateDefaultReactionType"
        ++ I.cc
        [ "reaction_type" `I.p` reaction_type_
        ]
  show UpdateDiceEmojis
    { emojis = emojis_
    }
      = "UpdateDiceEmojis"
        ++ I.cc
        [ "emojis" `I.p` emojis_
        ]
  show UpdateAnimatedEmojiMessageClicked
    { chat_id    = chat_id_
    , message_id = message_id_
    , sticker    = sticker_
    }
      = "UpdateAnimatedEmojiMessageClicked"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        , "sticker"    `I.p` sticker_
        ]
  show UpdateAnimationSearchParameters
    { provider = provider_
    , emojis   = emojis_
    }
      = "UpdateAnimationSearchParameters"
        ++ I.cc
        [ "provider" `I.p` provider_
        , "emojis"   `I.p` emojis_
        ]
  show UpdateSuggestedActions
    { added_actions   = added_actions_
    , removed_actions = removed_actions_
    }
      = "UpdateSuggestedActions"
        ++ I.cc
        [ "added_actions"   `I.p` added_actions_
        , "removed_actions" `I.p` removed_actions_
        ]
  show UpdateAddChatMembersPrivacyForbidden
    { chat_id  = chat_id_
    , user_ids = user_ids_
    }
      = "UpdateAddChatMembersPrivacyForbidden"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "user_ids" `I.p` user_ids_
        ]
  show UpdateAutosaveSettings
    { _scope   = _scope_
    , settings = settings_
    }
      = "UpdateAutosaveSettings"
        ++ I.cc
        [ "_scope"   `I.p` _scope_
        , "settings" `I.p` settings_
        ]
  show UpdateNewInlineQuery
    { _id            = _id_
    , sender_user_id = sender_user_id_
    , user_location  = user_location_
    , chat_type      = chat_type_
    , query          = query_
    , offset         = offset_
    }
      = "UpdateNewInlineQuery"
        ++ I.cc
        [ "_id"            `I.p` _id_
        , "sender_user_id" `I.p` sender_user_id_
        , "user_location"  `I.p` user_location_
        , "chat_type"      `I.p` chat_type_
        , "query"          `I.p` query_
        , "offset"         `I.p` offset_
        ]
  show UpdateNewChosenInlineResult
    { sender_user_id    = sender_user_id_
    , user_location     = user_location_
    , query             = query_
    , result_id         = result_id_
    , inline_message_id = inline_message_id_
    }
      = "UpdateNewChosenInlineResult"
        ++ I.cc
        [ "sender_user_id"    `I.p` sender_user_id_
        , "user_location"     `I.p` user_location_
        , "query"             `I.p` query_
        , "result_id"         `I.p` result_id_
        , "inline_message_id" `I.p` inline_message_id_
        ]
  show UpdateNewCallbackQuery
    { _id            = _id_
    , sender_user_id = sender_user_id_
    , chat_id        = chat_id_
    , message_id     = message_id_
    , chat_instance  = chat_instance_
    , payload        = payload_
    }
      = "UpdateNewCallbackQuery"
        ++ I.cc
        [ "_id"            `I.p` _id_
        , "sender_user_id" `I.p` sender_user_id_
        , "chat_id"        `I.p` chat_id_
        , "message_id"     `I.p` message_id_
        , "chat_instance"  `I.p` chat_instance_
        , "payload"        `I.p` payload_
        ]
  show UpdateNewInlineCallbackQuery
    { _id               = _id_
    , sender_user_id    = sender_user_id_
    , inline_message_id = inline_message_id_
    , chat_instance     = chat_instance_
    , payload           = payload_
    }
      = "UpdateNewInlineCallbackQuery"
        ++ I.cc
        [ "_id"               `I.p` _id_
        , "sender_user_id"    `I.p` sender_user_id_
        , "inline_message_id" `I.p` inline_message_id_
        , "chat_instance"     `I.p` chat_instance_
        , "payload"           `I.p` payload_
        ]
  show UpdateNewShippingQuery
    { _id              = _id_
    , sender_user_id   = sender_user_id_
    , invoice_payload  = invoice_payload_
    , shipping_address = shipping_address_
    }
      = "UpdateNewShippingQuery"
        ++ I.cc
        [ "_id"              `I.p` _id_
        , "sender_user_id"   `I.p` sender_user_id_
        , "invoice_payload"  `I.p` invoice_payload_
        , "shipping_address" `I.p` shipping_address_
        ]
  show UpdateNewPreCheckoutQuery
    { _id                = _id_
    , sender_user_id     = sender_user_id_
    , currency           = currency_
    , total_amount       = total_amount_
    , _invoice_payload   = _invoice_payload_
    , shipping_option_id = shipping_option_id_
    , order_info         = order_info_
    }
      = "UpdateNewPreCheckoutQuery"
        ++ I.cc
        [ "_id"                `I.p` _id_
        , "sender_user_id"     `I.p` sender_user_id_
        , "currency"           `I.p` currency_
        , "total_amount"       `I.p` total_amount_
        , "_invoice_payload"   `I.p` _invoice_payload_
        , "shipping_option_id" `I.p` shipping_option_id_
        , "order_info"         `I.p` order_info_
        ]
  show UpdateNewCustomEvent
    { event = event_
    }
      = "UpdateNewCustomEvent"
        ++ I.cc
        [ "event" `I.p` event_
        ]
  show UpdateNewCustomQuery
    { _id     = _id_
    , __data  = __data_
    , timeout = timeout_
    }
      = "UpdateNewCustomQuery"
        ++ I.cc
        [ "_id"     `I.p` _id_
        , "__data"  `I.p` __data_
        , "timeout" `I.p` timeout_
        ]
  show UpdatePoll
    { poll = poll_
    }
      = "UpdatePoll"
        ++ I.cc
        [ "poll" `I.p` poll_
        ]
  show UpdatePollAnswer
    { poll_id    = poll_id_
    , voter_id   = voter_id_
    , option_ids = option_ids_
    }
      = "UpdatePollAnswer"
        ++ I.cc
        [ "poll_id"    `I.p` poll_id_
        , "voter_id"   `I.p` voter_id_
        , "option_ids" `I.p` option_ids_
        ]
  show UpdateChatMember
    { chat_id                     = chat_id_
    , actor_user_id               = actor_user_id_
    , date                        = date_
    , invite_link                 = invite_link_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    , old_chat_member             = old_chat_member_
    , new_chat_member             = new_chat_member_
    }
      = "UpdateChatMember"
        ++ I.cc
        [ "chat_id"                     `I.p` chat_id_
        , "actor_user_id"               `I.p` actor_user_id_
        , "date"                        `I.p` date_
        , "invite_link"                 `I.p` invite_link_
        , "via_chat_folder_invite_link" `I.p` via_chat_folder_invite_link_
        , "old_chat_member"             `I.p` old_chat_member_
        , "new_chat_member"             `I.p` new_chat_member_
        ]
  show UpdateNewChatJoinRequest
    { chat_id      = chat_id_
    , request      = request_
    , user_chat_id = user_chat_id_
    , invite_link  = invite_link_
    }
      = "UpdateNewChatJoinRequest"
        ++ I.cc
        [ "chat_id"      `I.p` chat_id_
        , "request"      `I.p` request_
        , "user_chat_id" `I.p` user_chat_id_
        , "invite_link"  `I.p` invite_link_
        ]

instance AT.FromJSON Update where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "updateAuthorizationState"             -> parseUpdateAuthorizationState v
      "updateNewMessage"                     -> parseUpdateNewMessage v
      "updateMessageSendAcknowledged"        -> parseUpdateMessageSendAcknowledged v
      "updateMessageSendSucceeded"           -> parseUpdateMessageSendSucceeded v
      "updateMessageSendFailed"              -> parseUpdateMessageSendFailed v
      "updateMessageContent"                 -> parseUpdateMessageContent v
      "updateMessageEdited"                  -> parseUpdateMessageEdited v
      "updateMessageIsPinned"                -> parseUpdateMessageIsPinned v
      "updateMessageInteractionInfo"         -> parseUpdateMessageInteractionInfo v
      "updateMessageContentOpened"           -> parseUpdateMessageContentOpened v
      "updateMessageMentionRead"             -> parseUpdateMessageMentionRead v
      "updateMessageUnreadReactions"         -> parseUpdateMessageUnreadReactions v
      "updateMessageLiveLocationViewed"      -> parseUpdateMessageLiveLocationViewed v
      "updateNewChat"                        -> parseUpdateNewChat v
      "updateChatTitle"                      -> parseUpdateChatTitle v
      "updateChatPhoto"                      -> parseUpdateChatPhoto v
      "updateChatPermissions"                -> parseUpdateChatPermissions v
      "updateChatLastMessage"                -> parseUpdateChatLastMessage v
      "updateChatPosition"                   -> parseUpdateChatPosition v
      "updateChatReadInbox"                  -> parseUpdateChatReadInbox v
      "updateChatReadOutbox"                 -> parseUpdateChatReadOutbox v
      "updateChatActionBar"                  -> parseUpdateChatActionBar v
      "updateChatAvailableReactions"         -> parseUpdateChatAvailableReactions v
      "updateChatDraftMessage"               -> parseUpdateChatDraftMessage v
      "updateChatMessageSender"              -> parseUpdateChatMessageSender v
      "updateChatMessageAutoDeleteTime"      -> parseUpdateChatMessageAutoDeleteTime v
      "updateChatNotificationSettings"       -> parseUpdateChatNotificationSettings v
      "updateChatPendingJoinRequests"        -> parseUpdateChatPendingJoinRequests v
      "updateChatReplyMarkup"                -> parseUpdateChatReplyMarkup v
      "updateChatBackground"                 -> parseUpdateChatBackground v
      "updateChatTheme"                      -> parseUpdateChatTheme v
      "updateChatUnreadMentionCount"         -> parseUpdateChatUnreadMentionCount v
      "updateChatUnreadReactionCount"        -> parseUpdateChatUnreadReactionCount v
      "updateChatVideoChat"                  -> parseUpdateChatVideoChat v
      "updateChatDefaultDisableNotification" -> parseUpdateChatDefaultDisableNotification v
      "updateChatHasProtectedContent"        -> parseUpdateChatHasProtectedContent v
      "updateChatIsTranslatable"             -> parseUpdateChatIsTranslatable v
      "updateChatIsMarkedAsUnread"           -> parseUpdateChatIsMarkedAsUnread v
      "updateChatIsBlocked"                  -> parseUpdateChatIsBlocked v
      "updateChatHasScheduledMessages"       -> parseUpdateChatHasScheduledMessages v
      "updateChatFolders"                    -> parseUpdateChatFolders v
      "updateChatOnlineMemberCount"          -> parseUpdateChatOnlineMemberCount v
      "updateForumTopicInfo"                 -> parseUpdateForumTopicInfo v
      "updateScopeNotificationSettings"      -> parseUpdateScopeNotificationSettings v
      "updateNotification"                   -> parseUpdateNotification v
      "updateNotificationGroup"              -> parseUpdateNotificationGroup v
      "updateActiveNotifications"            -> parseUpdateActiveNotifications v
      "updateHavePendingNotifications"       -> parseUpdateHavePendingNotifications v
      "updateDeleteMessages"                 -> parseUpdateDeleteMessages v
      "updateChatAction"                     -> parseUpdateChatAction v
      "updateUserStatus"                     -> parseUpdateUserStatus v
      "updateUser"                           -> parseUpdateUser v
      "updateBasicGroup"                     -> parseUpdateBasicGroup v
      "updateSupergroup"                     -> parseUpdateSupergroup v
      "updateSecretChat"                     -> parseUpdateSecretChat v
      "updateUserFullInfo"                   -> parseUpdateUserFullInfo v
      "updateBasicGroupFullInfo"             -> parseUpdateBasicGroupFullInfo v
      "updateSupergroupFullInfo"             -> parseUpdateSupergroupFullInfo v
      "updateServiceNotification"            -> parseUpdateServiceNotification v
      "updateFile"                           -> parseUpdateFile v
      "updateFileGenerationStart"            -> parseUpdateFileGenerationStart v
      "updateFileGenerationStop"             -> parseUpdateFileGenerationStop v
      "updateFileDownloads"                  -> parseUpdateFileDownloads v
      "updateFileAddedToDownloads"           -> parseUpdateFileAddedToDownloads v
      "updateFileDownload"                   -> parseUpdateFileDownload v
      "updateFileRemovedFromDownloads"       -> parseUpdateFileRemovedFromDownloads v
      "updateCall"                           -> parseUpdateCall v
      "updateGroupCall"                      -> parseUpdateGroupCall v
      "updateGroupCallParticipant"           -> parseUpdateGroupCallParticipant v
      "updateNewCallSignalingData"           -> parseUpdateNewCallSignalingData v
      "updateUserPrivacySettingRules"        -> parseUpdateUserPrivacySettingRules v
      "updateUnreadMessageCount"             -> parseUpdateUnreadMessageCount v
      "updateUnreadChatCount"                -> parseUpdateUnreadChatCount v
      "updateStory"                          -> parseUpdateStory v
      "updateStoryDeleted"                   -> parseUpdateStoryDeleted v
      "updateChatActiveStories"              -> parseUpdateChatActiveStories v
      "updateStoryListChatCount"             -> parseUpdateStoryListChatCount v
      "updateOption"                         -> parseUpdateOption v
      "updateStickerSet"                     -> parseUpdateStickerSet v
      "updateInstalledStickerSets"           -> parseUpdateInstalledStickerSets v
      "updateTrendingStickerSets"            -> parseUpdateTrendingStickerSets v
      "updateRecentStickers"                 -> parseUpdateRecentStickers v
      "updateFavoriteStickers"               -> parseUpdateFavoriteStickers v
      "updateSavedAnimations"                -> parseUpdateSavedAnimations v
      "updateSavedNotificationSounds"        -> parseUpdateSavedNotificationSounds v
      "updateSelectedBackground"             -> parseUpdateSelectedBackground v
      "updateChatThemes"                     -> parseUpdateChatThemes v
      "updateLanguagePackStrings"            -> parseUpdateLanguagePackStrings v
      "updateConnectionState"                -> parseUpdateConnectionState v
      "updateTermsOfService"                 -> parseUpdateTermsOfService v
      "updateUsersNearby"                    -> parseUpdateUsersNearby v
      "updateAttachmentMenuBots"             -> parseUpdateAttachmentMenuBots v
      "updateWebAppMessageSent"              -> parseUpdateWebAppMessageSent v
      "updateActiveEmojiReactions"           -> parseUpdateActiveEmojiReactions v
      "updateDefaultReactionType"            -> parseUpdateDefaultReactionType v
      "updateDiceEmojis"                     -> parseUpdateDiceEmojis v
      "updateAnimatedEmojiMessageClicked"    -> parseUpdateAnimatedEmojiMessageClicked v
      "updateAnimationSearchParameters"      -> parseUpdateAnimationSearchParameters v
      "updateSuggestedActions"               -> parseUpdateSuggestedActions v
      "updateAddChatMembersPrivacyForbidden" -> parseUpdateAddChatMembersPrivacyForbidden v
      "updateAutosaveSettings"               -> parseUpdateAutosaveSettings v
      "updateNewInlineQuery"                 -> parseUpdateNewInlineQuery v
      "updateNewChosenInlineResult"          -> parseUpdateNewChosenInlineResult v
      "updateNewCallbackQuery"               -> parseUpdateNewCallbackQuery v
      "updateNewInlineCallbackQuery"         -> parseUpdateNewInlineCallbackQuery v
      "updateNewShippingQuery"               -> parseUpdateNewShippingQuery v
      "updateNewPreCheckoutQuery"            -> parseUpdateNewPreCheckoutQuery v
      "updateNewCustomEvent"                 -> parseUpdateNewCustomEvent v
      "updateNewCustomQuery"                 -> parseUpdateNewCustomQuery v
      "updatePoll"                           -> parseUpdatePoll v
      "updatePollAnswer"                     -> parseUpdatePollAnswer v
      "updateChatMember"                     -> parseUpdateChatMember v
      "updateNewChatJoinRequest"             -> parseUpdateNewChatJoinRequest v
      _                                      -> mempty
    
    where
      parseUpdateAuthorizationState :: A.Value -> AT.Parser Update
      parseUpdateAuthorizationState = A.withObject "UpdateAuthorizationState" $ \o -> do
        authorization_state_ <- o A..:?  "authorization_state"
        pure $ UpdateAuthorizationState
          { authorization_state = authorization_state_
          }
      parseUpdateNewMessage :: A.Value -> AT.Parser Update
      parseUpdateNewMessage = A.withObject "UpdateNewMessage" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ UpdateNewMessage
          { message = message_
          }
      parseUpdateMessageSendAcknowledged :: A.Value -> AT.Parser Update
      parseUpdateMessageSendAcknowledged = A.withObject "UpdateMessageSendAcknowledged" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ UpdateMessageSendAcknowledged
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseUpdateMessageSendSucceeded :: A.Value -> AT.Parser Update
      parseUpdateMessageSendSucceeded = A.withObject "UpdateMessageSendSucceeded" $ \o -> do
        message_        <- o A..:?  "message"
        old_message_id_ <- o A..:?  "old_message_id"
        pure $ UpdateMessageSendSucceeded
          { message        = message_
          , old_message_id = old_message_id_
          }
      parseUpdateMessageSendFailed :: A.Value -> AT.Parser Update
      parseUpdateMessageSendFailed = A.withObject "UpdateMessageSendFailed" $ \o -> do
        message_        <- o A..:?  "message"
        old_message_id_ <- o A..:?  "old_message_id"
        error_code_     <- o A..:?  "error_code"
        error_message_  <- o A..:?  "error_message"
        pure $ UpdateMessageSendFailed
          { message        = message_
          , old_message_id = old_message_id_
          , error_code     = error_code_
          , error_message  = error_message_
          }
      parseUpdateMessageContent :: A.Value -> AT.Parser Update
      parseUpdateMessageContent = A.withObject "UpdateMessageContent" $ \o -> do
        chat_id_     <- o A..:?  "chat_id"
        message_id_  <- o A..:?  "message_id"
        new_content_ <- o A..:?  "new_content"
        pure $ UpdateMessageContent
          { chat_id     = chat_id_
          , message_id  = message_id_
          , new_content = new_content_
          }
      parseUpdateMessageEdited :: A.Value -> AT.Parser Update
      parseUpdateMessageEdited = A.withObject "UpdateMessageEdited" $ \o -> do
        chat_id_      <- o A..:?  "chat_id"
        message_id_   <- o A..:?  "message_id"
        edit_date_    <- o A..:?  "edit_date"
        reply_markup_ <- o A..:?  "reply_markup"
        pure $ UpdateMessageEdited
          { chat_id      = chat_id_
          , message_id   = message_id_
          , edit_date    = edit_date_
          , reply_markup = reply_markup_
          }
      parseUpdateMessageIsPinned :: A.Value -> AT.Parser Update
      parseUpdateMessageIsPinned = A.withObject "UpdateMessageIsPinned" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        is_pinned_  <- o A..:?  "is_pinned"
        pure $ UpdateMessageIsPinned
          { chat_id    = chat_id_
          , message_id = message_id_
          , is_pinned  = is_pinned_
          }
      parseUpdateMessageInteractionInfo :: A.Value -> AT.Parser Update
      parseUpdateMessageInteractionInfo = A.withObject "UpdateMessageInteractionInfo" $ \o -> do
        chat_id_          <- o A..:?  "chat_id"
        message_id_       <- o A..:?  "message_id"
        interaction_info_ <- o A..:?  "interaction_info"
        pure $ UpdateMessageInteractionInfo
          { chat_id          = chat_id_
          , message_id       = message_id_
          , interaction_info = interaction_info_
          }
      parseUpdateMessageContentOpened :: A.Value -> AT.Parser Update
      parseUpdateMessageContentOpened = A.withObject "UpdateMessageContentOpened" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ UpdateMessageContentOpened
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseUpdateMessageMentionRead :: A.Value -> AT.Parser Update
      parseUpdateMessageMentionRead = A.withObject "UpdateMessageMentionRead" $ \o -> do
        chat_id_              <- o A..:?  "chat_id"
        message_id_           <- o A..:?  "message_id"
        unread_mention_count_ <- o A..:?  "unread_mention_count"
        pure $ UpdateMessageMentionRead
          { chat_id              = chat_id_
          , message_id           = message_id_
          , unread_mention_count = unread_mention_count_
          }
      parseUpdateMessageUnreadReactions :: A.Value -> AT.Parser Update
      parseUpdateMessageUnreadReactions = A.withObject "UpdateMessageUnreadReactions" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        message_id_            <- o A..:?  "message_id"
        unread_reactions_      <- o A..:?  "unread_reactions"
        unread_reaction_count_ <- o A..:?  "unread_reaction_count"
        pure $ UpdateMessageUnreadReactions
          { chat_id               = chat_id_
          , message_id            = message_id_
          , unread_reactions      = unread_reactions_
          , unread_reaction_count = unread_reaction_count_
          }
      parseUpdateMessageLiveLocationViewed :: A.Value -> AT.Parser Update
      parseUpdateMessageLiveLocationViewed = A.withObject "UpdateMessageLiveLocationViewed" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ UpdateMessageLiveLocationViewed
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseUpdateNewChat :: A.Value -> AT.Parser Update
      parseUpdateNewChat = A.withObject "UpdateNewChat" $ \o -> do
        chat_ <- o A..:?  "chat"
        pure $ UpdateNewChat
          { chat = chat_
          }
      parseUpdateChatTitle :: A.Value -> AT.Parser Update
      parseUpdateChatTitle = A.withObject "UpdateChatTitle" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        title_   <- o A..:?  "title"
        pure $ UpdateChatTitle
          { chat_id = chat_id_
          , title   = title_
          }
      parseUpdateChatPhoto :: A.Value -> AT.Parser Update
      parseUpdateChatPhoto = A.withObject "UpdateChatPhoto" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        photo_   <- o A..:?  "photo"
        pure $ UpdateChatPhoto
          { chat_id = chat_id_
          , photo   = photo_
          }
      parseUpdateChatPermissions :: A.Value -> AT.Parser Update
      parseUpdateChatPermissions = A.withObject "UpdateChatPermissions" $ \o -> do
        chat_id_     <- o A..:?  "chat_id"
        permissions_ <- o A..:?  "permissions"
        pure $ UpdateChatPermissions
          { chat_id     = chat_id_
          , permissions = permissions_
          }
      parseUpdateChatLastMessage :: A.Value -> AT.Parser Update
      parseUpdateChatLastMessage = A.withObject "UpdateChatLastMessage" $ \o -> do
        chat_id_      <- o A..:?  "chat_id"
        last_message_ <- o A..:?  "last_message"
        positions_    <- o A..:?  "positions"
        pure $ UpdateChatLastMessage
          { chat_id      = chat_id_
          , last_message = last_message_
          , positions    = positions_
          }
      parseUpdateChatPosition :: A.Value -> AT.Parser Update
      parseUpdateChatPosition = A.withObject "UpdateChatPosition" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        position_ <- o A..:?  "position"
        pure $ UpdateChatPosition
          { chat_id  = chat_id_
          , position = position_
          }
      parseUpdateChatReadInbox :: A.Value -> AT.Parser Update
      parseUpdateChatReadInbox = A.withObject "UpdateChatReadInbox" $ \o -> do
        chat_id_                    <- o A..:?  "chat_id"
        last_read_inbox_message_id_ <- o A..:?  "last_read_inbox_message_id"
        unread_count_               <- o A..:?  "unread_count"
        pure $ UpdateChatReadInbox
          { chat_id                    = chat_id_
          , last_read_inbox_message_id = last_read_inbox_message_id_
          , unread_count               = unread_count_
          }
      parseUpdateChatReadOutbox :: A.Value -> AT.Parser Update
      parseUpdateChatReadOutbox = A.withObject "UpdateChatReadOutbox" $ \o -> do
        chat_id_                     <- o A..:?  "chat_id"
        last_read_outbox_message_id_ <- o A..:?  "last_read_outbox_message_id"
        pure $ UpdateChatReadOutbox
          { chat_id                     = chat_id_
          , last_read_outbox_message_id = last_read_outbox_message_id_
          }
      parseUpdateChatActionBar :: A.Value -> AT.Parser Update
      parseUpdateChatActionBar = A.withObject "UpdateChatActionBar" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        action_bar_ <- o A..:?  "action_bar"
        pure $ UpdateChatActionBar
          { chat_id    = chat_id_
          , action_bar = action_bar_
          }
      parseUpdateChatAvailableReactions :: A.Value -> AT.Parser Update
      parseUpdateChatAvailableReactions = A.withObject "UpdateChatAvailableReactions" $ \o -> do
        chat_id_             <- o A..:?  "chat_id"
        available_reactions_ <- o A..:?  "available_reactions"
        pure $ UpdateChatAvailableReactions
          { chat_id             = chat_id_
          , available_reactions = available_reactions_
          }
      parseUpdateChatDraftMessage :: A.Value -> AT.Parser Update
      parseUpdateChatDraftMessage = A.withObject "UpdateChatDraftMessage" $ \o -> do
        chat_id_       <- o A..:?  "chat_id"
        draft_message_ <- o A..:?  "draft_message"
        positions_     <- o A..:?  "positions"
        pure $ UpdateChatDraftMessage
          { chat_id       = chat_id_
          , draft_message = draft_message_
          , positions     = positions_
          }
      parseUpdateChatMessageSender :: A.Value -> AT.Parser Update
      parseUpdateChatMessageSender = A.withObject "UpdateChatMessageSender" $ \o -> do
        chat_id_           <- o A..:?  "chat_id"
        message_sender_id_ <- o A..:?  "message_sender_id"
        pure $ UpdateChatMessageSender
          { chat_id           = chat_id_
          , message_sender_id = message_sender_id_
          }
      parseUpdateChatMessageAutoDeleteTime :: A.Value -> AT.Parser Update
      parseUpdateChatMessageAutoDeleteTime = A.withObject "UpdateChatMessageAutoDeleteTime" $ \o -> do
        chat_id_                  <- o A..:?  "chat_id"
        message_auto_delete_time_ <- o A..:?  "message_auto_delete_time"
        pure $ UpdateChatMessageAutoDeleteTime
          { chat_id                  = chat_id_
          , message_auto_delete_time = message_auto_delete_time_
          }
      parseUpdateChatNotificationSettings :: A.Value -> AT.Parser Update
      parseUpdateChatNotificationSettings = A.withObject "UpdateChatNotificationSettings" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        notification_settings_ <- o A..:?  "notification_settings"
        pure $ UpdateChatNotificationSettings
          { chat_id               = chat_id_
          , notification_settings = notification_settings_
          }
      parseUpdateChatPendingJoinRequests :: A.Value -> AT.Parser Update
      parseUpdateChatPendingJoinRequests = A.withObject "UpdateChatPendingJoinRequests" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        pending_join_requests_ <- o A..:?  "pending_join_requests"
        pure $ UpdateChatPendingJoinRequests
          { chat_id               = chat_id_
          , pending_join_requests = pending_join_requests_
          }
      parseUpdateChatReplyMarkup :: A.Value -> AT.Parser Update
      parseUpdateChatReplyMarkup = A.withObject "UpdateChatReplyMarkup" $ \o -> do
        chat_id_                 <- o A..:?  "chat_id"
        reply_markup_message_id_ <- o A..:?  "reply_markup_message_id"
        pure $ UpdateChatReplyMarkup
          { chat_id                 = chat_id_
          , reply_markup_message_id = reply_markup_message_id_
          }
      parseUpdateChatBackground :: A.Value -> AT.Parser Update
      parseUpdateChatBackground = A.withObject "UpdateChatBackground" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        background_ <- o A..:?  "background"
        pure $ UpdateChatBackground
          { chat_id    = chat_id_
          , background = background_
          }
      parseUpdateChatTheme :: A.Value -> AT.Parser Update
      parseUpdateChatTheme = A.withObject "UpdateChatTheme" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        theme_name_ <- o A..:?  "theme_name"
        pure $ UpdateChatTheme
          { chat_id    = chat_id_
          , theme_name = theme_name_
          }
      parseUpdateChatUnreadMentionCount :: A.Value -> AT.Parser Update
      parseUpdateChatUnreadMentionCount = A.withObject "UpdateChatUnreadMentionCount" $ \o -> do
        chat_id_              <- o A..:?  "chat_id"
        unread_mention_count_ <- o A..:?  "unread_mention_count"
        pure $ UpdateChatUnreadMentionCount
          { chat_id              = chat_id_
          , unread_mention_count = unread_mention_count_
          }
      parseUpdateChatUnreadReactionCount :: A.Value -> AT.Parser Update
      parseUpdateChatUnreadReactionCount = A.withObject "UpdateChatUnreadReactionCount" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        unread_reaction_count_ <- o A..:?  "unread_reaction_count"
        pure $ UpdateChatUnreadReactionCount
          { chat_id               = chat_id_
          , unread_reaction_count = unread_reaction_count_
          }
      parseUpdateChatVideoChat :: A.Value -> AT.Parser Update
      parseUpdateChatVideoChat = A.withObject "UpdateChatVideoChat" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        video_chat_ <- o A..:?  "video_chat"
        pure $ UpdateChatVideoChat
          { chat_id    = chat_id_
          , video_chat = video_chat_
          }
      parseUpdateChatDefaultDisableNotification :: A.Value -> AT.Parser Update
      parseUpdateChatDefaultDisableNotification = A.withObject "UpdateChatDefaultDisableNotification" $ \o -> do
        chat_id_                      <- o A..:?  "chat_id"
        default_disable_notification_ <- o A..:?  "default_disable_notification"
        pure $ UpdateChatDefaultDisableNotification
          { chat_id                      = chat_id_
          , default_disable_notification = default_disable_notification_
          }
      parseUpdateChatHasProtectedContent :: A.Value -> AT.Parser Update
      parseUpdateChatHasProtectedContent = A.withObject "UpdateChatHasProtectedContent" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        has_protected_content_ <- o A..:?  "has_protected_content"
        pure $ UpdateChatHasProtectedContent
          { chat_id               = chat_id_
          , has_protected_content = has_protected_content_
          }
      parseUpdateChatIsTranslatable :: A.Value -> AT.Parser Update
      parseUpdateChatIsTranslatable = A.withObject "UpdateChatIsTranslatable" $ \o -> do
        chat_id_         <- o A..:?  "chat_id"
        is_translatable_ <- o A..:?  "is_translatable"
        pure $ UpdateChatIsTranslatable
          { chat_id         = chat_id_
          , is_translatable = is_translatable_
          }
      parseUpdateChatIsMarkedAsUnread :: A.Value -> AT.Parser Update
      parseUpdateChatIsMarkedAsUnread = A.withObject "UpdateChatIsMarkedAsUnread" $ \o -> do
        chat_id_             <- o A..:?  "chat_id"
        is_marked_as_unread_ <- o A..:?  "is_marked_as_unread"
        pure $ UpdateChatIsMarkedAsUnread
          { chat_id             = chat_id_
          , is_marked_as_unread = is_marked_as_unread_
          }
      parseUpdateChatIsBlocked :: A.Value -> AT.Parser Update
      parseUpdateChatIsBlocked = A.withObject "UpdateChatIsBlocked" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        is_blocked_ <- o A..:?  "is_blocked"
        pure $ UpdateChatIsBlocked
          { chat_id    = chat_id_
          , is_blocked = is_blocked_
          }
      parseUpdateChatHasScheduledMessages :: A.Value -> AT.Parser Update
      parseUpdateChatHasScheduledMessages = A.withObject "UpdateChatHasScheduledMessages" $ \o -> do
        chat_id_                <- o A..:?  "chat_id"
        has_scheduled_messages_ <- o A..:?  "has_scheduled_messages"
        pure $ UpdateChatHasScheduledMessages
          { chat_id                = chat_id_
          , has_scheduled_messages = has_scheduled_messages_
          }
      parseUpdateChatFolders :: A.Value -> AT.Parser Update
      parseUpdateChatFolders = A.withObject "UpdateChatFolders" $ \o -> do
        chat_folders_            <- o A..:?  "chat_folders"
        main_chat_list_position_ <- o A..:?  "main_chat_list_position"
        pure $ UpdateChatFolders
          { chat_folders            = chat_folders_
          , main_chat_list_position = main_chat_list_position_
          }
      parseUpdateChatOnlineMemberCount :: A.Value -> AT.Parser Update
      parseUpdateChatOnlineMemberCount = A.withObject "UpdateChatOnlineMemberCount" $ \o -> do
        chat_id_             <- o A..:?  "chat_id"
        online_member_count_ <- o A..:?  "online_member_count"
        pure $ UpdateChatOnlineMemberCount
          { chat_id             = chat_id_
          , online_member_count = online_member_count_
          }
      parseUpdateForumTopicInfo :: A.Value -> AT.Parser Update
      parseUpdateForumTopicInfo = A.withObject "UpdateForumTopicInfo" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        info_    <- o A..:?  "info"
        pure $ UpdateForumTopicInfo
          { chat_id = chat_id_
          , info    = info_
          }
      parseUpdateScopeNotificationSettings :: A.Value -> AT.Parser Update
      parseUpdateScopeNotificationSettings = A.withObject "UpdateScopeNotificationSettings" $ \o -> do
        scope_                  <- o A..:?  "scope"
        _notification_settings_ <- o A..:?  "notification_settings"
        pure $ UpdateScopeNotificationSettings
          { scope                  = scope_
          , _notification_settings = _notification_settings_
          }
      parseUpdateNotification :: A.Value -> AT.Parser Update
      parseUpdateNotification = A.withObject "UpdateNotification" $ \o -> do
        notification_group_id_ <- o A..:?  "notification_group_id"
        notification_          <- o A..:?  "notification"
        pure $ UpdateNotification
          { notification_group_id = notification_group_id_
          , notification          = notification_
          }
      parseUpdateNotificationGroup :: A.Value -> AT.Parser Update
      parseUpdateNotificationGroup = A.withObject "UpdateNotificationGroup" $ \o -> do
        notification_group_id_         <- o A..:?                       "notification_group_id"
        _type_                         <- o A..:?                       "type"
        chat_id_                       <- o A..:?                       "chat_id"
        notification_settings_chat_id_ <- o A..:?                       "notification_settings_chat_id"
        notification_sound_id_         <- fmap I.readInt64 <$> o A..:?  "notification_sound_id"
        total_count_                   <- o A..:?                       "total_count"
        added_notifications_           <- o A..:?                       "added_notifications"
        removed_notification_ids_      <- o A..:?                       "removed_notification_ids"
        pure $ UpdateNotificationGroup
          { notification_group_id         = notification_group_id_
          , _type                         = _type_
          , chat_id                       = chat_id_
          , notification_settings_chat_id = notification_settings_chat_id_
          , notification_sound_id         = notification_sound_id_
          , total_count                   = total_count_
          , added_notifications           = added_notifications_
          , removed_notification_ids      = removed_notification_ids_
          }
      parseUpdateActiveNotifications :: A.Value -> AT.Parser Update
      parseUpdateActiveNotifications = A.withObject "UpdateActiveNotifications" $ \o -> do
        groups_ <- o A..:?  "groups"
        pure $ UpdateActiveNotifications
          { groups = groups_
          }
      parseUpdateHavePendingNotifications :: A.Value -> AT.Parser Update
      parseUpdateHavePendingNotifications = A.withObject "UpdateHavePendingNotifications" $ \o -> do
        have_delayed_notifications_    <- o A..:?  "have_delayed_notifications"
        have_unreceived_notifications_ <- o A..:?  "have_unreceived_notifications"
        pure $ UpdateHavePendingNotifications
          { have_delayed_notifications    = have_delayed_notifications_
          , have_unreceived_notifications = have_unreceived_notifications_
          }
      parseUpdateDeleteMessages :: A.Value -> AT.Parser Update
      parseUpdateDeleteMessages = A.withObject "UpdateDeleteMessages" $ \o -> do
        chat_id_      <- o A..:?  "chat_id"
        message_ids_  <- o A..:?  "message_ids"
        is_permanent_ <- o A..:?  "is_permanent"
        from_cache_   <- o A..:?  "from_cache"
        pure $ UpdateDeleteMessages
          { chat_id      = chat_id_
          , message_ids  = message_ids_
          , is_permanent = is_permanent_
          , from_cache   = from_cache_
          }
      parseUpdateChatAction :: A.Value -> AT.Parser Update
      parseUpdateChatAction = A.withObject "UpdateChatAction" $ \o -> do
        chat_id_           <- o A..:?  "chat_id"
        message_thread_id_ <- o A..:?  "message_thread_id"
        sender_id_         <- o A..:?  "sender_id"
        action_            <- o A..:?  "action"
        pure $ UpdateChatAction
          { chat_id           = chat_id_
          , message_thread_id = message_thread_id_
          , sender_id         = sender_id_
          , action            = action_
          }
      parseUpdateUserStatus :: A.Value -> AT.Parser Update
      parseUpdateUserStatus = A.withObject "UpdateUserStatus" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        status_  <- o A..:?  "status"
        pure $ UpdateUserStatus
          { user_id = user_id_
          , status  = status_
          }
      parseUpdateUser :: A.Value -> AT.Parser Update
      parseUpdateUser = A.withObject "UpdateUser" $ \o -> do
        user_ <- o A..:?  "user"
        pure $ UpdateUser
          { user = user_
          }
      parseUpdateBasicGroup :: A.Value -> AT.Parser Update
      parseUpdateBasicGroup = A.withObject "UpdateBasicGroup" $ \o -> do
        basic_group_ <- o A..:?  "basic_group"
        pure $ UpdateBasicGroup
          { basic_group = basic_group_
          }
      parseUpdateSupergroup :: A.Value -> AT.Parser Update
      parseUpdateSupergroup = A.withObject "UpdateSupergroup" $ \o -> do
        supergroup_ <- o A..:?  "supergroup"
        pure $ UpdateSupergroup
          { supergroup = supergroup_
          }
      parseUpdateSecretChat :: A.Value -> AT.Parser Update
      parseUpdateSecretChat = A.withObject "UpdateSecretChat" $ \o -> do
        secret_chat_ <- o A..:?  "secret_chat"
        pure $ UpdateSecretChat
          { secret_chat = secret_chat_
          }
      parseUpdateUserFullInfo :: A.Value -> AT.Parser Update
      parseUpdateUserFullInfo = A.withObject "UpdateUserFullInfo" $ \o -> do
        user_id_        <- o A..:?  "user_id"
        user_full_info_ <- o A..:?  "user_full_info"
        pure $ UpdateUserFullInfo
          { user_id        = user_id_
          , user_full_info = user_full_info_
          }
      parseUpdateBasicGroupFullInfo :: A.Value -> AT.Parser Update
      parseUpdateBasicGroupFullInfo = A.withObject "UpdateBasicGroupFullInfo" $ \o -> do
        basic_group_id_        <- o A..:?  "basic_group_id"
        basic_group_full_info_ <- o A..:?  "basic_group_full_info"
        pure $ UpdateBasicGroupFullInfo
          { basic_group_id        = basic_group_id_
          , basic_group_full_info = basic_group_full_info_
          }
      parseUpdateSupergroupFullInfo :: A.Value -> AT.Parser Update
      parseUpdateSupergroupFullInfo = A.withObject "UpdateSupergroupFullInfo" $ \o -> do
        supergroup_id_        <- o A..:?  "supergroup_id"
        supergroup_full_info_ <- o A..:?  "supergroup_full_info"
        pure $ UpdateSupergroupFullInfo
          { supergroup_id        = supergroup_id_
          , supergroup_full_info = supergroup_full_info_
          }
      parseUpdateServiceNotification :: A.Value -> AT.Parser Update
      parseUpdateServiceNotification = A.withObject "UpdateServiceNotification" $ \o -> do
        __type_  <- o A..:?  "type"
        content_ <- o A..:?  "content"
        pure $ UpdateServiceNotification
          { __type  = __type_
          , content = content_
          }
      parseUpdateFile :: A.Value -> AT.Parser Update
      parseUpdateFile = A.withObject "UpdateFile" $ \o -> do
        file_ <- o A..:?  "file"
        pure $ UpdateFile
          { file = file_
          }
      parseUpdateFileGenerationStart :: A.Value -> AT.Parser Update
      parseUpdateFileGenerationStart = A.withObject "UpdateFileGenerationStart" $ \o -> do
        generation_id_    <- fmap I.readInt64 <$> o A..:?  "generation_id"
        original_path_    <- o A..:?                       "original_path"
        destination_path_ <- o A..:?                       "destination_path"
        conversion_       <- o A..:?                       "conversion"
        pure $ UpdateFileGenerationStart
          { generation_id    = generation_id_
          , original_path    = original_path_
          , destination_path = destination_path_
          , conversion       = conversion_
          }
      parseUpdateFileGenerationStop :: A.Value -> AT.Parser Update
      parseUpdateFileGenerationStop = A.withObject "UpdateFileGenerationStop" $ \o -> do
        generation_id_ <- fmap I.readInt64 <$> o A..:?  "generation_id"
        pure $ UpdateFileGenerationStop
          { generation_id = generation_id_
          }
      parseUpdateFileDownloads :: A.Value -> AT.Parser Update
      parseUpdateFileDownloads = A.withObject "UpdateFileDownloads" $ \o -> do
        total_size_      <- o A..:?  "total_size"
        total_count_     <- o A..:?  "total_count"
        downloaded_size_ <- o A..:?  "downloaded_size"
        pure $ UpdateFileDownloads
          { total_size      = total_size_
          , total_count     = total_count_
          , downloaded_size = downloaded_size_
          }
      parseUpdateFileAddedToDownloads :: A.Value -> AT.Parser Update
      parseUpdateFileAddedToDownloads = A.withObject "UpdateFileAddedToDownloads" $ \o -> do
        file_download_ <- o A..:?  "file_download"
        counts_        <- o A..:?  "counts"
        pure $ UpdateFileAddedToDownloads
          { file_download = file_download_
          , counts        = counts_
          }
      parseUpdateFileDownload :: A.Value -> AT.Parser Update
      parseUpdateFileDownload = A.withObject "UpdateFileDownload" $ \o -> do
        file_id_       <- o A..:?  "file_id"
        complete_date_ <- o A..:?  "complete_date"
        is_paused_     <- o A..:?  "is_paused"
        counts_        <- o A..:?  "counts"
        pure $ UpdateFileDownload
          { file_id       = file_id_
          , complete_date = complete_date_
          , is_paused     = is_paused_
          , counts        = counts_
          }
      parseUpdateFileRemovedFromDownloads :: A.Value -> AT.Parser Update
      parseUpdateFileRemovedFromDownloads = A.withObject "UpdateFileRemovedFromDownloads" $ \o -> do
        file_id_ <- o A..:?  "file_id"
        counts_  <- o A..:?  "counts"
        pure $ UpdateFileRemovedFromDownloads
          { file_id = file_id_
          , counts  = counts_
          }
      parseUpdateCall :: A.Value -> AT.Parser Update
      parseUpdateCall = A.withObject "UpdateCall" $ \o -> do
        call_ <- o A..:?  "call"
        pure $ UpdateCall
          { call = call_
          }
      parseUpdateGroupCall :: A.Value -> AT.Parser Update
      parseUpdateGroupCall = A.withObject "UpdateGroupCall" $ \o -> do
        group_call_ <- o A..:?  "group_call"
        pure $ UpdateGroupCall
          { group_call = group_call_
          }
      parseUpdateGroupCallParticipant :: A.Value -> AT.Parser Update
      parseUpdateGroupCallParticipant = A.withObject "UpdateGroupCallParticipant" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        participant_   <- o A..:?  "participant"
        pure $ UpdateGroupCallParticipant
          { group_call_id = group_call_id_
          , participant   = participant_
          }
      parseUpdateNewCallSignalingData :: A.Value -> AT.Parser Update
      parseUpdateNewCallSignalingData = A.withObject "UpdateNewCallSignalingData" $ \o -> do
        call_id_ <- o A..:?                       "call_id"
        _data_   <- fmap I.readBytes <$> o A..:?  "data"
        pure $ UpdateNewCallSignalingData
          { call_id = call_id_
          , _data   = _data_
          }
      parseUpdateUserPrivacySettingRules :: A.Value -> AT.Parser Update
      parseUpdateUserPrivacySettingRules = A.withObject "UpdateUserPrivacySettingRules" $ \o -> do
        setting_ <- o A..:?  "setting"
        rules_   <- o A..:?  "rules"
        pure $ UpdateUserPrivacySettingRules
          { setting = setting_
          , rules   = rules_
          }
      parseUpdateUnreadMessageCount :: A.Value -> AT.Parser Update
      parseUpdateUnreadMessageCount = A.withObject "UpdateUnreadMessageCount" $ \o -> do
        chat_list_            <- o A..:?  "chat_list"
        unread_count_         <- o A..:?  "unread_count"
        unread_unmuted_count_ <- o A..:?  "unread_unmuted_count"
        pure $ UpdateUnreadMessageCount
          { chat_list            = chat_list_
          , unread_count         = unread_count_
          , unread_unmuted_count = unread_unmuted_count_
          }
      parseUpdateUnreadChatCount :: A.Value -> AT.Parser Update
      parseUpdateUnreadChatCount = A.withObject "UpdateUnreadChatCount" $ \o -> do
        chat_list_                      <- o A..:?  "chat_list"
        total_count_                    <- o A..:?  "total_count"
        unread_count_                   <- o A..:?  "unread_count"
        unread_unmuted_count_           <- o A..:?  "unread_unmuted_count"
        marked_as_unread_count_         <- o A..:?  "marked_as_unread_count"
        marked_as_unread_unmuted_count_ <- o A..:?  "marked_as_unread_unmuted_count"
        pure $ UpdateUnreadChatCount
          { chat_list                      = chat_list_
          , total_count                    = total_count_
          , unread_count                   = unread_count_
          , unread_unmuted_count           = unread_unmuted_count_
          , marked_as_unread_count         = marked_as_unread_count_
          , marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_
          }
      parseUpdateStory :: A.Value -> AT.Parser Update
      parseUpdateStory = A.withObject "UpdateStory" $ \o -> do
        story_ <- o A..:?  "story"
        pure $ UpdateStory
          { story = story_
          }
      parseUpdateStoryDeleted :: A.Value -> AT.Parser Update
      parseUpdateStoryDeleted = A.withObject "UpdateStoryDeleted" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ UpdateStoryDeleted
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          }
      parseUpdateChatActiveStories :: A.Value -> AT.Parser Update
      parseUpdateChatActiveStories = A.withObject "UpdateChatActiveStories" $ \o -> do
        active_stories_ <- o A..:?  "active_stories"
        pure $ UpdateChatActiveStories
          { active_stories = active_stories_
          }
      parseUpdateStoryListChatCount :: A.Value -> AT.Parser Update
      parseUpdateStoryListChatCount = A.withObject "UpdateStoryListChatCount" $ \o -> do
        story_list_ <- o A..:?  "story_list"
        chat_count_ <- o A..:?  "chat_count"
        pure $ UpdateStoryListChatCount
          { story_list = story_list_
          , chat_count = chat_count_
          }
      parseUpdateOption :: A.Value -> AT.Parser Update
      parseUpdateOption = A.withObject "UpdateOption" $ \o -> do
        name_  <- o A..:?  "name"
        value_ <- o A..:?  "value"
        pure $ UpdateOption
          { name  = name_
          , value = value_
          }
      parseUpdateStickerSet :: A.Value -> AT.Parser Update
      parseUpdateStickerSet = A.withObject "UpdateStickerSet" $ \o -> do
        sticker_set_ <- o A..:?  "sticker_set"
        pure $ UpdateStickerSet
          { sticker_set = sticker_set_
          }
      parseUpdateInstalledStickerSets :: A.Value -> AT.Parser Update
      parseUpdateInstalledStickerSets = A.withObject "UpdateInstalledStickerSets" $ \o -> do
        sticker_type_    <- o A..:?                              "sticker_type"
        sticker_set_ids_ <- fmap (fmap I.readInt64) <$> o A..:?  "sticker_set_ids"
        pure $ UpdateInstalledStickerSets
          { sticker_type    = sticker_type_
          , sticker_set_ids = sticker_set_ids_
          }
      parseUpdateTrendingStickerSets :: A.Value -> AT.Parser Update
      parseUpdateTrendingStickerSets = A.withObject "UpdateTrendingStickerSets" $ \o -> do
        sticker_type_ <- o A..:?  "sticker_type"
        sticker_sets_ <- o A..:?  "sticker_sets"
        pure $ UpdateTrendingStickerSets
          { sticker_type = sticker_type_
          , sticker_sets = sticker_sets_
          }
      parseUpdateRecentStickers :: A.Value -> AT.Parser Update
      parseUpdateRecentStickers = A.withObject "UpdateRecentStickers" $ \o -> do
        is_attached_ <- o A..:?  "is_attached"
        sticker_ids_ <- o A..:?  "sticker_ids"
        pure $ UpdateRecentStickers
          { is_attached = is_attached_
          , sticker_ids = sticker_ids_
          }
      parseUpdateFavoriteStickers :: A.Value -> AT.Parser Update
      parseUpdateFavoriteStickers = A.withObject "UpdateFavoriteStickers" $ \o -> do
        sticker_ids_ <- o A..:?  "sticker_ids"
        pure $ UpdateFavoriteStickers
          { sticker_ids = sticker_ids_
          }
      parseUpdateSavedAnimations :: A.Value -> AT.Parser Update
      parseUpdateSavedAnimations = A.withObject "UpdateSavedAnimations" $ \o -> do
        animation_ids_ <- o A..:?  "animation_ids"
        pure $ UpdateSavedAnimations
          { animation_ids = animation_ids_
          }
      parseUpdateSavedNotificationSounds :: A.Value -> AT.Parser Update
      parseUpdateSavedNotificationSounds = A.withObject "UpdateSavedNotificationSounds" $ \o -> do
        notification_sound_ids_ <- fmap (fmap I.readInt64) <$> o A..:?  "notification_sound_ids"
        pure $ UpdateSavedNotificationSounds
          { notification_sound_ids = notification_sound_ids_
          }
      parseUpdateSelectedBackground :: A.Value -> AT.Parser Update
      parseUpdateSelectedBackground = A.withObject "UpdateSelectedBackground" $ \o -> do
        for_dark_theme_ <- o A..:?  "for_dark_theme"
        _background_    <- o A..:?  "background"
        pure $ UpdateSelectedBackground
          { for_dark_theme = for_dark_theme_
          , _background    = _background_
          }
      parseUpdateChatThemes :: A.Value -> AT.Parser Update
      parseUpdateChatThemes = A.withObject "UpdateChatThemes" $ \o -> do
        chat_themes_ <- o A..:?  "chat_themes"
        pure $ UpdateChatThemes
          { chat_themes = chat_themes_
          }
      parseUpdateLanguagePackStrings :: A.Value -> AT.Parser Update
      parseUpdateLanguagePackStrings = A.withObject "UpdateLanguagePackStrings" $ \o -> do
        localization_target_ <- o A..:?  "localization_target"
        language_pack_id_    <- o A..:?  "language_pack_id"
        strings_             <- o A..:?  "strings"
        pure $ UpdateLanguagePackStrings
          { localization_target = localization_target_
          , language_pack_id    = language_pack_id_
          , strings             = strings_
          }
      parseUpdateConnectionState :: A.Value -> AT.Parser Update
      parseUpdateConnectionState = A.withObject "UpdateConnectionState" $ \o -> do
        state_ <- o A..:?  "state"
        pure $ UpdateConnectionState
          { state = state_
          }
      parseUpdateTermsOfService :: A.Value -> AT.Parser Update
      parseUpdateTermsOfService = A.withObject "UpdateTermsOfService" $ \o -> do
        terms_of_service_id_ <- o A..:?  "terms_of_service_id"
        terms_of_service_    <- o A..:?  "terms_of_service"
        pure $ UpdateTermsOfService
          { terms_of_service_id = terms_of_service_id_
          , terms_of_service    = terms_of_service_
          }
      parseUpdateUsersNearby :: A.Value -> AT.Parser Update
      parseUpdateUsersNearby = A.withObject "UpdateUsersNearby" $ \o -> do
        users_nearby_ <- o A..:?  "users_nearby"
        pure $ UpdateUsersNearby
          { users_nearby = users_nearby_
          }
      parseUpdateAttachmentMenuBots :: A.Value -> AT.Parser Update
      parseUpdateAttachmentMenuBots = A.withObject "UpdateAttachmentMenuBots" $ \o -> do
        bots_ <- o A..:?  "bots"
        pure $ UpdateAttachmentMenuBots
          { bots = bots_
          }
      parseUpdateWebAppMessageSent :: A.Value -> AT.Parser Update
      parseUpdateWebAppMessageSent = A.withObject "UpdateWebAppMessageSent" $ \o -> do
        web_app_launch_id_ <- fmap I.readInt64 <$> o A..:?  "web_app_launch_id"
        pure $ UpdateWebAppMessageSent
          { web_app_launch_id = web_app_launch_id_
          }
      parseUpdateActiveEmojiReactions :: A.Value -> AT.Parser Update
      parseUpdateActiveEmojiReactions = A.withObject "UpdateActiveEmojiReactions" $ \o -> do
        emojis_ <- o A..:?  "emojis"
        pure $ UpdateActiveEmojiReactions
          { emojis = emojis_
          }
      parseUpdateDefaultReactionType :: A.Value -> AT.Parser Update
      parseUpdateDefaultReactionType = A.withObject "UpdateDefaultReactionType" $ \o -> do
        reaction_type_ <- o A..:?  "reaction_type"
        pure $ UpdateDefaultReactionType
          { reaction_type = reaction_type_
          }
      parseUpdateDiceEmojis :: A.Value -> AT.Parser Update
      parseUpdateDiceEmojis = A.withObject "UpdateDiceEmojis" $ \o -> do
        emojis_ <- o A..:?  "emojis"
        pure $ UpdateDiceEmojis
          { emojis = emojis_
          }
      parseUpdateAnimatedEmojiMessageClicked :: A.Value -> AT.Parser Update
      parseUpdateAnimatedEmojiMessageClicked = A.withObject "UpdateAnimatedEmojiMessageClicked" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        sticker_    <- o A..:?  "sticker"
        pure $ UpdateAnimatedEmojiMessageClicked
          { chat_id    = chat_id_
          , message_id = message_id_
          , sticker    = sticker_
          }
      parseUpdateAnimationSearchParameters :: A.Value -> AT.Parser Update
      parseUpdateAnimationSearchParameters = A.withObject "UpdateAnimationSearchParameters" $ \o -> do
        provider_ <- o A..:?  "provider"
        emojis_   <- o A..:?  "emojis"
        pure $ UpdateAnimationSearchParameters
          { provider = provider_
          , emojis   = emojis_
          }
      parseUpdateSuggestedActions :: A.Value -> AT.Parser Update
      parseUpdateSuggestedActions = A.withObject "UpdateSuggestedActions" $ \o -> do
        added_actions_   <- o A..:?  "added_actions"
        removed_actions_ <- o A..:?  "removed_actions"
        pure $ UpdateSuggestedActions
          { added_actions   = added_actions_
          , removed_actions = removed_actions_
          }
      parseUpdateAddChatMembersPrivacyForbidden :: A.Value -> AT.Parser Update
      parseUpdateAddChatMembersPrivacyForbidden = A.withObject "UpdateAddChatMembersPrivacyForbidden" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        user_ids_ <- o A..:?  "user_ids"
        pure $ UpdateAddChatMembersPrivacyForbidden
          { chat_id  = chat_id_
          , user_ids = user_ids_
          }
      parseUpdateAutosaveSettings :: A.Value -> AT.Parser Update
      parseUpdateAutosaveSettings = A.withObject "UpdateAutosaveSettings" $ \o -> do
        _scope_   <- o A..:?  "scope"
        settings_ <- o A..:?  "settings"
        pure $ UpdateAutosaveSettings
          { _scope   = _scope_
          , settings = settings_
          }
      parseUpdateNewInlineQuery :: A.Value -> AT.Parser Update
      parseUpdateNewInlineQuery = A.withObject "UpdateNewInlineQuery" $ \o -> do
        _id_            <- fmap I.readInt64 <$> o A..:?  "id"
        sender_user_id_ <- o A..:?                       "sender_user_id"
        user_location_  <- o A..:?                       "user_location"
        chat_type_      <- o A..:?                       "chat_type"
        query_          <- o A..:?                       "query"
        offset_         <- o A..:?                       "offset"
        pure $ UpdateNewInlineQuery
          { _id            = _id_
          , sender_user_id = sender_user_id_
          , user_location  = user_location_
          , chat_type      = chat_type_
          , query          = query_
          , offset         = offset_
          }
      parseUpdateNewChosenInlineResult :: A.Value -> AT.Parser Update
      parseUpdateNewChosenInlineResult = A.withObject "UpdateNewChosenInlineResult" $ \o -> do
        sender_user_id_    <- o A..:?  "sender_user_id"
        user_location_     <- o A..:?  "user_location"
        query_             <- o A..:?  "query"
        result_id_         <- o A..:?  "result_id"
        inline_message_id_ <- o A..:?  "inline_message_id"
        pure $ UpdateNewChosenInlineResult
          { sender_user_id    = sender_user_id_
          , user_location     = user_location_
          , query             = query_
          , result_id         = result_id_
          , inline_message_id = inline_message_id_
          }
      parseUpdateNewCallbackQuery :: A.Value -> AT.Parser Update
      parseUpdateNewCallbackQuery = A.withObject "UpdateNewCallbackQuery" $ \o -> do
        _id_            <- fmap I.readInt64 <$> o A..:?  "id"
        sender_user_id_ <- o A..:?                       "sender_user_id"
        chat_id_        <- o A..:?                       "chat_id"
        message_id_     <- o A..:?                       "message_id"
        chat_instance_  <- fmap I.readInt64 <$> o A..:?  "chat_instance"
        payload_        <- o A..:?                       "payload"
        pure $ UpdateNewCallbackQuery
          { _id            = _id_
          , sender_user_id = sender_user_id_
          , chat_id        = chat_id_
          , message_id     = message_id_
          , chat_instance  = chat_instance_
          , payload        = payload_
          }
      parseUpdateNewInlineCallbackQuery :: A.Value -> AT.Parser Update
      parseUpdateNewInlineCallbackQuery = A.withObject "UpdateNewInlineCallbackQuery" $ \o -> do
        _id_               <- fmap I.readInt64 <$> o A..:?  "id"
        sender_user_id_    <- o A..:?                       "sender_user_id"
        inline_message_id_ <- o A..:?                       "inline_message_id"
        chat_instance_     <- fmap I.readInt64 <$> o A..:?  "chat_instance"
        payload_           <- o A..:?                       "payload"
        pure $ UpdateNewInlineCallbackQuery
          { _id               = _id_
          , sender_user_id    = sender_user_id_
          , inline_message_id = inline_message_id_
          , chat_instance     = chat_instance_
          , payload           = payload_
          }
      parseUpdateNewShippingQuery :: A.Value -> AT.Parser Update
      parseUpdateNewShippingQuery = A.withObject "UpdateNewShippingQuery" $ \o -> do
        _id_              <- fmap I.readInt64 <$> o A..:?  "id"
        sender_user_id_   <- o A..:?                       "sender_user_id"
        invoice_payload_  <- o A..:?                       "invoice_payload"
        shipping_address_ <- o A..:?                       "shipping_address"
        pure $ UpdateNewShippingQuery
          { _id              = _id_
          , sender_user_id   = sender_user_id_
          , invoice_payload  = invoice_payload_
          , shipping_address = shipping_address_
          }
      parseUpdateNewPreCheckoutQuery :: A.Value -> AT.Parser Update
      parseUpdateNewPreCheckoutQuery = A.withObject "UpdateNewPreCheckoutQuery" $ \o -> do
        _id_                <- fmap I.readInt64 <$> o A..:?  "id"
        sender_user_id_     <- o A..:?                       "sender_user_id"
        currency_           <- o A..:?                       "currency"
        total_amount_       <- o A..:?                       "total_amount"
        _invoice_payload_   <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        shipping_option_id_ <- o A..:?                       "shipping_option_id"
        order_info_         <- o A..:?                       "order_info"
        pure $ UpdateNewPreCheckoutQuery
          { _id                = _id_
          , sender_user_id     = sender_user_id_
          , currency           = currency_
          , total_amount       = total_amount_
          , _invoice_payload   = _invoice_payload_
          , shipping_option_id = shipping_option_id_
          , order_info         = order_info_
          }
      parseUpdateNewCustomEvent :: A.Value -> AT.Parser Update
      parseUpdateNewCustomEvent = A.withObject "UpdateNewCustomEvent" $ \o -> do
        event_ <- o A..:?  "event"
        pure $ UpdateNewCustomEvent
          { event = event_
          }
      parseUpdateNewCustomQuery :: A.Value -> AT.Parser Update
      parseUpdateNewCustomQuery = A.withObject "UpdateNewCustomQuery" $ \o -> do
        _id_     <- fmap I.readInt64 <$> o A..:?  "id"
        __data_  <- o A..:?                       "data"
        timeout_ <- o A..:?                       "timeout"
        pure $ UpdateNewCustomQuery
          { _id     = _id_
          , __data  = __data_
          , timeout = timeout_
          }
      parseUpdatePoll :: A.Value -> AT.Parser Update
      parseUpdatePoll = A.withObject "UpdatePoll" $ \o -> do
        poll_ <- o A..:?  "poll"
        pure $ UpdatePoll
          { poll = poll_
          }
      parseUpdatePollAnswer :: A.Value -> AT.Parser Update
      parseUpdatePollAnswer = A.withObject "UpdatePollAnswer" $ \o -> do
        poll_id_    <- fmap I.readInt64 <$> o A..:?  "poll_id"
        voter_id_   <- o A..:?                       "voter_id"
        option_ids_ <- o A..:?                       "option_ids"
        pure $ UpdatePollAnswer
          { poll_id    = poll_id_
          , voter_id   = voter_id_
          , option_ids = option_ids_
          }
      parseUpdateChatMember :: A.Value -> AT.Parser Update
      parseUpdateChatMember = A.withObject "UpdateChatMember" $ \o -> do
        chat_id_                     <- o A..:?  "chat_id"
        actor_user_id_               <- o A..:?  "actor_user_id"
        date_                        <- o A..:?  "date"
        invite_link_                 <- o A..:?  "invite_link"
        via_chat_folder_invite_link_ <- o A..:?  "via_chat_folder_invite_link"
        old_chat_member_             <- o A..:?  "old_chat_member"
        new_chat_member_             <- o A..:?  "new_chat_member"
        pure $ UpdateChatMember
          { chat_id                     = chat_id_
          , actor_user_id               = actor_user_id_
          , date                        = date_
          , invite_link                 = invite_link_
          , via_chat_folder_invite_link = via_chat_folder_invite_link_
          , old_chat_member             = old_chat_member_
          , new_chat_member             = new_chat_member_
          }
      parseUpdateNewChatJoinRequest :: A.Value -> AT.Parser Update
      parseUpdateNewChatJoinRequest = A.withObject "UpdateNewChatJoinRequest" $ \o -> do
        chat_id_      <- o A..:?  "chat_id"
        request_      <- o A..:?  "request"
        user_chat_id_ <- o A..:?  "user_chat_id"
        invite_link_  <- o A..:?  "invite_link"
        pure $ UpdateNewChatJoinRequest
          { chat_id      = chat_id_
          , request      = request_
          , user_chat_id = user_chat_id_
          , invite_link  = invite_link_
          }
  parseJSON _ = mempty

instance AT.ToJSON Update where
  toJSON UpdateAuthorizationState
    { authorization_state = authorization_state_
    }
      = A.object
        [ "@type"               A..= AT.String "updateAuthorizationState"
        , "authorization_state" A..= authorization_state_
        ]
  toJSON UpdateNewMessage
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "updateNewMessage"
        , "message" A..= message_
        ]
  toJSON UpdateMessageSendAcknowledged
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "updateMessageSendAcknowledged"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON UpdateMessageSendSucceeded
    { message        = message_
    , old_message_id = old_message_id_
    }
      = A.object
        [ "@type"          A..= AT.String "updateMessageSendSucceeded"
        , "message"        A..= message_
        , "old_message_id" A..= old_message_id_
        ]
  toJSON UpdateMessageSendFailed
    { message        = message_
    , old_message_id = old_message_id_
    , error_code     = error_code_
    , error_message  = error_message_
    }
      = A.object
        [ "@type"          A..= AT.String "updateMessageSendFailed"
        , "message"        A..= message_
        , "old_message_id" A..= old_message_id_
        , "error_code"     A..= error_code_
        , "error_message"  A..= error_message_
        ]
  toJSON UpdateMessageContent
    { chat_id     = chat_id_
    , message_id  = message_id_
    , new_content = new_content_
    }
      = A.object
        [ "@type"       A..= AT.String "updateMessageContent"
        , "chat_id"     A..= chat_id_
        , "message_id"  A..= message_id_
        , "new_content" A..= new_content_
        ]
  toJSON UpdateMessageEdited
    { chat_id      = chat_id_
    , message_id   = message_id_
    , edit_date    = edit_date_
    , reply_markup = reply_markup_
    }
      = A.object
        [ "@type"        A..= AT.String "updateMessageEdited"
        , "chat_id"      A..= chat_id_
        , "message_id"   A..= message_id_
        , "edit_date"    A..= edit_date_
        , "reply_markup" A..= reply_markup_
        ]
  toJSON UpdateMessageIsPinned
    { chat_id    = chat_id_
    , message_id = message_id_
    , is_pinned  = is_pinned_
    }
      = A.object
        [ "@type"      A..= AT.String "updateMessageIsPinned"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        , "is_pinned"  A..= is_pinned_
        ]
  toJSON UpdateMessageInteractionInfo
    { chat_id          = chat_id_
    , message_id       = message_id_
    , interaction_info = interaction_info_
    }
      = A.object
        [ "@type"            A..= AT.String "updateMessageInteractionInfo"
        , "chat_id"          A..= chat_id_
        , "message_id"       A..= message_id_
        , "interaction_info" A..= interaction_info_
        ]
  toJSON UpdateMessageContentOpened
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "updateMessageContentOpened"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON UpdateMessageMentionRead
    { chat_id              = chat_id_
    , message_id           = message_id_
    , unread_mention_count = unread_mention_count_
    }
      = A.object
        [ "@type"                A..= AT.String "updateMessageMentionRead"
        , "chat_id"              A..= chat_id_
        , "message_id"           A..= message_id_
        , "unread_mention_count" A..= unread_mention_count_
        ]
  toJSON UpdateMessageUnreadReactions
    { chat_id               = chat_id_
    , message_id            = message_id_
    , unread_reactions      = unread_reactions_
    , unread_reaction_count = unread_reaction_count_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateMessageUnreadReactions"
        , "chat_id"               A..= chat_id_
        , "message_id"            A..= message_id_
        , "unread_reactions"      A..= unread_reactions_
        , "unread_reaction_count" A..= unread_reaction_count_
        ]
  toJSON UpdateMessageLiveLocationViewed
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "updateMessageLiveLocationViewed"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON UpdateNewChat
    { chat = chat_
    }
      = A.object
        [ "@type" A..= AT.String "updateNewChat"
        , "chat"  A..= chat_
        ]
  toJSON UpdateChatTitle
    { chat_id = chat_id_
    , title   = title_
    }
      = A.object
        [ "@type"   A..= AT.String "updateChatTitle"
        , "chat_id" A..= chat_id_
        , "title"   A..= title_
        ]
  toJSON UpdateChatPhoto
    { chat_id = chat_id_
    , photo   = photo_
    }
      = A.object
        [ "@type"   A..= AT.String "updateChatPhoto"
        , "chat_id" A..= chat_id_
        , "photo"   A..= photo_
        ]
  toJSON UpdateChatPermissions
    { chat_id     = chat_id_
    , permissions = permissions_
    }
      = A.object
        [ "@type"       A..= AT.String "updateChatPermissions"
        , "chat_id"     A..= chat_id_
        , "permissions" A..= permissions_
        ]
  toJSON UpdateChatLastMessage
    { chat_id      = chat_id_
    , last_message = last_message_
    , positions    = positions_
    }
      = A.object
        [ "@type"        A..= AT.String "updateChatLastMessage"
        , "chat_id"      A..= chat_id_
        , "last_message" A..= last_message_
        , "positions"    A..= positions_
        ]
  toJSON UpdateChatPosition
    { chat_id  = chat_id_
    , position = position_
    }
      = A.object
        [ "@type"    A..= AT.String "updateChatPosition"
        , "chat_id"  A..= chat_id_
        , "position" A..= position_
        ]
  toJSON UpdateChatReadInbox
    { chat_id                    = chat_id_
    , last_read_inbox_message_id = last_read_inbox_message_id_
    , unread_count               = unread_count_
    }
      = A.object
        [ "@type"                      A..= AT.String "updateChatReadInbox"
        , "chat_id"                    A..= chat_id_
        , "last_read_inbox_message_id" A..= last_read_inbox_message_id_
        , "unread_count"               A..= unread_count_
        ]
  toJSON UpdateChatReadOutbox
    { chat_id                     = chat_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    }
      = A.object
        [ "@type"                       A..= AT.String "updateChatReadOutbox"
        , "chat_id"                     A..= chat_id_
        , "last_read_outbox_message_id" A..= last_read_outbox_message_id_
        ]
  toJSON UpdateChatActionBar
    { chat_id    = chat_id_
    , action_bar = action_bar_
    }
      = A.object
        [ "@type"      A..= AT.String "updateChatActionBar"
        , "chat_id"    A..= chat_id_
        , "action_bar" A..= action_bar_
        ]
  toJSON UpdateChatAvailableReactions
    { chat_id             = chat_id_
    , available_reactions = available_reactions_
    }
      = A.object
        [ "@type"               A..= AT.String "updateChatAvailableReactions"
        , "chat_id"             A..= chat_id_
        , "available_reactions" A..= available_reactions_
        ]
  toJSON UpdateChatDraftMessage
    { chat_id       = chat_id_
    , draft_message = draft_message_
    , positions     = positions_
    }
      = A.object
        [ "@type"         A..= AT.String "updateChatDraftMessage"
        , "chat_id"       A..= chat_id_
        , "draft_message" A..= draft_message_
        , "positions"     A..= positions_
        ]
  toJSON UpdateChatMessageSender
    { chat_id           = chat_id_
    , message_sender_id = message_sender_id_
    }
      = A.object
        [ "@type"             A..= AT.String "updateChatMessageSender"
        , "chat_id"           A..= chat_id_
        , "message_sender_id" A..= message_sender_id_
        ]
  toJSON UpdateChatMessageAutoDeleteTime
    { chat_id                  = chat_id_
    , message_auto_delete_time = message_auto_delete_time_
    }
      = A.object
        [ "@type"                    A..= AT.String "updateChatMessageAutoDeleteTime"
        , "chat_id"                  A..= chat_id_
        , "message_auto_delete_time" A..= message_auto_delete_time_
        ]
  toJSON UpdateChatNotificationSettings
    { chat_id               = chat_id_
    , notification_settings = notification_settings_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateChatNotificationSettings"
        , "chat_id"               A..= chat_id_
        , "notification_settings" A..= notification_settings_
        ]
  toJSON UpdateChatPendingJoinRequests
    { chat_id               = chat_id_
    , pending_join_requests = pending_join_requests_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateChatPendingJoinRequests"
        , "chat_id"               A..= chat_id_
        , "pending_join_requests" A..= pending_join_requests_
        ]
  toJSON UpdateChatReplyMarkup
    { chat_id                 = chat_id_
    , reply_markup_message_id = reply_markup_message_id_
    }
      = A.object
        [ "@type"                   A..= AT.String "updateChatReplyMarkup"
        , "chat_id"                 A..= chat_id_
        , "reply_markup_message_id" A..= reply_markup_message_id_
        ]
  toJSON UpdateChatBackground
    { chat_id    = chat_id_
    , background = background_
    }
      = A.object
        [ "@type"      A..= AT.String "updateChatBackground"
        , "chat_id"    A..= chat_id_
        , "background" A..= background_
        ]
  toJSON UpdateChatTheme
    { chat_id    = chat_id_
    , theme_name = theme_name_
    }
      = A.object
        [ "@type"      A..= AT.String "updateChatTheme"
        , "chat_id"    A..= chat_id_
        , "theme_name" A..= theme_name_
        ]
  toJSON UpdateChatUnreadMentionCount
    { chat_id              = chat_id_
    , unread_mention_count = unread_mention_count_
    }
      = A.object
        [ "@type"                A..= AT.String "updateChatUnreadMentionCount"
        , "chat_id"              A..= chat_id_
        , "unread_mention_count" A..= unread_mention_count_
        ]
  toJSON UpdateChatUnreadReactionCount
    { chat_id               = chat_id_
    , unread_reaction_count = unread_reaction_count_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateChatUnreadReactionCount"
        , "chat_id"               A..= chat_id_
        , "unread_reaction_count" A..= unread_reaction_count_
        ]
  toJSON UpdateChatVideoChat
    { chat_id    = chat_id_
    , video_chat = video_chat_
    }
      = A.object
        [ "@type"      A..= AT.String "updateChatVideoChat"
        , "chat_id"    A..= chat_id_
        , "video_chat" A..= video_chat_
        ]
  toJSON UpdateChatDefaultDisableNotification
    { chat_id                      = chat_id_
    , default_disable_notification = default_disable_notification_
    }
      = A.object
        [ "@type"                        A..= AT.String "updateChatDefaultDisableNotification"
        , "chat_id"                      A..= chat_id_
        , "default_disable_notification" A..= default_disable_notification_
        ]
  toJSON UpdateChatHasProtectedContent
    { chat_id               = chat_id_
    , has_protected_content = has_protected_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateChatHasProtectedContent"
        , "chat_id"               A..= chat_id_
        , "has_protected_content" A..= has_protected_content_
        ]
  toJSON UpdateChatIsTranslatable
    { chat_id         = chat_id_
    , is_translatable = is_translatable_
    }
      = A.object
        [ "@type"           A..= AT.String "updateChatIsTranslatable"
        , "chat_id"         A..= chat_id_
        , "is_translatable" A..= is_translatable_
        ]
  toJSON UpdateChatIsMarkedAsUnread
    { chat_id             = chat_id_
    , is_marked_as_unread = is_marked_as_unread_
    }
      = A.object
        [ "@type"               A..= AT.String "updateChatIsMarkedAsUnread"
        , "chat_id"             A..= chat_id_
        , "is_marked_as_unread" A..= is_marked_as_unread_
        ]
  toJSON UpdateChatIsBlocked
    { chat_id    = chat_id_
    , is_blocked = is_blocked_
    }
      = A.object
        [ "@type"      A..= AT.String "updateChatIsBlocked"
        , "chat_id"    A..= chat_id_
        , "is_blocked" A..= is_blocked_
        ]
  toJSON UpdateChatHasScheduledMessages
    { chat_id                = chat_id_
    , has_scheduled_messages = has_scheduled_messages_
    }
      = A.object
        [ "@type"                  A..= AT.String "updateChatHasScheduledMessages"
        , "chat_id"                A..= chat_id_
        , "has_scheduled_messages" A..= has_scheduled_messages_
        ]
  toJSON UpdateChatFolders
    { chat_folders            = chat_folders_
    , main_chat_list_position = main_chat_list_position_
    }
      = A.object
        [ "@type"                   A..= AT.String "updateChatFolders"
        , "chat_folders"            A..= chat_folders_
        , "main_chat_list_position" A..= main_chat_list_position_
        ]
  toJSON UpdateChatOnlineMemberCount
    { chat_id             = chat_id_
    , online_member_count = online_member_count_
    }
      = A.object
        [ "@type"               A..= AT.String "updateChatOnlineMemberCount"
        , "chat_id"             A..= chat_id_
        , "online_member_count" A..= online_member_count_
        ]
  toJSON UpdateForumTopicInfo
    { chat_id = chat_id_
    , info    = info_
    }
      = A.object
        [ "@type"   A..= AT.String "updateForumTopicInfo"
        , "chat_id" A..= chat_id_
        , "info"    A..= info_
        ]
  toJSON UpdateScopeNotificationSettings
    { scope                  = scope_
    , _notification_settings = _notification_settings_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateScopeNotificationSettings"
        , "scope"                 A..= scope_
        , "notification_settings" A..= _notification_settings_
        ]
  toJSON UpdateNotification
    { notification_group_id = notification_group_id_
    , notification          = notification_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateNotification"
        , "notification_group_id" A..= notification_group_id_
        , "notification"          A..= notification_
        ]
  toJSON UpdateNotificationGroup
    { notification_group_id         = notification_group_id_
    , _type                         = _type_
    , chat_id                       = chat_id_
    , notification_settings_chat_id = notification_settings_chat_id_
    , notification_sound_id         = notification_sound_id_
    , total_count                   = total_count_
    , added_notifications           = added_notifications_
    , removed_notification_ids      = removed_notification_ids_
    }
      = A.object
        [ "@type"                         A..= AT.String "updateNotificationGroup"
        , "notification_group_id"         A..= notification_group_id_
        , "type"                          A..= _type_
        , "chat_id"                       A..= chat_id_
        , "notification_settings_chat_id" A..= notification_settings_chat_id_
        , "notification_sound_id"         A..= fmap I.writeInt64  notification_sound_id_
        , "total_count"                   A..= total_count_
        , "added_notifications"           A..= added_notifications_
        , "removed_notification_ids"      A..= removed_notification_ids_
        ]
  toJSON UpdateActiveNotifications
    { groups = groups_
    }
      = A.object
        [ "@type"  A..= AT.String "updateActiveNotifications"
        , "groups" A..= groups_
        ]
  toJSON UpdateHavePendingNotifications
    { have_delayed_notifications    = have_delayed_notifications_
    , have_unreceived_notifications = have_unreceived_notifications_
    }
      = A.object
        [ "@type"                         A..= AT.String "updateHavePendingNotifications"
        , "have_delayed_notifications"    A..= have_delayed_notifications_
        , "have_unreceived_notifications" A..= have_unreceived_notifications_
        ]
  toJSON UpdateDeleteMessages
    { chat_id      = chat_id_
    , message_ids  = message_ids_
    , is_permanent = is_permanent_
    , from_cache   = from_cache_
    }
      = A.object
        [ "@type"        A..= AT.String "updateDeleteMessages"
        , "chat_id"      A..= chat_id_
        , "message_ids"  A..= message_ids_
        , "is_permanent" A..= is_permanent_
        , "from_cache"   A..= from_cache_
        ]
  toJSON UpdateChatAction
    { chat_id           = chat_id_
    , message_thread_id = message_thread_id_
    , sender_id         = sender_id_
    , action            = action_
    }
      = A.object
        [ "@type"             A..= AT.String "updateChatAction"
        , "chat_id"           A..= chat_id_
        , "message_thread_id" A..= message_thread_id_
        , "sender_id"         A..= sender_id_
        , "action"            A..= action_
        ]
  toJSON UpdateUserStatus
    { user_id = user_id_
    , status  = status_
    }
      = A.object
        [ "@type"   A..= AT.String "updateUserStatus"
        , "user_id" A..= user_id_
        , "status"  A..= status_
        ]
  toJSON UpdateUser
    { user = user_
    }
      = A.object
        [ "@type" A..= AT.String "updateUser"
        , "user"  A..= user_
        ]
  toJSON UpdateBasicGroup
    { basic_group = basic_group_
    }
      = A.object
        [ "@type"       A..= AT.String "updateBasicGroup"
        , "basic_group" A..= basic_group_
        ]
  toJSON UpdateSupergroup
    { supergroup = supergroup_
    }
      = A.object
        [ "@type"      A..= AT.String "updateSupergroup"
        , "supergroup" A..= supergroup_
        ]
  toJSON UpdateSecretChat
    { secret_chat = secret_chat_
    }
      = A.object
        [ "@type"       A..= AT.String "updateSecretChat"
        , "secret_chat" A..= secret_chat_
        ]
  toJSON UpdateUserFullInfo
    { user_id        = user_id_
    , user_full_info = user_full_info_
    }
      = A.object
        [ "@type"          A..= AT.String "updateUserFullInfo"
        , "user_id"        A..= user_id_
        , "user_full_info" A..= user_full_info_
        ]
  toJSON UpdateBasicGroupFullInfo
    { basic_group_id        = basic_group_id_
    , basic_group_full_info = basic_group_full_info_
    }
      = A.object
        [ "@type"                 A..= AT.String "updateBasicGroupFullInfo"
        , "basic_group_id"        A..= basic_group_id_
        , "basic_group_full_info" A..= basic_group_full_info_
        ]
  toJSON UpdateSupergroupFullInfo
    { supergroup_id        = supergroup_id_
    , supergroup_full_info = supergroup_full_info_
    }
      = A.object
        [ "@type"                A..= AT.String "updateSupergroupFullInfo"
        , "supergroup_id"        A..= supergroup_id_
        , "supergroup_full_info" A..= supergroup_full_info_
        ]
  toJSON UpdateServiceNotification
    { __type  = __type_
    , content = content_
    }
      = A.object
        [ "@type"   A..= AT.String "updateServiceNotification"
        , "type"    A..= __type_
        , "content" A..= content_
        ]
  toJSON UpdateFile
    { file = file_
    }
      = A.object
        [ "@type" A..= AT.String "updateFile"
        , "file"  A..= file_
        ]
  toJSON UpdateFileGenerationStart
    { generation_id    = generation_id_
    , original_path    = original_path_
    , destination_path = destination_path_
    , conversion       = conversion_
    }
      = A.object
        [ "@type"            A..= AT.String "updateFileGenerationStart"
        , "generation_id"    A..= fmap I.writeInt64  generation_id_
        , "original_path"    A..= original_path_
        , "destination_path" A..= destination_path_
        , "conversion"       A..= conversion_
        ]
  toJSON UpdateFileGenerationStop
    { generation_id = generation_id_
    }
      = A.object
        [ "@type"         A..= AT.String "updateFileGenerationStop"
        , "generation_id" A..= fmap I.writeInt64  generation_id_
        ]
  toJSON UpdateFileDownloads
    { total_size      = total_size_
    , total_count     = total_count_
    , downloaded_size = downloaded_size_
    }
      = A.object
        [ "@type"           A..= AT.String "updateFileDownloads"
        , "total_size"      A..= total_size_
        , "total_count"     A..= total_count_
        , "downloaded_size" A..= downloaded_size_
        ]
  toJSON UpdateFileAddedToDownloads
    { file_download = file_download_
    , counts        = counts_
    }
      = A.object
        [ "@type"         A..= AT.String "updateFileAddedToDownloads"
        , "file_download" A..= file_download_
        , "counts"        A..= counts_
        ]
  toJSON UpdateFileDownload
    { file_id       = file_id_
    , complete_date = complete_date_
    , is_paused     = is_paused_
    , counts        = counts_
    }
      = A.object
        [ "@type"         A..= AT.String "updateFileDownload"
        , "file_id"       A..= file_id_
        , "complete_date" A..= complete_date_
        , "is_paused"     A..= is_paused_
        , "counts"        A..= counts_
        ]
  toJSON UpdateFileRemovedFromDownloads
    { file_id = file_id_
    , counts  = counts_
    }
      = A.object
        [ "@type"   A..= AT.String "updateFileRemovedFromDownloads"
        , "file_id" A..= file_id_
        , "counts"  A..= counts_
        ]
  toJSON UpdateCall
    { call = call_
    }
      = A.object
        [ "@type" A..= AT.String "updateCall"
        , "call"  A..= call_
        ]
  toJSON UpdateGroupCall
    { group_call = group_call_
    }
      = A.object
        [ "@type"      A..= AT.String "updateGroupCall"
        , "group_call" A..= group_call_
        ]
  toJSON UpdateGroupCallParticipant
    { group_call_id = group_call_id_
    , participant   = participant_
    }
      = A.object
        [ "@type"         A..= AT.String "updateGroupCallParticipant"
        , "group_call_id" A..= group_call_id_
        , "participant"   A..= participant_
        ]
  toJSON UpdateNewCallSignalingData
    { call_id = call_id_
    , _data   = _data_
    }
      = A.object
        [ "@type"   A..= AT.String "updateNewCallSignalingData"
        , "call_id" A..= call_id_
        , "data"    A..= fmap I.writeBytes  _data_
        ]
  toJSON UpdateUserPrivacySettingRules
    { setting = setting_
    , rules   = rules_
    }
      = A.object
        [ "@type"   A..= AT.String "updateUserPrivacySettingRules"
        , "setting" A..= setting_
        , "rules"   A..= rules_
        ]
  toJSON UpdateUnreadMessageCount
    { chat_list            = chat_list_
    , unread_count         = unread_count_
    , unread_unmuted_count = unread_unmuted_count_
    }
      = A.object
        [ "@type"                A..= AT.String "updateUnreadMessageCount"
        , "chat_list"            A..= chat_list_
        , "unread_count"         A..= unread_count_
        , "unread_unmuted_count" A..= unread_unmuted_count_
        ]
  toJSON UpdateUnreadChatCount
    { chat_list                      = chat_list_
    , total_count                    = total_count_
    , unread_count                   = unread_count_
    , unread_unmuted_count           = unread_unmuted_count_
    , marked_as_unread_count         = marked_as_unread_count_
    , marked_as_unread_unmuted_count = marked_as_unread_unmuted_count_
    }
      = A.object
        [ "@type"                          A..= AT.String "updateUnreadChatCount"
        , "chat_list"                      A..= chat_list_
        , "total_count"                    A..= total_count_
        , "unread_count"                   A..= unread_count_
        , "unread_unmuted_count"           A..= unread_unmuted_count_
        , "marked_as_unread_count"         A..= marked_as_unread_count_
        , "marked_as_unread_unmuted_count" A..= marked_as_unread_unmuted_count_
        ]
  toJSON UpdateStory
    { story = story_
    }
      = A.object
        [ "@type" A..= AT.String "updateStory"
        , "story" A..= story_
        ]
  toJSON UpdateStoryDeleted
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = A.object
        [ "@type"                A..= AT.String "updateStoryDeleted"
        , "story_sender_chat_id" A..= story_sender_chat_id_
        , "story_id"             A..= story_id_
        ]
  toJSON UpdateChatActiveStories
    { active_stories = active_stories_
    }
      = A.object
        [ "@type"          A..= AT.String "updateChatActiveStories"
        , "active_stories" A..= active_stories_
        ]
  toJSON UpdateStoryListChatCount
    { story_list = story_list_
    , chat_count = chat_count_
    }
      = A.object
        [ "@type"      A..= AT.String "updateStoryListChatCount"
        , "story_list" A..= story_list_
        , "chat_count" A..= chat_count_
        ]
  toJSON UpdateOption
    { name  = name_
    , value = value_
    }
      = A.object
        [ "@type" A..= AT.String "updateOption"
        , "name"  A..= name_
        , "value" A..= value_
        ]
  toJSON UpdateStickerSet
    { sticker_set = sticker_set_
    }
      = A.object
        [ "@type"       A..= AT.String "updateStickerSet"
        , "sticker_set" A..= sticker_set_
        ]
  toJSON UpdateInstalledStickerSets
    { sticker_type    = sticker_type_
    , sticker_set_ids = sticker_set_ids_
    }
      = A.object
        [ "@type"           A..= AT.String "updateInstalledStickerSets"
        , "sticker_type"    A..= sticker_type_
        , "sticker_set_ids" A..= fmap (fmap I.writeInt64 ) sticker_set_ids_
        ]
  toJSON UpdateTrendingStickerSets
    { sticker_type = sticker_type_
    , sticker_sets = sticker_sets_
    }
      = A.object
        [ "@type"        A..= AT.String "updateTrendingStickerSets"
        , "sticker_type" A..= sticker_type_
        , "sticker_sets" A..= sticker_sets_
        ]
  toJSON UpdateRecentStickers
    { is_attached = is_attached_
    , sticker_ids = sticker_ids_
    }
      = A.object
        [ "@type"       A..= AT.String "updateRecentStickers"
        , "is_attached" A..= is_attached_
        , "sticker_ids" A..= sticker_ids_
        ]
  toJSON UpdateFavoriteStickers
    { sticker_ids = sticker_ids_
    }
      = A.object
        [ "@type"       A..= AT.String "updateFavoriteStickers"
        , "sticker_ids" A..= sticker_ids_
        ]
  toJSON UpdateSavedAnimations
    { animation_ids = animation_ids_
    }
      = A.object
        [ "@type"         A..= AT.String "updateSavedAnimations"
        , "animation_ids" A..= animation_ids_
        ]
  toJSON UpdateSavedNotificationSounds
    { notification_sound_ids = notification_sound_ids_
    }
      = A.object
        [ "@type"                  A..= AT.String "updateSavedNotificationSounds"
        , "notification_sound_ids" A..= fmap (fmap I.writeInt64 ) notification_sound_ids_
        ]
  toJSON UpdateSelectedBackground
    { for_dark_theme = for_dark_theme_
    , _background    = _background_
    }
      = A.object
        [ "@type"          A..= AT.String "updateSelectedBackground"
        , "for_dark_theme" A..= for_dark_theme_
        , "background"     A..= _background_
        ]
  toJSON UpdateChatThemes
    { chat_themes = chat_themes_
    }
      = A.object
        [ "@type"       A..= AT.String "updateChatThemes"
        , "chat_themes" A..= chat_themes_
        ]
  toJSON UpdateLanguagePackStrings
    { localization_target = localization_target_
    , language_pack_id    = language_pack_id_
    , strings             = strings_
    }
      = A.object
        [ "@type"               A..= AT.String "updateLanguagePackStrings"
        , "localization_target" A..= localization_target_
        , "language_pack_id"    A..= language_pack_id_
        , "strings"             A..= strings_
        ]
  toJSON UpdateConnectionState
    { state = state_
    }
      = A.object
        [ "@type" A..= AT.String "updateConnectionState"
        , "state" A..= state_
        ]
  toJSON UpdateTermsOfService
    { terms_of_service_id = terms_of_service_id_
    , terms_of_service    = terms_of_service_
    }
      = A.object
        [ "@type"               A..= AT.String "updateTermsOfService"
        , "terms_of_service_id" A..= terms_of_service_id_
        , "terms_of_service"    A..= terms_of_service_
        ]
  toJSON UpdateUsersNearby
    { users_nearby = users_nearby_
    }
      = A.object
        [ "@type"        A..= AT.String "updateUsersNearby"
        , "users_nearby" A..= users_nearby_
        ]
  toJSON UpdateAttachmentMenuBots
    { bots = bots_
    }
      = A.object
        [ "@type" A..= AT.String "updateAttachmentMenuBots"
        , "bots"  A..= bots_
        ]
  toJSON UpdateWebAppMessageSent
    { web_app_launch_id = web_app_launch_id_
    }
      = A.object
        [ "@type"             A..= AT.String "updateWebAppMessageSent"
        , "web_app_launch_id" A..= fmap I.writeInt64  web_app_launch_id_
        ]
  toJSON UpdateActiveEmojiReactions
    { emojis = emojis_
    }
      = A.object
        [ "@type"  A..= AT.String "updateActiveEmojiReactions"
        , "emojis" A..= emojis_
        ]
  toJSON UpdateDefaultReactionType
    { reaction_type = reaction_type_
    }
      = A.object
        [ "@type"         A..= AT.String "updateDefaultReactionType"
        , "reaction_type" A..= reaction_type_
        ]
  toJSON UpdateDiceEmojis
    { emojis = emojis_
    }
      = A.object
        [ "@type"  A..= AT.String "updateDiceEmojis"
        , "emojis" A..= emojis_
        ]
  toJSON UpdateAnimatedEmojiMessageClicked
    { chat_id    = chat_id_
    , message_id = message_id_
    , sticker    = sticker_
    }
      = A.object
        [ "@type"      A..= AT.String "updateAnimatedEmojiMessageClicked"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        , "sticker"    A..= sticker_
        ]
  toJSON UpdateAnimationSearchParameters
    { provider = provider_
    , emojis   = emojis_
    }
      = A.object
        [ "@type"    A..= AT.String "updateAnimationSearchParameters"
        , "provider" A..= provider_
        , "emojis"   A..= emojis_
        ]
  toJSON UpdateSuggestedActions
    { added_actions   = added_actions_
    , removed_actions = removed_actions_
    }
      = A.object
        [ "@type"           A..= AT.String "updateSuggestedActions"
        , "added_actions"   A..= added_actions_
        , "removed_actions" A..= removed_actions_
        ]
  toJSON UpdateAddChatMembersPrivacyForbidden
    { chat_id  = chat_id_
    , user_ids = user_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "updateAddChatMembersPrivacyForbidden"
        , "chat_id"  A..= chat_id_
        , "user_ids" A..= user_ids_
        ]
  toJSON UpdateAutosaveSettings
    { _scope   = _scope_
    , settings = settings_
    }
      = A.object
        [ "@type"    A..= AT.String "updateAutosaveSettings"
        , "scope"    A..= _scope_
        , "settings" A..= settings_
        ]
  toJSON UpdateNewInlineQuery
    { _id            = _id_
    , sender_user_id = sender_user_id_
    , user_location  = user_location_
    , chat_type      = chat_type_
    , query          = query_
    , offset         = offset_
    }
      = A.object
        [ "@type"          A..= AT.String "updateNewInlineQuery"
        , "id"             A..= fmap I.writeInt64  _id_
        , "sender_user_id" A..= sender_user_id_
        , "user_location"  A..= user_location_
        , "chat_type"      A..= chat_type_
        , "query"          A..= query_
        , "offset"         A..= offset_
        ]
  toJSON UpdateNewChosenInlineResult
    { sender_user_id    = sender_user_id_
    , user_location     = user_location_
    , query             = query_
    , result_id         = result_id_
    , inline_message_id = inline_message_id_
    }
      = A.object
        [ "@type"             A..= AT.String "updateNewChosenInlineResult"
        , "sender_user_id"    A..= sender_user_id_
        , "user_location"     A..= user_location_
        , "query"             A..= query_
        , "result_id"         A..= result_id_
        , "inline_message_id" A..= inline_message_id_
        ]
  toJSON UpdateNewCallbackQuery
    { _id            = _id_
    , sender_user_id = sender_user_id_
    , chat_id        = chat_id_
    , message_id     = message_id_
    , chat_instance  = chat_instance_
    , payload        = payload_
    }
      = A.object
        [ "@type"          A..= AT.String "updateNewCallbackQuery"
        , "id"             A..= fmap I.writeInt64  _id_
        , "sender_user_id" A..= sender_user_id_
        , "chat_id"        A..= chat_id_
        , "message_id"     A..= message_id_
        , "chat_instance"  A..= fmap I.writeInt64  chat_instance_
        , "payload"        A..= payload_
        ]
  toJSON UpdateNewInlineCallbackQuery
    { _id               = _id_
    , sender_user_id    = sender_user_id_
    , inline_message_id = inline_message_id_
    , chat_instance     = chat_instance_
    , payload           = payload_
    }
      = A.object
        [ "@type"             A..= AT.String "updateNewInlineCallbackQuery"
        , "id"                A..= fmap I.writeInt64  _id_
        , "sender_user_id"    A..= sender_user_id_
        , "inline_message_id" A..= inline_message_id_
        , "chat_instance"     A..= fmap I.writeInt64  chat_instance_
        , "payload"           A..= payload_
        ]
  toJSON UpdateNewShippingQuery
    { _id              = _id_
    , sender_user_id   = sender_user_id_
    , invoice_payload  = invoice_payload_
    , shipping_address = shipping_address_
    }
      = A.object
        [ "@type"            A..= AT.String "updateNewShippingQuery"
        , "id"               A..= fmap I.writeInt64  _id_
        , "sender_user_id"   A..= sender_user_id_
        , "invoice_payload"  A..= invoice_payload_
        , "shipping_address" A..= shipping_address_
        ]
  toJSON UpdateNewPreCheckoutQuery
    { _id                = _id_
    , sender_user_id     = sender_user_id_
    , currency           = currency_
    , total_amount       = total_amount_
    , _invoice_payload   = _invoice_payload_
    , shipping_option_id = shipping_option_id_
    , order_info         = order_info_
    }
      = A.object
        [ "@type"              A..= AT.String "updateNewPreCheckoutQuery"
        , "id"                 A..= fmap I.writeInt64  _id_
        , "sender_user_id"     A..= sender_user_id_
        , "currency"           A..= currency_
        , "total_amount"       A..= total_amount_
        , "invoice_payload"    A..= fmap I.writeBytes  _invoice_payload_
        , "shipping_option_id" A..= shipping_option_id_
        , "order_info"         A..= order_info_
        ]
  toJSON UpdateNewCustomEvent
    { event = event_
    }
      = A.object
        [ "@type" A..= AT.String "updateNewCustomEvent"
        , "event" A..= event_
        ]
  toJSON UpdateNewCustomQuery
    { _id     = _id_
    , __data  = __data_
    , timeout = timeout_
    }
      = A.object
        [ "@type"   A..= AT.String "updateNewCustomQuery"
        , "id"      A..= fmap I.writeInt64  _id_
        , "data"    A..= __data_
        , "timeout" A..= timeout_
        ]
  toJSON UpdatePoll
    { poll = poll_
    }
      = A.object
        [ "@type" A..= AT.String "updatePoll"
        , "poll"  A..= poll_
        ]
  toJSON UpdatePollAnswer
    { poll_id    = poll_id_
    , voter_id   = voter_id_
    , option_ids = option_ids_
    }
      = A.object
        [ "@type"      A..= AT.String "updatePollAnswer"
        , "poll_id"    A..= fmap I.writeInt64  poll_id_
        , "voter_id"   A..= voter_id_
        , "option_ids" A..= option_ids_
        ]
  toJSON UpdateChatMember
    { chat_id                     = chat_id_
    , actor_user_id               = actor_user_id_
    , date                        = date_
    , invite_link                 = invite_link_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    , old_chat_member             = old_chat_member_
    , new_chat_member             = new_chat_member_
    }
      = A.object
        [ "@type"                       A..= AT.String "updateChatMember"
        , "chat_id"                     A..= chat_id_
        , "actor_user_id"               A..= actor_user_id_
        , "date"                        A..= date_
        , "invite_link"                 A..= invite_link_
        , "via_chat_folder_invite_link" A..= via_chat_folder_invite_link_
        , "old_chat_member"             A..= old_chat_member_
        , "new_chat_member"             A..= new_chat_member_
        ]
  toJSON UpdateNewChatJoinRequest
    { chat_id      = chat_id_
    , request      = request_
    , user_chat_id = user_chat_id_
    , invite_link  = invite_link_
    }
      = A.object
        [ "@type"        A..= AT.String "updateNewChatJoinRequest"
        , "chat_id"      A..= chat_id_
        , "request"      A..= request_
        , "user_chat_id" A..= user_chat_id_
        , "invite_link"  A..= invite_link_
        ]
