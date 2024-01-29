module TD.Data.ReactionUnavailabilityReason
  (ReactionUnavailabilityReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes why the current user can't add reactions to the message, despite some other users can
data ReactionUnavailabilityReason
  = ReactionUnavailabilityReasonAnonymousAdministrator -- ^ The user is an anonymous administrator in the supergroup, but isn't a creator of it, so they can't vote on behalf of the supergroup
  | ReactionUnavailabilityReasonGuest -- ^ The user isn't a member of the supergroup and can't send messages and reactions there without joining
  deriving (Eq, Show)

instance I.ShortShow ReactionUnavailabilityReason where
  shortShow ReactionUnavailabilityReasonAnonymousAdministrator
      = "ReactionUnavailabilityReasonAnonymousAdministrator"
  shortShow ReactionUnavailabilityReasonGuest
      = "ReactionUnavailabilityReasonGuest"

instance AT.FromJSON ReactionUnavailabilityReason where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reactionUnavailabilityReasonAnonymousAdministrator" -> pure ReactionUnavailabilityReasonAnonymousAdministrator
      "reactionUnavailabilityReasonGuest"                  -> pure ReactionUnavailabilityReasonGuest
      _                                                    -> mempty
    
  parseJSON _ = mempty

