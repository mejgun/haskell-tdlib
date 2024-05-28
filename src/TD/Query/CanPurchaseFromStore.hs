module TD.Query.CanPurchaseFromStore
  (CanPurchaseFromStore(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

-- | Checks whether an in-store purchase is possible. Must be called before any in-store purchase. Returns 'TD.Data.Ok.Ok'
data CanPurchaseFromStore
  = CanPurchaseFromStore
    { purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq, Show)

instance I.ShortShow CanPurchaseFromStore where
  shortShow
    CanPurchaseFromStore
      { purpose = purpose_
      }
        = "CanPurchaseFromStore"
          ++ I.cc
          [ "purpose" `I.p` purpose_
          ]

instance AT.ToJSON CanPurchaseFromStore where
  toJSON
    CanPurchaseFromStore
      { purpose = purpose_
      }
        = A.object
          [ "@type"   A..= AT.String "canPurchaseFromStore"
          , "purpose" A..= purpose_
          ]

