{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.GeneralResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.AccountTtl as AccountTtl
import qualified TD.Reply.AddedReaction as AddedReaction
import qualified TD.Reply.AddedReactions as AddedReactions
import qualified TD.Reply.Address as Address
import qualified TD.Reply.AnimatedChatPhoto as AnimatedChatPhoto
import qualified TD.Reply.AnimatedEmoji as AnimatedEmoji
import qualified TD.Reply.Animation as Animation
import qualified TD.Reply.Animations as Animations
import qualified TD.Reply.AttachmentMenuBot as AttachmentMenuBot
import qualified TD.Reply.AttachmentMenuBotColor as AttachmentMenuBotColor
import qualified TD.Reply.Audio as Audio
import qualified TD.Reply.AuthenticationCodeInfo as AuthenticationCodeInfo
import qualified TD.Reply.AuthenticationCodeType as AuthenticationCodeType
import qualified TD.Reply.AuthorizationState as AuthorizationState
import qualified TD.Reply.AutoDownloadSettings as AutoDownloadSettings
import qualified TD.Reply.AutoDownloadSettingsPresets as AutoDownloadSettingsPresets
import qualified TD.Reply.AvailableReactions as AvailableReactions
import qualified TD.Reply.Background as Background
import qualified TD.Reply.BackgroundFill as BackgroundFill
import qualified TD.Reply.BackgroundType as BackgroundType
import qualified TD.Reply.Backgrounds as Backgrounds
import qualified TD.Reply.BankCardActionOpenUrl as BankCardActionOpenUrl
import qualified TD.Reply.BankCardInfo as BankCardInfo
import qualified TD.Reply.BasicGroup as BasicGroup
import qualified TD.Reply.BasicGroupFullInfo as BasicGroupFullInfo
import qualified TD.Reply.BotCommand as BotCommand
import qualified TD.Reply.BotCommandScope as BotCommandScope
import qualified TD.Reply.BotCommands as BotCommands
import qualified TD.Reply.BotInfo as BotInfo
import qualified TD.Reply.BotMenuButton as BotMenuButton
import qualified TD.Reply.Call as Call
import qualified TD.Reply.CallDiscardReason as CallDiscardReason
import qualified TD.Reply.CallId as CallId
import qualified TD.Reply.CallProblem as CallProblem
import qualified TD.Reply.CallProtocol as CallProtocol
import qualified TD.Reply.CallServer as CallServer
import qualified TD.Reply.CallServerType as CallServerType
import qualified TD.Reply.CallState as CallState
import qualified TD.Reply.CallbackQueryAnswer as CallbackQueryAnswer
import qualified TD.Reply.CallbackQueryPayload as CallbackQueryPayload
import qualified TD.Reply.CanTransferOwnershipResult as CanTransferOwnershipResult
import qualified TD.Reply.Chat as Chat
import qualified TD.Reply.ChatAction as ChatAction
import qualified TD.Reply.ChatActionBar as ChatActionBar
import qualified TD.Reply.ChatAdministrator as ChatAdministrator
import qualified TD.Reply.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Reply.ChatAdministrators as ChatAdministrators
import qualified TD.Reply.ChatEvent as ChatEvent
import qualified TD.Reply.ChatEventAction as ChatEventAction
import qualified TD.Reply.ChatEventLogFilters as ChatEventLogFilters
import qualified TD.Reply.ChatEvents as ChatEvents
import qualified TD.Reply.ChatFilter as ChatFilter
import qualified TD.Reply.ChatFilterInfo as ChatFilterInfo
import qualified TD.Reply.ChatInviteLink as ChatInviteLink
import qualified TD.Reply.ChatInviteLinkCount as ChatInviteLinkCount
import qualified TD.Reply.ChatInviteLinkCounts as ChatInviteLinkCounts
import qualified TD.Reply.ChatInviteLinkInfo as ChatInviteLinkInfo
import qualified TD.Reply.ChatInviteLinkMember as ChatInviteLinkMember
import qualified TD.Reply.ChatInviteLinkMembers as ChatInviteLinkMembers
import qualified TD.Reply.ChatInviteLinks as ChatInviteLinks
import qualified TD.Reply.ChatJoinRequest as ChatJoinRequest
import qualified TD.Reply.ChatJoinRequests as ChatJoinRequests
import qualified TD.Reply.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Reply.ChatList as ChatList
import qualified TD.Reply.ChatLists as ChatLists
import qualified TD.Reply.ChatLocation as ChatLocation
import qualified TD.Reply.ChatMember as ChatMember
import qualified TD.Reply.ChatMemberStatus as ChatMemberStatus
import qualified TD.Reply.ChatMembers as ChatMembers
import qualified TD.Reply.ChatMembersFilter as ChatMembersFilter
import qualified TD.Reply.ChatNearby as ChatNearby
import qualified TD.Reply.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Reply.ChatPermissions as ChatPermissions
import qualified TD.Reply.ChatPhoto as ChatPhoto
import qualified TD.Reply.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Reply.ChatPhotos as ChatPhotos
import qualified TD.Reply.ChatPosition as ChatPosition
import qualified TD.Reply.ChatReportReason as ChatReportReason
import qualified TD.Reply.ChatSource as ChatSource
import qualified TD.Reply.ChatStatistics as ChatStatistics
import qualified TD.Reply.ChatStatisticsAdministratorActionsInfo as ChatStatisticsAdministratorActionsInfo
import qualified TD.Reply.ChatStatisticsInviterInfo as ChatStatisticsInviterInfo
import qualified TD.Reply.ChatStatisticsMessageInteractionInfo as ChatStatisticsMessageInteractionInfo
import qualified TD.Reply.ChatStatisticsMessageSenderInfo as ChatStatisticsMessageSenderInfo
import qualified TD.Reply.ChatTheme as ChatTheme
import qualified TD.Reply.ChatType as ChatType
import qualified TD.Reply.Chats as Chats
import qualified TD.Reply.ChatsNearby as ChatsNearby
import qualified TD.Reply.CheckChatUsernameResult as CheckChatUsernameResult
import qualified TD.Reply.CheckStickerSetNameResult as CheckStickerSetNameResult
import qualified TD.Reply.ClosedVectorPath as ClosedVectorPath
import qualified TD.Reply.ConnectedWebsite as ConnectedWebsite
import qualified TD.Reply.ConnectedWebsites as ConnectedWebsites
import qualified TD.Reply.ConnectionState as ConnectionState
import qualified TD.Reply.Contact as Contact
import qualified TD.Reply.Count as Count
import qualified TD.Reply.Countries as Countries
import qualified TD.Reply.CountryInfo as CountryInfo
import qualified TD.Reply.CustomRequestResult as CustomRequestResult
import qualified TD.Reply.DatabaseStatistics as DatabaseStatistics
import qualified TD.Reply.Date as Date
import qualified TD.Reply.DateRange as DateRange
import qualified TD.Reply.DatedFile as DatedFile
import qualified TD.Reply.DeepLinkInfo as DeepLinkInfo
import qualified TD.Reply.DeviceToken as DeviceToken
import qualified TD.Reply.DiceStickers as DiceStickers
import qualified TD.Reply.Document as Document
import qualified TD.Reply.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Reply.DraftMessage as DraftMessage
import qualified TD.Reply.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified TD.Reply.Emojis as Emojis
import qualified TD.Reply.EncryptedCredentials as EncryptedCredentials
import qualified TD.Reply.EncryptedPassportElement as EncryptedPassportElement
import qualified TD.Reply.Error as Error
import qualified TD.Reply.File as File
import qualified TD.Reply.FileDownload as FileDownload
import qualified TD.Reply.FilePart as FilePart
import qualified TD.Reply.FileType as FileType
import qualified TD.Reply.FormattedText as FormattedText
import qualified TD.Reply.FoundFileDownloads as FoundFileDownloads
import qualified TD.Reply.FoundMessages as FoundMessages
import qualified TD.Reply.Game as Game
import qualified TD.Reply.GameHighScore as GameHighScore
import qualified TD.Reply.GameHighScores as GameHighScores
import qualified TD.Reply.GroupCall as GroupCall
import qualified TD.Reply.GroupCallId as GroupCallId
import qualified TD.Reply.GroupCallParticipant as GroupCallParticipant
import qualified TD.Reply.GroupCallParticipantVideoInfo as GroupCallParticipantVideoInfo
import qualified TD.Reply.GroupCallRecentSpeaker as GroupCallRecentSpeaker
import qualified TD.Reply.GroupCallStream as GroupCallStream
import qualified TD.Reply.GroupCallStreams as GroupCallStreams
import qualified TD.Reply.GroupCallVideoQuality as GroupCallVideoQuality
import qualified TD.Reply.GroupCallVideoSourceGroup as GroupCallVideoSourceGroup
import qualified TD.Reply.Hashtags as Hashtags
import qualified TD.Reply.HttpUrl as HttpUrl
import qualified TD.Reply.IdentityDocument as IdentityDocument
import qualified TD.Reply.ImportedContacts as ImportedContacts
import qualified TD.Reply.InlineKeyboardButton as InlineKeyboardButton
import qualified TD.Reply.InlineKeyboardButtonType as InlineKeyboardButtonType
import qualified TD.Reply.InlineQueryResult as InlineQueryResult
import qualified TD.Reply.InlineQueryResults as InlineQueryResults
import qualified TD.Reply.InputBackground as InputBackground
import qualified TD.Reply.InputChatPhoto as InputChatPhoto
import qualified TD.Reply.InputCredentials as InputCredentials
import qualified TD.Reply.InputFile as InputFile
import qualified TD.Reply.InputIdentityDocument as InputIdentityDocument
import qualified TD.Reply.InputInlineQueryResult as InputInlineQueryResult
import qualified TD.Reply.InputMessageContent as InputMessageContent
import qualified TD.Reply.InputPassportElement as InputPassportElement
import qualified TD.Reply.InputPassportElementError as InputPassportElementError
import qualified TD.Reply.InputPassportElementErrorSource as InputPassportElementErrorSource
import qualified TD.Reply.InputPersonalDocument as InputPersonalDocument
import qualified TD.Reply.InputSticker as InputSticker
import qualified TD.Reply.InputThumbnail as InputThumbnail
import qualified TD.Reply.InternalLinkType as InternalLinkType
import qualified TD.Reply.Invoice as Invoice
import qualified TD.Reply.JsonObjectMember as JsonObjectMember
import qualified TD.Reply.JsonValue as JsonValue
import qualified TD.Reply.KeyboardButton as KeyboardButton
import qualified TD.Reply.KeyboardButtonType as KeyboardButtonType
import qualified TD.Reply.LabeledPricePart as LabeledPricePart
import qualified TD.Reply.LanguagePackInfo as LanguagePackInfo
import qualified TD.Reply.LanguagePackString as LanguagePackString
import qualified TD.Reply.LanguagePackStringValue as LanguagePackStringValue
import qualified TD.Reply.LanguagePackStrings as LanguagePackStrings
import qualified TD.Reply.LocalFile as LocalFile
import qualified TD.Reply.LocalizationTargetInfo as LocalizationTargetInfo
import qualified TD.Reply.Location as Location
import qualified TD.Reply.LogStream as LogStream
import qualified TD.Reply.LogTags as LogTags
import qualified TD.Reply.LogVerbosityLevel as LogVerbosityLevel
import qualified TD.Reply.LoginUrlInfo as LoginUrlInfo
import qualified TD.Reply.MaskPoint as MaskPoint
import qualified TD.Reply.MaskPosition as MaskPosition
import qualified TD.Reply.Message as Message
import qualified TD.Reply.MessageCalendar as MessageCalendar
import qualified TD.Reply.MessageCalendarDay as MessageCalendarDay
import qualified TD.Reply.MessageContent as MessageContent
import qualified TD.Reply.MessageCopyOptions as MessageCopyOptions
import qualified TD.Reply.MessageFileType as MessageFileType
import qualified TD.Reply.MessageForwardInfo as MessageForwardInfo
import qualified TD.Reply.MessageForwardOrigin as MessageForwardOrigin
import qualified TD.Reply.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Reply.MessageLink as MessageLink
import qualified TD.Reply.MessageLinkInfo as MessageLinkInfo
import qualified TD.Reply.MessagePosition as MessagePosition
import qualified TD.Reply.MessagePositions as MessagePositions
import qualified TD.Reply.MessageReaction as MessageReaction
import qualified TD.Reply.MessageReplyInfo as MessageReplyInfo
import qualified TD.Reply.MessageSchedulingState as MessageSchedulingState
import qualified TD.Reply.MessageSendOptions as MessageSendOptions
import qualified TD.Reply.MessageSender as MessageSender
import qualified TD.Reply.MessageSenders as MessageSenders
import qualified TD.Reply.MessageSendingState as MessageSendingState
import qualified TD.Reply.MessageStatistics as MessageStatistics
import qualified TD.Reply.MessageThreadInfo as MessageThreadInfo
import qualified TD.Reply.Messages as Messages
import qualified TD.Reply.Minithumbnail as Minithumbnail
import qualified TD.Reply.NetworkStatistics as NetworkStatistics
import qualified TD.Reply.NetworkStatisticsEntry as NetworkStatisticsEntry
import qualified TD.Reply.NetworkType as NetworkType
import qualified TD.Reply.Notification as Notification
import qualified TD.Reply.NotificationGroup as NotificationGroup
import qualified TD.Reply.NotificationGroupType as NotificationGroupType
import qualified TD.Reply.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Reply.NotificationSound as NotificationSound
import qualified TD.Reply.NotificationSounds as NotificationSounds
import qualified TD.Reply.NotificationType as NotificationType
import qualified TD.Reply.Ok as Ok
import qualified TD.Reply.OptionValue as OptionValue
import qualified TD.Reply.OrderInfo as OrderInfo
import qualified TD.Reply.PageBlock as PageBlock
import qualified TD.Reply.PageBlockCaption as PageBlockCaption
import qualified TD.Reply.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import qualified TD.Reply.PageBlockListItem as PageBlockListItem
import qualified TD.Reply.PageBlockRelatedArticle as PageBlockRelatedArticle
import qualified TD.Reply.PageBlockTableCell as PageBlockTableCell
import qualified TD.Reply.PageBlockVerticalAlignment as PageBlockVerticalAlignment
import qualified TD.Reply.PassportAuthorizationForm as PassportAuthorizationForm
import qualified TD.Reply.PassportElement as PassportElement
import qualified TD.Reply.PassportElementError as PassportElementError
import qualified TD.Reply.PassportElementErrorSource as PassportElementErrorSource
import qualified TD.Reply.PassportElementType as PassportElementType
import qualified TD.Reply.PassportElements as PassportElements
import qualified TD.Reply.PassportElementsWithErrors as PassportElementsWithErrors
import qualified TD.Reply.PassportRequiredElement as PassportRequiredElement
import qualified TD.Reply.PassportSuitableElement as PassportSuitableElement
import qualified TD.Reply.PasswordState as PasswordState
import qualified TD.Reply.PaymentForm as PaymentForm
import qualified TD.Reply.PaymentReceipt as PaymentReceipt
import qualified TD.Reply.PaymentResult as PaymentResult
import qualified TD.Reply.PaymentsProviderStripe as PaymentsProviderStripe
import qualified TD.Reply.PersonalDetails as PersonalDetails
import qualified TD.Reply.PersonalDocument as PersonalDocument
import qualified TD.Reply.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified TD.Reply.PhoneNumberInfo as PhoneNumberInfo
import qualified TD.Reply.Photo as Photo
import qualified TD.Reply.PhotoSize as PhotoSize
import qualified TD.Reply.Point as Point
import qualified TD.Reply.Poll as Poll
import qualified TD.Reply.PollOption as PollOption
import qualified TD.Reply.PollType as PollType
import qualified TD.Reply.ProfilePhoto as ProfilePhoto
import qualified TD.Reply.Proxies as Proxies
import qualified TD.Reply.Proxy as Proxy
import qualified TD.Reply.ProxyType as ProxyType
import qualified TD.Reply.PublicChatType as PublicChatType
import qualified TD.Reply.PushMessageContent as PushMessageContent
import qualified TD.Reply.PushReceiverId as PushReceiverId
import qualified TD.Reply.Reaction as Reaction
import qualified TD.Reply.RecommendedChatFilter as RecommendedChatFilter
import qualified TD.Reply.RecommendedChatFilters as RecommendedChatFilters
import qualified TD.Reply.RecoveryEmailAddress as RecoveryEmailAddress
import qualified TD.Reply.RemoteFile as RemoteFile
import qualified TD.Reply.ReplyMarkup as ReplyMarkup
import qualified TD.Reply.ResetPasswordResult as ResetPasswordResult
import qualified TD.Reply.RichText as RichText
import qualified TD.Reply.RtmpUrl as RtmpUrl
import qualified TD.Reply.SavedCredentials as SavedCredentials
import qualified TD.Reply.ScopeNotificationSettings as ScopeNotificationSettings
import qualified TD.Reply.SearchMessagesFilter as SearchMessagesFilter
import qualified TD.Reply.Seconds as Seconds
import qualified TD.Reply.SecretChat as SecretChat
import qualified TD.Reply.SecretChatState as SecretChatState
import qualified TD.Reply.SentWebAppMessage as SentWebAppMessage
import qualified TD.Reply.Session as Session
import qualified TD.Reply.SessionType as SessionType
import qualified TD.Reply.Sessions as Sessions
import qualified TD.Reply.ShippingOption as ShippingOption
import qualified TD.Reply.SponsoredMessage as SponsoredMessage
import qualified TD.Reply.StatisticalGraph as StatisticalGraph
import qualified TD.Reply.StatisticalValue as StatisticalValue
import qualified TD.Reply.Sticker as Sticker
import qualified TD.Reply.StickerSet as StickerSet
import qualified TD.Reply.StickerSetInfo as StickerSetInfo
import qualified TD.Reply.StickerSets as StickerSets
import qualified TD.Reply.StickerType as StickerType
import qualified TD.Reply.Stickers as Stickers
import qualified TD.Reply.StorageStatistics as StorageStatistics
import qualified TD.Reply.StorageStatisticsByChat as StorageStatisticsByChat
import qualified TD.Reply.StorageStatisticsByFileType as StorageStatisticsByFileType
import qualified TD.Reply.StorageStatisticsFast as StorageStatisticsFast
import qualified TD.Reply.SuggestedAction as SuggestedAction
import qualified TD.Reply.Supergroup as Supergroup
import qualified TD.Reply.SupergroupFullInfo as SupergroupFullInfo
import qualified TD.Reply.SupergroupMembersFilter as SupergroupMembersFilter
import qualified TD.Reply.TMeUrl as TMeUrl
import qualified TD.Reply.TMeUrlType as TMeUrlType
import qualified TD.Reply.TMeUrls as TMeUrls
import qualified TD.Reply.TdlibParameters as TdlibParameters
import qualified TD.Reply.TemporaryPasswordState as TemporaryPasswordState
import qualified TD.Reply.TermsOfService as TermsOfService
import qualified TD.Reply.TestBytes as TestBytes
import qualified TD.Reply.TestInt as TestInt
import qualified TD.Reply.TestString as TestString
import qualified TD.Reply.TestVectorInt as TestVectorInt
import qualified TD.Reply.TestVectorIntObject as TestVectorIntObject
import qualified TD.Reply.TestVectorString as TestVectorString
import qualified TD.Reply.TestVectorStringObject as TestVectorStringObject
import qualified TD.Reply.Text as Text
import qualified TD.Reply.TextEntities as TextEntities
import qualified TD.Reply.TextEntity as TextEntity
import qualified TD.Reply.TextEntityType as TextEntityType
import qualified TD.Reply.TextParseMode as TextParseMode
import qualified TD.Reply.ThemeParameters as ThemeParameters
import qualified TD.Reply.ThemeSettings as ThemeSettings
import qualified TD.Reply.Thumbnail as Thumbnail
import qualified TD.Reply.ThumbnailFormat as ThumbnailFormat
import qualified TD.Reply.TopChatCategory as TopChatCategory
import qualified TD.Reply.UnreadReaction as UnreadReaction
import qualified TD.Reply.Update as Update
import qualified TD.Reply.Updates as Updates
import qualified TD.Reply.User as User
import qualified TD.Reply.UserFullInfo as UserFullInfo
import qualified TD.Reply.UserPrivacySetting as UserPrivacySetting
import qualified TD.Reply.UserPrivacySettingRule as UserPrivacySettingRule
import qualified TD.Reply.UserPrivacySettingRules as UserPrivacySettingRules
import qualified TD.Reply.UserStatus as UserStatus
import qualified TD.Reply.UserType as UserType
import qualified TD.Reply.Users as Users
import qualified TD.Reply.ValidatedOrderInfo as ValidatedOrderInfo
import qualified TD.Reply.VectorPathCommand as VectorPathCommand
import qualified TD.Reply.Venue as Venue
import qualified TD.Reply.Video as Video
import qualified TD.Reply.VideoChat as VideoChat
import qualified TD.Reply.VideoNote as VideoNote
import qualified TD.Reply.VoiceNote as VoiceNote
import qualified TD.Reply.WebAppInfo as WebAppInfo
import qualified TD.Reply.WebPage as WebPage
import qualified TD.Reply.WebPageInstantView as WebPageInstantView

data GeneralResult
  = Error Error.Error
  | Ok Ok.Ok
  | TdlibParameters TdlibParameters.TdlibParameters
  | AuthenticationCodeType AuthenticationCodeType.AuthenticationCodeType
  | AuthenticationCodeInfo AuthenticationCodeInfo.AuthenticationCodeInfo
  | EmailAddressAuthenticationCodeInfo EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo
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
  | MessageForwardOrigin MessageForwardOrigin.MessageForwardOrigin
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
  | PaymentsProviderStripe PaymentsProviderStripe.PaymentsProviderStripe
  | PaymentForm PaymentForm.PaymentForm
  | ValidatedOrderInfo ValidatedOrderInfo.ValidatedOrderInfo
  | PaymentResult PaymentResult.PaymentResult
  | PaymentReceipt PaymentReceipt.PaymentReceipt
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
  | AvailableReactions AvailableReactions.AvailableReactions
  | Reaction Reaction.Reaction
  | Animations Animations.Animations
  | DiceStickers DiceStickers.DiceStickers
  | ImportedContacts ImportedContacts.ImportedContacts
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
      _ -> fail ""
    where
      e :: Maybe String
      e = case T.parse (\o -> o A..:? "@extra" :: T.Parser (Maybe String)) obj of
        T.Success r -> r
        _ -> Nothing

instance T.FromJSON GeneralResult where
  parseJSON v@(T.Object obj) = do
    mconcat t
    where
      t =
        [ case (T.fromJSON v :: T.Result Error.Error) of
            T.Success a -> return $ Error a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Ok.Ok) of
            T.Success a -> return $ Ok a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TdlibParameters.TdlibParameters) of
            T.Success a -> return $ TdlibParameters a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AuthenticationCodeType.AuthenticationCodeType) of
            T.Success a -> return $ AuthenticationCodeType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AuthenticationCodeInfo.AuthenticationCodeInfo) of
            T.Success a -> return $ AuthenticationCodeInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo) of
            T.Success a -> return $ EmailAddressAuthenticationCodeInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TextEntity.TextEntity) of
            T.Success a -> return $ TextEntity a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TextEntities.TextEntities) of
            T.Success a -> return $ TextEntities a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FormattedText.FormattedText) of
            T.Success a -> return $ FormattedText a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TermsOfService.TermsOfService) of
            T.Success a -> return $ TermsOfService a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AuthorizationState.AuthorizationState) of
            T.Success a -> return $ AuthorizationState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PasswordState.PasswordState) of
            T.Success a -> return $ PasswordState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RecoveryEmailAddress.RecoveryEmailAddress) of
            T.Success a -> return $ RecoveryEmailAddress a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TemporaryPasswordState.TemporaryPasswordState) of
            T.Success a -> return $ TemporaryPasswordState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LocalFile.LocalFile) of
            T.Success a -> return $ LocalFile a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RemoteFile.RemoteFile) of
            T.Success a -> return $ RemoteFile a
            _ -> fail "",
          case (T.fromJSON v :: T.Result File.File) of
            T.Success a -> return $ File a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputFile.InputFile) of
            T.Success a -> return $ InputFile a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PhotoSize.PhotoSize) of
            T.Success a -> return $ PhotoSize a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Minithumbnail.Minithumbnail) of
            T.Success a -> return $ Minithumbnail a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ThumbnailFormat.ThumbnailFormat) of
            T.Success a -> return $ ThumbnailFormat a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Thumbnail.Thumbnail) of
            T.Success a -> return $ Thumbnail a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MaskPoint.MaskPoint) of
            T.Success a -> return $ MaskPoint a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MaskPosition.MaskPosition) of
            T.Success a -> return $ MaskPosition a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StickerType.StickerType) of
            T.Success a -> return $ StickerType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ClosedVectorPath.ClosedVectorPath) of
            T.Success a -> return $ ClosedVectorPath a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PollOption.PollOption) of
            T.Success a -> return $ PollOption a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PollType.PollType) of
            T.Success a -> return $ PollType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Animation.Animation) of
            T.Success a -> return $ Animation a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Audio.Audio) of
            T.Success a -> return $ Audio a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Document.Document) of
            T.Success a -> return $ Document a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Photo.Photo) of
            T.Success a -> return $ Photo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Sticker.Sticker) of
            T.Success a -> return $ Sticker a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Video.Video) of
            T.Success a -> return $ Video a
            _ -> fail "",
          case (T.fromJSON v :: T.Result VideoNote.VideoNote) of
            T.Success a -> return $ VideoNote a
            _ -> fail "",
          case (T.fromJSON v :: T.Result VoiceNote.VoiceNote) of
            T.Success a -> return $ VoiceNote a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AnimatedEmoji.AnimatedEmoji) of
            T.Success a -> return $ AnimatedEmoji a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Contact.Contact) of
            T.Success a -> return $ Contact a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Location.Location) of
            T.Success a -> return $ Location a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Venue.Venue) of
            T.Success a -> return $ Venue a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Game.Game) of
            T.Success a -> return $ Game a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Poll.Poll) of
            T.Success a -> return $ Poll a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ProfilePhoto.ProfilePhoto) of
            T.Success a -> return $ ProfilePhoto a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatPhotoInfo.ChatPhotoInfo) of
            T.Success a -> return $ ChatPhotoInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserType.UserType) of
            T.Success a -> return $ UserType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BotCommand.BotCommand) of
            T.Success a -> return $ BotCommand a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BotCommands.BotCommands) of
            T.Success a -> return $ BotCommands a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BotMenuButton.BotMenuButton) of
            T.Success a -> return $ BotMenuButton a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatLocation.ChatLocation) of
            T.Success a -> return $ ChatLocation a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AnimatedChatPhoto.AnimatedChatPhoto) of
            T.Success a -> return $ AnimatedChatPhoto a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatPhoto.ChatPhoto) of
            T.Success a -> return $ ChatPhoto a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatPhotos.ChatPhotos) of
            T.Success a -> return $ ChatPhotos a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputChatPhoto.InputChatPhoto) of
            T.Success a -> return $ InputChatPhoto a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatPermissions.ChatPermissions) of
            T.Success a -> return $ ChatPermissions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatAdministratorRights.ChatAdministratorRights) of
            T.Success a -> return $ ChatAdministratorRights a
            _ -> fail "",
          case (T.fromJSON v :: T.Result User.User) of
            T.Success a -> return $ User a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BotInfo.BotInfo) of
            T.Success a -> return $ BotInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserFullInfo.UserFullInfo) of
            T.Success a -> return $ UserFullInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Users.Users) of
            T.Success a -> return $ Users a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatAdministrator.ChatAdministrator) of
            T.Success a -> return $ ChatAdministrator a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatAdministrators.ChatAdministrators) of
            T.Success a -> return $ ChatAdministrators a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatMemberStatus.ChatMemberStatus) of
            T.Success a -> return $ ChatMemberStatus a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatMember.ChatMember) of
            T.Success a -> return $ ChatMember a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatMembers.ChatMembers) of
            T.Success a -> return $ ChatMembers a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatMembersFilter.ChatMembersFilter) of
            T.Success a -> return $ ChatMembersFilter a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SupergroupMembersFilter.SupergroupMembersFilter) of
            T.Success a -> return $ SupergroupMembersFilter a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLink.ChatInviteLink) of
            T.Success a -> return $ ChatInviteLink a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinks.ChatInviteLinks) of
            T.Success a -> return $ ChatInviteLinks a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinkCount.ChatInviteLinkCount) of
            T.Success a -> return $ ChatInviteLinkCount a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinkCounts.ChatInviteLinkCounts) of
            T.Success a -> return $ ChatInviteLinkCounts a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinkMember.ChatInviteLinkMember) of
            T.Success a -> return $ ChatInviteLinkMember a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinkMembers.ChatInviteLinkMembers) of
            T.Success a -> return $ ChatInviteLinkMembers a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatInviteLinkInfo.ChatInviteLinkInfo) of
            T.Success a -> return $ ChatInviteLinkInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatJoinRequest.ChatJoinRequest) of
            T.Success a -> return $ ChatJoinRequest a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatJoinRequests.ChatJoinRequests) of
            T.Success a -> return $ ChatJoinRequests a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatJoinRequestsInfo.ChatJoinRequestsInfo) of
            T.Success a -> return $ ChatJoinRequestsInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BasicGroup.BasicGroup) of
            T.Success a -> return $ BasicGroup a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BasicGroupFullInfo.BasicGroupFullInfo) of
            T.Success a -> return $ BasicGroupFullInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Supergroup.Supergroup) of
            T.Success a -> return $ Supergroup a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SupergroupFullInfo.SupergroupFullInfo) of
            T.Success a -> return $ SupergroupFullInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SecretChatState.SecretChatState) of
            T.Success a -> return $ SecretChatState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SecretChat.SecretChat) of
            T.Success a -> return $ SecretChat a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageSender.MessageSender) of
            T.Success a -> return $ MessageSender a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageSenders.MessageSenders) of
            T.Success a -> return $ MessageSenders a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageForwardOrigin.MessageForwardOrigin) of
            T.Success a -> return $ MessageForwardOrigin a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageForwardInfo.MessageForwardInfo) of
            T.Success a -> return $ MessageForwardInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageReplyInfo.MessageReplyInfo) of
            T.Success a -> return $ MessageReplyInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageReaction.MessageReaction) of
            T.Success a -> return $ MessageReaction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageInteractionInfo.MessageInteractionInfo) of
            T.Success a -> return $ MessageInteractionInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UnreadReaction.UnreadReaction) of
            T.Success a -> return $ UnreadReaction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageSendingState.MessageSendingState) of
            T.Success a -> return $ MessageSendingState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Message.Message) of
            T.Success a -> return $ Message a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Messages.Messages) of
            T.Success a -> return $ Messages a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FoundMessages.FoundMessages) of
            T.Success a -> return $ FoundMessages a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessagePosition.MessagePosition) of
            T.Success a -> return $ MessagePosition a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessagePositions.MessagePositions) of
            T.Success a -> return $ MessagePositions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageCalendarDay.MessageCalendarDay) of
            T.Success a -> return $ MessageCalendarDay a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageCalendar.MessageCalendar) of
            T.Success a -> return $ MessageCalendar a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SponsoredMessage.SponsoredMessage) of
            T.Success a -> return $ SponsoredMessage a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FileDownload.FileDownload) of
            T.Success a -> return $ FileDownload a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DownloadedFileCounts.DownloadedFileCounts) of
            T.Success a -> return $ DownloadedFileCounts a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FoundFileDownloads.FoundFileDownloads) of
            T.Success a -> return $ FoundFileDownloads a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationSettingsScope.NotificationSettingsScope) of
            T.Success a -> return $ NotificationSettingsScope a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatNotificationSettings.ChatNotificationSettings) of
            T.Success a -> return $ ChatNotificationSettings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ScopeNotificationSettings.ScopeNotificationSettings) of
            T.Success a -> return $ ScopeNotificationSettings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DraftMessage.DraftMessage) of
            T.Success a -> return $ DraftMessage a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatType.ChatType) of
            T.Success a -> return $ ChatType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatFilter.ChatFilter) of
            T.Success a -> return $ ChatFilter a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatFilterInfo.ChatFilterInfo) of
            T.Success a -> return $ ChatFilterInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RecommendedChatFilter.RecommendedChatFilter) of
            T.Success a -> return $ RecommendedChatFilter a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RecommendedChatFilters.RecommendedChatFilters) of
            T.Success a -> return $ RecommendedChatFilters a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatList.ChatList) of
            T.Success a -> return $ ChatList a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatLists.ChatLists) of
            T.Success a -> return $ ChatLists a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatSource.ChatSource) of
            T.Success a -> return $ ChatSource a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatPosition.ChatPosition) of
            T.Success a -> return $ ChatPosition a
            _ -> fail "",
          case (T.fromJSON v :: T.Result VideoChat.VideoChat) of
            T.Success a -> return $ VideoChat a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Chat.Chat) of
            T.Success a -> return $ Chat a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Chats.Chats) of
            T.Success a -> return $ Chats a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatNearby.ChatNearby) of
            T.Success a -> return $ ChatNearby a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatsNearby.ChatsNearby) of
            T.Success a -> return $ ChatsNearby a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PublicChatType.PublicChatType) of
            T.Success a -> return $ PublicChatType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatActionBar.ChatActionBar) of
            T.Success a -> return $ ChatActionBar a
            _ -> fail "",
          case (T.fromJSON v :: T.Result KeyboardButtonType.KeyboardButtonType) of
            T.Success a -> return $ KeyboardButtonType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result KeyboardButton.KeyboardButton) of
            T.Success a -> return $ KeyboardButton a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InlineKeyboardButtonType.InlineKeyboardButtonType) of
            T.Success a -> return $ InlineKeyboardButtonType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InlineKeyboardButton.InlineKeyboardButton) of
            T.Success a -> return $ InlineKeyboardButton a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ReplyMarkup.ReplyMarkup) of
            T.Success a -> return $ ReplyMarkup a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LoginUrlInfo.LoginUrlInfo) of
            T.Success a -> return $ LoginUrlInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result WebAppInfo.WebAppInfo) of
            T.Success a -> return $ WebAppInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageThreadInfo.MessageThreadInfo) of
            T.Success a -> return $ MessageThreadInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RichText.RichText) of
            T.Success a -> return $ RichText a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockCaption.PageBlockCaption) of
            T.Success a -> return $ PageBlockCaption a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockListItem.PageBlockListItem) of
            T.Success a -> return $ PageBlockListItem a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockHorizontalAlignment.PageBlockHorizontalAlignment) of
            T.Success a -> return $ PageBlockHorizontalAlignment a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockVerticalAlignment.PageBlockVerticalAlignment) of
            T.Success a -> return $ PageBlockVerticalAlignment a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockTableCell.PageBlockTableCell) of
            T.Success a -> return $ PageBlockTableCell a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlockRelatedArticle.PageBlockRelatedArticle) of
            T.Success a -> return $ PageBlockRelatedArticle a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PageBlock.PageBlock) of
            T.Success a -> return $ PageBlock a
            _ -> fail "",
          case (T.fromJSON v :: T.Result WebPageInstantView.WebPageInstantView) of
            T.Success a -> return $ WebPageInstantView a
            _ -> fail "",
          case (T.fromJSON v :: T.Result WebPage.WebPage) of
            T.Success a -> return $ WebPage a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CountryInfo.CountryInfo) of
            T.Success a -> return $ CountryInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Countries.Countries) of
            T.Success a -> return $ Countries a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PhoneNumberInfo.PhoneNumberInfo) of
            T.Success a -> return $ PhoneNumberInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BankCardActionOpenUrl.BankCardActionOpenUrl) of
            T.Success a -> return $ BankCardActionOpenUrl a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BankCardInfo.BankCardInfo) of
            T.Success a -> return $ BankCardInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Address.Address) of
            T.Success a -> return $ Address a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ThemeParameters.ThemeParameters) of
            T.Success a -> return $ ThemeParameters a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LabeledPricePart.LabeledPricePart) of
            T.Success a -> return $ LabeledPricePart a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Invoice.Invoice) of
            T.Success a -> return $ Invoice a
            _ -> fail "",
          case (T.fromJSON v :: T.Result OrderInfo.OrderInfo) of
            T.Success a -> return $ OrderInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ShippingOption.ShippingOption) of
            T.Success a -> return $ ShippingOption a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SavedCredentials.SavedCredentials) of
            T.Success a -> return $ SavedCredentials a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputCredentials.InputCredentials) of
            T.Success a -> return $ InputCredentials a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PaymentsProviderStripe.PaymentsProviderStripe) of
            T.Success a -> return $ PaymentsProviderStripe a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PaymentForm.PaymentForm) of
            T.Success a -> return $ PaymentForm a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ValidatedOrderInfo.ValidatedOrderInfo) of
            T.Success a -> return $ ValidatedOrderInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PaymentResult.PaymentResult) of
            T.Success a -> return $ PaymentResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PaymentReceipt.PaymentReceipt) of
            T.Success a -> return $ PaymentReceipt a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DatedFile.DatedFile) of
            T.Success a -> return $ DatedFile a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElementType.PassportElementType) of
            T.Success a -> return $ PassportElementType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Date.Date) of
            T.Success a -> return $ Date a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PersonalDetails.PersonalDetails) of
            T.Success a -> return $ PersonalDetails a
            _ -> fail "",
          case (T.fromJSON v :: T.Result IdentityDocument.IdentityDocument) of
            T.Success a -> return $ IdentityDocument a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputIdentityDocument.InputIdentityDocument) of
            T.Success a -> return $ InputIdentityDocument a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PersonalDocument.PersonalDocument) of
            T.Success a -> return $ PersonalDocument a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputPersonalDocument.InputPersonalDocument) of
            T.Success a -> return $ InputPersonalDocument a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElement.PassportElement) of
            T.Success a -> return $ PassportElement a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputPassportElement.InputPassportElement) of
            T.Success a -> return $ InputPassportElement a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElements.PassportElements) of
            T.Success a -> return $ PassportElements a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElementErrorSource.PassportElementErrorSource) of
            T.Success a -> return $ PassportElementErrorSource a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElementError.PassportElementError) of
            T.Success a -> return $ PassportElementError a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportSuitableElement.PassportSuitableElement) of
            T.Success a -> return $ PassportSuitableElement a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportRequiredElement.PassportRequiredElement) of
            T.Success a -> return $ PassportRequiredElement a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportAuthorizationForm.PassportAuthorizationForm) of
            T.Success a -> return $ PassportAuthorizationForm a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PassportElementsWithErrors.PassportElementsWithErrors) of
            T.Success a -> return $ PassportElementsWithErrors a
            _ -> fail "",
          case (T.fromJSON v :: T.Result EncryptedCredentials.EncryptedCredentials) of
            T.Success a -> return $ EncryptedCredentials a
            _ -> fail "",
          case (T.fromJSON v :: T.Result EncryptedPassportElement.EncryptedPassportElement) of
            T.Success a -> return $ EncryptedPassportElement a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputPassportElementErrorSource.InputPassportElementErrorSource) of
            T.Success a -> return $ InputPassportElementErrorSource a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputPassportElementError.InputPassportElementError) of
            T.Success a -> return $ InputPassportElementError a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageContent.MessageContent) of
            T.Success a -> return $ MessageContent a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TextEntityType.TextEntityType) of
            T.Success a -> return $ TextEntityType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputThumbnail.InputThumbnail) of
            T.Success a -> return $ InputThumbnail a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageSchedulingState.MessageSchedulingState) of
            T.Success a -> return $ MessageSchedulingState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageSendOptions.MessageSendOptions) of
            T.Success a -> return $ MessageSendOptions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageCopyOptions.MessageCopyOptions) of
            T.Success a -> return $ MessageCopyOptions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputMessageContent.InputMessageContent) of
            T.Success a -> return $ InputMessageContent a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SearchMessagesFilter.SearchMessagesFilter) of
            T.Success a -> return $ SearchMessagesFilter a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatAction.ChatAction) of
            T.Success a -> return $ ChatAction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserStatus.UserStatus) of
            T.Success a -> return $ UserStatus a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Stickers.Stickers) of
            T.Success a -> return $ Stickers a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Emojis.Emojis) of
            T.Success a -> return $ Emojis a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StickerSet.StickerSet) of
            T.Success a -> return $ StickerSet a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StickerSetInfo.StickerSetInfo) of
            T.Success a -> return $ StickerSetInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StickerSets.StickerSets) of
            T.Success a -> return $ StickerSets a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallDiscardReason.CallDiscardReason) of
            T.Success a -> return $ CallDiscardReason a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallProtocol.CallProtocol) of
            T.Success a -> return $ CallProtocol a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallServerType.CallServerType) of
            T.Success a -> return $ CallServerType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallServer.CallServer) of
            T.Success a -> return $ CallServer a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallId.CallId) of
            T.Success a -> return $ CallId a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallId.GroupCallId) of
            T.Success a -> return $ GroupCallId a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallState.CallState) of
            T.Success a -> return $ CallState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallVideoQuality.GroupCallVideoQuality) of
            T.Success a -> return $ GroupCallVideoQuality a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallStream.GroupCallStream) of
            T.Success a -> return $ GroupCallStream a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallStreams.GroupCallStreams) of
            T.Success a -> return $ GroupCallStreams a
            _ -> fail "",
          case (T.fromJSON v :: T.Result RtmpUrl.RtmpUrl) of
            T.Success a -> return $ RtmpUrl a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallRecentSpeaker.GroupCallRecentSpeaker) of
            T.Success a -> return $ GroupCallRecentSpeaker a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCall.GroupCall) of
            T.Success a -> return $ GroupCall a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallVideoSourceGroup.GroupCallVideoSourceGroup) of
            T.Success a -> return $ GroupCallVideoSourceGroup a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo) of
            T.Success a -> return $ GroupCallParticipantVideoInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GroupCallParticipant.GroupCallParticipant) of
            T.Success a -> return $ GroupCallParticipant a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallProblem.CallProblem) of
            T.Success a -> return $ CallProblem a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Call.Call) of
            T.Success a -> return $ Call a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings) of
            T.Success a -> return $ PhoneNumberAuthenticationSettings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AddedReaction.AddedReaction) of
            T.Success a -> return $ AddedReaction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AddedReactions.AddedReactions) of
            T.Success a -> return $ AddedReactions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AvailableReactions.AvailableReactions) of
            T.Success a -> return $ AvailableReactions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Reaction.Reaction) of
            T.Success a -> return $ Reaction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Animations.Animations) of
            T.Success a -> return $ Animations a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DiceStickers.DiceStickers) of
            T.Success a -> return $ DiceStickers a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ImportedContacts.ImportedContacts) of
            T.Success a -> return $ ImportedContacts a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AttachmentMenuBotColor.AttachmentMenuBotColor) of
            T.Success a -> return $ AttachmentMenuBotColor a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AttachmentMenuBot.AttachmentMenuBot) of
            T.Success a -> return $ AttachmentMenuBot a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SentWebAppMessage.SentWebAppMessage) of
            T.Success a -> return $ SentWebAppMessage a
            _ -> fail "",
          case (T.fromJSON v :: T.Result HttpUrl.HttpUrl) of
            T.Success a -> return $ HttpUrl a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputInlineQueryResult.InputInlineQueryResult) of
            T.Success a -> return $ InputInlineQueryResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InlineQueryResult.InlineQueryResult) of
            T.Success a -> return $ InlineQueryResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InlineQueryResults.InlineQueryResults) of
            T.Success a -> return $ InlineQueryResults a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallbackQueryPayload.CallbackQueryPayload) of
            T.Success a -> return $ CallbackQueryPayload a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CallbackQueryAnswer.CallbackQueryAnswer) of
            T.Success a -> return $ CallbackQueryAnswer a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CustomRequestResult.CustomRequestResult) of
            T.Success a -> return $ CustomRequestResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GameHighScore.GameHighScore) of
            T.Success a -> return $ GameHighScore a
            _ -> fail "",
          case (T.fromJSON v :: T.Result GameHighScores.GameHighScores) of
            T.Success a -> return $ GameHighScores a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatEventAction.ChatEventAction) of
            T.Success a -> return $ ChatEventAction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatEvent.ChatEvent) of
            T.Success a -> return $ ChatEvent a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatEvents.ChatEvents) of
            T.Success a -> return $ ChatEvents a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatEventLogFilters.ChatEventLogFilters) of
            T.Success a -> return $ ChatEventLogFilters a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LanguagePackStringValue.LanguagePackStringValue) of
            T.Success a -> return $ LanguagePackStringValue a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LanguagePackString.LanguagePackString) of
            T.Success a -> return $ LanguagePackString a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LanguagePackStrings.LanguagePackStrings) of
            T.Success a -> return $ LanguagePackStrings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LanguagePackInfo.LanguagePackInfo) of
            T.Success a -> return $ LanguagePackInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LocalizationTargetInfo.LocalizationTargetInfo) of
            T.Success a -> return $ LocalizationTargetInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DeviceToken.DeviceToken) of
            T.Success a -> return $ DeviceToken a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PushReceiverId.PushReceiverId) of
            T.Success a -> return $ PushReceiverId a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BackgroundFill.BackgroundFill) of
            T.Success a -> return $ BackgroundFill a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BackgroundType.BackgroundType) of
            T.Success a -> return $ BackgroundType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Background.Background) of
            T.Success a -> return $ Background a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Backgrounds.Backgrounds) of
            T.Success a -> return $ Backgrounds a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputBackground.InputBackground) of
            T.Success a -> return $ InputBackground a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ThemeSettings.ThemeSettings) of
            T.Success a -> return $ ThemeSettings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatTheme.ChatTheme) of
            T.Success a -> return $ ChatTheme a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Hashtags.Hashtags) of
            T.Success a -> return $ Hashtags a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CanTransferOwnershipResult.CanTransferOwnershipResult) of
            T.Success a -> return $ CanTransferOwnershipResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CheckChatUsernameResult.CheckChatUsernameResult) of
            T.Success a -> return $ CheckChatUsernameResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result CheckStickerSetNameResult.CheckStickerSetNameResult) of
            T.Success a -> return $ CheckStickerSetNameResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ResetPasswordResult.ResetPasswordResult) of
            T.Success a -> return $ ResetPasswordResult a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageFileType.MessageFileType) of
            T.Success a -> return $ MessageFileType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result PushMessageContent.PushMessageContent) of
            T.Success a -> return $ PushMessageContent a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationType.NotificationType) of
            T.Success a -> return $ NotificationType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationGroupType.NotificationGroupType) of
            T.Success a -> return $ NotificationGroupType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationSound.NotificationSound) of
            T.Success a -> return $ NotificationSound a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationSounds.NotificationSounds) of
            T.Success a -> return $ NotificationSounds a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Notification.Notification) of
            T.Success a -> return $ Notification a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NotificationGroup.NotificationGroup) of
            T.Success a -> return $ NotificationGroup a
            _ -> fail "",
          case (T.fromJSON v :: T.Result OptionValue.OptionValue) of
            T.Success a -> return $ OptionValue a
            _ -> fail "",
          case (T.fromJSON v :: T.Result JsonObjectMember.JsonObjectMember) of
            T.Success a -> return $ JsonObjectMember a
            _ -> fail "",
          case (T.fromJSON v :: T.Result JsonValue.JsonValue) of
            T.Success a -> return $ JsonValue a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserPrivacySettingRule.UserPrivacySettingRule) of
            T.Success a -> return $ UserPrivacySettingRule a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserPrivacySettingRules.UserPrivacySettingRules) of
            T.Success a -> return $ UserPrivacySettingRules a
            _ -> fail "",
          case (T.fromJSON v :: T.Result UserPrivacySetting.UserPrivacySetting) of
            T.Success a -> return $ UserPrivacySetting a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AccountTtl.AccountTtl) of
            T.Success a -> return $ AccountTtl a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SessionType.SessionType) of
            T.Success a -> return $ SessionType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Session.Session) of
            T.Success a -> return $ Session a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Sessions.Sessions) of
            T.Success a -> return $ Sessions a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ConnectedWebsite.ConnectedWebsite) of
            T.Success a -> return $ ConnectedWebsite a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ConnectedWebsites.ConnectedWebsites) of
            T.Success a -> return $ ConnectedWebsites a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatReportReason.ChatReportReason) of
            T.Success a -> return $ ChatReportReason a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InternalLinkType.InternalLinkType) of
            T.Success a -> return $ InternalLinkType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageLink.MessageLink) of
            T.Success a -> return $ MessageLink a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageLinkInfo.MessageLinkInfo) of
            T.Success a -> return $ MessageLinkInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FilePart.FilePart) of
            T.Success a -> return $ FilePart a
            _ -> fail "",
          case (T.fromJSON v :: T.Result FileType.FileType) of
            T.Success a -> return $ FileType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StorageStatisticsByFileType.StorageStatisticsByFileType) of
            T.Success a -> return $ StorageStatisticsByFileType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StorageStatisticsByChat.StorageStatisticsByChat) of
            T.Success a -> return $ StorageStatisticsByChat a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StorageStatistics.StorageStatistics) of
            T.Success a -> return $ StorageStatistics a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StorageStatisticsFast.StorageStatisticsFast) of
            T.Success a -> return $ StorageStatisticsFast a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DatabaseStatistics.DatabaseStatistics) of
            T.Success a -> return $ DatabaseStatistics a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NetworkType.NetworkType) of
            T.Success a -> return $ NetworkType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NetworkStatisticsEntry.NetworkStatisticsEntry) of
            T.Success a -> return $ NetworkStatisticsEntry a
            _ -> fail "",
          case (T.fromJSON v :: T.Result NetworkStatistics.NetworkStatistics) of
            T.Success a -> return $ NetworkStatistics a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AutoDownloadSettings.AutoDownloadSettings) of
            T.Success a -> return $ AutoDownloadSettings a
            _ -> fail "",
          case (T.fromJSON v :: T.Result AutoDownloadSettingsPresets.AutoDownloadSettingsPresets) of
            T.Success a -> return $ AutoDownloadSettingsPresets a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ConnectionState.ConnectionState) of
            T.Success a -> return $ ConnectionState a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TopChatCategory.TopChatCategory) of
            T.Success a -> return $ TopChatCategory a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TMeUrlType.TMeUrlType) of
            T.Success a -> return $ TMeUrlType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TMeUrl.TMeUrl) of
            T.Success a -> return $ TMeUrl a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TMeUrls.TMeUrls) of
            T.Success a -> return $ TMeUrls a
            _ -> fail "",
          case (T.fromJSON v :: T.Result SuggestedAction.SuggestedAction) of
            T.Success a -> return $ SuggestedAction a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Count.Count) of
            T.Success a -> return $ Count a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Text.Text) of
            T.Success a -> return $ Text a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Seconds.Seconds) of
            T.Success a -> return $ Seconds a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DeepLinkInfo.DeepLinkInfo) of
            T.Success a -> return $ DeepLinkInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TextParseMode.TextParseMode) of
            T.Success a -> return $ TextParseMode a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ProxyType.ProxyType) of
            T.Success a -> return $ ProxyType a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Proxy.Proxy) of
            T.Success a -> return $ Proxy a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Proxies.Proxies) of
            T.Success a -> return $ Proxies a
            _ -> fail "",
          case (T.fromJSON v :: T.Result InputSticker.InputSticker) of
            T.Success a -> return $ InputSticker a
            _ -> fail "",
          case (T.fromJSON v :: T.Result DateRange.DateRange) of
            T.Success a -> return $ DateRange a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StatisticalValue.StatisticalValue) of
            T.Success a -> return $ StatisticalValue a
            _ -> fail "",
          case (T.fromJSON v :: T.Result StatisticalGraph.StatisticalGraph) of
            T.Success a -> return $ StatisticalGraph a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo) of
            T.Success a -> return $ ChatStatisticsMessageInteractionInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo) of
            T.Success a -> return $ ChatStatisticsMessageSenderInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo) of
            T.Success a -> return $ ChatStatisticsAdministratorActionsInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatStatisticsInviterInfo.ChatStatisticsInviterInfo) of
            T.Success a -> return $ ChatStatisticsInviterInfo a
            _ -> fail "",
          case (T.fromJSON v :: T.Result ChatStatistics.ChatStatistics) of
            T.Success a -> return $ ChatStatistics a
            _ -> fail "",
          case (T.fromJSON v :: T.Result MessageStatistics.MessageStatistics) of
            T.Success a -> return $ MessageStatistics a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Point.Point) of
            T.Success a -> return $ Point a
            _ -> fail "",
          case (T.fromJSON v :: T.Result VectorPathCommand.VectorPathCommand) of
            T.Success a -> return $ VectorPathCommand a
            _ -> fail "",
          case (T.fromJSON v :: T.Result BotCommandScope.BotCommandScope) of
            T.Success a -> return $ BotCommandScope a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Update.Update) of
            T.Success a -> return $ Update a
            _ -> fail "",
          case (T.fromJSON v :: T.Result Updates.Updates) of
            T.Success a -> return $ Updates a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LogStream.LogStream) of
            T.Success a -> return $ LogStream a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LogVerbosityLevel.LogVerbosityLevel) of
            T.Success a -> return $ LogVerbosityLevel a
            _ -> fail "",
          case (T.fromJSON v :: T.Result LogTags.LogTags) of
            T.Success a -> return $ LogTags a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestInt.TestInt) of
            T.Success a -> return $ TestInt a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestString.TestString) of
            T.Success a -> return $ TestString a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestBytes.TestBytes) of
            T.Success a -> return $ TestBytes a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestVectorInt.TestVectorInt) of
            T.Success a -> return $ TestVectorInt a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestVectorIntObject.TestVectorIntObject) of
            T.Success a -> return $ TestVectorIntObject a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestVectorString.TestVectorString) of
            T.Success a -> return $ TestVectorString a
            _ -> fail "",
          case (T.fromJSON v :: T.Result TestVectorStringObject.TestVectorStringObject) of
            T.Success a -> return $ TestVectorStringObject a
            _ -> fail ""
        ]
