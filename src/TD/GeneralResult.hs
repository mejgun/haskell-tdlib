module TD.GeneralResult (GeneralResult(..)) where

import Control.Applicative (Alternative ((<|>)))
import Data.Aeson (FromJSON (parseJSON))
import qualified Data.Aeson.Types as T
import qualified TD.Lib.Internal as I
import qualified TD.Data.AccountTtl as AccountTtl
import qualified TD.Data.AddedReactions as AddedReactions
import qualified TD.Data.AnimatedEmoji as AnimatedEmoji
import qualified TD.Data.Animations as Animations
import qualified TD.Data.ArchiveChatListSettings as ArchiveChatListSettings
import qualified TD.Data.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Data.AuthenticationCodeInfo as AuthenticationCodeInfo
import qualified TD.Data.AuthorizationState as AuthorizationState
import qualified TD.Data.AutoDownloadSettingsPresets as AutoDownloadSettingsPresets
import qualified TD.Data.AutosaveSettings as AutosaveSettings
import qualified TD.Data.AvailableReactions as AvailableReactions
import qualified TD.Data.Background as Background
import qualified TD.Data.Backgrounds as Backgrounds
import qualified TD.Data.BankCardInfo as BankCardInfo
import qualified TD.Data.BasicGroup as BasicGroup
import qualified TD.Data.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Data.BotCommands as BotCommands
import qualified TD.Data.BotMenuButton as BotMenuButton
import qualified TD.Data.CallId as CallId
import qualified TD.Data.CallbackQueryAnswer as CallbackQueryAnswer
import qualified TD.Data.CanBoostChatResult as CanBoostChatResult
import qualified TD.Data.CanSendStoryResult as CanSendStoryResult
import qualified TD.Data.CanTransferOwnershipResult as CanTransferOwnershipResult
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatActiveStories as ChatActiveStories
import qualified TD.Data.ChatAdministrators as ChatAdministrators
import qualified TD.Data.ChatBoostLink as ChatBoostLink
import qualified TD.Data.ChatBoostLinkInfo as ChatBoostLinkInfo
import qualified TD.Data.ChatBoostStatus as ChatBoostStatus
import qualified TD.Data.ChatEvents as ChatEvents
import qualified TD.Data.ChatFolder as ChatFolder
import qualified TD.Data.ChatFolderIcon as ChatFolderIcon
import qualified TD.Data.ChatFolderInfo as ChatFolderInfo
import qualified TD.Data.ChatFolderInviteLink as ChatFolderInviteLink
import qualified TD.Data.ChatFolderInviteLinkInfo as ChatFolderInviteLinkInfo
import qualified TD.Data.ChatFolderInviteLinks as ChatFolderInviteLinks
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatInviteLinkCounts as ChatInviteLinkCounts
import qualified TD.Data.ChatInviteLinkInfo as ChatInviteLinkInfo
import qualified TD.Data.ChatInviteLinkMembers as ChatInviteLinkMembers
import qualified TD.Data.ChatInviteLinks as ChatInviteLinks
import qualified TD.Data.ChatJoinRequests as ChatJoinRequests
import qualified TD.Data.ChatLists as ChatLists
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatMembers as ChatMembers
import qualified TD.Data.ChatMessageSenders as ChatMessageSenders
import qualified TD.Data.ChatPhotos as ChatPhotos
import qualified TD.Data.ChatStatistics as ChatStatistics
import qualified TD.Data.Chats as Chats
import qualified TD.Data.ChatsNearby as ChatsNearby
import qualified TD.Data.CheckChatUsernameResult as CheckChatUsernameResult
import qualified TD.Data.CheckStickerSetNameResult as CheckStickerSetNameResult
import qualified TD.Data.ConnectedWebsites as ConnectedWebsites
import qualified TD.Data.Count as Count
import qualified TD.Data.Countries as Countries
import qualified TD.Data.CustomRequestResult as CustomRequestResult
import qualified TD.Data.DatabaseStatistics as DatabaseStatistics
import qualified TD.Data.DeepLinkInfo as DeepLinkInfo
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified TD.Data.EmojiCategories as EmojiCategories
import qualified TD.Data.EmojiReaction as EmojiReaction
import qualified TD.Data.EmojiStatuses as EmojiStatuses
import qualified TD.Data.Emojis as Emojis
import qualified TD.Data.Error as Error
import qualified TD.Data.File as File
import qualified TD.Data.FileDownloadedPrefixSize as FileDownloadedPrefixSize
import qualified TD.Data.FilePart as FilePart
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.ForumTopic as ForumTopic
import qualified TD.Data.ForumTopicInfo as ForumTopicInfo
import qualified TD.Data.ForumTopics as ForumTopics
import qualified TD.Data.FoundChatBoosts as FoundChatBoosts
import qualified TD.Data.FoundChatMessages as FoundChatMessages
import qualified TD.Data.FoundFileDownloads as FoundFileDownloads
import qualified TD.Data.FoundMessages as FoundMessages
import qualified TD.Data.FoundPositions as FoundPositions
import qualified TD.Data.FoundWebApp as FoundWebApp
import qualified TD.Data.GameHighScores as GameHighScores
import qualified TD.Data.GroupCall as GroupCall
import qualified TD.Data.GroupCallId as GroupCallId
import qualified TD.Data.GroupCallStreams as GroupCallStreams
import qualified TD.Data.Hashtags as Hashtags
import qualified TD.Data.HttpUrl as HttpUrl
import qualified TD.Data.ImportedContacts as ImportedContacts
import qualified TD.Data.InlineQueryResults as InlineQueryResults
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified TD.Data.JsonValue as JsonValue
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified TD.Data.LanguagePackStringValue as LanguagePackStringValue
import qualified TD.Data.LanguagePackStrings as LanguagePackStrings
import qualified TD.Data.LocalizationTargetInfo as LocalizationTargetInfo
import qualified TD.Data.LogStream as LogStream
import qualified TD.Data.LogTags as LogTags
import qualified TD.Data.LogVerbosityLevel as LogVerbosityLevel
import qualified TD.Data.LoginUrlInfo as LoginUrlInfo
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageAutoDeleteTime as MessageAutoDeleteTime
import qualified TD.Data.MessageCalendar as MessageCalendar
import qualified TD.Data.MessageFileType as MessageFileType
import qualified TD.Data.MessageLink as MessageLink
import qualified TD.Data.MessageLinkInfo as MessageLinkInfo
import qualified TD.Data.MessagePositions as MessagePositions
import qualified TD.Data.MessageSenders as MessageSenders
import qualified TD.Data.MessageStatistics as MessageStatistics
import qualified TD.Data.MessageThreadInfo as MessageThreadInfo
import qualified TD.Data.MessageViewers as MessageViewers
import qualified TD.Data.Messages as Messages
import qualified TD.Data.NetworkStatistics as NetworkStatistics
import qualified TD.Data.NotificationSound as NotificationSound
import qualified TD.Data.NotificationSounds as NotificationSounds
import qualified TD.Data.Ok as Ok
import qualified TD.Data.OptionValue as OptionValue
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.PassportAuthorizationForm as PassportAuthorizationForm
import qualified TD.Data.PassportElement as PassportElement
import qualified TD.Data.PassportElements as PassportElements
import qualified TD.Data.PassportElementsWithErrors as PassportElementsWithErrors
import qualified TD.Data.PasswordState as PasswordState
import qualified TD.Data.PaymentForm as PaymentForm
import qualified TD.Data.PaymentReceipt as PaymentReceipt
import qualified TD.Data.PaymentResult as PaymentResult
import qualified TD.Data.PhoneNumberInfo as PhoneNumberInfo
import qualified TD.Data.PremiumFeatures as PremiumFeatures
import qualified TD.Data.PremiumLimit as PremiumLimit
import qualified TD.Data.PremiumState as PremiumState
import qualified TD.Data.Proxies as Proxies
import qualified TD.Data.Proxy as Proxy
import qualified TD.Data.PushReceiverId as PushReceiverId
import qualified TD.Data.RecommendedChatFolders as RecommendedChatFolders
import qualified TD.Data.RecoveryEmailAddress as RecoveryEmailAddress
import qualified TD.Data.ResetPasswordResult as ResetPasswordResult
import qualified TD.Data.RtmpUrl as RtmpUrl
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Data.Seconds as Seconds
import qualified TD.Data.SecretChat as SecretChat
import qualified TD.Data.SentWebAppMessage as SentWebAppMessage
import qualified TD.Data.Session as Session
import qualified TD.Data.Sessions as Sessions
import qualified TD.Data.SponsoredMessages as SponsoredMessages
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerSet as StickerSet
import qualified TD.Data.StickerSets as StickerSets
import qualified TD.Data.Stickers as Stickers
import qualified TD.Data.StorageStatistics as StorageStatistics
import qualified TD.Data.StorageStatisticsFast as StorageStatisticsFast
import qualified TD.Data.Stories as Stories
import qualified TD.Data.Story as Story
import qualified TD.Data.StoryViewers as StoryViewers
import qualified TD.Data.Supergroup as Supergroup
import qualified TD.Data.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Data.TMeUrls as TMeUrls
import qualified TD.Data.TemporaryPasswordState as TemporaryPasswordState
import qualified TD.Data.TestBytes as TestBytes
import qualified TD.Data.TestInt as TestInt
import qualified TD.Data.TestString as TestString
import qualified TD.Data.TestVectorInt as TestVectorInt
import qualified TD.Data.TestVectorIntObject as TestVectorIntObject
import qualified TD.Data.TestVectorString as TestVectorString
import qualified TD.Data.TestVectorStringObject as TestVectorStringObject
import qualified TD.Data.Text as Text
import qualified TD.Data.TextEntities as TextEntities
import qualified TD.Data.TrendingStickerSets as TrendingStickerSets
import qualified TD.Data.Update as Update
import qualified TD.Data.Updates as Updates
import qualified TD.Data.User as User
import qualified TD.Data.UserFullInfo as UserFullInfo
import qualified TD.Data.UserLink as UserLink
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules
import qualified TD.Data.UserSupportInfo as UserSupportInfo
import qualified TD.Data.Users as Users
import qualified TD.Data.ValidatedOrderInfo as ValidatedOrderInfo
import qualified TD.Data.WebAppInfo as WebAppInfo
import qualified TD.Data.WebPage as WebPage
import qualified TD.Data.WebPageInstantView as WebPageInstantView

data GeneralResult
    = AccountTtl                         AccountTtl.AccountTtl
    | AddedReactions                     AddedReactions.AddedReactions
    | AnimatedEmoji                      AnimatedEmoji.AnimatedEmoji
    | Animations                         Animations.Animations
    | ArchiveChatListSettings            ArchiveChatListSettings.ArchiveChatListSettings
    | AttachmentMenuBot                  AttachmentMenuBot.AttachmentMenuBot
    | AuthenticationCodeInfo             AuthenticationCodeInfo.AuthenticationCodeInfo
    | AuthorizationState                 AuthorizationState.AuthorizationState
    | AutoDownloadSettingsPresets        AutoDownloadSettingsPresets.AutoDownloadSettingsPresets
    | AutosaveSettings                   AutosaveSettings.AutosaveSettings
    | AvailableReactions                 AvailableReactions.AvailableReactions
    | Background                         Background.Background
    | Backgrounds                        Backgrounds.Backgrounds
    | BankCardInfo                       BankCardInfo.BankCardInfo
    | BasicGroup                         BasicGroup.BasicGroup
    | BasicGroupFullInfo                 BasicGroupFullInfo.BasicGroupFullInfo
    | BotCommands                        BotCommands.BotCommands
    | BotMenuButton                      BotMenuButton.BotMenuButton
    | CallId                             CallId.CallId
    | CallbackQueryAnswer                CallbackQueryAnswer.CallbackQueryAnswer
    | CanBoostChatResult                 CanBoostChatResult.CanBoostChatResult
    | CanSendStoryResult                 CanSendStoryResult.CanSendStoryResult
    | CanTransferOwnershipResult         CanTransferOwnershipResult.CanTransferOwnershipResult
    | Chat                               Chat.Chat
    | ChatActiveStories                  ChatActiveStories.ChatActiveStories
    | ChatAdministrators                 ChatAdministrators.ChatAdministrators
    | ChatBoostLink                      ChatBoostLink.ChatBoostLink
    | ChatBoostLinkInfo                  ChatBoostLinkInfo.ChatBoostLinkInfo
    | ChatBoostStatus                    ChatBoostStatus.ChatBoostStatus
    | ChatEvents                         ChatEvents.ChatEvents
    | ChatFolder                         ChatFolder.ChatFolder
    | ChatFolderIcon                     ChatFolderIcon.ChatFolderIcon
    | ChatFolderInfo                     ChatFolderInfo.ChatFolderInfo
    | ChatFolderInviteLink               ChatFolderInviteLink.ChatFolderInviteLink
    | ChatFolderInviteLinkInfo           ChatFolderInviteLinkInfo.ChatFolderInviteLinkInfo
    | ChatFolderInviteLinks              ChatFolderInviteLinks.ChatFolderInviteLinks
    | ChatInviteLink                     ChatInviteLink.ChatInviteLink
    | ChatInviteLinkCounts               ChatInviteLinkCounts.ChatInviteLinkCounts
    | ChatInviteLinkInfo                 ChatInviteLinkInfo.ChatInviteLinkInfo
    | ChatInviteLinkMembers              ChatInviteLinkMembers.ChatInviteLinkMembers
    | ChatInviteLinks                    ChatInviteLinks.ChatInviteLinks
    | ChatJoinRequests                   ChatJoinRequests.ChatJoinRequests
    | ChatLists                          ChatLists.ChatLists
    | ChatMember                         ChatMember.ChatMember
    | ChatMembers                        ChatMembers.ChatMembers
    | ChatMessageSenders                 ChatMessageSenders.ChatMessageSenders
    | ChatPhotos                         ChatPhotos.ChatPhotos
    | ChatStatistics                     ChatStatistics.ChatStatistics
    | Chats                              Chats.Chats
    | ChatsNearby                        ChatsNearby.ChatsNearby
    | CheckChatUsernameResult            CheckChatUsernameResult.CheckChatUsernameResult
    | CheckStickerSetNameResult          CheckStickerSetNameResult.CheckStickerSetNameResult
    | ConnectedWebsites                  ConnectedWebsites.ConnectedWebsites
    | Count                              Count.Count
    | Countries                          Countries.Countries
    | CustomRequestResult                CustomRequestResult.CustomRequestResult
    | DatabaseStatistics                 DatabaseStatistics.DatabaseStatistics
    | DeepLinkInfo                       DeepLinkInfo.DeepLinkInfo
    | EmailAddressAuthenticationCodeInfo EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo
    | EmojiCategories                    EmojiCategories.EmojiCategories
    | EmojiReaction                      EmojiReaction.EmojiReaction
    | EmojiStatuses                      EmojiStatuses.EmojiStatuses
    | Emojis                             Emojis.Emojis
    | Error                              Error.Error
    | File                               File.File
    | FileDownloadedPrefixSize           FileDownloadedPrefixSize.FileDownloadedPrefixSize
    | FilePart                           FilePart.FilePart
    | FormattedText                      FormattedText.FormattedText
    | ForumTopic                         ForumTopic.ForumTopic
    | ForumTopicInfo                     ForumTopicInfo.ForumTopicInfo
    | ForumTopics                        ForumTopics.ForumTopics
    | FoundChatBoosts                    FoundChatBoosts.FoundChatBoosts
    | FoundChatMessages                  FoundChatMessages.FoundChatMessages
    | FoundFileDownloads                 FoundFileDownloads.FoundFileDownloads
    | FoundMessages                      FoundMessages.FoundMessages
    | FoundPositions                     FoundPositions.FoundPositions
    | FoundWebApp                        FoundWebApp.FoundWebApp
    | GameHighScores                     GameHighScores.GameHighScores
    | GroupCall                          GroupCall.GroupCall
    | GroupCallId                        GroupCallId.GroupCallId
    | GroupCallStreams                   GroupCallStreams.GroupCallStreams
    | Hashtags                           Hashtags.Hashtags
    | HttpUrl                            HttpUrl.HttpUrl
    | ImportedContacts                   ImportedContacts.ImportedContacts
    | InlineQueryResults                 InlineQueryResults.InlineQueryResults
    | InternalLinkType                   InternalLinkType.InternalLinkType
    | JsonValue                          JsonValue.JsonValue
    | LanguagePackInfo                   LanguagePackInfo.LanguagePackInfo
    | LanguagePackStringValue            LanguagePackStringValue.LanguagePackStringValue
    | LanguagePackStrings                LanguagePackStrings.LanguagePackStrings
    | LocalizationTargetInfo             LocalizationTargetInfo.LocalizationTargetInfo
    | LogStream                          LogStream.LogStream
    | LogTags                            LogTags.LogTags
    | LogVerbosityLevel                  LogVerbosityLevel.LogVerbosityLevel
    | LoginUrlInfo                       LoginUrlInfo.LoginUrlInfo
    | Message                            Message.Message
    | MessageAutoDeleteTime              MessageAutoDeleteTime.MessageAutoDeleteTime
    | MessageCalendar                    MessageCalendar.MessageCalendar
    | MessageFileType                    MessageFileType.MessageFileType
    | MessageLink                        MessageLink.MessageLink
    | MessageLinkInfo                    MessageLinkInfo.MessageLinkInfo
    | MessagePositions                   MessagePositions.MessagePositions
    | MessageSenders                     MessageSenders.MessageSenders
    | MessageStatistics                  MessageStatistics.MessageStatistics
    | MessageThreadInfo                  MessageThreadInfo.MessageThreadInfo
    | MessageViewers                     MessageViewers.MessageViewers
    | Messages                           Messages.Messages
    | NetworkStatistics                  NetworkStatistics.NetworkStatistics
    | NotificationSound                  NotificationSound.NotificationSound
    | NotificationSounds                 NotificationSounds.NotificationSounds
    | Ok                                 Ok.Ok
    | OptionValue                        OptionValue.OptionValue
    | OrderInfo                          OrderInfo.OrderInfo
    | PassportAuthorizationForm          PassportAuthorizationForm.PassportAuthorizationForm
    | PassportElement                    PassportElement.PassportElement
    | PassportElements                   PassportElements.PassportElements
    | PassportElementsWithErrors         PassportElementsWithErrors.PassportElementsWithErrors
    | PasswordState                      PasswordState.PasswordState
    | PaymentForm                        PaymentForm.PaymentForm
    | PaymentReceipt                     PaymentReceipt.PaymentReceipt
    | PaymentResult                      PaymentResult.PaymentResult
    | PhoneNumberInfo                    PhoneNumberInfo.PhoneNumberInfo
    | PremiumFeatures                    PremiumFeatures.PremiumFeatures
    | PremiumLimit                       PremiumLimit.PremiumLimit
    | PremiumState                       PremiumState.PremiumState
    | Proxies                            Proxies.Proxies
    | Proxy                              Proxy.Proxy
    | PushReceiverId                     PushReceiverId.PushReceiverId
    | RecommendedChatFolders             RecommendedChatFolders.RecommendedChatFolders
    | RecoveryEmailAddress               RecoveryEmailAddress.RecoveryEmailAddress
    | ResetPasswordResult                ResetPasswordResult.ResetPasswordResult
    | RtmpUrl                            RtmpUrl.RtmpUrl
    | ScopeNotificationSettings          ScopeNotificationSettings.ScopeNotificationSettings
    | Seconds                            Seconds.Seconds
    | SecretChat                         SecretChat.SecretChat
    | SentWebAppMessage                  SentWebAppMessage.SentWebAppMessage
    | Session                            Session.Session
    | Sessions                           Sessions.Sessions
    | SponsoredMessages                  SponsoredMessages.SponsoredMessages
    | StatisticalGraph                   StatisticalGraph.StatisticalGraph
    | Sticker                            Sticker.Sticker
    | StickerSet                         StickerSet.StickerSet
    | StickerSets                        StickerSets.StickerSets
    | Stickers                           Stickers.Stickers
    | StorageStatistics                  StorageStatistics.StorageStatistics
    | StorageStatisticsFast              StorageStatisticsFast.StorageStatisticsFast
    | Stories                            Stories.Stories
    | Story                              Story.Story
    | StoryViewers                       StoryViewers.StoryViewers
    | Supergroup                         Supergroup.Supergroup
    | SupergroupFullInfo                 SupergroupFullInfo.SupergroupFullInfo
    | TMeUrls                            TMeUrls.TMeUrls
    | TemporaryPasswordState             TemporaryPasswordState.TemporaryPasswordState
    | TestBytes                          TestBytes.TestBytes
    | TestInt                            TestInt.TestInt
    | TestString                         TestString.TestString
    | TestVectorInt                      TestVectorInt.TestVectorInt
    | TestVectorIntObject                TestVectorIntObject.TestVectorIntObject
    | TestVectorString                   TestVectorString.TestVectorString
    | TestVectorStringObject             TestVectorStringObject.TestVectorStringObject
    | Text                               Text.Text
    | TextEntities                       TextEntities.TextEntities
    | TrendingStickerSets                TrendingStickerSets.TrendingStickerSets
    | Update                             Update.Update
    | Updates                            Updates.Updates
    | User                               User.User
    | UserFullInfo                       UserFullInfo.UserFullInfo
    | UserLink                           UserLink.UserLink
    | UserPrivacySettingRules            UserPrivacySettingRules.UserPrivacySettingRules
    | UserSupportInfo                    UserSupportInfo.UserSupportInfo
    | Users                              Users.Users
    | ValidatedOrderInfo                 ValidatedOrderInfo.ValidatedOrderInfo
    | WebAppInfo                         WebAppInfo.WebAppInfo
    | WebPage                            WebPage.WebPage
    | WebPageInstantView                 WebPageInstantView.WebPageInstantView
 deriving (Eq, Show)

instance I.ShortShow GeneralResult where
  shortShow (AccountTtl v)
    = "AccountTtl" <> " (" <> I.shortShow v <> ")"
  shortShow (AddedReactions v)
    = "AddedReactions" <> " (" <> I.shortShow v <> ")"
  shortShow (AnimatedEmoji v)
    = "AnimatedEmoji" <> " (" <> I.shortShow v <> ")"
  shortShow (Animations v)
    = "Animations" <> " (" <> I.shortShow v <> ")"
  shortShow (ArchiveChatListSettings v)
    = "ArchiveChatListSettings" <> " (" <> I.shortShow v <> ")"
  shortShow (AttachmentMenuBot v)
    = "AttachmentMenuBot" <> " (" <> I.shortShow v <> ")"
  shortShow (AuthenticationCodeInfo v)
    = "AuthenticationCodeInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (AuthorizationState v)
    = "AuthorizationState" <> " (" <> I.shortShow v <> ")"
  shortShow (AutoDownloadSettingsPresets v)
    = "AutoDownloadSettingsPresets" <> " (" <> I.shortShow v <> ")"
  shortShow (AutosaveSettings v)
    = "AutosaveSettings" <> " (" <> I.shortShow v <> ")"
  shortShow (AvailableReactions v)
    = "AvailableReactions" <> " (" <> I.shortShow v <> ")"
  shortShow (Background v)
    = "Background" <> " (" <> I.shortShow v <> ")"
  shortShow (Backgrounds v)
    = "Backgrounds" <> " (" <> I.shortShow v <> ")"
  shortShow (BankCardInfo v)
    = "BankCardInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (BasicGroup v)
    = "BasicGroup" <> " (" <> I.shortShow v <> ")"
  shortShow (BasicGroupFullInfo v)
    = "BasicGroupFullInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (BotCommands v)
    = "BotCommands" <> " (" <> I.shortShow v <> ")"
  shortShow (BotMenuButton v)
    = "BotMenuButton" <> " (" <> I.shortShow v <> ")"
  shortShow (CallId v)
    = "CallId" <> " (" <> I.shortShow v <> ")"
  shortShow (CallbackQueryAnswer v)
    = "CallbackQueryAnswer" <> " (" <> I.shortShow v <> ")"
  shortShow (CanBoostChatResult v)
    = "CanBoostChatResult" <> " (" <> I.shortShow v <> ")"
  shortShow (CanSendStoryResult v)
    = "CanSendStoryResult" <> " (" <> I.shortShow v <> ")"
  shortShow (CanTransferOwnershipResult v)
    = "CanTransferOwnershipResult" <> " (" <> I.shortShow v <> ")"
  shortShow (Chat v)
    = "Chat" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatActiveStories v)
    = "ChatActiveStories" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatAdministrators v)
    = "ChatAdministrators" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatBoostLink v)
    = "ChatBoostLink" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatBoostLinkInfo v)
    = "ChatBoostLinkInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatBoostStatus v)
    = "ChatBoostStatus" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatEvents v)
    = "ChatEvents" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolder v)
    = "ChatFolder" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolderIcon v)
    = "ChatFolderIcon" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolderInfo v)
    = "ChatFolderInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolderInviteLink v)
    = "ChatFolderInviteLink" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolderInviteLinkInfo v)
    = "ChatFolderInviteLinkInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatFolderInviteLinks v)
    = "ChatFolderInviteLinks" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatInviteLink v)
    = "ChatInviteLink" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatInviteLinkCounts v)
    = "ChatInviteLinkCounts" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatInviteLinkInfo v)
    = "ChatInviteLinkInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatInviteLinkMembers v)
    = "ChatInviteLinkMembers" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatInviteLinks v)
    = "ChatInviteLinks" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatJoinRequests v)
    = "ChatJoinRequests" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatLists v)
    = "ChatLists" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatMember v)
    = "ChatMember" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatMembers v)
    = "ChatMembers" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatMessageSenders v)
    = "ChatMessageSenders" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatPhotos v)
    = "ChatPhotos" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatStatistics v)
    = "ChatStatistics" <> " (" <> I.shortShow v <> ")"
  shortShow (Chats v)
    = "Chats" <> " (" <> I.shortShow v <> ")"
  shortShow (ChatsNearby v)
    = "ChatsNearby" <> " (" <> I.shortShow v <> ")"
  shortShow (CheckChatUsernameResult v)
    = "CheckChatUsernameResult" <> " (" <> I.shortShow v <> ")"
  shortShow (CheckStickerSetNameResult v)
    = "CheckStickerSetNameResult" <> " (" <> I.shortShow v <> ")"
  shortShow (ConnectedWebsites v)
    = "ConnectedWebsites" <> " (" <> I.shortShow v <> ")"
  shortShow (Count v)
    = "Count" <> " (" <> I.shortShow v <> ")"
  shortShow (Countries v)
    = "Countries" <> " (" <> I.shortShow v <> ")"
  shortShow (CustomRequestResult v)
    = "CustomRequestResult" <> " (" <> I.shortShow v <> ")"
  shortShow (DatabaseStatistics v)
    = "DatabaseStatistics" <> " (" <> I.shortShow v <> ")"
  shortShow (DeepLinkInfo v)
    = "DeepLinkInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (EmailAddressAuthenticationCodeInfo v)
    = "EmailAddressAuthenticationCodeInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (EmojiCategories v)
    = "EmojiCategories" <> " (" <> I.shortShow v <> ")"
  shortShow (EmojiReaction v)
    = "EmojiReaction" <> " (" <> I.shortShow v <> ")"
  shortShow (EmojiStatuses v)
    = "EmojiStatuses" <> " (" <> I.shortShow v <> ")"
  shortShow (Emojis v)
    = "Emojis" <> " (" <> I.shortShow v <> ")"
  shortShow (Error v)
    = "Error" <> " (" <> I.shortShow v <> ")"
  shortShow (File v)
    = "File" <> " (" <> I.shortShow v <> ")"
  shortShow (FileDownloadedPrefixSize v)
    = "FileDownloadedPrefixSize" <> " (" <> I.shortShow v <> ")"
  shortShow (FilePart v)
    = "FilePart" <> " (" <> I.shortShow v <> ")"
  shortShow (FormattedText v)
    = "FormattedText" <> " (" <> I.shortShow v <> ")"
  shortShow (ForumTopic v)
    = "ForumTopic" <> " (" <> I.shortShow v <> ")"
  shortShow (ForumTopicInfo v)
    = "ForumTopicInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (ForumTopics v)
    = "ForumTopics" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundChatBoosts v)
    = "FoundChatBoosts" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundChatMessages v)
    = "FoundChatMessages" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundFileDownloads v)
    = "FoundFileDownloads" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundMessages v)
    = "FoundMessages" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundPositions v)
    = "FoundPositions" <> " (" <> I.shortShow v <> ")"
  shortShow (FoundWebApp v)
    = "FoundWebApp" <> " (" <> I.shortShow v <> ")"
  shortShow (GameHighScores v)
    = "GameHighScores" <> " (" <> I.shortShow v <> ")"
  shortShow (GroupCall v)
    = "GroupCall" <> " (" <> I.shortShow v <> ")"
  shortShow (GroupCallId v)
    = "GroupCallId" <> " (" <> I.shortShow v <> ")"
  shortShow (GroupCallStreams v)
    = "GroupCallStreams" <> " (" <> I.shortShow v <> ")"
  shortShow (Hashtags v)
    = "Hashtags" <> " (" <> I.shortShow v <> ")"
  shortShow (HttpUrl v)
    = "HttpUrl" <> " (" <> I.shortShow v <> ")"
  shortShow (ImportedContacts v)
    = "ImportedContacts" <> " (" <> I.shortShow v <> ")"
  shortShow (InlineQueryResults v)
    = "InlineQueryResults" <> " (" <> I.shortShow v <> ")"
  shortShow (InternalLinkType v)
    = "InternalLinkType" <> " (" <> I.shortShow v <> ")"
  shortShow (JsonValue v)
    = "JsonValue" <> " (" <> I.shortShow v <> ")"
  shortShow (LanguagePackInfo v)
    = "LanguagePackInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (LanguagePackStringValue v)
    = "LanguagePackStringValue" <> " (" <> I.shortShow v <> ")"
  shortShow (LanguagePackStrings v)
    = "LanguagePackStrings" <> " (" <> I.shortShow v <> ")"
  shortShow (LocalizationTargetInfo v)
    = "LocalizationTargetInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (LogStream v)
    = "LogStream" <> " (" <> I.shortShow v <> ")"
  shortShow (LogTags v)
    = "LogTags" <> " (" <> I.shortShow v <> ")"
  shortShow (LogVerbosityLevel v)
    = "LogVerbosityLevel" <> " (" <> I.shortShow v <> ")"
  shortShow (LoginUrlInfo v)
    = "LoginUrlInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (Message v)
    = "Message" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageAutoDeleteTime v)
    = "MessageAutoDeleteTime" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageCalendar v)
    = "MessageCalendar" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageFileType v)
    = "MessageFileType" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageLink v)
    = "MessageLink" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageLinkInfo v)
    = "MessageLinkInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (MessagePositions v)
    = "MessagePositions" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageSenders v)
    = "MessageSenders" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageStatistics v)
    = "MessageStatistics" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageThreadInfo v)
    = "MessageThreadInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (MessageViewers v)
    = "MessageViewers" <> " (" <> I.shortShow v <> ")"
  shortShow (Messages v)
    = "Messages" <> " (" <> I.shortShow v <> ")"
  shortShow (NetworkStatistics v)
    = "NetworkStatistics" <> " (" <> I.shortShow v <> ")"
  shortShow (NotificationSound v)
    = "NotificationSound" <> " (" <> I.shortShow v <> ")"
  shortShow (NotificationSounds v)
    = "NotificationSounds" <> " (" <> I.shortShow v <> ")"
  shortShow (Ok v)
    = "Ok" <> " (" <> I.shortShow v <> ")"
  shortShow (OptionValue v)
    = "OptionValue" <> " (" <> I.shortShow v <> ")"
  shortShow (OrderInfo v)
    = "OrderInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (PassportAuthorizationForm v)
    = "PassportAuthorizationForm" <> " (" <> I.shortShow v <> ")"
  shortShow (PassportElement v)
    = "PassportElement" <> " (" <> I.shortShow v <> ")"
  shortShow (PassportElements v)
    = "PassportElements" <> " (" <> I.shortShow v <> ")"
  shortShow (PassportElementsWithErrors v)
    = "PassportElementsWithErrors" <> " (" <> I.shortShow v <> ")"
  shortShow (PasswordState v)
    = "PasswordState" <> " (" <> I.shortShow v <> ")"
  shortShow (PaymentForm v)
    = "PaymentForm" <> " (" <> I.shortShow v <> ")"
  shortShow (PaymentReceipt v)
    = "PaymentReceipt" <> " (" <> I.shortShow v <> ")"
  shortShow (PaymentResult v)
    = "PaymentResult" <> " (" <> I.shortShow v <> ")"
  shortShow (PhoneNumberInfo v)
    = "PhoneNumberInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (PremiumFeatures v)
    = "PremiumFeatures" <> " (" <> I.shortShow v <> ")"
  shortShow (PremiumLimit v)
    = "PremiumLimit" <> " (" <> I.shortShow v <> ")"
  shortShow (PremiumState v)
    = "PremiumState" <> " (" <> I.shortShow v <> ")"
  shortShow (Proxies v)
    = "Proxies" <> " (" <> I.shortShow v <> ")"
  shortShow (Proxy v)
    = "Proxy" <> " (" <> I.shortShow v <> ")"
  shortShow (PushReceiverId v)
    = "PushReceiverId" <> " (" <> I.shortShow v <> ")"
  shortShow (RecommendedChatFolders v)
    = "RecommendedChatFolders" <> " (" <> I.shortShow v <> ")"
  shortShow (RecoveryEmailAddress v)
    = "RecoveryEmailAddress" <> " (" <> I.shortShow v <> ")"
  shortShow (ResetPasswordResult v)
    = "ResetPasswordResult" <> " (" <> I.shortShow v <> ")"
  shortShow (RtmpUrl v)
    = "RtmpUrl" <> " (" <> I.shortShow v <> ")"
  shortShow (ScopeNotificationSettings v)
    = "ScopeNotificationSettings" <> " (" <> I.shortShow v <> ")"
  shortShow (Seconds v)
    = "Seconds" <> " (" <> I.shortShow v <> ")"
  shortShow (SecretChat v)
    = "SecretChat" <> " (" <> I.shortShow v <> ")"
  shortShow (SentWebAppMessage v)
    = "SentWebAppMessage" <> " (" <> I.shortShow v <> ")"
  shortShow (Session v)
    = "Session" <> " (" <> I.shortShow v <> ")"
  shortShow (Sessions v)
    = "Sessions" <> " (" <> I.shortShow v <> ")"
  shortShow (SponsoredMessages v)
    = "SponsoredMessages" <> " (" <> I.shortShow v <> ")"
  shortShow (StatisticalGraph v)
    = "StatisticalGraph" <> " (" <> I.shortShow v <> ")"
  shortShow (Sticker v)
    = "Sticker" <> " (" <> I.shortShow v <> ")"
  shortShow (StickerSet v)
    = "StickerSet" <> " (" <> I.shortShow v <> ")"
  shortShow (StickerSets v)
    = "StickerSets" <> " (" <> I.shortShow v <> ")"
  shortShow (Stickers v)
    = "Stickers" <> " (" <> I.shortShow v <> ")"
  shortShow (StorageStatistics v)
    = "StorageStatistics" <> " (" <> I.shortShow v <> ")"
  shortShow (StorageStatisticsFast v)
    = "StorageStatisticsFast" <> " (" <> I.shortShow v <> ")"
  shortShow (Stories v)
    = "Stories" <> " (" <> I.shortShow v <> ")"
  shortShow (Story v)
    = "Story" <> " (" <> I.shortShow v <> ")"
  shortShow (StoryViewers v)
    = "StoryViewers" <> " (" <> I.shortShow v <> ")"
  shortShow (Supergroup v)
    = "Supergroup" <> " (" <> I.shortShow v <> ")"
  shortShow (SupergroupFullInfo v)
    = "SupergroupFullInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (TMeUrls v)
    = "TMeUrls" <> " (" <> I.shortShow v <> ")"
  shortShow (TemporaryPasswordState v)
    = "TemporaryPasswordState" <> " (" <> I.shortShow v <> ")"
  shortShow (TestBytes v)
    = "TestBytes" <> " (" <> I.shortShow v <> ")"
  shortShow (TestInt v)
    = "TestInt" <> " (" <> I.shortShow v <> ")"
  shortShow (TestString v)
    = "TestString" <> " (" <> I.shortShow v <> ")"
  shortShow (TestVectorInt v)
    = "TestVectorInt" <> " (" <> I.shortShow v <> ")"
  shortShow (TestVectorIntObject v)
    = "TestVectorIntObject" <> " (" <> I.shortShow v <> ")"
  shortShow (TestVectorString v)
    = "TestVectorString" <> " (" <> I.shortShow v <> ")"
  shortShow (TestVectorStringObject v)
    = "TestVectorStringObject" <> " (" <> I.shortShow v <> ")"
  shortShow (Text v)
    = "Text" <> " (" <> I.shortShow v <> ")"
  shortShow (TextEntities v)
    = "TextEntities" <> " (" <> I.shortShow v <> ")"
  shortShow (TrendingStickerSets v)
    = "TrendingStickerSets" <> " (" <> I.shortShow v <> ")"
  shortShow (Update v)
    = "Update" <> " (" <> I.shortShow v <> ")"
  shortShow (Updates v)
    = "Updates" <> " (" <> I.shortShow v <> ")"
  shortShow (User v)
    = "User" <> " (" <> I.shortShow v <> ")"
  shortShow (UserFullInfo v)
    = "UserFullInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (UserLink v)
    = "UserLink" <> " (" <> I.shortShow v <> ")"
  shortShow (UserPrivacySettingRules v)
    = "UserPrivacySettingRules" <> " (" <> I.shortShow v <> ")"
  shortShow (UserSupportInfo v)
    = "UserSupportInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (Users v)
    = "Users" <> " (" <> I.shortShow v <> ")"
  shortShow (ValidatedOrderInfo v)
    = "ValidatedOrderInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (WebAppInfo v)
    = "WebAppInfo" <> " (" <> I.shortShow v <> ")"
  shortShow (WebPage v)
    = "WebPage" <> " (" <> I.shortShow v <> ")"
  shortShow (WebPageInstantView v)
    = "WebPageInstantView" <> " (" <> I.shortShow v <> ")"

instance T.FromJSON GeneralResult where
 parseJSON v =
        ( AccountTtl                          <$> parseJSON v )
    <|> ( AddedReactions                      <$> parseJSON v )
    <|> ( AnimatedEmoji                       <$> parseJSON v )
    <|> ( Animations                          <$> parseJSON v )
    <|> ( ArchiveChatListSettings             <$> parseJSON v )
    <|> ( AttachmentMenuBot                   <$> parseJSON v )
    <|> ( AuthenticationCodeInfo              <$> parseJSON v )
    <|> ( AuthorizationState                  <$> parseJSON v )
    <|> ( AutoDownloadSettingsPresets         <$> parseJSON v )
    <|> ( AutosaveSettings                    <$> parseJSON v )
    <|> ( AvailableReactions                  <$> parseJSON v )
    <|> ( Background                          <$> parseJSON v )
    <|> ( Backgrounds                         <$> parseJSON v )
    <|> ( BankCardInfo                        <$> parseJSON v )
    <|> ( BasicGroup                          <$> parseJSON v )
    <|> ( BasicGroupFullInfo                  <$> parseJSON v )
    <|> ( BotCommands                         <$> parseJSON v )
    <|> ( BotMenuButton                       <$> parseJSON v )
    <|> ( CallId                              <$> parseJSON v )
    <|> ( CallbackQueryAnswer                 <$> parseJSON v )
    <|> ( CanBoostChatResult                  <$> parseJSON v )
    <|> ( CanSendStoryResult                  <$> parseJSON v )
    <|> ( CanTransferOwnershipResult          <$> parseJSON v )
    <|> ( Chat                                <$> parseJSON v )
    <|> ( ChatActiveStories                   <$> parseJSON v )
    <|> ( ChatAdministrators                  <$> parseJSON v )
    <|> ( ChatBoostLink                       <$> parseJSON v )
    <|> ( ChatBoostLinkInfo                   <$> parseJSON v )
    <|> ( ChatBoostStatus                     <$> parseJSON v )
    <|> ( ChatEvents                          <$> parseJSON v )
    <|> ( ChatFolder                          <$> parseJSON v )
    <|> ( ChatFolderIcon                      <$> parseJSON v )
    <|> ( ChatFolderInfo                      <$> parseJSON v )
    <|> ( ChatFolderInviteLink                <$> parseJSON v )
    <|> ( ChatFolderInviteLinkInfo            <$> parseJSON v )
    <|> ( ChatFolderInviteLinks               <$> parseJSON v )
    <|> ( ChatInviteLink                      <$> parseJSON v )
    <|> ( ChatInviteLinkCounts                <$> parseJSON v )
    <|> ( ChatInviteLinkInfo                  <$> parseJSON v )
    <|> ( ChatInviteLinkMembers               <$> parseJSON v )
    <|> ( ChatInviteLinks                     <$> parseJSON v )
    <|> ( ChatJoinRequests                    <$> parseJSON v )
    <|> ( ChatLists                           <$> parseJSON v )
    <|> ( ChatMember                          <$> parseJSON v )
    <|> ( ChatMembers                         <$> parseJSON v )
    <|> ( ChatMessageSenders                  <$> parseJSON v )
    <|> ( ChatPhotos                          <$> parseJSON v )
    <|> ( ChatStatistics                      <$> parseJSON v )
    <|> ( Chats                               <$> parseJSON v )
    <|> ( ChatsNearby                         <$> parseJSON v )
    <|> ( CheckChatUsernameResult             <$> parseJSON v )
    <|> ( CheckStickerSetNameResult           <$> parseJSON v )
    <|> ( ConnectedWebsites                   <$> parseJSON v )
    <|> ( Count                               <$> parseJSON v )
    <|> ( Countries                           <$> parseJSON v )
    <|> ( CustomRequestResult                 <$> parseJSON v )
    <|> ( DatabaseStatistics                  <$> parseJSON v )
    <|> ( DeepLinkInfo                        <$> parseJSON v )
    <|> ( EmailAddressAuthenticationCodeInfo  <$> parseJSON v )
    <|> ( EmojiCategories                     <$> parseJSON v )
    <|> ( EmojiReaction                       <$> parseJSON v )
    <|> ( EmojiStatuses                       <$> parseJSON v )
    <|> ( Emojis                              <$> parseJSON v )
    <|> ( Error                               <$> parseJSON v )
    <|> ( File                                <$> parseJSON v )
    <|> ( FileDownloadedPrefixSize            <$> parseJSON v )
    <|> ( FilePart                            <$> parseJSON v )
    <|> ( FormattedText                       <$> parseJSON v )
    <|> ( ForumTopic                          <$> parseJSON v )
    <|> ( ForumTopicInfo                      <$> parseJSON v )
    <|> ( ForumTopics                         <$> parseJSON v )
    <|> ( FoundChatBoosts                     <$> parseJSON v )
    <|> ( FoundChatMessages                   <$> parseJSON v )
    <|> ( FoundFileDownloads                  <$> parseJSON v )
    <|> ( FoundMessages                       <$> parseJSON v )
    <|> ( FoundPositions                      <$> parseJSON v )
    <|> ( FoundWebApp                         <$> parseJSON v )
    <|> ( GameHighScores                      <$> parseJSON v )
    <|> ( GroupCall                           <$> parseJSON v )
    <|> ( GroupCallId                         <$> parseJSON v )
    <|> ( GroupCallStreams                    <$> parseJSON v )
    <|> ( Hashtags                            <$> parseJSON v )
    <|> ( HttpUrl                             <$> parseJSON v )
    <|> ( ImportedContacts                    <$> parseJSON v )
    <|> ( InlineQueryResults                  <$> parseJSON v )
    <|> ( InternalLinkType                    <$> parseJSON v )
    <|> ( JsonValue                           <$> parseJSON v )
    <|> ( LanguagePackInfo                    <$> parseJSON v )
    <|> ( LanguagePackStringValue             <$> parseJSON v )
    <|> ( LanguagePackStrings                 <$> parseJSON v )
    <|> ( LocalizationTargetInfo              <$> parseJSON v )
    <|> ( LogStream                           <$> parseJSON v )
    <|> ( LogTags                             <$> parseJSON v )
    <|> ( LogVerbosityLevel                   <$> parseJSON v )
    <|> ( LoginUrlInfo                        <$> parseJSON v )
    <|> ( Message                             <$> parseJSON v )
    <|> ( MessageAutoDeleteTime               <$> parseJSON v )
    <|> ( MessageCalendar                     <$> parseJSON v )
    <|> ( MessageFileType                     <$> parseJSON v )
    <|> ( MessageLink                         <$> parseJSON v )
    <|> ( MessageLinkInfo                     <$> parseJSON v )
    <|> ( MessagePositions                    <$> parseJSON v )
    <|> ( MessageSenders                      <$> parseJSON v )
    <|> ( MessageStatistics                   <$> parseJSON v )
    <|> ( MessageThreadInfo                   <$> parseJSON v )
    <|> ( MessageViewers                      <$> parseJSON v )
    <|> ( Messages                            <$> parseJSON v )
    <|> ( NetworkStatistics                   <$> parseJSON v )
    <|> ( NotificationSound                   <$> parseJSON v )
    <|> ( NotificationSounds                  <$> parseJSON v )
    <|> ( Ok                                  <$> parseJSON v )
    <|> ( OptionValue                         <$> parseJSON v )
    <|> ( OrderInfo                           <$> parseJSON v )
    <|> ( PassportAuthorizationForm           <$> parseJSON v )
    <|> ( PassportElement                     <$> parseJSON v )
    <|> ( PassportElements                    <$> parseJSON v )
    <|> ( PassportElementsWithErrors          <$> parseJSON v )
    <|> ( PasswordState                       <$> parseJSON v )
    <|> ( PaymentForm                         <$> parseJSON v )
    <|> ( PaymentReceipt                      <$> parseJSON v )
    <|> ( PaymentResult                       <$> parseJSON v )
    <|> ( PhoneNumberInfo                     <$> parseJSON v )
    <|> ( PremiumFeatures                     <$> parseJSON v )
    <|> ( PremiumLimit                        <$> parseJSON v )
    <|> ( PremiumState                        <$> parseJSON v )
    <|> ( Proxies                             <$> parseJSON v )
    <|> ( Proxy                               <$> parseJSON v )
    <|> ( PushReceiverId                      <$> parseJSON v )
    <|> ( RecommendedChatFolders              <$> parseJSON v )
    <|> ( RecoveryEmailAddress                <$> parseJSON v )
    <|> ( ResetPasswordResult                 <$> parseJSON v )
    <|> ( RtmpUrl                             <$> parseJSON v )
    <|> ( ScopeNotificationSettings           <$> parseJSON v )
    <|> ( Seconds                             <$> parseJSON v )
    <|> ( SecretChat                          <$> parseJSON v )
    <|> ( SentWebAppMessage                   <$> parseJSON v )
    <|> ( Session                             <$> parseJSON v )
    <|> ( Sessions                            <$> parseJSON v )
    <|> ( SponsoredMessages                   <$> parseJSON v )
    <|> ( StatisticalGraph                    <$> parseJSON v )
    <|> ( Sticker                             <$> parseJSON v )
    <|> ( StickerSet                          <$> parseJSON v )
    <|> ( StickerSets                         <$> parseJSON v )
    <|> ( Stickers                            <$> parseJSON v )
    <|> ( StorageStatistics                   <$> parseJSON v )
    <|> ( StorageStatisticsFast               <$> parseJSON v )
    <|> ( Stories                             <$> parseJSON v )
    <|> ( Story                               <$> parseJSON v )
    <|> ( StoryViewers                        <$> parseJSON v )
    <|> ( Supergroup                          <$> parseJSON v )
    <|> ( SupergroupFullInfo                  <$> parseJSON v )
    <|> ( TMeUrls                             <$> parseJSON v )
    <|> ( TemporaryPasswordState              <$> parseJSON v )
    <|> ( TestBytes                           <$> parseJSON v )
    <|> ( TestInt                             <$> parseJSON v )
    <|> ( TestString                          <$> parseJSON v )
    <|> ( TestVectorInt                       <$> parseJSON v )
    <|> ( TestVectorIntObject                 <$> parseJSON v )
    <|> ( TestVectorString                    <$> parseJSON v )
    <|> ( TestVectorStringObject              <$> parseJSON v )
    <|> ( Text                                <$> parseJSON v )
    <|> ( TextEntities                        <$> parseJSON v )
    <|> ( TrendingStickerSets                 <$> parseJSON v )
    <|> ( Update                              <$> parseJSON v )
    <|> ( Updates                             <$> parseJSON v )
    <|> ( User                                <$> parseJSON v )
    <|> ( UserFullInfo                        <$> parseJSON v )
    <|> ( UserLink                            <$> parseJSON v )
    <|> ( UserPrivacySettingRules             <$> parseJSON v )
    <|> ( UserSupportInfo                     <$> parseJSON v )
    <|> ( Users                               <$> parseJSON v )
    <|> ( ValidatedOrderInfo                  <$> parseJSON v )
    <|> ( WebAppInfo                          <$> parseJSON v )
    <|> ( WebPage                             <$> parseJSON v )
    <|> ( WebPageInstantView                  <$> parseJSON v )
