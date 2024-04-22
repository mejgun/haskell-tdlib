module TD.Data.InviteLinkChatType
  (InviteLinkChatType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the type of chat to which points an invite link
data InviteLinkChatType
  = InviteLinkChatTypeBasicGroup -- ^ The link is an invite link for a basic group
  | InviteLinkChatTypeSupergroup -- ^ The link is an invite link for a supergroup
  | InviteLinkChatTypeChannel -- ^ The link is an invite link for a channel
  deriving (Eq, Show)

instance I.ShortShow InviteLinkChatType where
  shortShow InviteLinkChatTypeBasicGroup
      = "InviteLinkChatTypeBasicGroup"
  shortShow InviteLinkChatTypeSupergroup
      = "InviteLinkChatTypeSupergroup"
  shortShow InviteLinkChatTypeChannel
      = "InviteLinkChatTypeChannel"

instance AT.FromJSON InviteLinkChatType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inviteLinkChatTypeBasicGroup" -> pure InviteLinkChatTypeBasicGroup
      "inviteLinkChatTypeSupergroup" -> pure InviteLinkChatTypeSupergroup
      "inviteLinkChatTypeChannel"    -> pure InviteLinkChatTypeChannel
      _                              -> mempty
    
  parseJSON _ = mempty

