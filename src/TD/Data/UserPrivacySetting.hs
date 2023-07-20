{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserPrivacySetting where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes available user privacy settings
data UserPrivacySetting
  = -- | A privacy setting for managing whether the user's online status is visible
    UserPrivacySettingShowStatus
  | -- | A privacy setting for managing whether the user's profile photo is visible
    UserPrivacySettingShowProfilePhoto
  | -- | A privacy setting for managing whether a link to the user's account is included in forwarded messages
    UserPrivacySettingShowLinkInForwardedMessages
  | -- | A privacy setting for managing whether the user's phone number is visible
    UserPrivacySettingShowPhoneNumber
  | -- | A privacy setting for managing whether the user's bio is visible
    UserPrivacySettingShowBio
  | -- | A privacy setting for managing whether the user can be invited to chats
    UserPrivacySettingAllowChatInvites
  | -- | A privacy setting for managing whether the user can be called
    UserPrivacySettingAllowCalls
  | -- | A privacy setting for managing whether peer-to-peer connections can be used for calls
    UserPrivacySettingAllowPeerToPeerCalls
  | -- | A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all"
    UserPrivacySettingAllowFindingByPhoneNumber
  | -- | A privacy setting for managing whether the user can receive voice and video messages in private chats
    UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
  deriving (Eq)

instance Show UserPrivacySetting where
  show UserPrivacySettingShowStatus =
    "UserPrivacySettingShowStatus"
      ++ U.cc
        []
  show UserPrivacySettingShowProfilePhoto =
    "UserPrivacySettingShowProfilePhoto"
      ++ U.cc
        []
  show UserPrivacySettingShowLinkInForwardedMessages =
    "UserPrivacySettingShowLinkInForwardedMessages"
      ++ U.cc
        []
  show UserPrivacySettingShowPhoneNumber =
    "UserPrivacySettingShowPhoneNumber"
      ++ U.cc
        []
  show UserPrivacySettingShowBio =
    "UserPrivacySettingShowBio"
      ++ U.cc
        []
  show UserPrivacySettingAllowChatInvites =
    "UserPrivacySettingAllowChatInvites"
      ++ U.cc
        []
  show UserPrivacySettingAllowCalls =
    "UserPrivacySettingAllowCalls"
      ++ U.cc
        []
  show UserPrivacySettingAllowPeerToPeerCalls =
    "UserPrivacySettingAllowPeerToPeerCalls"
      ++ U.cc
        []
  show UserPrivacySettingAllowFindingByPhoneNumber =
    "UserPrivacySettingAllowFindingByPhoneNumber"
      ++ U.cc
        []
  show UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages =
    "UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages"
      ++ U.cc
        []

instance T.FromJSON UserPrivacySetting where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userPrivacySettingShowStatus" -> parseUserPrivacySettingShowStatus v
      "userPrivacySettingShowProfilePhoto" -> parseUserPrivacySettingShowProfilePhoto v
      "userPrivacySettingShowLinkInForwardedMessages" -> parseUserPrivacySettingShowLinkInForwardedMessages v
      "userPrivacySettingShowPhoneNumber" -> parseUserPrivacySettingShowPhoneNumber v
      "userPrivacySettingShowBio" -> parseUserPrivacySettingShowBio v
      "userPrivacySettingAllowChatInvites" -> parseUserPrivacySettingAllowChatInvites v
      "userPrivacySettingAllowCalls" -> parseUserPrivacySettingAllowCalls v
      "userPrivacySettingAllowPeerToPeerCalls" -> parseUserPrivacySettingAllowPeerToPeerCalls v
      "userPrivacySettingAllowFindingByPhoneNumber" -> parseUserPrivacySettingAllowFindingByPhoneNumber v
      "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages" -> parseUserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages v
      _ -> mempty
    where
      parseUserPrivacySettingShowStatus :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingShowStatus = A.withObject "UserPrivacySettingShowStatus" $ \_ -> return UserPrivacySettingShowStatus

      parseUserPrivacySettingShowProfilePhoto :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingShowProfilePhoto = A.withObject "UserPrivacySettingShowProfilePhoto" $ \_ -> return UserPrivacySettingShowProfilePhoto

      parseUserPrivacySettingShowLinkInForwardedMessages :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingShowLinkInForwardedMessages = A.withObject "UserPrivacySettingShowLinkInForwardedMessages" $ \_ -> return UserPrivacySettingShowLinkInForwardedMessages

      parseUserPrivacySettingShowPhoneNumber :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingShowPhoneNumber = A.withObject "UserPrivacySettingShowPhoneNumber" $ \_ -> return UserPrivacySettingShowPhoneNumber

      parseUserPrivacySettingShowBio :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingShowBio = A.withObject "UserPrivacySettingShowBio" $ \_ -> return UserPrivacySettingShowBio

      parseUserPrivacySettingAllowChatInvites :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingAllowChatInvites = A.withObject "UserPrivacySettingAllowChatInvites" $ \_ -> return UserPrivacySettingAllowChatInvites

      parseUserPrivacySettingAllowCalls :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingAllowCalls = A.withObject "UserPrivacySettingAllowCalls" $ \_ -> return UserPrivacySettingAllowCalls

      parseUserPrivacySettingAllowPeerToPeerCalls :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingAllowPeerToPeerCalls = A.withObject "UserPrivacySettingAllowPeerToPeerCalls" $ \_ -> return UserPrivacySettingAllowPeerToPeerCalls

      parseUserPrivacySettingAllowFindingByPhoneNumber :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingAllowFindingByPhoneNumber = A.withObject "UserPrivacySettingAllowFindingByPhoneNumber" $ \_ -> return UserPrivacySettingAllowFindingByPhoneNumber

      parseUserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages :: A.Value -> T.Parser UserPrivacySetting
      parseUserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages = A.withObject "UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages" $ \_ -> return UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
  parseJSON _ = mempty

instance T.ToJSON UserPrivacySetting where
  toJSON UserPrivacySettingShowStatus =
    A.object
      [ "@type" A..= T.String "userPrivacySettingShowStatus"
      ]
  toJSON UserPrivacySettingShowProfilePhoto =
    A.object
      [ "@type" A..= T.String "userPrivacySettingShowProfilePhoto"
      ]
  toJSON UserPrivacySettingShowLinkInForwardedMessages =
    A.object
      [ "@type" A..= T.String "userPrivacySettingShowLinkInForwardedMessages"
      ]
  toJSON UserPrivacySettingShowPhoneNumber =
    A.object
      [ "@type" A..= T.String "userPrivacySettingShowPhoneNumber"
      ]
  toJSON UserPrivacySettingShowBio =
    A.object
      [ "@type" A..= T.String "userPrivacySettingShowBio"
      ]
  toJSON UserPrivacySettingAllowChatInvites =
    A.object
      [ "@type" A..= T.String "userPrivacySettingAllowChatInvites"
      ]
  toJSON UserPrivacySettingAllowCalls =
    A.object
      [ "@type" A..= T.String "userPrivacySettingAllowCalls"
      ]
  toJSON UserPrivacySettingAllowPeerToPeerCalls =
    A.object
      [ "@type" A..= T.String "userPrivacySettingAllowPeerToPeerCalls"
      ]
  toJSON UserPrivacySettingAllowFindingByPhoneNumber =
    A.object
      [ "@type" A..= T.String "userPrivacySettingAllowFindingByPhoneNumber"
      ]
  toJSON UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages =
    A.object
      [ "@type" A..= T.String "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages"
      ]
