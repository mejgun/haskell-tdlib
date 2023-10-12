module TD.Query.AssignAppStoreTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

data AssignAppStoreTransaction -- ^ Informs server about a purchase through App Store. For official applications only
  = AssignAppStoreTransaction
    { receipt :: Maybe BS.ByteString                           -- ^ App Store receipt
    , purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq)

instance Show AssignAppStoreTransaction where
  show
    AssignAppStoreTransaction
      { receipt = receipt_
      , purpose = purpose_
      }
        = "AssignAppStoreTransaction"
          ++ I.cc
          [ "receipt" `I.p` receipt_
          , "purpose" `I.p` purpose_
          ]

instance AT.ToJSON AssignAppStoreTransaction where
  toJSON
    AssignAppStoreTransaction
      { receipt = receipt_
      , purpose = purpose_
      }
        = A.object
          [ "@type"   A..= AT.String "assignAppStoreTransaction"
          , "receipt" A..= I.toB receipt_
          , "purpose" A..= purpose_
          ]
