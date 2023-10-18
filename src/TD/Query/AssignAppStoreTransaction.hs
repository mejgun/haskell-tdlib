module TD.Query.AssignAppStoreTransaction
  (AssignAppStoreTransaction(..)
  , defaultAssignAppStoreTransaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

-- | Informs server about a purchase through App Store. For official applications only. Returns 'TD.Data.Ok.Ok'
data AssignAppStoreTransaction
  = AssignAppStoreTransaction
    { receipt :: Maybe BS.ByteString                           -- ^ App Store receipt
    , purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq, Show)

instance I.ShortShow AssignAppStoreTransaction where
  shortShow
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
          , "receipt" A..= fmap I.writeBytes  receipt_
          , "purpose" A..= purpose_
          ]

defaultAssignAppStoreTransaction :: AssignAppStoreTransaction
defaultAssignAppStoreTransaction =
  AssignAppStoreTransaction
    { receipt = Nothing
    , purpose = Nothing
    }

