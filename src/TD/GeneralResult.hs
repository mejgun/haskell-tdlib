module TD.GeneralResult (GeneralResult(..)) where

import Control.Applicative (Alternative ((<|>)))
import Data.Aeson (FromJSON (parseJSON))
import qualified Data.Aeson.Types as T
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
import qualified TD.Data.CanTransferOwnershipResult as CanTransferOwnershipResult
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatActiveStories as ChatActiveStories
import qualified TD.Data.ChatAdministrators as ChatAdministrators
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
import qualified TD.Data.FoundChatMessages as FoundChatMessages
import qualified TD.Data.FoundFileDownloads as FoundFileDownloads
import qualified TD.Data.FoundMessages as FoundMessages
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
    | CanTransferOwnershipResult         CanTransferOwnershipResult.CanTransferOwnershipResult
    | Chat                               Chat.Chat
    | ChatActiveStories                  ChatActiveStories.ChatActiveStories
    | ChatAdministrators                 ChatAdministrators.ChatAdministrators
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
    | FoundChatMessages                  FoundChatMessages.FoundChatMessages
    | FoundFileDownloads                 FoundFileDownloads.FoundFileDownloads
    | FoundMessages                      FoundMessages.FoundMessages
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
    <|> ( CanTransferOwnershipResult          <$> parseJSON v )
    <|> ( Chat                                <$> parseJSON v )
    <|> ( ChatActiveStories                   <$> parseJSON v )
    <|> ( ChatAdministrators                  <$> parseJSON v )
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
    <|> ( FoundChatMessages                   <$> parseJSON v )
    <|> ( FoundFileDownloads                  <$> parseJSON v )
    <|> ( FoundMessages                       <$> parseJSON v )
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
