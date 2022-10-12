{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GeneralResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AccountTtl as AccountTtl
import qualified TD.Data.AddedReaction as AddedReaction
import qualified TD.Data.AddedReactions as AddedReactions
import qualified TD.Data.Address as Address
import qualified TD.Data.AnimatedChatPhoto as AnimatedChatPhoto
import qualified TD.Data.AnimatedEmoji as AnimatedEmoji
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Animations as Animations
import qualified TD.Data.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Data.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Data.Audio as Audio
import qualified TD.Data.AuthenticationCodeInfo as AuthenticationCodeInfo
import qualified TD.Data.AuthenticationCodeType as AuthenticationCodeType
import qualified TD.Data.AuthorizationState as AuthorizationState
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings
import qualified TD.Data.AutoDownloadSettingsPresets as AutoDownloadSettingsPresets
import qualified TD.Data.AvailableReaction as AvailableReaction
import qualified TD.Data.AvailableReactions as AvailableReactions
import qualified TD.Data.Background as Background
import qualified TD.Data.BackgroundFill as BackgroundFill
import qualified TD.Data.BackgroundType as BackgroundType
import qualified TD.Data.Backgrounds as Backgrounds
import qualified TD.Data.BankCardActionOpenUrl as BankCardActionOpenUrl
import qualified TD.Data.BankCardInfo as BankCardInfo
import qualified TD.Data.BasicGroup as BasicGroup
import qualified TD.Data.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Data.BotCommand as BotCommand
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified TD.Data.BotCommands as BotCommands
import qualified TD.Data.BotInfo as BotInfo
import qualified TD.Data.BotMenuButton as BotMenuButton
import qualified TD.Data.Call as Call
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.CallId as CallId
import qualified TD.Data.CallProblem as CallProblem
import qualified TD.Data.CallProtocol as CallProtocol
import qualified TD.Data.CallServer as CallServer
import qualified TD.Data.CallServerType as CallServerType
import qualified TD.Data.CallState as CallState
import qualified TD.Data.CallbackQueryAnswer as CallbackQueryAnswer
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload
import qualified TD.Data.CanTransferOwnershipResult as CanTransferOwnershipResult
import qualified TD.Data.Chat as Chat
import qualified TD.Data.ChatAction as ChatAction
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.ChatAdministrator as ChatAdministrator
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.ChatAdministrators as ChatAdministrators
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.ChatEvent as ChatEvent
import qualified TD.Data.ChatEventAction as ChatEventAction
import qualified TD.Data.ChatEventLogFilters as ChatEventLogFilters
import qualified TD.Data.ChatEvents as ChatEvents
import qualified TD.Data.ChatFilter as ChatFilter
import qualified TD.Data.ChatFilterInfo as ChatFilterInfo
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatInviteLinkCount as ChatInviteLinkCount
import qualified TD.Data.ChatInviteLinkCounts as ChatInviteLinkCounts
import qualified TD.Data.ChatInviteLinkInfo as ChatInviteLinkInfo
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember
import qualified TD.Data.ChatInviteLinkMembers as ChatInviteLinkMembers
import qualified TD.Data.ChatInviteLinks as ChatInviteLinks
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest
import qualified TD.Data.ChatJoinRequests as ChatJoinRequests
import qualified TD.Data.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Data.ChatList as ChatList
import qualified TD.Data.ChatLists as ChatLists
import qualified TD.Data.ChatLocation as ChatLocation
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified TD.Data.ChatMembers as ChatMembers
import qualified TD.Data.ChatMembersFilter as ChatMembersFilter
import qualified TD.Data.ChatMessageSender as ChatMessageSender
import qualified TD.Data.ChatMessageSenders as ChatMessageSenders
import qualified TD.Data.ChatNearby as ChatNearby
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatPhotos as ChatPhotos
import qualified TD.Data.ChatPosition as ChatPosition
import qualified TD.Data.ChatReportReason as ChatReportReason
import qualified TD.Data.ChatSource as ChatSource
import qualified TD.Data.ChatStatistics as ChatStatistics
import qualified TD.Data.ChatStatisticsAdministratorActionsInfo as ChatStatisticsAdministratorActionsInfo
import qualified TD.Data.ChatStatisticsInviterInfo as ChatStatisticsInviterInfo
import qualified TD.Data.ChatStatisticsMessageInteractionInfo as ChatStatisticsMessageInteractionInfo
import qualified TD.Data.ChatStatisticsMessageSenderInfo as ChatStatisticsMessageSenderInfo
import qualified TD.Data.ChatTheme as ChatTheme
import qualified TD.Data.ChatType as ChatType
import qualified TD.Data.Chats as Chats
import qualified TD.Data.ChatsNearby as ChatsNearby
import qualified TD.Data.CheckChatUsernameResult as CheckChatUsernameResult
import qualified TD.Data.CheckStickerSetNameResult as CheckStickerSetNameResult
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.ConnectedWebsite as ConnectedWebsite
import qualified TD.Data.ConnectedWebsites as ConnectedWebsites
import qualified TD.Data.ConnectionState as ConnectionState
import qualified TD.Data.Contact as Contact
import qualified TD.Data.Count as Count
import qualified TD.Data.Countries as Countries
import qualified TD.Data.CountryInfo as CountryInfo
import qualified TD.Data.CustomRequestResult as CustomRequestResult
import qualified TD.Data.DatabaseStatistics as DatabaseStatistics
import qualified TD.Data.Date as Date
import qualified TD.Data.DateRange as DateRange
import qualified TD.Data.DatedFile as DatedFile
import qualified TD.Data.DeepLinkInfo as DeepLinkInfo
import qualified TD.Data.DeviceToken as DeviceToken
import qualified TD.Data.DiceStickers as DiceStickers
import qualified TD.Data.Document as Document
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.EmailAddressAuthentication as EmailAddressAuthentication
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified TD.Data.EmojiReaction as EmojiReaction
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified TD.Data.EmojiStatuses as EmojiStatuses
import qualified TD.Data.Emojis as Emojis
import qualified TD.Data.EncryptedCredentials as EncryptedCredentials
import qualified TD.Data.EncryptedPassportElement as EncryptedPassportElement
import qualified TD.Data.Error as Error
import qualified TD.Data.File as File
import qualified TD.Data.FileDownload as FileDownload
import qualified TD.Data.FileDownloadedPrefixSize as FileDownloadedPrefixSize
import qualified TD.Data.FilePart as FilePart
import qualified TD.Data.FileType as FileType
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.FoundFileDownloads as FoundFileDownloads
import qualified TD.Data.FoundMessages as FoundMessages
import qualified TD.Data.Game as Game
import qualified TD.Data.GameHighScore as GameHighScore
import qualified TD.Data.GameHighScores as GameHighScores
import qualified TD.Data.GroupCall as GroupCall
import qualified TD.Data.GroupCallId as GroupCallId
import qualified TD.Data.GroupCallParticipant as GroupCallParticipant
import qualified TD.Data.GroupCallParticipantVideoInfo as GroupCallParticipantVideoInfo
import qualified TD.Data.GroupCallRecentSpeaker as GroupCallRecentSpeaker
import qualified TD.Data.GroupCallStream as GroupCallStream
import qualified TD.Data.GroupCallStreams as GroupCallStreams
import qualified TD.Data.GroupCallVideoQuality as GroupCallVideoQuality
import qualified TD.Data.GroupCallVideoSourceGroup as GroupCallVideoSourceGroup
import qualified TD.Data.Hashtags as Hashtags
import qualified TD.Data.HttpUrl as HttpUrl
import qualified TD.Data.IdentityDocument as IdentityDocument
import qualified TD.Data.ImportedContacts as ImportedContacts
import qualified TD.Data.InlineKeyboardButton as InlineKeyboardButton
import qualified TD.Data.InlineKeyboardButtonType as InlineKeyboardButtonType
import qualified TD.Data.InlineQueryResult as InlineQueryResult
import qualified TD.Data.InlineQueryResults as InlineQueryResults
import qualified TD.Data.InputBackground as InputBackground
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified TD.Data.InputCredentials as InputCredentials
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputIdentityDocument as InputIdentityDocument
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified TD.Data.InputInvoice as InputInvoice
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.InputPassportElement as InputPassportElement
import qualified TD.Data.InputPassportElementError as InputPassportElementError
import qualified TD.Data.InputPassportElementErrorSource as InputPassportElementErrorSource
import qualified TD.Data.InputPersonalDocument as InputPersonalDocument
import qualified TD.Data.InputSticker as InputSticker
import qualified TD.Data.InputThumbnail as InputThumbnail
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.JsonObjectMember as JsonObjectMember
import qualified TD.Data.JsonValue as JsonValue
import qualified TD.Data.KeyboardButton as KeyboardButton
import qualified TD.Data.KeyboardButtonType as KeyboardButtonType
import qualified TD.Data.LabeledPricePart as LabeledPricePart
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified TD.Data.LanguagePackStringValue as LanguagePackStringValue
import qualified TD.Data.LanguagePackStrings as LanguagePackStrings
import qualified TD.Data.LocalFile as LocalFile
import qualified TD.Data.LocalizationTargetInfo as LocalizationTargetInfo
import qualified TD.Data.Location as Location
import qualified TD.Data.LogStream as LogStream
import qualified TD.Data.LogTags as LogTags
import qualified TD.Data.LogVerbosityLevel as LogVerbosityLevel
import qualified TD.Data.LoginUrlInfo as LoginUrlInfo
import qualified TD.Data.MaskPoint as MaskPoint
import qualified TD.Data.MaskPosition as MaskPosition
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageCalendar as MessageCalendar
import qualified TD.Data.MessageCalendarDay as MessageCalendarDay
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageCopyOptions as MessageCopyOptions
import qualified TD.Data.MessageExtendedMedia as MessageExtendedMedia
import qualified TD.Data.MessageFileType as MessageFileType
import qualified TD.Data.MessageForwardInfo as MessageForwardInfo
import qualified TD.Data.MessageForwardOrigin as MessageForwardOrigin
import qualified TD.Data.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Data.MessageLink as MessageLink
import qualified TD.Data.MessageLinkInfo as MessageLinkInfo
import qualified TD.Data.MessagePosition as MessagePosition
import qualified TD.Data.MessagePositions as MessagePositions
import qualified TD.Data.MessageReaction as MessageReaction
import qualified TD.Data.MessageReplyInfo as MessageReplyInfo
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.MessageSenders as MessageSenders
import qualified TD.Data.MessageSendingState as MessageSendingState
import qualified TD.Data.MessageStatistics as MessageStatistics
import qualified TD.Data.MessageThreadInfo as MessageThreadInfo
import qualified TD.Data.Messages as Messages
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.NetworkStatistics as NetworkStatistics
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry
import qualified TD.Data.NetworkType as NetworkType
import qualified TD.Data.Notification as Notification
import qualified TD.Data.NotificationGroup as NotificationGroup
import qualified TD.Data.NotificationGroupType as NotificationGroupType
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Data.NotificationSound as NotificationSound
import qualified TD.Data.NotificationSounds as NotificationSounds
import qualified TD.Data.NotificationType as NotificationType
import qualified TD.Data.Ok as Ok
import qualified TD.Data.OptionValue as OptionValue
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.PageBlock as PageBlock
import qualified TD.Data.PageBlockCaption as PageBlockCaption
import qualified TD.Data.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import qualified TD.Data.PageBlockListItem as PageBlockListItem
import qualified TD.Data.PageBlockRelatedArticle as PageBlockRelatedArticle
import qualified TD.Data.PageBlockTableCell as PageBlockTableCell
import qualified TD.Data.PageBlockVerticalAlignment as PageBlockVerticalAlignment
import qualified TD.Data.PassportAuthorizationForm as PassportAuthorizationForm
import qualified TD.Data.PassportElement as PassportElement
import qualified TD.Data.PassportElementError as PassportElementError
import qualified TD.Data.PassportElementErrorSource as PassportElementErrorSource
import qualified TD.Data.PassportElementType as PassportElementType
import qualified TD.Data.PassportElements as PassportElements
import qualified TD.Data.PassportElementsWithErrors as PassportElementsWithErrors
import qualified TD.Data.PassportRequiredElement as PassportRequiredElement
import qualified TD.Data.PassportSuitableElement as PassportSuitableElement
import qualified TD.Data.PasswordState as PasswordState
import qualified TD.Data.PaymentForm as PaymentForm
import qualified TD.Data.PaymentOption as PaymentOption
import qualified TD.Data.PaymentProvider as PaymentProvider
import qualified TD.Data.PaymentReceipt as PaymentReceipt
import qualified TD.Data.PaymentResult as PaymentResult
import qualified TD.Data.PersonalDetails as PersonalDetails
import qualified TD.Data.PersonalDocument as PersonalDocument
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified TD.Data.PhoneNumberInfo as PhoneNumberInfo
import qualified TD.Data.Photo as Photo
import qualified TD.Data.PhotoSize as PhotoSize
import qualified TD.Data.Point as Point
import qualified TD.Data.Poll as Poll
import qualified TD.Data.PollOption as PollOption
import qualified TD.Data.PollType as PollType
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.PremiumFeaturePromotionAnimation as PremiumFeaturePromotionAnimation
import qualified TD.Data.PremiumFeatures as PremiumFeatures
import qualified TD.Data.PremiumLimit as PremiumLimit
import qualified TD.Data.PremiumLimitType as PremiumLimitType
import qualified TD.Data.PremiumPaymentOption as PremiumPaymentOption
import qualified TD.Data.PremiumSource as PremiumSource
import qualified TD.Data.PremiumState as PremiumState
import qualified TD.Data.ProfilePhoto as ProfilePhoto
import qualified TD.Data.Proxies as Proxies
import qualified TD.Data.Proxy as Proxy
import qualified TD.Data.ProxyType as ProxyType
import qualified TD.Data.PublicChatType as PublicChatType
import qualified TD.Data.PushMessageContent as PushMessageContent
import qualified TD.Data.PushReceiverId as PushReceiverId
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.RecommendedChatFilter as RecommendedChatFilter
import qualified TD.Data.RecommendedChatFilters as RecommendedChatFilters
import qualified TD.Data.RecoveryEmailAddress as RecoveryEmailAddress
import qualified TD.Data.RemoteFile as RemoteFile
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.ResetPasswordResult as ResetPasswordResult
import qualified TD.Data.RichText as RichText
import qualified TD.Data.RtmpUrl as RtmpUrl
import qualified TD.Data.SavedCredentials as SavedCredentials
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified TD.Data.Seconds as Seconds
import qualified TD.Data.SecretChat as SecretChat
import qualified TD.Data.SecretChatState as SecretChatState
import qualified TD.Data.SentWebAppMessage as SentWebAppMessage
import qualified TD.Data.Session as Session
import qualified TD.Data.SessionType as SessionType
import qualified TD.Data.Sessions as Sessions
import qualified TD.Data.ShippingOption as ShippingOption
import qualified TD.Data.SpeechRecognitionResult as SpeechRecognitionResult
import qualified TD.Data.SponsoredMessage as SponsoredMessage
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.StatisticalValue as StatisticalValue
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerSet as StickerSet
import qualified TD.Data.StickerSetInfo as StickerSetInfo
import qualified TD.Data.StickerSets as StickerSets
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Stickers as Stickers
import qualified TD.Data.StorageStatistics as StorageStatistics
import qualified TD.Data.StorageStatisticsByChat as StorageStatisticsByChat
import qualified TD.Data.StorageStatisticsByFileType as StorageStatisticsByFileType
import qualified TD.Data.StorageStatisticsFast as StorageStatisticsFast
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose
import qualified TD.Data.SuggestedAction as SuggestedAction
import qualified TD.Data.Supergroup as Supergroup
import qualified TD.Data.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Data.SupergroupMembersFilter as SupergroupMembersFilter
import qualified TD.Data.TMeUrl as TMeUrl
import qualified TD.Data.TMeUrlType as TMeUrlType
import qualified TD.Data.TMeUrls as TMeUrls
import qualified TD.Data.TargetChat as TargetChat
import qualified TD.Data.TemporaryPasswordState as TemporaryPasswordState
import qualified TD.Data.TermsOfService as TermsOfService
import qualified TD.Data.TestBytes as TestBytes
import qualified TD.Data.TestInt as TestInt
import qualified TD.Data.TestString as TestString
import qualified TD.Data.TestVectorInt as TestVectorInt
import qualified TD.Data.TestVectorIntObject as TestVectorIntObject
import qualified TD.Data.TestVectorString as TestVectorString
import qualified TD.Data.TestVectorStringObject as TestVectorStringObject
import qualified TD.Data.Text as Text
import qualified TD.Data.TextEntities as TextEntities
import qualified TD.Data.TextEntity as TextEntity
import qualified TD.Data.TextEntityType as TextEntityType
import qualified TD.Data.TextParseMode as TextParseMode
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified TD.Data.ThemeSettings as ThemeSettings
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.ThumbnailFormat as ThumbnailFormat
import qualified TD.Data.TopChatCategory as TopChatCategory
import qualified TD.Data.TrendingStickerSets as TrendingStickerSets
import qualified TD.Data.UnreadReaction as UnreadReaction
import qualified TD.Data.Update as Update
import qualified TD.Data.Updates as Updates
import qualified TD.Data.User as User
import qualified TD.Data.UserFullInfo as UserFullInfo
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRule as UserPrivacySettingRule
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules
import qualified TD.Data.UserStatus as UserStatus
import qualified TD.Data.UserSupportInfo as UserSupportInfo
import qualified TD.Data.UserType as UserType
import qualified TD.Data.Users as Users
import qualified TD.Data.ValidatedOrderInfo as ValidatedOrderInfo
import qualified TD.Data.VectorPathCommand as VectorPathCommand
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoChat as VideoChat
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote
import qualified TD.Data.WebAppInfo as WebAppInfo
import qualified TD.Data.WebPage as WebPage
import qualified TD.Data.WebPageInstantView as WebPageInstantView

data GeneralResult
  = Error Error.Error
  | Ok Ok.Ok
  | AuthenticationCodeType AuthenticationCodeType.AuthenticationCodeType
  | AuthenticationCodeInfo AuthenticationCodeInfo.AuthenticationCodeInfo
  | EmailAddressAuthenticationCodeInfo EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo
  | EmailAddressAuthentication EmailAddressAuthentication.EmailAddressAuthentication
  | TextEntity TextEntity.TextEntity
  | TextEntities TextEntities.TextEntities
  | FormattedText FormattedText.FormattedText
  | TermsOfService TermsOfService.TermsOfService
  | AuthorizationState AuthorizationState.AuthorizationState
  | PasswordState PasswordState.PasswordState
  | RecoveryEmailAddress RecoveryEmailAddress.RecoveryEmailAddress
  | TemporaryPasswordState TemporaryPasswordState.TemporaryPasswordState
  | LocalFile LocalFile.LocalFile
  | RemoteFile RemoteFile.RemoteFile
  | File File.File
  | InputFile InputFile.InputFile
  | PhotoSize PhotoSize.PhotoSize
  | Minithumbnail Minithumbnail.Minithumbnail
  | ThumbnailFormat ThumbnailFormat.ThumbnailFormat
  | Thumbnail Thumbnail.Thumbnail
  | MaskPoint MaskPoint.MaskPoint
  | MaskPosition MaskPosition.MaskPosition
  | StickerFormat StickerFormat.StickerFormat
  | StickerType StickerType.StickerType
  | ClosedVectorPath ClosedVectorPath.ClosedVectorPath
  | PollOption PollOption.PollOption
  | PollType PollType.PollType
  | Animation Animation.Animation
  | Audio Audio.Audio
  | Document Document.Document
  | Photo Photo.Photo
  | Sticker Sticker.Sticker
  | Video Video.Video
  | VideoNote VideoNote.VideoNote
  | VoiceNote VoiceNote.VoiceNote
  | AnimatedEmoji AnimatedEmoji.AnimatedEmoji
  | Contact Contact.Contact
  | Location Location.Location
  | Venue Venue.Venue
  | Game Game.Game
  | Poll Poll.Poll
  | ProfilePhoto ProfilePhoto.ProfilePhoto
  | ChatPhotoInfo ChatPhotoInfo.ChatPhotoInfo
  | UserType UserType.UserType
  | BotCommand BotCommand.BotCommand
  | BotCommands BotCommands.BotCommands
  | BotMenuButton BotMenuButton.BotMenuButton
  | ChatLocation ChatLocation.ChatLocation
  | AnimatedChatPhoto AnimatedChatPhoto.AnimatedChatPhoto
  | ChatPhoto ChatPhoto.ChatPhoto
  | ChatPhotos ChatPhotos.ChatPhotos
  | InputChatPhoto InputChatPhoto.InputChatPhoto
  | ChatPermissions ChatPermissions.ChatPermissions
  | ChatAdministratorRights ChatAdministratorRights.ChatAdministratorRights
  | PremiumPaymentOption PremiumPaymentOption.PremiumPaymentOption
  | EmojiStatus EmojiStatus.EmojiStatus
  | EmojiStatuses EmojiStatuses.EmojiStatuses
  | User User.User
  | BotInfo BotInfo.BotInfo
  | UserFullInfo UserFullInfo.UserFullInfo
  | Users Users.Users
  | ChatAdministrator ChatAdministrator.ChatAdministrator
  | ChatAdministrators ChatAdministrators.ChatAdministrators
  | ChatMemberStatus ChatMemberStatus.ChatMemberStatus
  | ChatMember ChatMember.ChatMember
  | ChatMembers ChatMembers.ChatMembers
  | ChatMembersFilter ChatMembersFilter.ChatMembersFilter
  | SupergroupMembersFilter SupergroupMembersFilter.SupergroupMembersFilter
  | ChatInviteLink ChatInviteLink.ChatInviteLink
  | ChatInviteLinks ChatInviteLinks.ChatInviteLinks
  | ChatInviteLinkCount ChatInviteLinkCount.ChatInviteLinkCount
  | ChatInviteLinkCounts ChatInviteLinkCounts.ChatInviteLinkCounts
  | ChatInviteLinkMember ChatInviteLinkMember.ChatInviteLinkMember
  | ChatInviteLinkMembers ChatInviteLinkMembers.ChatInviteLinkMembers
  | ChatInviteLinkInfo ChatInviteLinkInfo.ChatInviteLinkInfo
  | ChatJoinRequest ChatJoinRequest.ChatJoinRequest
  | ChatJoinRequests ChatJoinRequests.ChatJoinRequests
  | ChatJoinRequestsInfo ChatJoinRequestsInfo.ChatJoinRequestsInfo
  | BasicGroup BasicGroup.BasicGroup
  | BasicGroupFullInfo BasicGroupFullInfo.BasicGroupFullInfo
  | Supergroup Supergroup.Supergroup
  | SupergroupFullInfo SupergroupFullInfo.SupergroupFullInfo
  | SecretChatState SecretChatState.SecretChatState
  | SecretChat SecretChat.SecretChat
  | MessageSender MessageSender.MessageSender
  | MessageSenders MessageSenders.MessageSenders
  | ChatMessageSender ChatMessageSender.ChatMessageSender
  | ChatMessageSenders ChatMessageSenders.ChatMessageSenders
  | MessageForwardOrigin MessageForwardOrigin.MessageForwardOrigin
  | ReactionType ReactionType.ReactionType
  | MessageForwardInfo MessageForwardInfo.MessageForwardInfo
  | MessageReplyInfo MessageReplyInfo.MessageReplyInfo
  | MessageReaction MessageReaction.MessageReaction
  | MessageInteractionInfo MessageInteractionInfo.MessageInteractionInfo
  | UnreadReaction UnreadReaction.UnreadReaction
  | MessageSendingState MessageSendingState.MessageSendingState
  | Message Message.Message
  | Messages Messages.Messages
  | FoundMessages FoundMessages.FoundMessages
  | MessagePosition MessagePosition.MessagePosition
  | MessagePositions MessagePositions.MessagePositions
  | MessageCalendarDay MessageCalendarDay.MessageCalendarDay
  | MessageCalendar MessageCalendar.MessageCalendar
  | SponsoredMessage SponsoredMessage.SponsoredMessage
  | FileDownload FileDownload.FileDownload
  | DownloadedFileCounts DownloadedFileCounts.DownloadedFileCounts
  | FoundFileDownloads FoundFileDownloads.FoundFileDownloads
  | NotificationSettingsScope NotificationSettingsScope.NotificationSettingsScope
  | ChatNotificationSettings ChatNotificationSettings.ChatNotificationSettings
  | ScopeNotificationSettings ScopeNotificationSettings.ScopeNotificationSettings
  | DraftMessage DraftMessage.DraftMessage
  | ChatType ChatType.ChatType
  | ChatFilter ChatFilter.ChatFilter
  | ChatFilterInfo ChatFilterInfo.ChatFilterInfo
  | RecommendedChatFilter RecommendedChatFilter.RecommendedChatFilter
  | RecommendedChatFilters RecommendedChatFilters.RecommendedChatFilters
  | ChatList ChatList.ChatList
  | ChatLists ChatLists.ChatLists
  | ChatSource ChatSource.ChatSource
  | ChatPosition ChatPosition.ChatPosition
  | ChatAvailableReactions ChatAvailableReactions.ChatAvailableReactions
  | VideoChat VideoChat.VideoChat
  | Chat Chat.Chat
  | Chats Chats.Chats
  | ChatNearby ChatNearby.ChatNearby
  | ChatsNearby ChatsNearby.ChatsNearby
  | PublicChatType PublicChatType.PublicChatType
  | ChatActionBar ChatActionBar.ChatActionBar
  | KeyboardButtonType KeyboardButtonType.KeyboardButtonType
  | KeyboardButton KeyboardButton.KeyboardButton
  | InlineKeyboardButtonType InlineKeyboardButtonType.InlineKeyboardButtonType
  | InlineKeyboardButton InlineKeyboardButton.InlineKeyboardButton
  | ReplyMarkup ReplyMarkup.ReplyMarkup
  | LoginUrlInfo LoginUrlInfo.LoginUrlInfo
  | WebAppInfo WebAppInfo.WebAppInfo
  | MessageThreadInfo MessageThreadInfo.MessageThreadInfo
  | RichText RichText.RichText
  | PageBlockCaption PageBlockCaption.PageBlockCaption
  | PageBlockListItem PageBlockListItem.PageBlockListItem
  | PageBlockHorizontalAlignment PageBlockHorizontalAlignment.PageBlockHorizontalAlignment
  | PageBlockVerticalAlignment PageBlockVerticalAlignment.PageBlockVerticalAlignment
  | PageBlockTableCell PageBlockTableCell.PageBlockTableCell
  | PageBlockRelatedArticle PageBlockRelatedArticle.PageBlockRelatedArticle
  | PageBlock PageBlock.PageBlock
  | WebPageInstantView WebPageInstantView.WebPageInstantView
  | WebPage WebPage.WebPage
  | CountryInfo CountryInfo.CountryInfo
  | Countries Countries.Countries
  | PhoneNumberInfo PhoneNumberInfo.PhoneNumberInfo
  | BankCardActionOpenUrl BankCardActionOpenUrl.BankCardActionOpenUrl
  | BankCardInfo BankCardInfo.BankCardInfo
  | Address Address.Address
  | ThemeParameters ThemeParameters.ThemeParameters
  | LabeledPricePart LabeledPricePart.LabeledPricePart
  | Invoice Invoice.Invoice
  | OrderInfo OrderInfo.OrderInfo
  | ShippingOption ShippingOption.ShippingOption
  | SavedCredentials SavedCredentials.SavedCredentials
  | InputCredentials InputCredentials.InputCredentials
  | PaymentProvider PaymentProvider.PaymentProvider
  | PaymentOption PaymentOption.PaymentOption
  | PaymentForm PaymentForm.PaymentForm
  | ValidatedOrderInfo ValidatedOrderInfo.ValidatedOrderInfo
  | PaymentResult PaymentResult.PaymentResult
  | PaymentReceipt PaymentReceipt.PaymentReceipt
  | InputInvoice InputInvoice.InputInvoice
  | MessageExtendedMedia MessageExtendedMedia.MessageExtendedMedia
  | DatedFile DatedFile.DatedFile
  | PassportElementType PassportElementType.PassportElementType
  | Date Date.Date
  | PersonalDetails PersonalDetails.PersonalDetails
  | IdentityDocument IdentityDocument.IdentityDocument
  | InputIdentityDocument InputIdentityDocument.InputIdentityDocument
  | PersonalDocument PersonalDocument.PersonalDocument
  | InputPersonalDocument InputPersonalDocument.InputPersonalDocument
  | PassportElement PassportElement.PassportElement
  | InputPassportElement InputPassportElement.InputPassportElement
  | PassportElements PassportElements.PassportElements
  | PassportElementErrorSource PassportElementErrorSource.PassportElementErrorSource
  | PassportElementError PassportElementError.PassportElementError
  | PassportSuitableElement PassportSuitableElement.PassportSuitableElement
  | PassportRequiredElement PassportRequiredElement.PassportRequiredElement
  | PassportAuthorizationForm PassportAuthorizationForm.PassportAuthorizationForm
  | PassportElementsWithErrors PassportElementsWithErrors.PassportElementsWithErrors
  | EncryptedCredentials EncryptedCredentials.EncryptedCredentials
  | EncryptedPassportElement EncryptedPassportElement.EncryptedPassportElement
  | InputPassportElementErrorSource InputPassportElementErrorSource.InputPassportElementErrorSource
  | InputPassportElementError InputPassportElementError.InputPassportElementError
  | MessageContent MessageContent.MessageContent
  | TextEntityType TextEntityType.TextEntityType
  | InputThumbnail InputThumbnail.InputThumbnail
  | MessageSchedulingState MessageSchedulingState.MessageSchedulingState
  | MessageSendOptions MessageSendOptions.MessageSendOptions
  | MessageCopyOptions MessageCopyOptions.MessageCopyOptions
  | InputMessageContent InputMessageContent.InputMessageContent
  | SearchMessagesFilter SearchMessagesFilter.SearchMessagesFilter
  | ChatAction ChatAction.ChatAction
  | UserStatus UserStatus.UserStatus
  | Stickers Stickers.Stickers
  | Emojis Emojis.Emojis
  | StickerSet StickerSet.StickerSet
  | StickerSetInfo StickerSetInfo.StickerSetInfo
  | StickerSets StickerSets.StickerSets
  | TrendingStickerSets TrendingStickerSets.TrendingStickerSets
  | CallDiscardReason CallDiscardReason.CallDiscardReason
  | CallProtocol CallProtocol.CallProtocol
  | CallServerType CallServerType.CallServerType
  | CallServer CallServer.CallServer
  | CallId CallId.CallId
  | GroupCallId GroupCallId.GroupCallId
  | CallState CallState.CallState
  | GroupCallVideoQuality GroupCallVideoQuality.GroupCallVideoQuality
  | GroupCallStream GroupCallStream.GroupCallStream
  | GroupCallStreams GroupCallStreams.GroupCallStreams
  | RtmpUrl RtmpUrl.RtmpUrl
  | GroupCallRecentSpeaker GroupCallRecentSpeaker.GroupCallRecentSpeaker
  | GroupCall GroupCall.GroupCall
  | GroupCallVideoSourceGroup GroupCallVideoSourceGroup.GroupCallVideoSourceGroup
  | GroupCallParticipantVideoInfo GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo
  | GroupCallParticipant GroupCallParticipant.GroupCallParticipant
  | CallProblem CallProblem.CallProblem
  | Call Call.Call
  | PhoneNumberAuthenticationSettings PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings
  | AddedReaction AddedReaction.AddedReaction
  | AddedReactions AddedReactions.AddedReactions
  | AvailableReaction AvailableReaction.AvailableReaction
  | AvailableReactions AvailableReactions.AvailableReactions
  | EmojiReaction EmojiReaction.EmojiReaction
  | Animations Animations.Animations
  | DiceStickers DiceStickers.DiceStickers
  | ImportedContacts ImportedContacts.ImportedContacts
  | SpeechRecognitionResult SpeechRecognitionResult.SpeechRecognitionResult
  | AttachmentMenuBotColor AttachmentMenuBotColor.AttachmentMenuBotColor
  | AttachmentMenuBot AttachmentMenuBot.AttachmentMenuBot
  | SentWebAppMessage SentWebAppMessage.SentWebAppMessage
  | HttpUrl HttpUrl.HttpUrl
  | InputInlineQueryResult InputInlineQueryResult.InputInlineQueryResult
  | InlineQueryResult InlineQueryResult.InlineQueryResult
  | InlineQueryResults InlineQueryResults.InlineQueryResults
  | CallbackQueryPayload CallbackQueryPayload.CallbackQueryPayload
  | CallbackQueryAnswer CallbackQueryAnswer.CallbackQueryAnswer
  | CustomRequestResult CustomRequestResult.CustomRequestResult
  | GameHighScore GameHighScore.GameHighScore
  | GameHighScores GameHighScores.GameHighScores
  | ChatEventAction ChatEventAction.ChatEventAction
  | ChatEvent ChatEvent.ChatEvent
  | ChatEvents ChatEvents.ChatEvents
  | ChatEventLogFilters ChatEventLogFilters.ChatEventLogFilters
  | LanguagePackStringValue LanguagePackStringValue.LanguagePackStringValue
  | LanguagePackString LanguagePackString.LanguagePackString
  | LanguagePackStrings LanguagePackStrings.LanguagePackStrings
  | LanguagePackInfo LanguagePackInfo.LanguagePackInfo
  | LocalizationTargetInfo LocalizationTargetInfo.LocalizationTargetInfo
  | PremiumLimitType PremiumLimitType.PremiumLimitType
  | PremiumFeature PremiumFeature.PremiumFeature
  | PremiumLimit PremiumLimit.PremiumLimit
  | PremiumFeatures PremiumFeatures.PremiumFeatures
  | PremiumSource PremiumSource.PremiumSource
  | PremiumFeaturePromotionAnimation PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation
  | PremiumState PremiumState.PremiumState
  | StorePaymentPurpose StorePaymentPurpose.StorePaymentPurpose
  | DeviceToken DeviceToken.DeviceToken
  | PushReceiverId PushReceiverId.PushReceiverId
  | BackgroundFill BackgroundFill.BackgroundFill
  | BackgroundType BackgroundType.BackgroundType
  | Background Background.Background
  | Backgrounds Backgrounds.Backgrounds
  | InputBackground InputBackground.InputBackground
  | ThemeSettings ThemeSettings.ThemeSettings
  | ChatTheme ChatTheme.ChatTheme
  | Hashtags Hashtags.Hashtags
  | CanTransferOwnershipResult CanTransferOwnershipResult.CanTransferOwnershipResult
  | CheckChatUsernameResult CheckChatUsernameResult.CheckChatUsernameResult
  | CheckStickerSetNameResult CheckStickerSetNameResult.CheckStickerSetNameResult
  | ResetPasswordResult ResetPasswordResult.ResetPasswordResult
  | MessageFileType MessageFileType.MessageFileType
  | PushMessageContent PushMessageContent.PushMessageContent
  | NotificationType NotificationType.NotificationType
  | NotificationGroupType NotificationGroupType.NotificationGroupType
  | NotificationSound NotificationSound.NotificationSound
  | NotificationSounds NotificationSounds.NotificationSounds
  | Notification Notification.Notification
  | NotificationGroup NotificationGroup.NotificationGroup
  | OptionValue OptionValue.OptionValue
  | JsonObjectMember JsonObjectMember.JsonObjectMember
  | JsonValue JsonValue.JsonValue
  | UserPrivacySettingRule UserPrivacySettingRule.UserPrivacySettingRule
  | UserPrivacySettingRules UserPrivacySettingRules.UserPrivacySettingRules
  | UserPrivacySetting UserPrivacySetting.UserPrivacySetting
  | AccountTtl AccountTtl.AccountTtl
  | SessionType SessionType.SessionType
  | Session Session.Session
  | Sessions Sessions.Sessions
  | ConnectedWebsite ConnectedWebsite.ConnectedWebsite
  | ConnectedWebsites ConnectedWebsites.ConnectedWebsites
  | ChatReportReason ChatReportReason.ChatReportReason
  | TargetChat TargetChat.TargetChat
  | InternalLinkType InternalLinkType.InternalLinkType
  | MessageLink MessageLink.MessageLink
  | MessageLinkInfo MessageLinkInfo.MessageLinkInfo
  | FilePart FilePart.FilePart
  | FileType FileType.FileType
  | StorageStatisticsByFileType StorageStatisticsByFileType.StorageStatisticsByFileType
  | StorageStatisticsByChat StorageStatisticsByChat.StorageStatisticsByChat
  | StorageStatistics StorageStatistics.StorageStatistics
  | StorageStatisticsFast StorageStatisticsFast.StorageStatisticsFast
  | DatabaseStatistics DatabaseStatistics.DatabaseStatistics
  | NetworkType NetworkType.NetworkType
  | NetworkStatisticsEntry NetworkStatisticsEntry.NetworkStatisticsEntry
  | NetworkStatistics NetworkStatistics.NetworkStatistics
  | AutoDownloadSettings AutoDownloadSettings.AutoDownloadSettings
  | AutoDownloadSettingsPresets AutoDownloadSettingsPresets.AutoDownloadSettingsPresets
  | ConnectionState ConnectionState.ConnectionState
  | TopChatCategory TopChatCategory.TopChatCategory
  | TMeUrlType TMeUrlType.TMeUrlType
  | TMeUrl TMeUrl.TMeUrl
  | TMeUrls TMeUrls.TMeUrls
  | SuggestedAction SuggestedAction.SuggestedAction
  | Count Count.Count
  | Text Text.Text
  | Seconds Seconds.Seconds
  | FileDownloadedPrefixSize FileDownloadedPrefixSize.FileDownloadedPrefixSize
  | DeepLinkInfo DeepLinkInfo.DeepLinkInfo
  | TextParseMode TextParseMode.TextParseMode
  | ProxyType ProxyType.ProxyType
  | Proxy Proxy.Proxy
  | Proxies Proxies.Proxies
  | InputSticker InputSticker.InputSticker
  | DateRange DateRange.DateRange
  | StatisticalValue StatisticalValue.StatisticalValue
  | StatisticalGraph StatisticalGraph.StatisticalGraph
  | ChatStatisticsMessageInteractionInfo ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo
  | ChatStatisticsMessageSenderInfo ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo
  | ChatStatisticsAdministratorActionsInfo ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo
  | ChatStatisticsInviterInfo ChatStatisticsInviterInfo.ChatStatisticsInviterInfo
  | ChatStatistics ChatStatistics.ChatStatistics
  | MessageStatistics MessageStatistics.MessageStatistics
  | Point Point.Point
  | VectorPathCommand VectorPathCommand.VectorPathCommand
  | BotCommandScope BotCommandScope.BotCommandScope
  | Update Update.Update
  | Updates Updates.Updates
  | LogStream LogStream.LogStream
  | LogVerbosityLevel LogVerbosityLevel.LogVerbosityLevel
  | LogTags LogTags.LogTags
  | UserSupportInfo UserSupportInfo.UserSupportInfo
  | TestInt TestInt.TestInt
  | TestString TestString.TestString
  | TestBytes TestBytes.TestBytes
  | TestVectorInt TestVectorInt.TestVectorInt
  | TestVectorIntObject TestVectorIntObject.TestVectorIntObject
  | TestVectorString TestVectorString.TestVectorString
  | TestVectorStringObject TestVectorStringObject.TestVectorStringObject
  deriving (Show, Eq)

data ResultWithExtra = ResultWithExtra GeneralResult (Maybe String) deriving (Show, Eq)

instance T.FromJSON ResultWithExtra where
  parseJSON v@(T.Object obj) = do
    case (T.fromJSON v :: T.Result GeneralResult) of
      T.Success a -> return $ ResultWithExtra a e
      _ -> mempty
    where
      e :: Maybe String
      e = case T.parse (\o -> o A..:? "@extra" :: T.Parser (Maybe String)) obj of
        T.Success r -> r
        _ -> Nothing
  parseJSON _ = mempty

instance T.FromJSON GeneralResult where
  parseJSON v@(T.Object _) = do
    mconcat t
    where
      t =
        [ case (T.fromJSON v :: T.Result Error.Error) of
            T.Success a -> return $ Error a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Ok.Ok) of
            T.Success a -> return $ Ok a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AuthenticationCodeType.AuthenticationCodeType) of
            T.Success a -> return $ AuthenticationCodeType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AuthenticationCodeInfo.AuthenticationCodeInfo) of
            T.Success a -> return $ AuthenticationCodeInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo) of
            T.Success a -> return $ EmailAddressAuthenticationCodeInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EmailAddressAuthentication.EmailAddressAuthentication) of
            T.Success a -> return $ EmailAddressAuthentication a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TextEntity.TextEntity) of
            T.Success a -> return $ TextEntity a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TextEntities.TextEntities) of
            T.Success a -> return $ TextEntities a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FormattedText.FormattedText) of
            T.Success a -> return $ FormattedText a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TermsOfService.TermsOfService) of
            T.Success a -> return $ TermsOfService a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AuthorizationState.AuthorizationState) of
            T.Success a -> return $ AuthorizationState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PasswordState.PasswordState) of
            T.Success a -> return $ PasswordState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RecoveryEmailAddress.RecoveryEmailAddress) of
            T.Success a -> return $ RecoveryEmailAddress a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TemporaryPasswordState.TemporaryPasswordState) of
            T.Success a -> return $ TemporaryPasswordState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LocalFile.LocalFile) of
            T.Success a -> return $ LocalFile a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RemoteFile.RemoteFile) of
            T.Success a -> return $ RemoteFile a
            _ -> mempty,
          case (T.fromJSON v :: T.Result File.File) of
            T.Success a -> return $ File a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputFile.InputFile) of
            T.Success a -> return $ InputFile a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PhotoSize.PhotoSize) of
            T.Success a -> return $ PhotoSize a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Minithumbnail.Minithumbnail) of
            T.Success a -> return $ Minithumbnail a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ThumbnailFormat.ThumbnailFormat) of
            T.Success a -> return $ ThumbnailFormat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Thumbnail.Thumbnail) of
            T.Success a -> return $ Thumbnail a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MaskPoint.MaskPoint) of
            T.Success a -> return $ MaskPoint a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MaskPosition.MaskPosition) of
            T.Success a -> return $ MaskPosition a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StickerFormat.StickerFormat) of
            T.Success a -> return $ StickerFormat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StickerType.StickerType) of
            T.Success a -> return $ StickerType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ClosedVectorPath.ClosedVectorPath) of
            T.Success a -> return $ ClosedVectorPath a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PollOption.PollOption) of
            T.Success a -> return $ PollOption a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PollType.PollType) of
            T.Success a -> return $ PollType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Animation.Animation) of
            T.Success a -> return $ Animation a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Audio.Audio) of
            T.Success a -> return $ Audio a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Document.Document) of
            T.Success a -> return $ Document a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Photo.Photo) of
            T.Success a -> return $ Photo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Sticker.Sticker) of
            T.Success a -> return $ Sticker a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Video.Video) of
            T.Success a -> return $ Video a
            _ -> mempty,
          case (T.fromJSON v :: T.Result VideoNote.VideoNote) of
            T.Success a -> return $ VideoNote a
            _ -> mempty,
          case (T.fromJSON v :: T.Result VoiceNote.VoiceNote) of
            T.Success a -> return $ VoiceNote a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AnimatedEmoji.AnimatedEmoji) of
            T.Success a -> return $ AnimatedEmoji a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Contact.Contact) of
            T.Success a -> return $ Contact a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Location.Location) of
            T.Success a -> return $ Location a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Venue.Venue) of
            T.Success a -> return $ Venue a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Game.Game) of
            T.Success a -> return $ Game a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Poll.Poll) of
            T.Success a -> return $ Poll a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ProfilePhoto.ProfilePhoto) of
            T.Success a -> return $ ProfilePhoto a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatPhotoInfo.ChatPhotoInfo) of
            T.Success a -> return $ ChatPhotoInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserType.UserType) of
            T.Success a -> return $ UserType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BotCommand.BotCommand) of
            T.Success a -> return $ BotCommand a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BotCommands.BotCommands) of
            T.Success a -> return $ BotCommands a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BotMenuButton.BotMenuButton) of
            T.Success a -> return $ BotMenuButton a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatLocation.ChatLocation) of
            T.Success a -> return $ ChatLocation a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AnimatedChatPhoto.AnimatedChatPhoto) of
            T.Success a -> return $ AnimatedChatPhoto a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatPhoto.ChatPhoto) of
            T.Success a -> return $ ChatPhoto a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatPhotos.ChatPhotos) of
            T.Success a -> return $ ChatPhotos a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputChatPhoto.InputChatPhoto) of
            T.Success a -> return $ InputChatPhoto a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatPermissions.ChatPermissions) of
            T.Success a -> return $ ChatPermissions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatAdministratorRights.ChatAdministratorRights) of
            T.Success a -> return $ ChatAdministratorRights a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumPaymentOption.PremiumPaymentOption) of
            T.Success a -> return $ PremiumPaymentOption a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EmojiStatus.EmojiStatus) of
            T.Success a -> return $ EmojiStatus a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EmojiStatuses.EmojiStatuses) of
            T.Success a -> return $ EmojiStatuses a
            _ -> mempty,
          case (T.fromJSON v :: T.Result User.User) of
            T.Success a -> return $ User a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BotInfo.BotInfo) of
            T.Success a -> return $ BotInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserFullInfo.UserFullInfo) of
            T.Success a -> return $ UserFullInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Users.Users) of
            T.Success a -> return $ Users a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatAdministrator.ChatAdministrator) of
            T.Success a -> return $ ChatAdministrator a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatAdministrators.ChatAdministrators) of
            T.Success a -> return $ ChatAdministrators a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMemberStatus.ChatMemberStatus) of
            T.Success a -> return $ ChatMemberStatus a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMember.ChatMember) of
            T.Success a -> return $ ChatMember a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMembers.ChatMembers) of
            T.Success a -> return $ ChatMembers a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMembersFilter.ChatMembersFilter) of
            T.Success a -> return $ ChatMembersFilter a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SupergroupMembersFilter.SupergroupMembersFilter) of
            T.Success a -> return $ SupergroupMembersFilter a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLink.ChatInviteLink) of
            T.Success a -> return $ ChatInviteLink a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinks.ChatInviteLinks) of
            T.Success a -> return $ ChatInviteLinks a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinkCount.ChatInviteLinkCount) of
            T.Success a -> return $ ChatInviteLinkCount a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinkCounts.ChatInviteLinkCounts) of
            T.Success a -> return $ ChatInviteLinkCounts a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinkMember.ChatInviteLinkMember) of
            T.Success a -> return $ ChatInviteLinkMember a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinkMembers.ChatInviteLinkMembers) of
            T.Success a -> return $ ChatInviteLinkMembers a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatInviteLinkInfo.ChatInviteLinkInfo) of
            T.Success a -> return $ ChatInviteLinkInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatJoinRequest.ChatJoinRequest) of
            T.Success a -> return $ ChatJoinRequest a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatJoinRequests.ChatJoinRequests) of
            T.Success a -> return $ ChatJoinRequests a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatJoinRequestsInfo.ChatJoinRequestsInfo) of
            T.Success a -> return $ ChatJoinRequestsInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BasicGroup.BasicGroup) of
            T.Success a -> return $ BasicGroup a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BasicGroupFullInfo.BasicGroupFullInfo) of
            T.Success a -> return $ BasicGroupFullInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Supergroup.Supergroup) of
            T.Success a -> return $ Supergroup a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SupergroupFullInfo.SupergroupFullInfo) of
            T.Success a -> return $ SupergroupFullInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SecretChatState.SecretChatState) of
            T.Success a -> return $ SecretChatState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SecretChat.SecretChat) of
            T.Success a -> return $ SecretChat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageSender.MessageSender) of
            T.Success a -> return $ MessageSender a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageSenders.MessageSenders) of
            T.Success a -> return $ MessageSenders a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMessageSender.ChatMessageSender) of
            T.Success a -> return $ ChatMessageSender a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatMessageSenders.ChatMessageSenders) of
            T.Success a -> return $ ChatMessageSenders a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageForwardOrigin.MessageForwardOrigin) of
            T.Success a -> return $ MessageForwardOrigin a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ReactionType.ReactionType) of
            T.Success a -> return $ ReactionType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageForwardInfo.MessageForwardInfo) of
            T.Success a -> return $ MessageForwardInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageReplyInfo.MessageReplyInfo) of
            T.Success a -> return $ MessageReplyInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageReaction.MessageReaction) of
            T.Success a -> return $ MessageReaction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageInteractionInfo.MessageInteractionInfo) of
            T.Success a -> return $ MessageInteractionInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UnreadReaction.UnreadReaction) of
            T.Success a -> return $ UnreadReaction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageSendingState.MessageSendingState) of
            T.Success a -> return $ MessageSendingState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Message.Message) of
            T.Success a -> return $ Message a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Messages.Messages) of
            T.Success a -> return $ Messages a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FoundMessages.FoundMessages) of
            T.Success a -> return $ FoundMessages a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessagePosition.MessagePosition) of
            T.Success a -> return $ MessagePosition a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessagePositions.MessagePositions) of
            T.Success a -> return $ MessagePositions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageCalendarDay.MessageCalendarDay) of
            T.Success a -> return $ MessageCalendarDay a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageCalendar.MessageCalendar) of
            T.Success a -> return $ MessageCalendar a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SponsoredMessage.SponsoredMessage) of
            T.Success a -> return $ SponsoredMessage a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FileDownload.FileDownload) of
            T.Success a -> return $ FileDownload a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DownloadedFileCounts.DownloadedFileCounts) of
            T.Success a -> return $ DownloadedFileCounts a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FoundFileDownloads.FoundFileDownloads) of
            T.Success a -> return $ FoundFileDownloads a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationSettingsScope.NotificationSettingsScope) of
            T.Success a -> return $ NotificationSettingsScope a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatNotificationSettings.ChatNotificationSettings) of
            T.Success a -> return $ ChatNotificationSettings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ScopeNotificationSettings.ScopeNotificationSettings) of
            T.Success a -> return $ ScopeNotificationSettings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DraftMessage.DraftMessage) of
            T.Success a -> return $ DraftMessage a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatType.ChatType) of
            T.Success a -> return $ ChatType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatFilter.ChatFilter) of
            T.Success a -> return $ ChatFilter a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatFilterInfo.ChatFilterInfo) of
            T.Success a -> return $ ChatFilterInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RecommendedChatFilter.RecommendedChatFilter) of
            T.Success a -> return $ RecommendedChatFilter a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RecommendedChatFilters.RecommendedChatFilters) of
            T.Success a -> return $ RecommendedChatFilters a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatList.ChatList) of
            T.Success a -> return $ ChatList a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatLists.ChatLists) of
            T.Success a -> return $ ChatLists a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatSource.ChatSource) of
            T.Success a -> return $ ChatSource a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatPosition.ChatPosition) of
            T.Success a -> return $ ChatPosition a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatAvailableReactions.ChatAvailableReactions) of
            T.Success a -> return $ ChatAvailableReactions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result VideoChat.VideoChat) of
            T.Success a -> return $ VideoChat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Chat.Chat) of
            T.Success a -> return $ Chat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Chats.Chats) of
            T.Success a -> return $ Chats a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatNearby.ChatNearby) of
            T.Success a -> return $ ChatNearby a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatsNearby.ChatsNearby) of
            T.Success a -> return $ ChatsNearby a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PublicChatType.PublicChatType) of
            T.Success a -> return $ PublicChatType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatActionBar.ChatActionBar) of
            T.Success a -> return $ ChatActionBar a
            _ -> mempty,
          case (T.fromJSON v :: T.Result KeyboardButtonType.KeyboardButtonType) of
            T.Success a -> return $ KeyboardButtonType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result KeyboardButton.KeyboardButton) of
            T.Success a -> return $ KeyboardButton a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InlineKeyboardButtonType.InlineKeyboardButtonType) of
            T.Success a -> return $ InlineKeyboardButtonType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InlineKeyboardButton.InlineKeyboardButton) of
            T.Success a -> return $ InlineKeyboardButton a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ReplyMarkup.ReplyMarkup) of
            T.Success a -> return $ ReplyMarkup a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LoginUrlInfo.LoginUrlInfo) of
            T.Success a -> return $ LoginUrlInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result WebAppInfo.WebAppInfo) of
            T.Success a -> return $ WebAppInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageThreadInfo.MessageThreadInfo) of
            T.Success a -> return $ MessageThreadInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RichText.RichText) of
            T.Success a -> return $ RichText a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockCaption.PageBlockCaption) of
            T.Success a -> return $ PageBlockCaption a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockListItem.PageBlockListItem) of
            T.Success a -> return $ PageBlockListItem a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockHorizontalAlignment.PageBlockHorizontalAlignment) of
            T.Success a -> return $ PageBlockHorizontalAlignment a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockVerticalAlignment.PageBlockVerticalAlignment) of
            T.Success a -> return $ PageBlockVerticalAlignment a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockTableCell.PageBlockTableCell) of
            T.Success a -> return $ PageBlockTableCell a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlockRelatedArticle.PageBlockRelatedArticle) of
            T.Success a -> return $ PageBlockRelatedArticle a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PageBlock.PageBlock) of
            T.Success a -> return $ PageBlock a
            _ -> mempty,
          case (T.fromJSON v :: T.Result WebPageInstantView.WebPageInstantView) of
            T.Success a -> return $ WebPageInstantView a
            _ -> mempty,
          case (T.fromJSON v :: T.Result WebPage.WebPage) of
            T.Success a -> return $ WebPage a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CountryInfo.CountryInfo) of
            T.Success a -> return $ CountryInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Countries.Countries) of
            T.Success a -> return $ Countries a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PhoneNumberInfo.PhoneNumberInfo) of
            T.Success a -> return $ PhoneNumberInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BankCardActionOpenUrl.BankCardActionOpenUrl) of
            T.Success a -> return $ BankCardActionOpenUrl a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BankCardInfo.BankCardInfo) of
            T.Success a -> return $ BankCardInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Address.Address) of
            T.Success a -> return $ Address a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ThemeParameters.ThemeParameters) of
            T.Success a -> return $ ThemeParameters a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LabeledPricePart.LabeledPricePart) of
            T.Success a -> return $ LabeledPricePart a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Invoice.Invoice) of
            T.Success a -> return $ Invoice a
            _ -> mempty,
          case (T.fromJSON v :: T.Result OrderInfo.OrderInfo) of
            T.Success a -> return $ OrderInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ShippingOption.ShippingOption) of
            T.Success a -> return $ ShippingOption a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SavedCredentials.SavedCredentials) of
            T.Success a -> return $ SavedCredentials a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputCredentials.InputCredentials) of
            T.Success a -> return $ InputCredentials a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PaymentProvider.PaymentProvider) of
            T.Success a -> return $ PaymentProvider a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PaymentOption.PaymentOption) of
            T.Success a -> return $ PaymentOption a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PaymentForm.PaymentForm) of
            T.Success a -> return $ PaymentForm a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ValidatedOrderInfo.ValidatedOrderInfo) of
            T.Success a -> return $ ValidatedOrderInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PaymentResult.PaymentResult) of
            T.Success a -> return $ PaymentResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PaymentReceipt.PaymentReceipt) of
            T.Success a -> return $ PaymentReceipt a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputInvoice.InputInvoice) of
            T.Success a -> return $ InputInvoice a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageExtendedMedia.MessageExtendedMedia) of
            T.Success a -> return $ MessageExtendedMedia a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DatedFile.DatedFile) of
            T.Success a -> return $ DatedFile a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElementType.PassportElementType) of
            T.Success a -> return $ PassportElementType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Date.Date) of
            T.Success a -> return $ Date a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PersonalDetails.PersonalDetails) of
            T.Success a -> return $ PersonalDetails a
            _ -> mempty,
          case (T.fromJSON v :: T.Result IdentityDocument.IdentityDocument) of
            T.Success a -> return $ IdentityDocument a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputIdentityDocument.InputIdentityDocument) of
            T.Success a -> return $ InputIdentityDocument a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PersonalDocument.PersonalDocument) of
            T.Success a -> return $ PersonalDocument a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputPersonalDocument.InputPersonalDocument) of
            T.Success a -> return $ InputPersonalDocument a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElement.PassportElement) of
            T.Success a -> return $ PassportElement a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputPassportElement.InputPassportElement) of
            T.Success a -> return $ InputPassportElement a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElements.PassportElements) of
            T.Success a -> return $ PassportElements a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElementErrorSource.PassportElementErrorSource) of
            T.Success a -> return $ PassportElementErrorSource a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElementError.PassportElementError) of
            T.Success a -> return $ PassportElementError a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportSuitableElement.PassportSuitableElement) of
            T.Success a -> return $ PassportSuitableElement a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportRequiredElement.PassportRequiredElement) of
            T.Success a -> return $ PassportRequiredElement a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportAuthorizationForm.PassportAuthorizationForm) of
            T.Success a -> return $ PassportAuthorizationForm a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PassportElementsWithErrors.PassportElementsWithErrors) of
            T.Success a -> return $ PassportElementsWithErrors a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EncryptedCredentials.EncryptedCredentials) of
            T.Success a -> return $ EncryptedCredentials a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EncryptedPassportElement.EncryptedPassportElement) of
            T.Success a -> return $ EncryptedPassportElement a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputPassportElementErrorSource.InputPassportElementErrorSource) of
            T.Success a -> return $ InputPassportElementErrorSource a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputPassportElementError.InputPassportElementError) of
            T.Success a -> return $ InputPassportElementError a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageContent.MessageContent) of
            T.Success a -> return $ MessageContent a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TextEntityType.TextEntityType) of
            T.Success a -> return $ TextEntityType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputThumbnail.InputThumbnail) of
            T.Success a -> return $ InputThumbnail a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageSchedulingState.MessageSchedulingState) of
            T.Success a -> return $ MessageSchedulingState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageSendOptions.MessageSendOptions) of
            T.Success a -> return $ MessageSendOptions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageCopyOptions.MessageCopyOptions) of
            T.Success a -> return $ MessageCopyOptions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputMessageContent.InputMessageContent) of
            T.Success a -> return $ InputMessageContent a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SearchMessagesFilter.SearchMessagesFilter) of
            T.Success a -> return $ SearchMessagesFilter a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatAction.ChatAction) of
            T.Success a -> return $ ChatAction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserStatus.UserStatus) of
            T.Success a -> return $ UserStatus a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Stickers.Stickers) of
            T.Success a -> return $ Stickers a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Emojis.Emojis) of
            T.Success a -> return $ Emojis a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StickerSet.StickerSet) of
            T.Success a -> return $ StickerSet a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StickerSetInfo.StickerSetInfo) of
            T.Success a -> return $ StickerSetInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StickerSets.StickerSets) of
            T.Success a -> return $ StickerSets a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TrendingStickerSets.TrendingStickerSets) of
            T.Success a -> return $ TrendingStickerSets a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallDiscardReason.CallDiscardReason) of
            T.Success a -> return $ CallDiscardReason a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallProtocol.CallProtocol) of
            T.Success a -> return $ CallProtocol a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallServerType.CallServerType) of
            T.Success a -> return $ CallServerType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallServer.CallServer) of
            T.Success a -> return $ CallServer a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallId.CallId) of
            T.Success a -> return $ CallId a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallId.GroupCallId) of
            T.Success a -> return $ GroupCallId a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallState.CallState) of
            T.Success a -> return $ CallState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallVideoQuality.GroupCallVideoQuality) of
            T.Success a -> return $ GroupCallVideoQuality a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallStream.GroupCallStream) of
            T.Success a -> return $ GroupCallStream a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallStreams.GroupCallStreams) of
            T.Success a -> return $ GroupCallStreams a
            _ -> mempty,
          case (T.fromJSON v :: T.Result RtmpUrl.RtmpUrl) of
            T.Success a -> return $ RtmpUrl a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallRecentSpeaker.GroupCallRecentSpeaker) of
            T.Success a -> return $ GroupCallRecentSpeaker a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCall.GroupCall) of
            T.Success a -> return $ GroupCall a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallVideoSourceGroup.GroupCallVideoSourceGroup) of
            T.Success a -> return $ GroupCallVideoSourceGroup a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo) of
            T.Success a -> return $ GroupCallParticipantVideoInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GroupCallParticipant.GroupCallParticipant) of
            T.Success a -> return $ GroupCallParticipant a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallProblem.CallProblem) of
            T.Success a -> return $ CallProblem a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Call.Call) of
            T.Success a -> return $ Call a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings) of
            T.Success a -> return $ PhoneNumberAuthenticationSettings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AddedReaction.AddedReaction) of
            T.Success a -> return $ AddedReaction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AddedReactions.AddedReactions) of
            T.Success a -> return $ AddedReactions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AvailableReaction.AvailableReaction) of
            T.Success a -> return $ AvailableReaction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AvailableReactions.AvailableReactions) of
            T.Success a -> return $ AvailableReactions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result EmojiReaction.EmojiReaction) of
            T.Success a -> return $ EmojiReaction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Animations.Animations) of
            T.Success a -> return $ Animations a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DiceStickers.DiceStickers) of
            T.Success a -> return $ DiceStickers a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ImportedContacts.ImportedContacts) of
            T.Success a -> return $ ImportedContacts a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SpeechRecognitionResult.SpeechRecognitionResult) of
            T.Success a -> return $ SpeechRecognitionResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AttachmentMenuBotColor.AttachmentMenuBotColor) of
            T.Success a -> return $ AttachmentMenuBotColor a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AttachmentMenuBot.AttachmentMenuBot) of
            T.Success a -> return $ AttachmentMenuBot a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SentWebAppMessage.SentWebAppMessage) of
            T.Success a -> return $ SentWebAppMessage a
            _ -> mempty,
          case (T.fromJSON v :: T.Result HttpUrl.HttpUrl) of
            T.Success a -> return $ HttpUrl a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputInlineQueryResult.InputInlineQueryResult) of
            T.Success a -> return $ InputInlineQueryResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InlineQueryResult.InlineQueryResult) of
            T.Success a -> return $ InlineQueryResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InlineQueryResults.InlineQueryResults) of
            T.Success a -> return $ InlineQueryResults a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallbackQueryPayload.CallbackQueryPayload) of
            T.Success a -> return $ CallbackQueryPayload a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CallbackQueryAnswer.CallbackQueryAnswer) of
            T.Success a -> return $ CallbackQueryAnswer a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CustomRequestResult.CustomRequestResult) of
            T.Success a -> return $ CustomRequestResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GameHighScore.GameHighScore) of
            T.Success a -> return $ GameHighScore a
            _ -> mempty,
          case (T.fromJSON v :: T.Result GameHighScores.GameHighScores) of
            T.Success a -> return $ GameHighScores a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatEventAction.ChatEventAction) of
            T.Success a -> return $ ChatEventAction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatEvent.ChatEvent) of
            T.Success a -> return $ ChatEvent a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatEvents.ChatEvents) of
            T.Success a -> return $ ChatEvents a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatEventLogFilters.ChatEventLogFilters) of
            T.Success a -> return $ ChatEventLogFilters a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LanguagePackStringValue.LanguagePackStringValue) of
            T.Success a -> return $ LanguagePackStringValue a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LanguagePackString.LanguagePackString) of
            T.Success a -> return $ LanguagePackString a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LanguagePackStrings.LanguagePackStrings) of
            T.Success a -> return $ LanguagePackStrings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LanguagePackInfo.LanguagePackInfo) of
            T.Success a -> return $ LanguagePackInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LocalizationTargetInfo.LocalizationTargetInfo) of
            T.Success a -> return $ LocalizationTargetInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumLimitType.PremiumLimitType) of
            T.Success a -> return $ PremiumLimitType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumFeature.PremiumFeature) of
            T.Success a -> return $ PremiumFeature a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumLimit.PremiumLimit) of
            T.Success a -> return $ PremiumLimit a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumFeatures.PremiumFeatures) of
            T.Success a -> return $ PremiumFeatures a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumSource.PremiumSource) of
            T.Success a -> return $ PremiumSource a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation) of
            T.Success a -> return $ PremiumFeaturePromotionAnimation a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PremiumState.PremiumState) of
            T.Success a -> return $ PremiumState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StorePaymentPurpose.StorePaymentPurpose) of
            T.Success a -> return $ StorePaymentPurpose a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DeviceToken.DeviceToken) of
            T.Success a -> return $ DeviceToken a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PushReceiverId.PushReceiverId) of
            T.Success a -> return $ PushReceiverId a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BackgroundFill.BackgroundFill) of
            T.Success a -> return $ BackgroundFill a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BackgroundType.BackgroundType) of
            T.Success a -> return $ BackgroundType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Background.Background) of
            T.Success a -> return $ Background a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Backgrounds.Backgrounds) of
            T.Success a -> return $ Backgrounds a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputBackground.InputBackground) of
            T.Success a -> return $ InputBackground a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ThemeSettings.ThemeSettings) of
            T.Success a -> return $ ThemeSettings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatTheme.ChatTheme) of
            T.Success a -> return $ ChatTheme a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Hashtags.Hashtags) of
            T.Success a -> return $ Hashtags a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CanTransferOwnershipResult.CanTransferOwnershipResult) of
            T.Success a -> return $ CanTransferOwnershipResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CheckChatUsernameResult.CheckChatUsernameResult) of
            T.Success a -> return $ CheckChatUsernameResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result CheckStickerSetNameResult.CheckStickerSetNameResult) of
            T.Success a -> return $ CheckStickerSetNameResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ResetPasswordResult.ResetPasswordResult) of
            T.Success a -> return $ ResetPasswordResult a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageFileType.MessageFileType) of
            T.Success a -> return $ MessageFileType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result PushMessageContent.PushMessageContent) of
            T.Success a -> return $ PushMessageContent a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationType.NotificationType) of
            T.Success a -> return $ NotificationType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationGroupType.NotificationGroupType) of
            T.Success a -> return $ NotificationGroupType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationSound.NotificationSound) of
            T.Success a -> return $ NotificationSound a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationSounds.NotificationSounds) of
            T.Success a -> return $ NotificationSounds a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Notification.Notification) of
            T.Success a -> return $ Notification a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NotificationGroup.NotificationGroup) of
            T.Success a -> return $ NotificationGroup a
            _ -> mempty,
          case (T.fromJSON v :: T.Result OptionValue.OptionValue) of
            T.Success a -> return $ OptionValue a
            _ -> mempty,
          case (T.fromJSON v :: T.Result JsonObjectMember.JsonObjectMember) of
            T.Success a -> return $ JsonObjectMember a
            _ -> mempty,
          case (T.fromJSON v :: T.Result JsonValue.JsonValue) of
            T.Success a -> return $ JsonValue a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserPrivacySettingRule.UserPrivacySettingRule) of
            T.Success a -> return $ UserPrivacySettingRule a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserPrivacySettingRules.UserPrivacySettingRules) of
            T.Success a -> return $ UserPrivacySettingRules a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserPrivacySetting.UserPrivacySetting) of
            T.Success a -> return $ UserPrivacySetting a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AccountTtl.AccountTtl) of
            T.Success a -> return $ AccountTtl a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SessionType.SessionType) of
            T.Success a -> return $ SessionType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Session.Session) of
            T.Success a -> return $ Session a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Sessions.Sessions) of
            T.Success a -> return $ Sessions a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ConnectedWebsite.ConnectedWebsite) of
            T.Success a -> return $ ConnectedWebsite a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ConnectedWebsites.ConnectedWebsites) of
            T.Success a -> return $ ConnectedWebsites a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatReportReason.ChatReportReason) of
            T.Success a -> return $ ChatReportReason a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TargetChat.TargetChat) of
            T.Success a -> return $ TargetChat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InternalLinkType.InternalLinkType) of
            T.Success a -> return $ InternalLinkType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageLink.MessageLink) of
            T.Success a -> return $ MessageLink a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageLinkInfo.MessageLinkInfo) of
            T.Success a -> return $ MessageLinkInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FilePart.FilePart) of
            T.Success a -> return $ FilePart a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FileType.FileType) of
            T.Success a -> return $ FileType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StorageStatisticsByFileType.StorageStatisticsByFileType) of
            T.Success a -> return $ StorageStatisticsByFileType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StorageStatisticsByChat.StorageStatisticsByChat) of
            T.Success a -> return $ StorageStatisticsByChat a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StorageStatistics.StorageStatistics) of
            T.Success a -> return $ StorageStatistics a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StorageStatisticsFast.StorageStatisticsFast) of
            T.Success a -> return $ StorageStatisticsFast a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DatabaseStatistics.DatabaseStatistics) of
            T.Success a -> return $ DatabaseStatistics a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NetworkType.NetworkType) of
            T.Success a -> return $ NetworkType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NetworkStatisticsEntry.NetworkStatisticsEntry) of
            T.Success a -> return $ NetworkStatisticsEntry a
            _ -> mempty,
          case (T.fromJSON v :: T.Result NetworkStatistics.NetworkStatistics) of
            T.Success a -> return $ NetworkStatistics a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AutoDownloadSettings.AutoDownloadSettings) of
            T.Success a -> return $ AutoDownloadSettings a
            _ -> mempty,
          case (T.fromJSON v :: T.Result AutoDownloadSettingsPresets.AutoDownloadSettingsPresets) of
            T.Success a -> return $ AutoDownloadSettingsPresets a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ConnectionState.ConnectionState) of
            T.Success a -> return $ ConnectionState a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TopChatCategory.TopChatCategory) of
            T.Success a -> return $ TopChatCategory a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TMeUrlType.TMeUrlType) of
            T.Success a -> return $ TMeUrlType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TMeUrl.TMeUrl) of
            T.Success a -> return $ TMeUrl a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TMeUrls.TMeUrls) of
            T.Success a -> return $ TMeUrls a
            _ -> mempty,
          case (T.fromJSON v :: T.Result SuggestedAction.SuggestedAction) of
            T.Success a -> return $ SuggestedAction a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Count.Count) of
            T.Success a -> return $ Count a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Text.Text) of
            T.Success a -> return $ Text a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Seconds.Seconds) of
            T.Success a -> return $ Seconds a
            _ -> mempty,
          case (T.fromJSON v :: T.Result FileDownloadedPrefixSize.FileDownloadedPrefixSize) of
            T.Success a -> return $ FileDownloadedPrefixSize a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DeepLinkInfo.DeepLinkInfo) of
            T.Success a -> return $ DeepLinkInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TextParseMode.TextParseMode) of
            T.Success a -> return $ TextParseMode a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ProxyType.ProxyType) of
            T.Success a -> return $ ProxyType a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Proxy.Proxy) of
            T.Success a -> return $ Proxy a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Proxies.Proxies) of
            T.Success a -> return $ Proxies a
            _ -> mempty,
          case (T.fromJSON v :: T.Result InputSticker.InputSticker) of
            T.Success a -> return $ InputSticker a
            _ -> mempty,
          case (T.fromJSON v :: T.Result DateRange.DateRange) of
            T.Success a -> return $ DateRange a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StatisticalValue.StatisticalValue) of
            T.Success a -> return $ StatisticalValue a
            _ -> mempty,
          case (T.fromJSON v :: T.Result StatisticalGraph.StatisticalGraph) of
            T.Success a -> return $ StatisticalGraph a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo) of
            T.Success a -> return $ ChatStatisticsMessageInteractionInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo) of
            T.Success a -> return $ ChatStatisticsMessageSenderInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo) of
            T.Success a -> return $ ChatStatisticsAdministratorActionsInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatStatisticsInviterInfo.ChatStatisticsInviterInfo) of
            T.Success a -> return $ ChatStatisticsInviterInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result ChatStatistics.ChatStatistics) of
            T.Success a -> return $ ChatStatistics a
            _ -> mempty,
          case (T.fromJSON v :: T.Result MessageStatistics.MessageStatistics) of
            T.Success a -> return $ MessageStatistics a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Point.Point) of
            T.Success a -> return $ Point a
            _ -> mempty,
          case (T.fromJSON v :: T.Result VectorPathCommand.VectorPathCommand) of
            T.Success a -> return $ VectorPathCommand a
            _ -> mempty,
          case (T.fromJSON v :: T.Result BotCommandScope.BotCommandScope) of
            T.Success a -> return $ BotCommandScope a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Update.Update) of
            T.Success a -> return $ Update a
            _ -> mempty,
          case (T.fromJSON v :: T.Result Updates.Updates) of
            T.Success a -> return $ Updates a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LogStream.LogStream) of
            T.Success a -> return $ LogStream a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LogVerbosityLevel.LogVerbosityLevel) of
            T.Success a -> return $ LogVerbosityLevel a
            _ -> mempty,
          case (T.fromJSON v :: T.Result LogTags.LogTags) of
            T.Success a -> return $ LogTags a
            _ -> mempty,
          case (T.fromJSON v :: T.Result UserSupportInfo.UserSupportInfo) of
            T.Success a -> return $ UserSupportInfo a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestInt.TestInt) of
            T.Success a -> return $ TestInt a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestString.TestString) of
            T.Success a -> return $ TestString a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestBytes.TestBytes) of
            T.Success a -> return $ TestBytes a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestVectorInt.TestVectorInt) of
            T.Success a -> return $ TestVectorInt a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestVectorIntObject.TestVectorIntObject) of
            T.Success a -> return $ TestVectorIntObject a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestVectorString.TestVectorString) of
            T.Success a -> return $ TestVectorString a
            _ -> mempty,
          case (T.fromJSON v :: T.Result TestVectorStringObject.TestVectorStringObject) of
            T.Success a -> return $ TestVectorStringObject a
            _ -> mempty
        ]
  parseJSON _ = mempty
