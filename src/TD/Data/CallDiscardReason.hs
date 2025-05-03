module TD.Data.CallDiscardReason
  (CallDiscardReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes the reason why a call was discarded
data CallDiscardReason
  = CallDiscardReasonEmpty -- ^ The call wasn't discarded, or the reason is unknown
  | CallDiscardReasonMissed -- ^ The call was ended before the conversation started. It was canceled by the caller or missed by the other party
  | CallDiscardReasonDeclined -- ^ The call was ended before the conversation started. It was declined by the other party
  | CallDiscardReasonDisconnected -- ^ The call was ended during the conversation because the users were disconnected
  | CallDiscardReasonHungUp -- ^ The call was ended because one of the parties hung up
  | CallDiscardReasonUpgradeToGroupCall -- ^ The call was ended because it has been upgraded to a group call
    { invite_link :: Maybe T.Text -- ^ Invite link for the group call
    }
  deriving (Eq, Show)

instance I.ShortShow CallDiscardReason where
  shortShow CallDiscardReasonEmpty
      = "CallDiscardReasonEmpty"
  shortShow CallDiscardReasonMissed
      = "CallDiscardReasonMissed"
  shortShow CallDiscardReasonDeclined
      = "CallDiscardReasonDeclined"
  shortShow CallDiscardReasonDisconnected
      = "CallDiscardReasonDisconnected"
  shortShow CallDiscardReasonHungUp
      = "CallDiscardReasonHungUp"
  shortShow CallDiscardReasonUpgradeToGroupCall
    { invite_link = invite_link_
    }
      = "CallDiscardReasonUpgradeToGroupCall"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]

instance AT.FromJSON CallDiscardReason where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callDiscardReasonEmpty"              -> pure CallDiscardReasonEmpty
      "callDiscardReasonMissed"             -> pure CallDiscardReasonMissed
      "callDiscardReasonDeclined"           -> pure CallDiscardReasonDeclined
      "callDiscardReasonDisconnected"       -> pure CallDiscardReasonDisconnected
      "callDiscardReasonHungUp"             -> pure CallDiscardReasonHungUp
      "callDiscardReasonUpgradeToGroupCall" -> parseCallDiscardReasonUpgradeToGroupCall v
      _                                     -> mempty
    
    where
      parseCallDiscardReasonUpgradeToGroupCall :: A.Value -> AT.Parser CallDiscardReason
      parseCallDiscardReasonUpgradeToGroupCall = A.withObject "CallDiscardReasonUpgradeToGroupCall" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ CallDiscardReasonUpgradeToGroupCall
          { invite_link = invite_link_
          }
  parseJSON _ = mempty

