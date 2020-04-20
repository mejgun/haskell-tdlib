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

--main = putStrLn "ok"

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
 | Error Error.Error -- deriving (Show)

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
-- AuthorizationState GeneralResult  AuthorizationState.AuthorizationState

-- Session GeneralResult  Session.Session

-- Updates GeneralResult  Updates.Updates

-- RecoveryEmailAddress GeneralResult  RecoveryEmailAddress.RecoveryEmailAddress

-- PasswordState GeneralResult  PasswordState.PasswordState

-- TemporaryPasswordState GeneralResult  TemporaryPasswordState.TemporaryPasswordState

-- UserFullInfo GeneralResult  UserFullInfo.UserFullInfo

-- BasicGroup GeneralResult  BasicGroup.BasicGroup

-- BasicGroupFullInfo GeneralResult  BasicGroupFullInfo.BasicGroupFullInfo

-- Supergroup GeneralResult  Supergroup.Supergroup

-- SupergroupFullInfo GeneralResult  SupergroupFullInfo.SupergroupFullInfo

-- SecretChat GeneralResult  SecretChat.SecretChat

-- ChatsNearby GeneralResult  ChatsNearby.ChatsNearby

-- CheckChatUsernameResult GeneralResult  CheckChatUsernameResult.CheckChatUsernameResult

-- FoundMessages GeneralResult  FoundMessages.FoundMessages

-- PublicMessageLink GeneralResult  PublicMessageLink.PublicMessageLink

-- MessageLinkInfo GeneralResult  MessageLinkInfo.MessageLinkInfo

-- Messages GeneralResult  Messages.Messages

-- TextEntities GeneralResult  TextEntities.TextEntities

-- FormattedText GeneralResult  FormattedText.FormattedText

-- LanguagePackStringValue GeneralResult  LanguagePackStringValue.LanguagePackStringValue

-- LoginUrlInfo GeneralResult  LoginUrlInfo.LoginUrlInfo

-- InlineQueryResults GeneralResult  InlineQueryResults.InlineQueryResults

-- CallbackQueryAnswer GeneralResult  CallbackQueryAnswer.CallbackQueryAnswer

-- Message GeneralResult  Message.Message

-- GameHighScores GeneralResult  GameHighScores.GameHighScores

-- CanTransferOwnershipResult GeneralResult  CanTransferOwnershipResult.CanTransferOwnershipResult

-- ChatMember GeneralResult  ChatMember.ChatMember

-- ChatAdministrators GeneralResult  ChatAdministrators.ChatAdministrators

-- Chats GeneralResult  Chats.Chats

-- ScopeNotificationSettings GeneralResult  ScopeNotificationSettings.ScopeNotificationSettings

-- FilePart GeneralResult  FilePart.FilePart

-- ChatInviteLink GeneralResult  ChatInviteLink.ChatInviteLink

-- ChatInviteLinkInfo GeneralResult  ChatInviteLinkInfo.ChatInviteLinkInfo

-- Chat GeneralResult  Chat.Chat

-- CallId GeneralResult  CallId.CallId

-- Count GeneralResult  Count.Count

-- ImportedContacts GeneralResult  ImportedContacts.ImportedContacts

-- UserProfilePhotos GeneralResult  UserProfilePhotos.UserProfilePhotos

-- StickerSets GeneralResult  StickerSets.StickerSets

-- Stickers GeneralResult  Stickers.Stickers

-- Emojis GeneralResult  Emojis.Emojis

-- Animations GeneralResult  Animations.Animations

-- Users GeneralResult  Users.Users

-- Hashtags GeneralResult  Hashtags.Hashtags

-- WebPage GeneralResult  WebPage.WebPage

-- WebPageInstantView GeneralResult  WebPageInstantView.WebPageInstantView

-- Sessions GeneralResult  Sessions.Sessions

-- ConnectedWebsites GeneralResult  ConnectedWebsites.ConnectedWebsites

-- ChatMembers GeneralResult  ChatMembers.ChatMembers

-- ChatEvents GeneralResult  ChatEvents.ChatEvents

-- PaymentForm GeneralResult  PaymentForm.PaymentForm

-- ValidatedOrderInfo GeneralResult  ValidatedOrderInfo.ValidatedOrderInfo

-- PaymentResult GeneralResult  PaymentResult.PaymentResult

-- PaymentReceipt GeneralResult  PaymentReceipt.PaymentReceipt

-- OrderInfo GeneralResult  OrderInfo.OrderInfo

-- User GeneralResult  User.User

-- Backgrounds GeneralResult  Backgrounds.Backgrounds

-- Background GeneralResult  Background.Background

-- LocalizationTargetInfo GeneralResult  LocalizationTargetInfo.LocalizationTargetInfo

-- LanguagePackInfo GeneralResult  LanguagePackInfo.LanguagePackInfo

-- LanguagePackStrings GeneralResult  LanguagePackStrings.LanguagePackStrings

-- PushReceiverId GeneralResult  PushReceiverId.PushReceiverId

-- TMeUrls GeneralResult  TMeUrls.TMeUrls

-- UserPrivacySettingRules GeneralResult  UserPrivacySettingRules.UserPrivacySettingRules

-- OptionValue GeneralResult  OptionValue.OptionValue

-- AccountTtl GeneralResult  AccountTtl.AccountTtl

-- HttpUrl GeneralResult  HttpUrl.HttpUrl

-- ChatStatistics GeneralResult  ChatStatistics.ChatStatistics

-- StatisticsGraph GeneralResult  StatisticsGraph.StatisticsGraph

-- StorageStatisticsFast GeneralResult  StorageStatisticsFast.StorageStatisticsFast

-- DatabaseStatistics GeneralResult  DatabaseStatistics.DatabaseStatistics

-- StorageStatistics GeneralResult  StorageStatistics.StorageStatistics

-- NetworkStatistics GeneralResult  NetworkStatistics.NetworkStatistics

-- AutoDownloadSettingsPresets GeneralResult  AutoDownloadSettingsPresets.AutoDownloadSettingsPresets

-- BankCardInfo GeneralResult  BankCardInfo.BankCardInfo

-- PassportElements GeneralResult  PassportElements.PassportElements

-- PassportElement GeneralResult  PassportElement.PassportElement

-- EmailAddressAuthenticationCodeInfo GeneralResult  EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo

-- PassportAuthorizationForm GeneralResult  PassportAuthorizationForm.PassportAuthorizationForm

-- PassportElementsWithErrors GeneralResult  PassportElementsWithErrors.PassportElementsWithErrors

-- AuthenticationCodeInfo GeneralResult  AuthenticationCodeInfo.AuthenticationCodeInfo

-- StickerSet GeneralResult  StickerSet.StickerSet

-- File GeneralResult  File.File

-- CustomRequestResult GeneralResult  CustomRequestResult.CustomRequestResult

-- DeepLinkInfo GeneralResult  DeepLinkInfo.DeepLinkInfo

-- JsonValue GeneralResult  JsonValue.JsonValue

-- Proxy GeneralResult  Proxy.Proxy

-- Proxies GeneralResult  Proxies.Proxies

-- Text GeneralResult  Text.Text

-- Seconds GeneralResult  Seconds.Seconds

-- LogStream GeneralResult  LogStream.LogStream

-- LogTags GeneralResult  LogTags.LogTags

-- LogVerbosityLevel GeneralResult  LogVerbosityLevel.LogVerbosityLevel

-- TestString GeneralResult  TestString.TestString

-- TestBytes GeneralResult  TestBytes.TestBytes

-- TestVectorInt GeneralResult  TestVectorInt.TestVectorInt

-- TestVectorIntObject GeneralResult  TestVectorIntObject.TestVectorIntObject

-- TestVectorString GeneralResult  TestVectorString.TestVectorString

-- TestVectorStringObject GeneralResult  TestVectorStringObject.TestVectorStringObject

-- TestInt GeneralResult  TestInt.TestInt

-- Ok GeneralResult  Ok.Ok

-- Update GeneralResult  Update.Update

-- Error GeneralResult  Error.Error



instance T.FromJSON GeneralResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "AuthorizationState" -> parseAuthorizationState v
   "Session" -> parseSession v
   "Updates" -> parseUpdates v
   "RecoveryEmailAddress" -> parseRecoveryEmailAddress v
   "PasswordState" -> parsePasswordState v
   "TemporaryPasswordState" -> parseTemporaryPasswordState v
   "UserFullInfo" -> parseUserFullInfo v
   "BasicGroup" -> parseBasicGroup v
   "BasicGroupFullInfo" -> parseBasicGroupFullInfo v
   "Supergroup" -> parseSupergroup v
   "SupergroupFullInfo" -> parseSupergroupFullInfo v
   "SecretChat" -> parseSecretChat v
   "ChatsNearby" -> parseChatsNearby v
   "CheckChatUsernameResult" -> parseCheckChatUsernameResult v
   "FoundMessages" -> parseFoundMessages v
   "PublicMessageLink" -> parsePublicMessageLink v
   "MessageLinkInfo" -> parseMessageLinkInfo v
   "Messages" -> parseMessages v
   "TextEntities" -> parseTextEntities v
   "FormattedText" -> parseFormattedText v
   "LanguagePackStringValue" -> parseLanguagePackStringValue v
   "LoginUrlInfo" -> parseLoginUrlInfo v
   "InlineQueryResults" -> parseInlineQueryResults v
   "CallbackQueryAnswer" -> parseCallbackQueryAnswer v
   "Message" -> parseMessage v
   "GameHighScores" -> parseGameHighScores v
   "CanTransferOwnershipResult" -> parseCanTransferOwnershipResult v
   "ChatMember" -> parseChatMember v
   "ChatAdministrators" -> parseChatAdministrators v
   "Chats" -> parseChats v
   "ScopeNotificationSettings" -> parseScopeNotificationSettings v
   "FilePart" -> parseFilePart v
   "ChatInviteLink" -> parseChatInviteLink v
   "ChatInviteLinkInfo" -> parseChatInviteLinkInfo v
   "Chat" -> parseChat v
   "CallId" -> parseCallId v
   "Count" -> parseCount v
   "ImportedContacts" -> parseImportedContacts v
   "UserProfilePhotos" -> parseUserProfilePhotos v
   "StickerSets" -> parseStickerSets v
   "Stickers" -> parseStickers v
   "Emojis" -> parseEmojis v
   "Animations" -> parseAnimations v
   "Users" -> parseUsers v
   "Hashtags" -> parseHashtags v
   "WebPage" -> parseWebPage v
   "WebPageInstantView" -> parseWebPageInstantView v
   "Sessions" -> parseSessions v
   "ConnectedWebsites" -> parseConnectedWebsites v
   "ChatMembers" -> parseChatMembers v
   "ChatEvents" -> parseChatEvents v
   "PaymentForm" -> parsePaymentForm v
   "ValidatedOrderInfo" -> parseValidatedOrderInfo v
   "PaymentResult" -> parsePaymentResult v
   "PaymentReceipt" -> parsePaymentReceipt v
   "OrderInfo" -> parseOrderInfo v
   "User" -> parseUser v
   "Backgrounds" -> parseBackgrounds v
   "Background" -> parseBackground v
   "LocalizationTargetInfo" -> parseLocalizationTargetInfo v
   "LanguagePackInfo" -> parseLanguagePackInfo v
   "LanguagePackStrings" -> parseLanguagePackStrings v
   "PushReceiverId" -> parsePushReceiverId v
   "TMeUrls" -> parseTMeUrls v
   "UserPrivacySettingRules" -> parseUserPrivacySettingRules v
   "OptionValue" -> parseOptionValue v
   "AccountTtl" -> parseAccountTtl v
   "HttpUrl" -> parseHttpUrl v
   "ChatStatistics" -> parseChatStatistics v
   "StatisticsGraph" -> parseStatisticsGraph v
   "StorageStatisticsFast" -> parseStorageStatisticsFast v
   "DatabaseStatistics" -> parseDatabaseStatistics v
   "StorageStatistics" -> parseStorageStatistics v
   "NetworkStatistics" -> parseNetworkStatistics v
   "AutoDownloadSettingsPresets" -> parseAutoDownloadSettingsPresets v
   "BankCardInfo" -> parseBankCardInfo v
   "PassportElements" -> parsePassportElements v
   "PassportElement" -> parsePassportElement v
   "EmailAddressAuthenticationCodeInfo" -> parseEmailAddressAuthenticationCodeInfo v
   "PassportAuthorizationForm" -> parsePassportAuthorizationForm v
   "PassportElementsWithErrors" -> parsePassportElementsWithErrors v
   "AuthenticationCodeInfo" -> parseAuthenticationCodeInfo v
   "StickerSet" -> parseStickerSet v
   "File" -> parseFile v
   "CustomRequestResult" -> parseCustomRequestResult v
   "DeepLinkInfo" -> parseDeepLinkInfo v
   "JsonValue" -> parseJsonValue v
   "Proxy" -> parseProxy v
   "Proxies" -> parseProxies v
   "Text" -> parseText v
   "Seconds" -> parseSeconds v
   "LogStream" -> parseLogStream v
   "LogTags" -> parseLogTags v
   "LogVerbosityLevel" -> parseLogVerbosityLevel v
   "TestString" -> parseTestString v
   "TestBytes" -> parseTestBytes v
   "TestVectorInt" -> parseTestVectorInt v
   "TestVectorIntObject" -> parseTestVectorIntObject v
   "TestVectorString" -> parseTestVectorString v
   "TestVectorStringObject" -> parseTestVectorStringObject v
   "TestInt" -> parseTestInt v
   "Ok" -> parseOk v
   "Update" -> parseUpdate v
   "Error" -> parseError v
  where
   parseAuthorizationState :: A.Value -> T.Parser GeneralResult
   parseAuthorizationState v = do
    d <- A.parseJSON v :: T.Parser AuthorizationState.AuthorizationState
    return $ AuthorizationState d

   parseSession :: A.Value -> T.Parser GeneralResult
   parseSession v = do
    d <- A.parseJSON v :: T.Parser Session.Session
    return $ Session d

   parseUpdates :: A.Value -> T.Parser GeneralResult
   parseUpdates v = do
    d <- A.parseJSON v :: T.Parser Updates.Updates
    return $ Updates d

   parseRecoveryEmailAddress :: A.Value -> T.Parser GeneralResult
   parseRecoveryEmailAddress v = do
    d <- A.parseJSON v :: T.Parser RecoveryEmailAddress.RecoveryEmailAddress
    return $ RecoveryEmailAddress d

   parsePasswordState :: A.Value -> T.Parser GeneralResult
   parsePasswordState v = do
    d <- A.parseJSON v :: T.Parser PasswordState.PasswordState
    return $ PasswordState d

   parseTemporaryPasswordState :: A.Value -> T.Parser GeneralResult
   parseTemporaryPasswordState v = do
    d <- A.parseJSON v :: T.Parser TemporaryPasswordState.TemporaryPasswordState
    return $ TemporaryPasswordState d

   parseUserFullInfo :: A.Value -> T.Parser GeneralResult
   parseUserFullInfo v = do
    d <- A.parseJSON v :: T.Parser UserFullInfo.UserFullInfo
    return $ UserFullInfo d

   parseBasicGroup :: A.Value -> T.Parser GeneralResult
   parseBasicGroup v = do
    d <- A.parseJSON v :: T.Parser BasicGroup.BasicGroup
    return $ BasicGroup d

   parseBasicGroupFullInfo :: A.Value -> T.Parser GeneralResult
   parseBasicGroupFullInfo v = do
    d <- A.parseJSON v :: T.Parser BasicGroupFullInfo.BasicGroupFullInfo
    return $ BasicGroupFullInfo d

   parseSupergroup :: A.Value -> T.Parser GeneralResult
   parseSupergroup v = do
    d <- A.parseJSON v :: T.Parser Supergroup.Supergroup
    return $ Supergroup d

   parseSupergroupFullInfo :: A.Value -> T.Parser GeneralResult
   parseSupergroupFullInfo v = do
    d <- A.parseJSON v :: T.Parser SupergroupFullInfo.SupergroupFullInfo
    return $ SupergroupFullInfo d

   parseSecretChat :: A.Value -> T.Parser GeneralResult
   parseSecretChat v = do
    d <- A.parseJSON v :: T.Parser SecretChat.SecretChat
    return $ SecretChat d

   parseChatsNearby :: A.Value -> T.Parser GeneralResult
   parseChatsNearby v = do
    d <- A.parseJSON v :: T.Parser ChatsNearby.ChatsNearby
    return $ ChatsNearby d

   parseCheckChatUsernameResult :: A.Value -> T.Parser GeneralResult
   parseCheckChatUsernameResult v = do
    d <- A.parseJSON v :: T.Parser CheckChatUsernameResult.CheckChatUsernameResult
    return $ CheckChatUsernameResult d

   parseFoundMessages :: A.Value -> T.Parser GeneralResult
   parseFoundMessages v = do
    d <- A.parseJSON v :: T.Parser FoundMessages.FoundMessages
    return $ FoundMessages d

   parsePublicMessageLink :: A.Value -> T.Parser GeneralResult
   parsePublicMessageLink v = do
    d <- A.parseJSON v :: T.Parser PublicMessageLink.PublicMessageLink
    return $ PublicMessageLink d

   parseMessageLinkInfo :: A.Value -> T.Parser GeneralResult
   parseMessageLinkInfo v = do
    d <- A.parseJSON v :: T.Parser MessageLinkInfo.MessageLinkInfo
    return $ MessageLinkInfo d

   parseMessages :: A.Value -> T.Parser GeneralResult
   parseMessages v = do
    d <- A.parseJSON v :: T.Parser Messages.Messages
    return $ Messages d

   parseTextEntities :: A.Value -> T.Parser GeneralResult
   parseTextEntities v = do
    d <- A.parseJSON v :: T.Parser TextEntities.TextEntities
    return $ TextEntities d

   parseFormattedText :: A.Value -> T.Parser GeneralResult
   parseFormattedText v = do
    d <- A.parseJSON v :: T.Parser FormattedText.FormattedText
    return $ FormattedText d

   parseLanguagePackStringValue :: A.Value -> T.Parser GeneralResult
   parseLanguagePackStringValue v = do
    d <- A.parseJSON v :: T.Parser LanguagePackStringValue.LanguagePackStringValue
    return $ LanguagePackStringValue d

   parseLoginUrlInfo :: A.Value -> T.Parser GeneralResult
   parseLoginUrlInfo v = do
    d <- A.parseJSON v :: T.Parser LoginUrlInfo.LoginUrlInfo
    return $ LoginUrlInfo d

   parseInlineQueryResults :: A.Value -> T.Parser GeneralResult
   parseInlineQueryResults v = do
    d <- A.parseJSON v :: T.Parser InlineQueryResults.InlineQueryResults
    return $ InlineQueryResults d

   parseCallbackQueryAnswer :: A.Value -> T.Parser GeneralResult
   parseCallbackQueryAnswer v = do
    d <- A.parseJSON v :: T.Parser CallbackQueryAnswer.CallbackQueryAnswer
    return $ CallbackQueryAnswer d

   parseMessage :: A.Value -> T.Parser GeneralResult
   parseMessage v = do
    d <- A.parseJSON v :: T.Parser Message.Message
    return $ Message d

   parseGameHighScores :: A.Value -> T.Parser GeneralResult
   parseGameHighScores v = do
    d <- A.parseJSON v :: T.Parser GameHighScores.GameHighScores
    return $ GameHighScores d

   parseCanTransferOwnershipResult :: A.Value -> T.Parser GeneralResult
   parseCanTransferOwnershipResult v = do
    d <- A.parseJSON v :: T.Parser CanTransferOwnershipResult.CanTransferOwnershipResult
    return $ CanTransferOwnershipResult d

   parseChatMember :: A.Value -> T.Parser GeneralResult
   parseChatMember v = do
    d <- A.parseJSON v :: T.Parser ChatMember.ChatMember
    return $ ChatMember d

   parseChatAdministrators :: A.Value -> T.Parser GeneralResult
   parseChatAdministrators v = do
    d <- A.parseJSON v :: T.Parser ChatAdministrators.ChatAdministrators
    return $ ChatAdministrators d

   parseChats :: A.Value -> T.Parser GeneralResult
   parseChats v = do
    d <- A.parseJSON v :: T.Parser Chats.Chats
    return $ Chats d

   parseScopeNotificationSettings :: A.Value -> T.Parser GeneralResult
   parseScopeNotificationSettings v = do
    d <- A.parseJSON v :: T.Parser ScopeNotificationSettings.ScopeNotificationSettings
    return $ ScopeNotificationSettings d

   parseFilePart :: A.Value -> T.Parser GeneralResult
   parseFilePart v = do
    d <- A.parseJSON v :: T.Parser FilePart.FilePart
    return $ FilePart d

   parseChatInviteLink :: A.Value -> T.Parser GeneralResult
   parseChatInviteLink v = do
    d <- A.parseJSON v :: T.Parser ChatInviteLink.ChatInviteLink
    return $ ChatInviteLink d

   parseChatInviteLinkInfo :: A.Value -> T.Parser GeneralResult
   parseChatInviteLinkInfo v = do
    d <- A.parseJSON v :: T.Parser ChatInviteLinkInfo.ChatInviteLinkInfo
    return $ ChatInviteLinkInfo d

   parseChat :: A.Value -> T.Parser GeneralResult
   parseChat v = do
    d <- A.parseJSON v :: T.Parser Chat.Chat
    return $ Chat d

   parseCallId :: A.Value -> T.Parser GeneralResult
   parseCallId v = do
    d <- A.parseJSON v :: T.Parser CallId.CallId
    return $ CallId d

   parseCount :: A.Value -> T.Parser GeneralResult
   parseCount v = do
    d <- A.parseJSON v :: T.Parser Count.Count
    return $ Count d

   parseImportedContacts :: A.Value -> T.Parser GeneralResult
   parseImportedContacts v = do
    d <- A.parseJSON v :: T.Parser ImportedContacts.ImportedContacts
    return $ ImportedContacts d

   parseUserProfilePhotos :: A.Value -> T.Parser GeneralResult
   parseUserProfilePhotos v = do
    d <- A.parseJSON v :: T.Parser UserProfilePhotos.UserProfilePhotos
    return $ UserProfilePhotos d

   parseStickerSets :: A.Value -> T.Parser GeneralResult
   parseStickerSets v = do
    d <- A.parseJSON v :: T.Parser StickerSets.StickerSets
    return $ StickerSets d

   parseStickers :: A.Value -> T.Parser GeneralResult
   parseStickers v = do
    d <- A.parseJSON v :: T.Parser Stickers.Stickers
    return $ Stickers d

   parseEmojis :: A.Value -> T.Parser GeneralResult
   parseEmojis v = do
    d <- A.parseJSON v :: T.Parser Emojis.Emojis
    return $ Emojis d

   parseAnimations :: A.Value -> T.Parser GeneralResult
   parseAnimations v = do
    d <- A.parseJSON v :: T.Parser Animations.Animations
    return $ Animations d

   parseUsers :: A.Value -> T.Parser GeneralResult
   parseUsers v = do
    d <- A.parseJSON v :: T.Parser Users.Users
    return $ Users d

   parseHashtags :: A.Value -> T.Parser GeneralResult
   parseHashtags v = do
    d <- A.parseJSON v :: T.Parser Hashtags.Hashtags
    return $ Hashtags d

   parseWebPage :: A.Value -> T.Parser GeneralResult
   parseWebPage v = do
    d <- A.parseJSON v :: T.Parser WebPage.WebPage
    return $ WebPage d

   parseWebPageInstantView :: A.Value -> T.Parser GeneralResult
   parseWebPageInstantView v = do
    d <- A.parseJSON v :: T.Parser WebPageInstantView.WebPageInstantView
    return $ WebPageInstantView d

   parseSessions :: A.Value -> T.Parser GeneralResult
   parseSessions v = do
    d <- A.parseJSON v :: T.Parser Sessions.Sessions
    return $ Sessions d

   parseConnectedWebsites :: A.Value -> T.Parser GeneralResult
   parseConnectedWebsites v = do
    d <- A.parseJSON v :: T.Parser ConnectedWebsites.ConnectedWebsites
    return $ ConnectedWebsites d

   parseChatMembers :: A.Value -> T.Parser GeneralResult
   parseChatMembers v = do
    d <- A.parseJSON v :: T.Parser ChatMembers.ChatMembers
    return $ ChatMembers d

   parseChatEvents :: A.Value -> T.Parser GeneralResult
   parseChatEvents v = do
    d <- A.parseJSON v :: T.Parser ChatEvents.ChatEvents
    return $ ChatEvents d

   parsePaymentForm :: A.Value -> T.Parser GeneralResult
   parsePaymentForm v = do
    d <- A.parseJSON v :: T.Parser PaymentForm.PaymentForm
    return $ PaymentForm d

   parseValidatedOrderInfo :: A.Value -> T.Parser GeneralResult
   parseValidatedOrderInfo v = do
    d <- A.parseJSON v :: T.Parser ValidatedOrderInfo.ValidatedOrderInfo
    return $ ValidatedOrderInfo d

   parsePaymentResult :: A.Value -> T.Parser GeneralResult
   parsePaymentResult v = do
    d <- A.parseJSON v :: T.Parser PaymentResult.PaymentResult
    return $ PaymentResult d

   parsePaymentReceipt :: A.Value -> T.Parser GeneralResult
   parsePaymentReceipt v = do
    d <- A.parseJSON v :: T.Parser PaymentReceipt.PaymentReceipt
    return $ PaymentReceipt d

   parseOrderInfo :: A.Value -> T.Parser GeneralResult
   parseOrderInfo v = do
    d <- A.parseJSON v :: T.Parser OrderInfo.OrderInfo
    return $ OrderInfo d

   parseUser :: A.Value -> T.Parser GeneralResult
   parseUser v = do
    d <- A.parseJSON v :: T.Parser User.User
    return $ User d

   parseBackgrounds :: A.Value -> T.Parser GeneralResult
   parseBackgrounds v = do
    d <- A.parseJSON v :: T.Parser Backgrounds.Backgrounds
    return $ Backgrounds d

   parseBackground :: A.Value -> T.Parser GeneralResult
   parseBackground v = do
    d <- A.parseJSON v :: T.Parser Background.Background
    return $ Background d

   parseLocalizationTargetInfo :: A.Value -> T.Parser GeneralResult
   parseLocalizationTargetInfo v = do
    d <- A.parseJSON v :: T.Parser LocalizationTargetInfo.LocalizationTargetInfo
    return $ LocalizationTargetInfo d

   parseLanguagePackInfo :: A.Value -> T.Parser GeneralResult
   parseLanguagePackInfo v = do
    d <- A.parseJSON v :: T.Parser LanguagePackInfo.LanguagePackInfo
    return $ LanguagePackInfo d

   parseLanguagePackStrings :: A.Value -> T.Parser GeneralResult
   parseLanguagePackStrings v = do
    d <- A.parseJSON v :: T.Parser LanguagePackStrings.LanguagePackStrings
    return $ LanguagePackStrings d

   parsePushReceiverId :: A.Value -> T.Parser GeneralResult
   parsePushReceiverId v = do
    d <- A.parseJSON v :: T.Parser PushReceiverId.PushReceiverId
    return $ PushReceiverId d

   parseTMeUrls :: A.Value -> T.Parser GeneralResult
   parseTMeUrls v = do
    d <- A.parseJSON v :: T.Parser TMeUrls.TMeUrls
    return $ TMeUrls d

   parseUserPrivacySettingRules :: A.Value -> T.Parser GeneralResult
   parseUserPrivacySettingRules v = do
    d <- A.parseJSON v :: T.Parser UserPrivacySettingRules.UserPrivacySettingRules
    return $ UserPrivacySettingRules d

   parseOptionValue :: A.Value -> T.Parser GeneralResult
   parseOptionValue v = do
    d <- A.parseJSON v :: T.Parser OptionValue.OptionValue
    return $ OptionValue d

   parseAccountTtl :: A.Value -> T.Parser GeneralResult
   parseAccountTtl v = do
    d <- A.parseJSON v :: T.Parser AccountTtl.AccountTtl
    return $ AccountTtl d

   parseHttpUrl :: A.Value -> T.Parser GeneralResult
   parseHttpUrl v = do
    d <- A.parseJSON v :: T.Parser HttpUrl.HttpUrl
    return $ HttpUrl d

   parseChatStatistics :: A.Value -> T.Parser GeneralResult
   parseChatStatistics v = do
    d <- A.parseJSON v :: T.Parser ChatStatistics.ChatStatistics
    return $ ChatStatistics d

   parseStatisticsGraph :: A.Value -> T.Parser GeneralResult
   parseStatisticsGraph v = do
    d <- A.parseJSON v :: T.Parser StatisticsGraph.StatisticsGraph
    return $ StatisticsGraph d

   parseStorageStatisticsFast :: A.Value -> T.Parser GeneralResult
   parseStorageStatisticsFast v = do
    d <- A.parseJSON v :: T.Parser StorageStatisticsFast.StorageStatisticsFast
    return $ StorageStatisticsFast d

   parseDatabaseStatistics :: A.Value -> T.Parser GeneralResult
   parseDatabaseStatistics v = do
    d <- A.parseJSON v :: T.Parser DatabaseStatistics.DatabaseStatistics
    return $ DatabaseStatistics d

   parseStorageStatistics :: A.Value -> T.Parser GeneralResult
   parseStorageStatistics v = do
    d <- A.parseJSON v :: T.Parser StorageStatistics.StorageStatistics
    return $ StorageStatistics d

   parseNetworkStatistics :: A.Value -> T.Parser GeneralResult
   parseNetworkStatistics v = do
    d <- A.parseJSON v :: T.Parser NetworkStatistics.NetworkStatistics
    return $ NetworkStatistics d

   parseAutoDownloadSettingsPresets :: A.Value -> T.Parser GeneralResult
   parseAutoDownloadSettingsPresets v = do
    d <- A.parseJSON v :: T.Parser AutoDownloadSettingsPresets.AutoDownloadSettingsPresets
    return $ AutoDownloadSettingsPresets d

   parseBankCardInfo :: A.Value -> T.Parser GeneralResult
   parseBankCardInfo v = do
    d <- A.parseJSON v :: T.Parser BankCardInfo.BankCardInfo
    return $ BankCardInfo d

   parsePassportElements :: A.Value -> T.Parser GeneralResult
   parsePassportElements v = do
    d <- A.parseJSON v :: T.Parser PassportElements.PassportElements
    return $ PassportElements d

   parsePassportElement :: A.Value -> T.Parser GeneralResult
   parsePassportElement v = do
    d <- A.parseJSON v :: T.Parser PassportElement.PassportElement
    return $ PassportElement d

   parseEmailAddressAuthenticationCodeInfo :: A.Value -> T.Parser GeneralResult
   parseEmailAddressAuthenticationCodeInfo v = do
    d <- A.parseJSON v :: T.Parser EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo
    return $ EmailAddressAuthenticationCodeInfo d

   parsePassportAuthorizationForm :: A.Value -> T.Parser GeneralResult
   parsePassportAuthorizationForm v = do
    d <- A.parseJSON v :: T.Parser PassportAuthorizationForm.PassportAuthorizationForm
    return $ PassportAuthorizationForm d

   parsePassportElementsWithErrors :: A.Value -> T.Parser GeneralResult
   parsePassportElementsWithErrors v = do
    d <- A.parseJSON v :: T.Parser PassportElementsWithErrors.PassportElementsWithErrors
    return $ PassportElementsWithErrors d

   parseAuthenticationCodeInfo :: A.Value -> T.Parser GeneralResult
   parseAuthenticationCodeInfo v = do
    d <- A.parseJSON v :: T.Parser AuthenticationCodeInfo.AuthenticationCodeInfo
    return $ AuthenticationCodeInfo d

   parseStickerSet :: A.Value -> T.Parser GeneralResult
   parseStickerSet v = do
    d <- A.parseJSON v :: T.Parser StickerSet.StickerSet
    return $ StickerSet d

   parseFile :: A.Value -> T.Parser GeneralResult
   parseFile v = do
    d <- A.parseJSON v :: T.Parser File.File
    return $ File d

   parseCustomRequestResult :: A.Value -> T.Parser GeneralResult
   parseCustomRequestResult v = do
    d <- A.parseJSON v :: T.Parser CustomRequestResult.CustomRequestResult
    return $ CustomRequestResult d

   parseDeepLinkInfo :: A.Value -> T.Parser GeneralResult
   parseDeepLinkInfo v = do
    d <- A.parseJSON v :: T.Parser DeepLinkInfo.DeepLinkInfo
    return $ DeepLinkInfo d

   parseJsonValue :: A.Value -> T.Parser GeneralResult
   parseJsonValue v = do
    d <- A.parseJSON v :: T.Parser JsonValue.JsonValue
    return $ JsonValue d

   parseProxy :: A.Value -> T.Parser GeneralResult
   parseProxy v = do
    d <- A.parseJSON v :: T.Parser Proxy.Proxy
    return $ Proxy d

   parseProxies :: A.Value -> T.Parser GeneralResult
   parseProxies v = do
    d <- A.parseJSON v :: T.Parser Proxies.Proxies
    return $ Proxies d

   parseText :: A.Value -> T.Parser GeneralResult
   parseText v = do
    d <- A.parseJSON v :: T.Parser Text.Text
    return $ Text d

   parseSeconds :: A.Value -> T.Parser GeneralResult
   parseSeconds v = do
    d <- A.parseJSON v :: T.Parser Seconds.Seconds
    return $ Seconds d

   parseLogStream :: A.Value -> T.Parser GeneralResult
   parseLogStream v = do
    d <- A.parseJSON v :: T.Parser LogStream.LogStream
    return $ LogStream d

   parseLogTags :: A.Value -> T.Parser GeneralResult
   parseLogTags v = do
    d <- A.parseJSON v :: T.Parser LogTags.LogTags
    return $ LogTags d

   parseLogVerbosityLevel :: A.Value -> T.Parser GeneralResult
   parseLogVerbosityLevel v = do
    d <- A.parseJSON v :: T.Parser LogVerbosityLevel.LogVerbosityLevel
    return $ LogVerbosityLevel d

   parseTestString :: A.Value -> T.Parser GeneralResult
   parseTestString v = do
    d <- A.parseJSON v :: T.Parser TestString.TestString
    return $ TestString d

   parseTestBytes :: A.Value -> T.Parser GeneralResult
   parseTestBytes v = do
    d <- A.parseJSON v :: T.Parser TestBytes.TestBytes
    return $ TestBytes d

   parseTestVectorInt :: A.Value -> T.Parser GeneralResult
   parseTestVectorInt v = do
    d <- A.parseJSON v :: T.Parser TestVectorInt.TestVectorInt
    return $ TestVectorInt d

   parseTestVectorIntObject :: A.Value -> T.Parser GeneralResult
   parseTestVectorIntObject v = do
    d <- A.parseJSON v :: T.Parser TestVectorIntObject.TestVectorIntObject
    return $ TestVectorIntObject d

   parseTestVectorString :: A.Value -> T.Parser GeneralResult
   parseTestVectorString v = do
    d <- A.parseJSON v :: T.Parser TestVectorString.TestVectorString
    return $ TestVectorString d

   parseTestVectorStringObject :: A.Value -> T.Parser GeneralResult
   parseTestVectorStringObject v = do
    d <- A.parseJSON v :: T.Parser TestVectorStringObject.TestVectorStringObject
    return $ TestVectorStringObject d

   parseTestInt :: A.Value -> T.Parser GeneralResult
   parseTestInt v = do
    d <- A.parseJSON v :: T.Parser TestInt.TestInt
    return $ TestInt d

   parseOk :: A.Value -> T.Parser GeneralResult
   parseOk v = do
    d <- A.parseJSON v :: T.Parser Ok.Ok
    return $ Ok d

   parseUpdate :: A.Value -> T.Parser GeneralResult
   parseUpdate v = do
    d <- A.parseJSON v :: T.Parser Update.Update
    return $ Update d

   parseError :: A.Value -> T.Parser GeneralResult
   parseError v = do
    d <- A.parseJSON v :: T.Parser Error.Error
    return $ Error d