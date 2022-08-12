{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CanPurchasePremium where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose
import qualified Utils as U

-- |
-- Checks whether Telegram Premium purchase is possible. Must be called before in-store Premium purchase @purpose Transaction purpose
data CanPurchasePremium = CanPurchasePremium
  { -- |
    purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose
  }
  deriving (Eq)

instance Show CanPurchasePremium where
  show
    CanPurchasePremium
      { purpose = purpose_
      } =
      "CanPurchasePremium"
        ++ U.cc
          [ U.p "purpose" purpose_
          ]

instance T.ToJSON CanPurchasePremium where
  toJSON
    CanPurchasePremium
      { purpose = purpose_
      } =
      A.object
        [ "@type" A..= T.String "canPurchasePremium",
          "purpose" A..= purpose_
        ]
