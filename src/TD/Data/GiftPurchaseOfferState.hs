module TD.Data.GiftPurchaseOfferState
  (GiftPurchaseOfferState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes state of a gift purchase offer
data GiftPurchaseOfferState
  = GiftPurchaseOfferStatePending -- ^ The offer must be accepted or rejected
  | GiftPurchaseOfferStateAccepted -- ^ The offer was accepted
  | GiftPurchaseOfferStateRejected -- ^ The offer was rejected
  deriving (Eq, Show)

instance I.ShortShow GiftPurchaseOfferState where
  shortShow GiftPurchaseOfferStatePending
      = "GiftPurchaseOfferStatePending"
  shortShow GiftPurchaseOfferStateAccepted
      = "GiftPurchaseOfferStateAccepted"
  shortShow GiftPurchaseOfferStateRejected
      = "GiftPurchaseOfferStateRejected"

instance AT.FromJSON GiftPurchaseOfferState where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftPurchaseOfferStatePending"  -> pure GiftPurchaseOfferStatePending
      "giftPurchaseOfferStateAccepted" -> pure GiftPurchaseOfferStateAccepted
      "giftPurchaseOfferStateRejected" -> pure GiftPurchaseOfferStateRejected
      _                                -> mempty
    
  parseJSON _ = mempty

