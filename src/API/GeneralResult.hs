-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GeneralResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthorizationState as AuthorizationState
import {-# SOURCE #-} qualified API.Session as Session
import {-# SOURCE #-} qualified API.Updates as Updates
import {-# SOURCE #-} qualified API.RecoveryEmailAddress as RecoveryEmailAddress
import {-# SOURCE #-} qualified API.PasswordState as PasswordState
import {-# SOURCE #-} qualified API.TemporaryPasswordState as TemporaryPasswordState
import {-# SOURCE #-} qualified API.UserFullInfo as UserFullInfo
import {-# SOURCE #-} qualified API.BasicGroup as BasicGroup
import {-# SOURCE #-} qualified API.BasicGroupFullInfo as BasicGroupFullInfo
import {-# SOURCE #-} qualified API.Supergroup as Supergroup
import {-# SOURCE #-} qualified API.SupergroupFullInfo as SupergroupFullInfo
import {-# SOURCE #-} qualified API.SecretChat as SecretChat
import {-# SOURCE #-} qualified API.ChatsNearby as ChatsNearby
import {-# SOURCE #-} qualified API.CheckChatUsernameResult as CheckChatUsernameResult
import {-# SOURCE #-} qualified API.FoundMessages as FoundMessages
import {-# SOURCE #-} qualified API.PublicMessageLink as PublicMessageLink
import {-# SOURCE #-} qualified API.MessageLinkInfo as MessageLinkInfo
import {-# SOURCE #-} qualified API.Messages as Messages
import {-# SOURCE #-} qualified API.TextEntities as TextEntities
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.LanguagePackStringValue as LanguagePackStringValue
import {-# SOURCE #-} qualified API.LoginUrlInfo as LoginUrlInfo
import {-# SOURCE #-} qualified API.InlineQueryResults as InlineQueryResults
import {-# SOURCE #-} qualified API.CallbackQueryAnswer as CallbackQueryAnswer
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.GameHighScores as GameHighScores
import {-# SOURCE #-} qualified API.CanTransferOwnershipResult as CanTransferOwnershipResult
import {-# SOURCE #-} qualified API.ChatMember as ChatMember
import {-# SOURCE #-} qualified API.ChatAdministrators as ChatAdministrators
import {-# SOURCE #-} qualified API.Chats as Chats
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.FilePart as FilePart
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink
import {-# SOURCE #-} qualified API.ChatInviteLinkInfo as ChatInviteLinkInfo
import {-# SOURCE #-} qualified API.Chat as Chat
import {-# SOURCE #-} qualified API.CallId as CallId
import {-# SOURCE #-} qualified API.Count as Count
import {-# SOURCE #-} qualified API.ImportedContacts as ImportedContacts
import {-# SOURCE #-} qualified API.UserProfilePhotos as UserProfilePhotos
import {-# SOURCE #-} qualified API.StickerSets as StickerSets
import {-# SOURCE #-} qualified API.Stickers as Stickers
import {-# SOURCE #-} qualified API.Emojis as Emojis
import {-# SOURCE #-} qualified API.Animations as Animations
import {-# SOURCE #-} qualified API.Users as Users
import {-# SOURCE #-} qualified API.Hashtags as Hashtags
import {-# SOURCE #-} qualified API.WebPage as WebPage
import {-# SOURCE #-} qualified API.WebPageInstantView as WebPageInstantView
import {-# SOURCE #-} qualified API.Sessions as Sessions
import {-# SOURCE #-} qualified API.ConnectedWebsites as ConnectedWebsites
import {-# SOURCE #-} qualified API.ChatMembers as ChatMembers
import {-# SOURCE #-} qualified API.ChatEvents as ChatEvents
import {-# SOURCE #-} qualified API.PaymentForm as PaymentForm
import {-# SOURCE #-} qualified API.ValidatedOrderInfo as ValidatedOrderInfo
import {-# SOURCE #-} qualified API.PaymentResult as PaymentResult
import {-# SOURCE #-} qualified API.PaymentReceipt as PaymentReceipt
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.User as User
import {-# SOURCE #-} qualified API.Backgrounds as Backgrounds
import {-# SOURCE #-} qualified API.Background as Background
import {-# SOURCE #-} qualified API.LocalizationTargetInfo as LocalizationTargetInfo
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo
import {-# SOURCE #-} qualified API.LanguagePackStrings as LanguagePackStrings
import {-# SOURCE #-} qualified API.PushReceiverId as PushReceiverId
import {-# SOURCE #-} qualified API.TMeUrls as TMeUrls
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.OptionValue as OptionValue
import {-# SOURCE #-} qualified API.AccountTtl as AccountTtl
import {-# SOURCE #-} qualified API.HttpUrl as HttpUrl
import {-# SOURCE #-} qualified API.ChatStatistics as ChatStatistics
import {-# SOURCE #-} qualified API.StatisticsGraph as StatisticsGraph
import {-# SOURCE #-} qualified API.StorageStatisticsFast as StorageStatisticsFast
import {-# SOURCE #-} qualified API.DatabaseStatistics as DatabaseStatistics
import {-# SOURCE #-} qualified API.StorageStatistics as StorageStatistics
import {-# SOURCE #-} qualified API.NetworkStatistics as NetworkStatistics
import {-# SOURCE #-} qualified API.AutoDownloadSettingsPresets as AutoDownloadSettingsPresets
import {-# SOURCE #-} qualified API.BankCardInfo as BankCardInfo
import {-# SOURCE #-} qualified API.PassportElements as PassportElements
import {-# SOURCE #-} qualified API.PassportElement as PassportElement
import {-# SOURCE #-} qualified API.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import {-# SOURCE #-} qualified API.PassportAuthorizationForm as PassportAuthorizationForm
import {-# SOURCE #-} qualified API.PassportElementsWithErrors as PassportElementsWithErrors
import {-# SOURCE #-} qualified API.AuthenticationCodeInfo as AuthenticationCodeInfo
import {-# SOURCE #-} qualified API.StickerSet as StickerSet
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.CustomRequestResult as CustomRequestResult
import {-# SOURCE #-} qualified API.DeepLinkInfo as DeepLinkInfo
import {-# SOURCE #-} qualified API.JsonValue as JsonValue
import {-# SOURCE #-} qualified API.Proxy as Proxy
import {-# SOURCE #-} qualified API.Proxies as Proxies
import {-# SOURCE #-} qualified API.Text as Text
import {-# SOURCE #-} qualified API.Seconds as Seconds
import {-# SOURCE #-} qualified API.LogStream as LogStream
import {-# SOURCE #-} qualified API.LogTags as LogTags
import {-# SOURCE #-} qualified API.LogVerbosityLevel as LogVerbosityLevel
import {-# SOURCE #-} qualified API.TestString as TestString
import {-# SOURCE #-} qualified API.TestBytes as TestBytes
import {-# SOURCE #-} qualified API.TestVectorInt as TestVectorInt
import {-# SOURCE #-} qualified API.TestVectorIntObject as TestVectorIntObject
import {-# SOURCE #-} qualified API.TestVectorString as TestVectorString
import {-# SOURCE #-} qualified API.TestVectorStringObject as TestVectorStringObject
import {-# SOURCE #-} qualified API.TestInt as TestInt
import {-# SOURCE #-} qualified API.Ok as Ok
import {-# SOURCE #-} qualified API.Update as Update
import {-# SOURCE #-} qualified API.Error as Error

data GeneralResult = 
 AuthorizationState AuthorizationState.AuthorizationState 
 | Session Session.Session 
 | Updates Updates.Updates 
 | RecoveryEmailAddress RecoveryEmailAddress.RecoveryEmailAddress 
 | PasswordState PasswordState.PasswordState 
 | TemporaryPasswordState TemporaryPasswordState.TemporaryPasswordState 
 | UserFullInfo UserFullInfo.UserFullInfo 
 | BasicGroup BasicGroup.BasicGroup 
 | BasicGroupFullInfo BasicGroupFullInfo.BasicGroupFullInfo 
 | Supergroup Supergroup.Supergroup 
 | SupergroupFullInfo SupergroupFullInfo.SupergroupFullInfo 
 | SecretChat SecretChat.SecretChat 
 | ChatsNearby ChatsNearby.ChatsNearby 
 | CheckChatUsernameResult CheckChatUsernameResult.CheckChatUsernameResult 
 | FoundMessages FoundMessages.FoundMessages 
 | PublicMessageLink PublicMessageLink.PublicMessageLink 
 | MessageLinkInfo MessageLinkInfo.MessageLinkInfo 
 | Messages Messages.Messages 
 | TextEntities TextEntities.TextEntities 
 | FormattedText FormattedText.FormattedText 
 | LanguagePackStringValue LanguagePackStringValue.LanguagePackStringValue 
 | LoginUrlInfo LoginUrlInfo.LoginUrlInfo 
 | InlineQueryResults InlineQueryResults.InlineQueryResults 
 | CallbackQueryAnswer CallbackQueryAnswer.CallbackQueryAnswer 
 | Message Message.Message 
 | GameHighScores GameHighScores.GameHighScores 
 | CanTransferOwnershipResult CanTransferOwnershipResult.CanTransferOwnershipResult 
 | ChatMember ChatMember.ChatMember 
 | ChatAdministrators ChatAdministrators.ChatAdministrators 
 | Chats Chats.Chats 
 | ScopeNotificationSettings ScopeNotificationSettings.ScopeNotificationSettings 
 | FilePart FilePart.FilePart 
 | ChatInviteLink ChatInviteLink.ChatInviteLink 
 | ChatInviteLinkInfo ChatInviteLinkInfo.ChatInviteLinkInfo 
 | Chat Chat.Chat 
 | CallId CallId.CallId 
 | Count Count.Count 
 | ImportedContacts ImportedContacts.ImportedContacts 
 | UserProfilePhotos UserProfilePhotos.UserProfilePhotos 
 | StickerSets StickerSets.StickerSets 
 | Stickers Stickers.Stickers 
 | Emojis Emojis.Emojis 
 | Animations Animations.Animations 
 | Users Users.Users 
 | Hashtags Hashtags.Hashtags 
 | WebPage WebPage.WebPage 
 | WebPageInstantView WebPageInstantView.WebPageInstantView 
 | Sessions Sessions.Sessions 
 | ConnectedWebsites ConnectedWebsites.ConnectedWebsites 
 | ChatMembers ChatMembers.ChatMembers 
 | ChatEvents ChatEvents.ChatEvents 
 | PaymentForm PaymentForm.PaymentForm 
 | ValidatedOrderInfo ValidatedOrderInfo.ValidatedOrderInfo 
 | PaymentResult PaymentResult.PaymentResult 
 | PaymentReceipt PaymentReceipt.PaymentReceipt 
 | OrderInfo OrderInfo.OrderInfo 
 | User User.User 
 | Backgrounds Backgrounds.Backgrounds 
 | Background Background.Background 
 | LocalizationTargetInfo LocalizationTargetInfo.LocalizationTargetInfo 
 | LanguagePackInfo LanguagePackInfo.LanguagePackInfo 
 | LanguagePackStrings LanguagePackStrings.LanguagePackStrings 
 | PushReceiverId PushReceiverId.PushReceiverId 
 | TMeUrls TMeUrls.TMeUrls 
 | UserPrivacySettingRules UserPrivacySettingRules.UserPrivacySettingRules 
 | OptionValue OptionValue.OptionValue 
 | AccountTtl AccountTtl.AccountTtl 
 | HttpUrl HttpUrl.HttpUrl 
 | ChatStatistics ChatStatistics.ChatStatistics 
 | StatisticsGraph StatisticsGraph.StatisticsGraph 
 | StorageStatisticsFast StorageStatisticsFast.StorageStatisticsFast 
 | DatabaseStatistics DatabaseStatistics.DatabaseStatistics 
 | StorageStatistics StorageStatistics.StorageStatistics 
 | NetworkStatistics NetworkStatistics.NetworkStatistics 
 | AutoDownloadSettingsPresets AutoDownloadSettingsPresets.AutoDownloadSettingsPresets 
 | BankCardInfo BankCardInfo.BankCardInfo 
 | PassportElements PassportElements.PassportElements 
 | PassportElement PassportElement.PassportElement 
 | EmailAddressAuthenticationCodeInfo EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo 
 | PassportAuthorizationForm PassportAuthorizationForm.PassportAuthorizationForm 
 | PassportElementsWithErrors PassportElementsWithErrors.PassportElementsWithErrors 
 | AuthenticationCodeInfo AuthenticationCodeInfo.AuthenticationCodeInfo 
 | StickerSet StickerSet.StickerSet 
 | File File.File 
 | CustomRequestResult CustomRequestResult.CustomRequestResult 
 | DeepLinkInfo DeepLinkInfo.DeepLinkInfo 
 | JsonValue JsonValue.JsonValue 
 | Proxy Proxy.Proxy 
 | Proxies Proxies.Proxies 
 | Text Text.Text 
 | Seconds Seconds.Seconds 
 | LogStream LogStream.LogStream 
 | LogTags LogTags.LogTags 
 | LogVerbosityLevel LogVerbosityLevel.LogVerbosityLevel 
 | TestString TestString.TestString 
 | TestBytes TestBytes.TestBytes 
 | TestVectorInt TestVectorInt.TestVectorInt 
 | TestVectorIntObject TestVectorIntObject.TestVectorIntObject 
 | TestVectorString TestVectorString.TestVectorString 
 | TestVectorStringObject TestVectorStringObject.TestVectorStringObject 
 | TestInt TestInt.TestInt 
 | Ok Ok.Ok 
 | Update Update.Update 
 | Error Error.Error deriving (Show, Eq)

data ResultWithExtra = ResultWithExtra GeneralResult (Maybe String) deriving (Show, Eq)

instance T.FromJSON ResultWithExtra where
 parseJSON v@(T.Object obj) = do
   case (T.fromJSON v :: T.Result GeneralResult) of
    T.Success a -> return $ ResultWithExtra a e
    _           -> mempty
  where
   e :: Maybe String
   e = case T.parse (\o -> o A..:? "@extra" :: T.Parser (Maybe String)) obj of
     T.Success r -> r
     _           -> Nothing


instance T.FromJSON GeneralResult where
 parseJSON v@(T.Object obj) = do
   mconcat t
  where
   t =
     [
      case (T.fromJSON v :: T.Result AuthorizationState.AuthorizationState) of
       T.Success a -> return $ AuthorizationState a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Session.Session) of
       T.Success a -> return $ Session a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Updates.Updates) of
       T.Success a -> return $ Updates a
       _ -> mempty,
      case (T.fromJSON v :: T.Result RecoveryEmailAddress.RecoveryEmailAddress) of
       T.Success a -> return $ RecoveryEmailAddress a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PasswordState.PasswordState) of
       T.Success a -> return $ PasswordState a
       _ -> mempty,
      case (T.fromJSON v :: T.Result TemporaryPasswordState.TemporaryPasswordState) of
       T.Success a -> return $ TemporaryPasswordState a
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserFullInfo.UserFullInfo) of
       T.Success a -> return $ UserFullInfo a
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
      case (T.fromJSON v :: T.Result SecretChat.SecretChat) of
       T.Success a -> return $ SecretChat a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatsNearby.ChatsNearby) of
       T.Success a -> return $ ChatsNearby a
       _ -> mempty,
      case (T.fromJSON v :: T.Result CheckChatUsernameResult.CheckChatUsernameResult) of
       T.Success a -> return $ CheckChatUsernameResult a
       _ -> mempty,
      case (T.fromJSON v :: T.Result FoundMessages.FoundMessages) of
       T.Success a -> return $ FoundMessages a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PublicMessageLink.PublicMessageLink) of
       T.Success a -> return $ PublicMessageLink a
       _ -> mempty,
      case (T.fromJSON v :: T.Result MessageLinkInfo.MessageLinkInfo) of
       T.Success a -> return $ MessageLinkInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Messages.Messages) of
       T.Success a -> return $ Messages a
       _ -> mempty,
      case (T.fromJSON v :: T.Result TextEntities.TextEntities) of
       T.Success a -> return $ TextEntities a
       _ -> mempty,
      case (T.fromJSON v :: T.Result FormattedText.FormattedText) of
       T.Success a -> return $ FormattedText a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackStringValue.LanguagePackStringValue) of
       T.Success a -> return $ LanguagePackStringValue a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LoginUrlInfo.LoginUrlInfo) of
       T.Success a -> return $ LoginUrlInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result InlineQueryResults.InlineQueryResults) of
       T.Success a -> return $ InlineQueryResults a
       _ -> mempty,
      case (T.fromJSON v :: T.Result CallbackQueryAnswer.CallbackQueryAnswer) of
       T.Success a -> return $ CallbackQueryAnswer a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Message.Message) of
       T.Success a -> return $ Message a
       _ -> mempty,
      case (T.fromJSON v :: T.Result GameHighScores.GameHighScores) of
       T.Success a -> return $ GameHighScores a
       _ -> mempty,
      case (T.fromJSON v :: T.Result CanTransferOwnershipResult.CanTransferOwnershipResult) of
       T.Success a -> return $ CanTransferOwnershipResult a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatMember.ChatMember) of
       T.Success a -> return $ ChatMember a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatAdministrators.ChatAdministrators) of
       T.Success a -> return $ ChatAdministrators a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Chats.Chats) of
       T.Success a -> return $ Chats a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ScopeNotificationSettings.ScopeNotificationSettings) of
       T.Success a -> return $ ScopeNotificationSettings a
       _ -> mempty,
      case (T.fromJSON v :: T.Result FilePart.FilePart) of
       T.Success a -> return $ FilePart a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatInviteLink.ChatInviteLink) of
       T.Success a -> return $ ChatInviteLink a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatInviteLinkInfo.ChatInviteLinkInfo) of
       T.Success a -> return $ ChatInviteLinkInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Chat.Chat) of
       T.Success a -> return $ Chat a
       _ -> mempty,
      case (T.fromJSON v :: T.Result CallId.CallId) of
       T.Success a -> return $ CallId a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Count.Count) of
       T.Success a -> return $ Count a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ImportedContacts.ImportedContacts) of
       T.Success a -> return $ ImportedContacts a
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserProfilePhotos.UserProfilePhotos) of
       T.Success a -> return $ UserProfilePhotos a
       _ -> mempty,
      case (T.fromJSON v :: T.Result StickerSets.StickerSets) of
       T.Success a -> return $ StickerSets a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Stickers.Stickers) of
       T.Success a -> return $ Stickers a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Emojis.Emojis) of
       T.Success a -> return $ Emojis a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Animations.Animations) of
       T.Success a -> return $ Animations a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Users.Users) of
       T.Success a -> return $ Users a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Hashtags.Hashtags) of
       T.Success a -> return $ Hashtags a
       _ -> mempty,
      case (T.fromJSON v :: T.Result WebPage.WebPage) of
       T.Success a -> return $ WebPage a
       _ -> mempty,
      case (T.fromJSON v :: T.Result WebPageInstantView.WebPageInstantView) of
       T.Success a -> return $ WebPageInstantView a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Sessions.Sessions) of
       T.Success a -> return $ Sessions a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ConnectedWebsites.ConnectedWebsites) of
       T.Success a -> return $ ConnectedWebsites a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatMembers.ChatMembers) of
       T.Success a -> return $ ChatMembers a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatEvents.ChatEvents) of
       T.Success a -> return $ ChatEvents a
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
      case (T.fromJSON v :: T.Result OrderInfo.OrderInfo) of
       T.Success a -> return $ OrderInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result User.User) of
       T.Success a -> return $ User a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Backgrounds.Backgrounds) of
       T.Success a -> return $ Backgrounds a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Background.Background) of
       T.Success a -> return $ Background a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LocalizationTargetInfo.LocalizationTargetInfo) of
       T.Success a -> return $ LocalizationTargetInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackInfo.LanguagePackInfo) of
       T.Success a -> return $ LanguagePackInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackStrings.LanguagePackStrings) of
       T.Success a -> return $ LanguagePackStrings a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PushReceiverId.PushReceiverId) of
       T.Success a -> return $ PushReceiverId a
       _ -> mempty,
      case (T.fromJSON v :: T.Result TMeUrls.TMeUrls) of
       T.Success a -> return $ TMeUrls a
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserPrivacySettingRules.UserPrivacySettingRules) of
       T.Success a -> return $ UserPrivacySettingRules a
       _ -> mempty,
      case (T.fromJSON v :: T.Result OptionValue.OptionValue) of
       T.Success a -> return $ OptionValue a
       _ -> mempty,
      case (T.fromJSON v :: T.Result AccountTtl.AccountTtl) of
       T.Success a -> return $ AccountTtl a
       _ -> mempty,
      case (T.fromJSON v :: T.Result HttpUrl.HttpUrl) of
       T.Success a -> return $ HttpUrl a
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatStatistics.ChatStatistics) of
       T.Success a -> return $ ChatStatistics a
       _ -> mempty,
      case (T.fromJSON v :: T.Result StatisticsGraph.StatisticsGraph) of
       T.Success a -> return $ StatisticsGraph a
       _ -> mempty,
      case (T.fromJSON v :: T.Result StorageStatisticsFast.StorageStatisticsFast) of
       T.Success a -> return $ StorageStatisticsFast a
       _ -> mempty,
      case (T.fromJSON v :: T.Result DatabaseStatistics.DatabaseStatistics) of
       T.Success a -> return $ DatabaseStatistics a
       _ -> mempty,
      case (T.fromJSON v :: T.Result StorageStatistics.StorageStatistics) of
       T.Success a -> return $ StorageStatistics a
       _ -> mempty,
      case (T.fromJSON v :: T.Result NetworkStatistics.NetworkStatistics) of
       T.Success a -> return $ NetworkStatistics a
       _ -> mempty,
      case (T.fromJSON v :: T.Result AutoDownloadSettingsPresets.AutoDownloadSettingsPresets) of
       T.Success a -> return $ AutoDownloadSettingsPresets a
       _ -> mempty,
      case (T.fromJSON v :: T.Result BankCardInfo.BankCardInfo) of
       T.Success a -> return $ BankCardInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElements.PassportElements) of
       T.Success a -> return $ PassportElements a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElement.PassportElement) of
       T.Success a -> return $ PassportElement a
       _ -> mempty,
      case (T.fromJSON v :: T.Result EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo) of
       T.Success a -> return $ EmailAddressAuthenticationCodeInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportAuthorizationForm.PassportAuthorizationForm) of
       T.Success a -> return $ PassportAuthorizationForm a
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElementsWithErrors.PassportElementsWithErrors) of
       T.Success a -> return $ PassportElementsWithErrors a
       _ -> mempty,
      case (T.fromJSON v :: T.Result AuthenticationCodeInfo.AuthenticationCodeInfo) of
       T.Success a -> return $ AuthenticationCodeInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result StickerSet.StickerSet) of
       T.Success a -> return $ StickerSet a
       _ -> mempty,
      case (T.fromJSON v :: T.Result File.File) of
       T.Success a -> return $ File a
       _ -> mempty,
      case (T.fromJSON v :: T.Result CustomRequestResult.CustomRequestResult) of
       T.Success a -> return $ CustomRequestResult a
       _ -> mempty,
      case (T.fromJSON v :: T.Result DeepLinkInfo.DeepLinkInfo) of
       T.Success a -> return $ DeepLinkInfo a
       _ -> mempty,
      case (T.fromJSON v :: T.Result JsonValue.JsonValue) of
       T.Success a -> return $ JsonValue a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Proxy.Proxy) of
       T.Success a -> return $ Proxy a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Proxies.Proxies) of
       T.Success a -> return $ Proxies a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Text.Text) of
       T.Success a -> return $ Text a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Seconds.Seconds) of
       T.Success a -> return $ Seconds a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogStream.LogStream) of
       T.Success a -> return $ LogStream a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogTags.LogTags) of
       T.Success a -> return $ LogTags a
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogVerbosityLevel.LogVerbosityLevel) of
       T.Success a -> return $ LogVerbosityLevel a
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
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestInt.TestInt) of
       T.Success a -> return $ TestInt a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Ok.Ok) of
       T.Success a -> return $ Ok a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Update.Update) of
       T.Success a -> return $ Update a
       _ -> mempty,
      case (T.fromJSON v :: T.Result Error.Error) of
       T.Success a -> return $ Error a
       _ -> mempty
    ]
