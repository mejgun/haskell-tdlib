module TD.Data.GiftForResaleOrder
  (GiftForResaleOrder(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes order in which upgraded gifts for resale will be sorted
data GiftForResaleOrder
  = GiftForResaleOrderPrice -- ^ The gifts will be sorted by their price from the lowest to the highest
  | GiftForResaleOrderPriceChangeDate -- ^ The gifts will be sorted by the last date when their price was changed from the newest to the oldest
  | GiftForResaleOrderNumber -- ^ The gifts will be sorted by their number from the smallest to the largest
  deriving (Eq, Show)

instance I.ShortShow GiftForResaleOrder where
  shortShow GiftForResaleOrderPrice
      = "GiftForResaleOrderPrice"
  shortShow GiftForResaleOrderPriceChangeDate
      = "GiftForResaleOrderPriceChangeDate"
  shortShow GiftForResaleOrderNumber
      = "GiftForResaleOrderNumber"

instance AT.FromJSON GiftForResaleOrder where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftForResaleOrderPrice"           -> pure GiftForResaleOrderPrice
      "giftForResaleOrderPriceChangeDate" -> pure GiftForResaleOrderPriceChangeDate
      "giftForResaleOrderNumber"          -> pure GiftForResaleOrderNumber
      _                                   -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON GiftForResaleOrder where
  toJSON GiftForResaleOrderPrice
      = A.object
        [ "@type" A..= AT.String "giftForResaleOrderPrice"
        ]
  toJSON GiftForResaleOrderPriceChangeDate
      = A.object
        [ "@type" A..= AT.String "giftForResaleOrderPriceChangeDate"
        ]
  toJSON GiftForResaleOrderNumber
      = A.object
        [ "@type" A..= AT.String "giftForResaleOrderNumber"
        ]

