module TD.Data.UserPrivacySetting
  (UserPrivacySetting(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes available user privacy settings
data UserPrivacySetting
  = UserPrivacySettingShowStatus -- ^ A privacy setting for managing whether the user's online status is visible
  | UserPrivacySettingShowProfilePhoto -- ^ A privacy setting for managing whether the user's profile photo is visible
  | UserPrivacySettingShowLinkInForwardedMessages -- ^ A privacy setting for managing whether a link to the user's account is included in forwarded messages
  | UserPrivacySettingShowPhoneNumber -- ^ A privacy setting for managing whether the user's phone number is visible
  | UserPrivacySettingShowBio -- ^ A privacy setting for managing whether the user's bio is visible
  | UserPrivacySettingShowBirthdate -- ^ A privacy setting for managing whether the user's birthdate is visible
  | UserPrivacySettingAllowChatInvites -- ^ A privacy setting for managing whether the user can be invited to chats
  | UserPrivacySettingAllowCalls -- ^ A privacy setting for managing whether the user can be called
  | UserPrivacySettingAllowPeerToPeerCalls -- ^ A privacy setting for managing whether peer-to-peer connections can be used for calls
  | UserPrivacySettingAllowFindingByPhoneNumber -- ^ A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all"
  | UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages -- ^ A privacy setting for managing whether the user can receive voice and video messages in private chats; for Telegram Premium users only
  | UserPrivacySettingAutosaveGifts -- ^ A privacy setting for managing whether received gifts are automatically shown on the user's profile page
  deriving (Eq, Show)

instance I.ShortShow UserPrivacySetting where
  shortShow UserPrivacySettingShowStatus
      = "UserPrivacySettingShowStatus"
  shortShow UserPrivacySettingShowProfilePhoto
      = "UserPrivacySettingShowProfilePhoto"
  shortShow UserPrivacySettingShowLinkInForwardedMessages
      = "UserPrivacySettingShowLinkInForwardedMessages"
  shortShow UserPrivacySettingShowPhoneNumber
      = "UserPrivacySettingShowPhoneNumber"
  shortShow UserPrivacySettingShowBio
      = "UserPrivacySettingShowBio"
  shortShow UserPrivacySettingShowBirthdate
      = "UserPrivacySettingShowBirthdate"
  shortShow UserPrivacySettingAllowChatInvites
      = "UserPrivacySettingAllowChatInvites"
  shortShow UserPrivacySettingAllowCalls
      = "UserPrivacySettingAllowCalls"
  shortShow UserPrivacySettingAllowPeerToPeerCalls
      = "UserPrivacySettingAllowPeerToPeerCalls"
  shortShow UserPrivacySettingAllowFindingByPhoneNumber
      = "UserPrivacySettingAllowFindingByPhoneNumber"
  shortShow UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
      = "UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages"
  shortShow UserPrivacySettingAutosaveGifts
      = "UserPrivacySettingAutosaveGifts"

instance AT.FromJSON UserPrivacySetting where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userPrivacySettingShowStatus"                            -> pure UserPrivacySettingShowStatus
      "userPrivacySettingShowProfilePhoto"                      -> pure UserPrivacySettingShowProfilePhoto
      "userPrivacySettingShowLinkInForwardedMessages"           -> pure UserPrivacySettingShowLinkInForwardedMessages
      "userPrivacySettingShowPhoneNumber"                       -> pure UserPrivacySettingShowPhoneNumber
      "userPrivacySettingShowBio"                               -> pure UserPrivacySettingShowBio
      "userPrivacySettingShowBirthdate"                         -> pure UserPrivacySettingShowBirthdate
      "userPrivacySettingAllowChatInvites"                      -> pure UserPrivacySettingAllowChatInvites
      "userPrivacySettingAllowCalls"                            -> pure UserPrivacySettingAllowCalls
      "userPrivacySettingAllowPeerToPeerCalls"                  -> pure UserPrivacySettingAllowPeerToPeerCalls
      "userPrivacySettingAllowFindingByPhoneNumber"             -> pure UserPrivacySettingAllowFindingByPhoneNumber
      "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages" -> pure UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
      "userPrivacySettingAutosaveGifts"                         -> pure UserPrivacySettingAutosaveGifts
      _                                                         -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON UserPrivacySetting where
  toJSON UserPrivacySettingShowStatus
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowStatus"
        ]
  toJSON UserPrivacySettingShowProfilePhoto
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowProfilePhoto"
        ]
  toJSON UserPrivacySettingShowLinkInForwardedMessages
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowLinkInForwardedMessages"
        ]
  toJSON UserPrivacySettingShowPhoneNumber
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowPhoneNumber"
        ]
  toJSON UserPrivacySettingShowBio
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowBio"
        ]
  toJSON UserPrivacySettingShowBirthdate
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingShowBirthdate"
        ]
  toJSON UserPrivacySettingAllowChatInvites
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAllowChatInvites"
        ]
  toJSON UserPrivacySettingAllowCalls
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAllowCalls"
        ]
  toJSON UserPrivacySettingAllowPeerToPeerCalls
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAllowPeerToPeerCalls"
        ]
  toJSON UserPrivacySettingAllowFindingByPhoneNumber
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAllowFindingByPhoneNumber"
        ]
  toJSON UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages"
        ]
  toJSON UserPrivacySettingAutosaveGifts
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingAutosaveGifts"
        ]

