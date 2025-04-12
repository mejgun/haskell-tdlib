module TD.Query.AssignStoreTransaction
  (AssignStoreTransaction(..)
  , defaultAssignStoreTransaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoreTransaction as StoreTransaction
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose

-- | Informs server about an in-store purchase. For official applications only. Returns 'TD.Data.Ok.Ok'
data AssignStoreTransaction
  = AssignStoreTransaction
    { transaction :: Maybe StoreTransaction.StoreTransaction       -- ^ Information about the transaction
    , purpose     :: Maybe StorePaymentPurpose.StorePaymentPurpose -- ^ Transaction purpose
    }
  deriving (Eq, Show)

instance I.ShortShow AssignStoreTransaction where
  shortShow
    AssignStoreTransaction
      { transaction = transaction_
      , purpose     = purpose_
      }
        = "AssignStoreTransaction"
          ++ I.cc
          [ "transaction" `I.p` transaction_
          , "purpose"     `I.p` purpose_
          ]

instance AT.ToJSON AssignStoreTransaction where
  toJSON
    AssignStoreTransaction
      { transaction = transaction_
      , purpose     = purpose_
      }
        = A.object
          [ "@type"       A..= AT.String "assignStoreTransaction"
          , "transaction" A..= transaction_
          , "purpose"     A..= purpose_
          ]

defaultAssignStoreTransaction :: AssignStoreTransaction
defaultAssignStoreTransaction =
  AssignStoreTransaction
    { transaction = Nothing
    , purpose     = Nothing
    }

