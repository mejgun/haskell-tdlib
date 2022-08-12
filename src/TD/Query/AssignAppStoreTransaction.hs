{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AssignAppStoreTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose
import qualified Utils as U

-- |
-- Informs server about a purchase through App Store. For official applications only @receipt App Store receipt @purpose Transaction purpose
data AssignAppStoreTransaction = AssignAppStoreTransaction
  { -- |
    purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose,
    -- |
    receipt :: Maybe String
  }
  deriving (Eq)

instance Show AssignAppStoreTransaction where
  show
    AssignAppStoreTransaction
      { purpose = purpose_,
        receipt = receipt_
      } =
      "AssignAppStoreTransaction"
        ++ U.cc
          [ U.p "purpose" purpose_,
            U.p "receipt" receipt_
          ]

instance T.ToJSON AssignAppStoreTransaction where
  toJSON
    AssignAppStoreTransaction
      { purpose = purpose_,
        receipt = receipt_
      } =
      A.object
        [ "@type" A..= T.String "assignAppStoreTransaction",
          "purpose" A..= purpose_,
          "receipt" A..= receipt_
        ]
