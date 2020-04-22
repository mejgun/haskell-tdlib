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
 AuthorizationState AuthorizationState.AuthorizationState (Maybe String) 
 | Session Session.Session (Maybe String) 
 | Updates Updates.Updates (Maybe String) 
 | RecoveryEmailAddress RecoveryEmailAddress.RecoveryEmailAddress (Maybe String) 
 | PasswordState PasswordState.PasswordState (Maybe String) 
 | TemporaryPasswordState TemporaryPasswordState.TemporaryPasswordState (Maybe String) 
 | UserFullInfo UserFullInfo.UserFullInfo (Maybe String) 
 | BasicGroup BasicGroup.BasicGroup (Maybe String) 
 | BasicGroupFullInfo BasicGroupFullInfo.BasicGroupFullInfo (Maybe String) 
 | Supergroup Supergroup.Supergroup (Maybe String) 
 | SupergroupFullInfo SupergroupFullInfo.SupergroupFullInfo (Maybe String) 
 | SecretChat SecretChat.SecretChat (Maybe String) 
 | ChatsNearby ChatsNearby.ChatsNearby (Maybe String) 
 | CheckChatUsernameResult CheckChatUsernameResult.CheckChatUsernameResult (Maybe String) 
 | FoundMessages FoundMessages.FoundMessages (Maybe String) 
 | PublicMessageLink PublicMessageLink.PublicMessageLink (Maybe String) 
 | MessageLinkInfo MessageLinkInfo.MessageLinkInfo (Maybe String) 
 | Messages Messages.Messages (Maybe String) 
 | TextEntities TextEntities.TextEntities (Maybe String) 
 | FormattedText FormattedText.FormattedText (Maybe String) 
 | LanguagePackStringValue LanguagePackStringValue.LanguagePackStringValue (Maybe String) 
 | LoginUrlInfo LoginUrlInfo.LoginUrlInfo (Maybe String) 
 | InlineQueryResults InlineQueryResults.InlineQueryResults (Maybe String) 
 | CallbackQueryAnswer CallbackQueryAnswer.CallbackQueryAnswer (Maybe String) 
 | Message Message.Message (Maybe String) 
 | GameHighScores GameHighScores.GameHighScores (Maybe String) 
 | CanTransferOwnershipResult CanTransferOwnershipResult.CanTransferOwnershipResult (Maybe String) 
 | ChatMember ChatMember.ChatMember (Maybe String) 
 | ChatAdministrators ChatAdministrators.ChatAdministrators (Maybe String) 
 | Chats Chats.Chats (Maybe String) 
 | ScopeNotificationSettings ScopeNotificationSettings.ScopeNotificationSettings (Maybe String) 
 | FilePart FilePart.FilePart (Maybe String) 
 | ChatInviteLink ChatInviteLink.ChatInviteLink (Maybe String) 
 | ChatInviteLinkInfo ChatInviteLinkInfo.ChatInviteLinkInfo (Maybe String) 
 | Chat Chat.Chat (Maybe String) 
 | CallId CallId.CallId (Maybe String) 
 | Count Count.Count (Maybe String) 
 | ImportedContacts ImportedContacts.ImportedContacts (Maybe String) 
 | UserProfilePhotos UserProfilePhotos.UserProfilePhotos (Maybe String) 
 | StickerSets StickerSets.StickerSets (Maybe String) 
 | Stickers Stickers.Stickers (Maybe String) 
 | Emojis Emojis.Emojis (Maybe String) 
 | Animations Animations.Animations (Maybe String) 
 | Users Users.Users (Maybe String) 
 | Hashtags Hashtags.Hashtags (Maybe String) 
 | WebPage WebPage.WebPage (Maybe String) 
 | WebPageInstantView WebPageInstantView.WebPageInstantView (Maybe String) 
 | Sessions Sessions.Sessions (Maybe String) 
 | ConnectedWebsites ConnectedWebsites.ConnectedWebsites (Maybe String) 
 | ChatMembers ChatMembers.ChatMembers (Maybe String) 
 | ChatEvents ChatEvents.ChatEvents (Maybe String) 
 | PaymentForm PaymentForm.PaymentForm (Maybe String) 
 | ValidatedOrderInfo ValidatedOrderInfo.ValidatedOrderInfo (Maybe String) 
 | PaymentResult PaymentResult.PaymentResult (Maybe String) 
 | PaymentReceipt PaymentReceipt.PaymentReceipt (Maybe String) 
 | OrderInfo OrderInfo.OrderInfo (Maybe String) 
 | User User.User (Maybe String) 
 | Backgrounds Backgrounds.Backgrounds (Maybe String) 
 | Background Background.Background (Maybe String) 
 | LocalizationTargetInfo LocalizationTargetInfo.LocalizationTargetInfo (Maybe String) 
 | LanguagePackInfo LanguagePackInfo.LanguagePackInfo (Maybe String) 
 | LanguagePackStrings LanguagePackStrings.LanguagePackStrings (Maybe String) 
 | PushReceiverId PushReceiverId.PushReceiverId (Maybe String) 
 | TMeUrls TMeUrls.TMeUrls (Maybe String) 
 | UserPrivacySettingRules UserPrivacySettingRules.UserPrivacySettingRules (Maybe String) 
 | OptionValue OptionValue.OptionValue (Maybe String) 
 | AccountTtl AccountTtl.AccountTtl (Maybe String) 
 | HttpUrl HttpUrl.HttpUrl (Maybe String) 
 | ChatStatistics ChatStatistics.ChatStatistics (Maybe String) 
 | StatisticsGraph StatisticsGraph.StatisticsGraph (Maybe String) 
 | StorageStatisticsFast StorageStatisticsFast.StorageStatisticsFast (Maybe String) 
 | DatabaseStatistics DatabaseStatistics.DatabaseStatistics (Maybe String) 
 | StorageStatistics StorageStatistics.StorageStatistics (Maybe String) 
 | NetworkStatistics NetworkStatistics.NetworkStatistics (Maybe String) 
 | AutoDownloadSettingsPresets AutoDownloadSettingsPresets.AutoDownloadSettingsPresets (Maybe String) 
 | BankCardInfo BankCardInfo.BankCardInfo (Maybe String) 
 | PassportElements PassportElements.PassportElements (Maybe String) 
 | PassportElement PassportElement.PassportElement (Maybe String) 
 | EmailAddressAuthenticationCodeInfo EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo (Maybe String) 
 | PassportAuthorizationForm PassportAuthorizationForm.PassportAuthorizationForm (Maybe String) 
 | PassportElementsWithErrors PassportElementsWithErrors.PassportElementsWithErrors (Maybe String) 
 | AuthenticationCodeInfo AuthenticationCodeInfo.AuthenticationCodeInfo (Maybe String) 
 | StickerSet StickerSet.StickerSet (Maybe String) 
 | File File.File (Maybe String) 
 | CustomRequestResult CustomRequestResult.CustomRequestResult (Maybe String) 
 | DeepLinkInfo DeepLinkInfo.DeepLinkInfo (Maybe String) 
 | JsonValue JsonValue.JsonValue (Maybe String) 
 | Proxy Proxy.Proxy (Maybe String) 
 | Proxies Proxies.Proxies (Maybe String) 
 | Text Text.Text (Maybe String) 
 | Seconds Seconds.Seconds (Maybe String) 
 | LogStream LogStream.LogStream (Maybe String) 
 | LogTags LogTags.LogTags (Maybe String) 
 | LogVerbosityLevel LogVerbosityLevel.LogVerbosityLevel (Maybe String) 
 | TestString TestString.TestString (Maybe String) 
 | TestBytes TestBytes.TestBytes (Maybe String) 
 | TestVectorInt TestVectorInt.TestVectorInt (Maybe String) 
 | TestVectorIntObject TestVectorIntObject.TestVectorIntObject (Maybe String) 
 | TestVectorString TestVectorString.TestVectorString (Maybe String) 
 | TestVectorStringObject TestVectorStringObject.TestVectorStringObject (Maybe String) 
 | TestInt TestInt.TestInt (Maybe String) 
 | Ok Ok.Ok (Maybe String) 
 | Update Update.Update (Maybe String) 
 | Error Error.Error (Maybe String) deriving (Show)

instance T.ToJSON GeneralResult where
 toJSON (AuthorizationState {  }) =
  A.object [ "@type" A..= T.String "AuthorizationState" ]

 toJSON (Session {  }) =
  A.object [ "@type" A..= T.String "Session" ]

 toJSON (Updates {  }) =
  A.object [ "@type" A..= T.String "Updates" ]

 toJSON (RecoveryEmailAddress {  }) =
  A.object [ "@type" A..= T.String "RecoveryEmailAddress" ]

 toJSON (PasswordState {  }) =
  A.object [ "@type" A..= T.String "PasswordState" ]

 toJSON (TemporaryPasswordState {  }) =
  A.object [ "@type" A..= T.String "TemporaryPasswordState" ]

 toJSON (UserFullInfo {  }) =
  A.object [ "@type" A..= T.String "UserFullInfo" ]

 toJSON (BasicGroup {  }) =
  A.object [ "@type" A..= T.String "BasicGroup" ]

 toJSON (BasicGroupFullInfo {  }) =
  A.object [ "@type" A..= T.String "BasicGroupFullInfo" ]

 toJSON (Supergroup {  }) =
  A.object [ "@type" A..= T.String "Supergroup" ]

 toJSON (SupergroupFullInfo {  }) =
  A.object [ "@type" A..= T.String "SupergroupFullInfo" ]

 toJSON (SecretChat {  }) =
  A.object [ "@type" A..= T.String "SecretChat" ]

 toJSON (ChatsNearby {  }) =
  A.object [ "@type" A..= T.String "ChatsNearby" ]

 toJSON (CheckChatUsernameResult {  }) =
  A.object [ "@type" A..= T.String "CheckChatUsernameResult" ]

 toJSON (FoundMessages {  }) =
  A.object [ "@type" A..= T.String "FoundMessages" ]

 toJSON (PublicMessageLink {  }) =
  A.object [ "@type" A..= T.String "PublicMessageLink" ]

 toJSON (MessageLinkInfo {  }) =
  A.object [ "@type" A..= T.String "MessageLinkInfo" ]

 toJSON (Messages {  }) =
  A.object [ "@type" A..= T.String "Messages" ]

 toJSON (TextEntities {  }) =
  A.object [ "@type" A..= T.String "TextEntities" ]

 toJSON (FormattedText {  }) =
  A.object [ "@type" A..= T.String "FormattedText" ]

 toJSON (LanguagePackStringValue {  }) =
  A.object [ "@type" A..= T.String "LanguagePackStringValue" ]

 toJSON (LoginUrlInfo {  }) =
  A.object [ "@type" A..= T.String "LoginUrlInfo" ]

 toJSON (InlineQueryResults {  }) =
  A.object [ "@type" A..= T.String "InlineQueryResults" ]

 toJSON (CallbackQueryAnswer {  }) =
  A.object [ "@type" A..= T.String "CallbackQueryAnswer" ]

 toJSON (Message {  }) =
  A.object [ "@type" A..= T.String "Message" ]

 toJSON (GameHighScores {  }) =
  A.object [ "@type" A..= T.String "GameHighScores" ]

 toJSON (CanTransferOwnershipResult {  }) =
  A.object [ "@type" A..= T.String "CanTransferOwnershipResult" ]

 toJSON (ChatMember {  }) =
  A.object [ "@type" A..= T.String "ChatMember" ]

 toJSON (ChatAdministrators {  }) =
  A.object [ "@type" A..= T.String "ChatAdministrators" ]

 toJSON (Chats {  }) =
  A.object [ "@type" A..= T.String "Chats" ]

 toJSON (ScopeNotificationSettings {  }) =
  A.object [ "@type" A..= T.String "ScopeNotificationSettings" ]

 toJSON (FilePart {  }) =
  A.object [ "@type" A..= T.String "FilePart" ]

 toJSON (ChatInviteLink {  }) =
  A.object [ "@type" A..= T.String "ChatInviteLink" ]

 toJSON (ChatInviteLinkInfo {  }) =
  A.object [ "@type" A..= T.String "ChatInviteLinkInfo" ]

 toJSON (Chat {  }) =
  A.object [ "@type" A..= T.String "Chat" ]

 toJSON (CallId {  }) =
  A.object [ "@type" A..= T.String "CallId" ]

 toJSON (Count {  }) =
  A.object [ "@type" A..= T.String "Count" ]

 toJSON (ImportedContacts {  }) =
  A.object [ "@type" A..= T.String "ImportedContacts" ]

 toJSON (UserProfilePhotos {  }) =
  A.object [ "@type" A..= T.String "UserProfilePhotos" ]

 toJSON (StickerSets {  }) =
  A.object [ "@type" A..= T.String "StickerSets" ]

 toJSON (Stickers {  }) =
  A.object [ "@type" A..= T.String "Stickers" ]

 toJSON (Emojis {  }) =
  A.object [ "@type" A..= T.String "Emojis" ]

 toJSON (Animations {  }) =
  A.object [ "@type" A..= T.String "Animations" ]

 toJSON (Users {  }) =
  A.object [ "@type" A..= T.String "Users" ]

 toJSON (Hashtags {  }) =
  A.object [ "@type" A..= T.String "Hashtags" ]

 toJSON (WebPage {  }) =
  A.object [ "@type" A..= T.String "WebPage" ]

 toJSON (WebPageInstantView {  }) =
  A.object [ "@type" A..= T.String "WebPageInstantView" ]

 toJSON (Sessions {  }) =
  A.object [ "@type" A..= T.String "Sessions" ]

 toJSON (ConnectedWebsites {  }) =
  A.object [ "@type" A..= T.String "ConnectedWebsites" ]

 toJSON (ChatMembers {  }) =
  A.object [ "@type" A..= T.String "ChatMembers" ]

 toJSON (ChatEvents {  }) =
  A.object [ "@type" A..= T.String "ChatEvents" ]

 toJSON (PaymentForm {  }) =
  A.object [ "@type" A..= T.String "PaymentForm" ]

 toJSON (ValidatedOrderInfo {  }) =
  A.object [ "@type" A..= T.String "ValidatedOrderInfo" ]

 toJSON (PaymentResult {  }) =
  A.object [ "@type" A..= T.String "PaymentResult" ]

 toJSON (PaymentReceipt {  }) =
  A.object [ "@type" A..= T.String "PaymentReceipt" ]

 toJSON (OrderInfo {  }) =
  A.object [ "@type" A..= T.String "OrderInfo" ]

 toJSON (User {  }) =
  A.object [ "@type" A..= T.String "User" ]

 toJSON (Backgrounds {  }) =
  A.object [ "@type" A..= T.String "Backgrounds" ]

 toJSON (Background {  }) =
  A.object [ "@type" A..= T.String "Background" ]

 toJSON (LocalizationTargetInfo {  }) =
  A.object [ "@type" A..= T.String "LocalizationTargetInfo" ]

 toJSON (LanguagePackInfo {  }) =
  A.object [ "@type" A..= T.String "LanguagePackInfo" ]

 toJSON (LanguagePackStrings {  }) =
  A.object [ "@type" A..= T.String "LanguagePackStrings" ]

 toJSON (PushReceiverId {  }) =
  A.object [ "@type" A..= T.String "PushReceiverId" ]

 toJSON (TMeUrls {  }) =
  A.object [ "@type" A..= T.String "TMeUrls" ]

 toJSON (UserPrivacySettingRules {  }) =
  A.object [ "@type" A..= T.String "UserPrivacySettingRules" ]

 toJSON (OptionValue {  }) =
  A.object [ "@type" A..= T.String "OptionValue" ]

 toJSON (AccountTtl {  }) =
  A.object [ "@type" A..= T.String "AccountTtl" ]

 toJSON (HttpUrl {  }) =
  A.object [ "@type" A..= T.String "HttpUrl" ]

 toJSON (ChatStatistics {  }) =
  A.object [ "@type" A..= T.String "ChatStatistics" ]

 toJSON (StatisticsGraph {  }) =
  A.object [ "@type" A..= T.String "StatisticsGraph" ]

 toJSON (StorageStatisticsFast {  }) =
  A.object [ "@type" A..= T.String "StorageStatisticsFast" ]

 toJSON (DatabaseStatistics {  }) =
  A.object [ "@type" A..= T.String "DatabaseStatistics" ]

 toJSON (StorageStatistics {  }) =
  A.object [ "@type" A..= T.String "StorageStatistics" ]

 toJSON (NetworkStatistics {  }) =
  A.object [ "@type" A..= T.String "NetworkStatistics" ]

 toJSON (AutoDownloadSettingsPresets {  }) =
  A.object [ "@type" A..= T.String "AutoDownloadSettingsPresets" ]

 toJSON (BankCardInfo {  }) =
  A.object [ "@type" A..= T.String "BankCardInfo" ]

 toJSON (PassportElements {  }) =
  A.object [ "@type" A..= T.String "PassportElements" ]

 toJSON (PassportElement {  }) =
  A.object [ "@type" A..= T.String "PassportElement" ]

 toJSON (EmailAddressAuthenticationCodeInfo {  }) =
  A.object [ "@type" A..= T.String "EmailAddressAuthenticationCodeInfo" ]

 toJSON (PassportAuthorizationForm {  }) =
  A.object [ "@type" A..= T.String "PassportAuthorizationForm" ]

 toJSON (PassportElementsWithErrors {  }) =
  A.object [ "@type" A..= T.String "PassportElementsWithErrors" ]

 toJSON (AuthenticationCodeInfo {  }) =
  A.object [ "@type" A..= T.String "AuthenticationCodeInfo" ]

 toJSON (StickerSet {  }) =
  A.object [ "@type" A..= T.String "StickerSet" ]

 toJSON (File {  }) =
  A.object [ "@type" A..= T.String "File" ]

 toJSON (CustomRequestResult {  }) =
  A.object [ "@type" A..= T.String "CustomRequestResult" ]

 toJSON (DeepLinkInfo {  }) =
  A.object [ "@type" A..= T.String "DeepLinkInfo" ]

 toJSON (JsonValue {  }) =
  A.object [ "@type" A..= T.String "JsonValue" ]

 toJSON (Proxy {  }) =
  A.object [ "@type" A..= T.String "Proxy" ]

 toJSON (Proxies {  }) =
  A.object [ "@type" A..= T.String "Proxies" ]

 toJSON (Text {  }) =
  A.object [ "@type" A..= T.String "Text" ]

 toJSON (Seconds {  }) =
  A.object [ "@type" A..= T.String "Seconds" ]

 toJSON (LogStream {  }) =
  A.object [ "@type" A..= T.String "LogStream" ]

 toJSON (LogTags {  }) =
  A.object [ "@type" A..= T.String "LogTags" ]

 toJSON (LogVerbosityLevel {  }) =
  A.object [ "@type" A..= T.String "LogVerbosityLevel" ]

 toJSON (TestString {  }) =
  A.object [ "@type" A..= T.String "TestString" ]

 toJSON (TestBytes {  }) =
  A.object [ "@type" A..= T.String "TestBytes" ]

 toJSON (TestVectorInt {  }) =
  A.object [ "@type" A..= T.String "TestVectorInt" ]

 toJSON (TestVectorIntObject {  }) =
  A.object [ "@type" A..= T.String "TestVectorIntObject" ]

 toJSON (TestVectorString {  }) =
  A.object [ "@type" A..= T.String "TestVectorString" ]

 toJSON (TestVectorStringObject {  }) =
  A.object [ "@type" A..= T.String "TestVectorStringObject" ]

 toJSON (TestInt {  }) =
  A.object [ "@type" A..= T.String "TestInt" ]

 toJSON (Ok {  }) =
  A.object [ "@type" A..= T.String "Ok" ]

 toJSON (Update {  }) =
  A.object [ "@type" A..= T.String "Update" ]

 toJSON (Error {  }) =
  A.object [ "@type" A..= T.String "Error" ]

instance T.FromJSON GeneralResult where
 parseJSON v@(T.Object obj) = do
   mconcat t
  where
   e :: Maybe String
   e = case T.parse (\o -> o A..:? "@extra" :: T.Parser (Maybe String)) obj of
     T.Success r -> r
     _           -> Nothing
   t =
     [
      case (T.fromJSON v :: T.Result AuthorizationState.AuthorizationState) of
       T.Success a -> return $ AuthorizationState a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Session.Session) of
       T.Success a -> return $ Session a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Updates.Updates) of
       T.Success a -> return $ Updates a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result RecoveryEmailAddress.RecoveryEmailAddress) of
       T.Success a -> return $ RecoveryEmailAddress a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PasswordState.PasswordState) of
       T.Success a -> return $ PasswordState a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TemporaryPasswordState.TemporaryPasswordState) of
       T.Success a -> return $ TemporaryPasswordState a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserFullInfo.UserFullInfo) of
       T.Success a -> return $ UserFullInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result BasicGroup.BasicGroup) of
       T.Success a -> return $ BasicGroup a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result BasicGroupFullInfo.BasicGroupFullInfo) of
       T.Success a -> return $ BasicGroupFullInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Supergroup.Supergroup) of
       T.Success a -> return $ Supergroup a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result SupergroupFullInfo.SupergroupFullInfo) of
       T.Success a -> return $ SupergroupFullInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result SecretChat.SecretChat) of
       T.Success a -> return $ SecretChat a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatsNearby.ChatsNearby) of
       T.Success a -> return $ ChatsNearby a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result CheckChatUsernameResult.CheckChatUsernameResult) of
       T.Success a -> return $ CheckChatUsernameResult a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result FoundMessages.FoundMessages) of
       T.Success a -> return $ FoundMessages a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PublicMessageLink.PublicMessageLink) of
       T.Success a -> return $ PublicMessageLink a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result MessageLinkInfo.MessageLinkInfo) of
       T.Success a -> return $ MessageLinkInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Messages.Messages) of
       T.Success a -> return $ Messages a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TextEntities.TextEntities) of
       T.Success a -> return $ TextEntities a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result FormattedText.FormattedText) of
       T.Success a -> return $ FormattedText a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackStringValue.LanguagePackStringValue) of
       T.Success a -> return $ LanguagePackStringValue a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LoginUrlInfo.LoginUrlInfo) of
       T.Success a -> return $ LoginUrlInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result InlineQueryResults.InlineQueryResults) of
       T.Success a -> return $ InlineQueryResults a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result CallbackQueryAnswer.CallbackQueryAnswer) of
       T.Success a -> return $ CallbackQueryAnswer a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Message.Message) of
       T.Success a -> return $ Message a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result GameHighScores.GameHighScores) of
       T.Success a -> return $ GameHighScores a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result CanTransferOwnershipResult.CanTransferOwnershipResult) of
       T.Success a -> return $ CanTransferOwnershipResult a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatMember.ChatMember) of
       T.Success a -> return $ ChatMember a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatAdministrators.ChatAdministrators) of
       T.Success a -> return $ ChatAdministrators a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Chats.Chats) of
       T.Success a -> return $ Chats a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ScopeNotificationSettings.ScopeNotificationSettings) of
       T.Success a -> return $ ScopeNotificationSettings a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result FilePart.FilePart) of
       T.Success a -> return $ FilePart a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatInviteLink.ChatInviteLink) of
       T.Success a -> return $ ChatInviteLink a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatInviteLinkInfo.ChatInviteLinkInfo) of
       T.Success a -> return $ ChatInviteLinkInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Chat.Chat) of
       T.Success a -> return $ Chat a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result CallId.CallId) of
       T.Success a -> return $ CallId a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Count.Count) of
       T.Success a -> return $ Count a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ImportedContacts.ImportedContacts) of
       T.Success a -> return $ ImportedContacts a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserProfilePhotos.UserProfilePhotos) of
       T.Success a -> return $ UserProfilePhotos a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result StickerSets.StickerSets) of
       T.Success a -> return $ StickerSets a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Stickers.Stickers) of
       T.Success a -> return $ Stickers a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Emojis.Emojis) of
       T.Success a -> return $ Emojis a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Animations.Animations) of
       T.Success a -> return $ Animations a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Users.Users) of
       T.Success a -> return $ Users a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Hashtags.Hashtags) of
       T.Success a -> return $ Hashtags a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result WebPage.WebPage) of
       T.Success a -> return $ WebPage a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result WebPageInstantView.WebPageInstantView) of
       T.Success a -> return $ WebPageInstantView a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Sessions.Sessions) of
       T.Success a -> return $ Sessions a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ConnectedWebsites.ConnectedWebsites) of
       T.Success a -> return $ ConnectedWebsites a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatMembers.ChatMembers) of
       T.Success a -> return $ ChatMembers a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatEvents.ChatEvents) of
       T.Success a -> return $ ChatEvents a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PaymentForm.PaymentForm) of
       T.Success a -> return $ PaymentForm a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ValidatedOrderInfo.ValidatedOrderInfo) of
       T.Success a -> return $ ValidatedOrderInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PaymentResult.PaymentResult) of
       T.Success a -> return $ PaymentResult a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PaymentReceipt.PaymentReceipt) of
       T.Success a -> return $ PaymentReceipt a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result OrderInfo.OrderInfo) of
       T.Success a -> return $ OrderInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result User.User) of
       T.Success a -> return $ User a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Backgrounds.Backgrounds) of
       T.Success a -> return $ Backgrounds a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Background.Background) of
       T.Success a -> return $ Background a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LocalizationTargetInfo.LocalizationTargetInfo) of
       T.Success a -> return $ LocalizationTargetInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackInfo.LanguagePackInfo) of
       T.Success a -> return $ LanguagePackInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LanguagePackStrings.LanguagePackStrings) of
       T.Success a -> return $ LanguagePackStrings a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PushReceiverId.PushReceiverId) of
       T.Success a -> return $ PushReceiverId a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TMeUrls.TMeUrls) of
       T.Success a -> return $ TMeUrls a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result UserPrivacySettingRules.UserPrivacySettingRules) of
       T.Success a -> return $ UserPrivacySettingRules a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result OptionValue.OptionValue) of
       T.Success a -> return $ OptionValue a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result AccountTtl.AccountTtl) of
       T.Success a -> return $ AccountTtl a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result HttpUrl.HttpUrl) of
       T.Success a -> return $ HttpUrl a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result ChatStatistics.ChatStatistics) of
       T.Success a -> return $ ChatStatistics a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result StatisticsGraph.StatisticsGraph) of
       T.Success a -> return $ StatisticsGraph a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result StorageStatisticsFast.StorageStatisticsFast) of
       T.Success a -> return $ StorageStatisticsFast a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result DatabaseStatistics.DatabaseStatistics) of
       T.Success a -> return $ DatabaseStatistics a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result StorageStatistics.StorageStatistics) of
       T.Success a -> return $ StorageStatistics a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result NetworkStatistics.NetworkStatistics) of
       T.Success a -> return $ NetworkStatistics a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result AutoDownloadSettingsPresets.AutoDownloadSettingsPresets) of
       T.Success a -> return $ AutoDownloadSettingsPresets a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result BankCardInfo.BankCardInfo) of
       T.Success a -> return $ BankCardInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElements.PassportElements) of
       T.Success a -> return $ PassportElements a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElement.PassportElement) of
       T.Success a -> return $ PassportElement a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo) of
       T.Success a -> return $ EmailAddressAuthenticationCodeInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportAuthorizationForm.PassportAuthorizationForm) of
       T.Success a -> return $ PassportAuthorizationForm a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result PassportElementsWithErrors.PassportElementsWithErrors) of
       T.Success a -> return $ PassportElementsWithErrors a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result AuthenticationCodeInfo.AuthenticationCodeInfo) of
       T.Success a -> return $ AuthenticationCodeInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result StickerSet.StickerSet) of
       T.Success a -> return $ StickerSet a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result File.File) of
       T.Success a -> return $ File a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result CustomRequestResult.CustomRequestResult) of
       T.Success a -> return $ CustomRequestResult a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result DeepLinkInfo.DeepLinkInfo) of
       T.Success a -> return $ DeepLinkInfo a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result JsonValue.JsonValue) of
       T.Success a -> return $ JsonValue a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Proxy.Proxy) of
       T.Success a -> return $ Proxy a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Proxies.Proxies) of
       T.Success a -> return $ Proxies a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Text.Text) of
       T.Success a -> return $ Text a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Seconds.Seconds) of
       T.Success a -> return $ Seconds a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogStream.LogStream) of
       T.Success a -> return $ LogStream a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogTags.LogTags) of
       T.Success a -> return $ LogTags a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result LogVerbosityLevel.LogVerbosityLevel) of
       T.Success a -> return $ LogVerbosityLevel a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestString.TestString) of
       T.Success a -> return $ TestString a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestBytes.TestBytes) of
       T.Success a -> return $ TestBytes a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestVectorInt.TestVectorInt) of
       T.Success a -> return $ TestVectorInt a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestVectorIntObject.TestVectorIntObject) of
       T.Success a -> return $ TestVectorIntObject a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestVectorString.TestVectorString) of
       T.Success a -> return $ TestVectorString a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestVectorStringObject.TestVectorStringObject) of
       T.Success a -> return $ TestVectorStringObject a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result TestInt.TestInt) of
       T.Success a -> return $ TestInt a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Ok.Ok) of
       T.Success a -> return $ Ok a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Update.Update) of
       T.Success a -> return $ Update a e
       _ -> mempty,
      case (T.fromJSON v :: T.Result Error.Error) of
       T.Success a -> return $ Error a e
       _ -> mempty
    ]
