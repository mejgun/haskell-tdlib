module TD.Data.CheckChatUsernameResult
  (CheckChatUsernameResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of checking whether a username can be set for a chat
data CheckChatUsernameResult
  = CheckChatUsernameResultOk -- ^ The username can be set
  | CheckChatUsernameResultUsernameInvalid -- ^ The username is invalid
  | CheckChatUsernameResultUsernameOccupied -- ^ The username is occupied
  | CheckChatUsernameResultUsernamePurchasable -- ^ The username can be purchased at https://fragment.com. Information about the username can be received using getCollectibleItemInfo
  | CheckChatUsernameResultPublicChatsTooMany -- ^ The user has too many chats with username, one of them must be made private first
  | CheckChatUsernameResultPublicGroupsUnavailable -- ^ The user can't be a member of a public supergroup
  deriving (Eq, Show)

instance I.ShortShow CheckChatUsernameResult where
  shortShow CheckChatUsernameResultOk
      = "CheckChatUsernameResultOk"
  shortShow CheckChatUsernameResultUsernameInvalid
      = "CheckChatUsernameResultUsernameInvalid"
  shortShow CheckChatUsernameResultUsernameOccupied
      = "CheckChatUsernameResultUsernameOccupied"
  shortShow CheckChatUsernameResultUsernamePurchasable
      = "CheckChatUsernameResultUsernamePurchasable"
  shortShow CheckChatUsernameResultPublicChatsTooMany
      = "CheckChatUsernameResultPublicChatsTooMany"
  shortShow CheckChatUsernameResultPublicGroupsUnavailable
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

