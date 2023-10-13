module TD.Query.CanPurchasePremium
  (CanPurchasePremium(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

-- | Checks whether Telegram Premium purchase is possible. Must be called before in-store Premium purchase
data CanPurchasePremium
  = CanPurchasePremium
    { purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq)

instance Show CanPurchasePremium where
  show
    CanPurchasePremium
      { purpose = purpose_
      }
        = "CanPurchasePremium"
          ++ I.cc
          [ "purpose" `I.p` purpose_
          ]

instance AT.ToJSON CanPurchasePremium where
  toJSON
    CanPurchasePremium
      { purpose = purpose_
      }
        = A.object
          [ "@type"   A..= AT.String "canPurchasePremium"
          , "purpose" A..= purpose_
          ]

