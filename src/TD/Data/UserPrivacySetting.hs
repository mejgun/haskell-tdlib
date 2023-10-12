module TD.Data.UserPrivacySetting where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data UserPrivacySetting -- ^ Describes available user privacy settings
  = UserPrivacySettingShowStatus -- ^ A privacy setting for managing whether the user's online status is visible
  | UserPrivacySettingShowProfilePhoto -- ^ A privacy setting for managing whether the user's profile photo is visible
  | UserPrivacySettingShowLinkInForwardedMessages -- ^ A privacy setting for managing whether a link to the user's account is included in forwarded messages
  | UserPrivacySettingShowPhoneNumber -- ^ A privacy setting for managing whether the user's phone number is visible
  | UserPrivacySettingShowBio -- ^ A privacy setting for managing whether the user's bio is visible
  | UserPrivacySettingAllowChatInvites -- ^ A privacy setting for managing whether the user can be invited to chats
  | UserPrivacySettingAllowCalls -- ^ A privacy setting for managing whether the user can be called
  | UserPrivacySettingAllowPeerToPeerCalls -- ^ A privacy setting for managing whether peer-to-peer connections can be used for calls
  | UserPrivacySettingAllowFindingByPhoneNumber -- ^ A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all"
  | UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages -- ^ A privacy setting for managing whether the user can receive voice and video messages in private chats
  deriving (Eq)

instance Show UserPrivacySetting where
  show UserPrivacySettingShowStatus
      = "UserPrivacySettingShowStatus"
  show UserPrivacySettingShowProfilePhoto
      = "UserPrivacySettingShowProfilePhoto"
  show UserPrivacySettingShowLinkInForwardedMessages
      = "UserPrivacySettingShowLinkInForwardedMessages"
  show UserPrivacySettingShowPhoneNumber
      = "UserPrivacySettingShowPhoneNumber"
  show UserPrivacySettingShowBio
      = "UserPrivacySettingShowBio"
  show UserPrivacySettingAllowChatInvites
      = "UserPrivacySettingAllowChatInvites"
  show UserPrivacySettingAllowCalls
      = "UserPrivacySettingAllowCalls"
  show UserPrivacySettingAllowPeerToPeerCalls
      = "UserPrivacySettingAllowPeerToPeerCalls"
  show UserPrivacySettingAllowFindingByPhoneNumber
      = "UserPrivacySettingAllowFindingByPhoneNumber"
  show UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
      = "UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages"

instance AT.FromJSON UserPrivacySetting where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userPrivacySettingShowStatus"                            -> pure UserPrivacySettingShowStatus
      "userPrivacySettingShowProfilePhoto"                      -> pure UserPrivacySettingShowProfilePhoto
      "userPrivacySettingShowLinkInForwardedMessages"           -> pure UserPrivacySettingShowLinkInForwardedMessages
      "userPrivacySettingShowPhoneNumber"                       -> pure UserPrivacySettingShowPhoneNumber
      "userPrivacySettingShowBio"                               -> pure UserPrivacySettingShowBio
      "userPrivacySettingAllowChatInvites"                      -> pure UserPrivacySettingAllowChatInvites
      "userPrivacySettingAllowCalls"                            -> pure UserPrivacySettingAllowCalls
      "userPrivacySettingAllowPeerToPeerCalls"                  -> pure UserPrivacySettingAllowPeerToPeerCalls
      "userPrivacySettingAllowFindingByPhoneNumber"             -> pure UserPrivacySettingAllowFindingByPhoneNumber
      "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages" -> pure UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
      _                                                         -> mempty
    

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
