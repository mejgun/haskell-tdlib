module TD.Data.SuggestedPostRefundReason
  (SuggestedPostRefundReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes reason for refund of the payment for a suggested post
data SuggestedPostRefundReason
  = SuggestedPostRefundReasonPostDeleted -- ^ The post was refunded, because it was deleted by channel administrators in less than getOption("suggested_post_lifetime_min") seconds
  | SuggestedPostRefundReasonPaymentRefunded -- ^ The post was refunded, because the payment for the post was refunded
  deriving (Eq, Show)

instance I.ShortShow SuggestedPostRefundReason where
  shortShow SuggestedPostRefundReasonPostDeleted
      = "SuggestedPostRefundReasonPostDeleted"
  shortShow SuggestedPostRefundReasonPaymentRefunded
      = "SuggestedPostRefundReasonPaymentRefunded"

instance AT.FromJSON SuggestedPostRefundReason where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedPostRefundReasonPostDeleted"     -> pure SuggestedPostRefundReasonPostDeleted
      "suggestedPostRefundReasonPaymentRefunded" -> pure SuggestedPostRefundReasonPaymentRefunded
      _                                          -> mempty
    
  parseJSON _ = mempty

