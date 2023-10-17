module TD.Data.CallDiscardReason
  (CallDiscardReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the reason why a call was discarded
data CallDiscardReason
  = CallDiscardReasonEmpty -- ^ The call wasn't discarded, or the reason is unknown
  | CallDiscardReasonMissed -- ^ The call was ended before the conversation started. It was canceled by the caller or missed by the other party
  | CallDiscardReasonDeclined -- ^ The call was ended before the conversation started. It was declined by the other party
  | CallDiscardReasonDisconnected -- ^ The call was ended during the conversation because the users were disconnected
  | CallDiscardReasonHungUp -- ^ The call was ended because one of the parties hung up
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

instance AT.FromJSON CallDiscardReason where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callDiscardReasonEmpty"        -> pure CallDiscardReasonEmpty
      "callDiscardReasonMissed"       -> pure CallDiscardReasonMissed
      "callDiscardReasonDeclined"     -> pure CallDiscardReasonDeclined
      "callDiscardReasonDisconnected" -> pure CallDiscardReasonDisconnected
      "callDiscardReasonHungUp"       -> pure CallDiscardReasonHungUp
      _                               -> mempty
    
  parseJSON _ = mempty

