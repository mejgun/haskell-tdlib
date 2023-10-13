module TD.Data.CheckChatUsernameResult (CheckChatUsernameResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data CheckChatUsernameResult -- ^ Represents result of checking whether a username can be set for a chat
  = CheckChatUsernameResultOk -- ^ The username can be set
  | CheckChatUsernameResultUsernameInvalid -- ^ The username is invalid
  | CheckChatUsernameResultUsernameOccupied -- ^ The username is occupied
  | CheckChatUsernameResultUsernamePurchasable -- ^ The username can be purchased at fragment.com
  | CheckChatUsernameResultPublicChatsTooMany -- ^ The user has too many chats with username, one of them must be made private first
  | CheckChatUsernameResultPublicGroupsUnavailable -- ^ The user can't be a member of a public supergroup
  deriving (Eq)

instance Show CheckChatUsernameResult where
  show CheckChatUsernameResultOk
      = "CheckChatUsernameResultOk"
  show CheckChatUsernameResultUsernameInvalid
      = "CheckChatUsernameResultUsernameInvalid"
  show CheckChatUsernameResultUsernameOccupied
      = "CheckChatUsernameResultUsernameOccupied"
  show CheckChatUsernameResultUsernamePurchasable
      = "CheckChatUsernameResultUsernamePurchasable"
  show CheckChatUsernameResultPublicChatsTooMany
      = "CheckChatUsernameResultPublicChatsTooMany"
  show CheckChatUsernameResultPublicGroupsUnavailable
      = "CheckChatUsernameResultPublicGroupsUnavailable"

instance AT.FromJSON CheckChatUsernameResult where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "checkChatUsernameResultOk"                      -> pure CheckChatUsernameResultOk
      "checkChatUsernameResultUsernameInvalid"         -> pure CheckChatUsernameResultUsernameInvalid
      "checkChatUsernameResultUsernameOccupied"        -> pure CheckChatUsernameResultUsernameOccupied
      "checkChatUsernameResultUsernamePurchasable"     -> pure CheckChatUsernameResultUsernamePurchasable
      "checkChatUsernameResultPublicChatsTooMany"      -> pure CheckChatUsernameResultPublicChatsTooMany
      "checkChatUsernameResultPublicGroupsUnavailable" -> pure CheckChatUsernameResultPublicGroupsUnavailable
      _                                                -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON CheckChatUsernameResult where
  toJSON CheckChatUsernameResultOk
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultOk"
        ]
  toJSON CheckChatUsernameResultUsernameInvalid
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultUsernameInvalid"
        ]
  toJSON CheckChatUsernameResultUsernameOccupied
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultUsernameOccupied"
        ]
  toJSON CheckChatUsernameResultUsernamePurchasable
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultUsernamePurchasable"
        ]
  toJSON CheckChatUsernameResultPublicChatsTooMany
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultPublicChatsTooMany"
        ]
  toJSON CheckChatUsernameResultPublicGroupsUnavailable
      = A.object
        [ "@type" A..= AT.String "checkChatUsernameResultPublicGroupsUnavailable"
        ]
