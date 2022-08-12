{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AssignGooglePlayTransaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StorePaymentPurpose as StorePaymentPurpose
import qualified Utils as U

-- |
-- Informs server about a purchase through Google Play. For official applications only @package_name Application package name @store_product_id Identifier of the purchased store product @purchase_token Google Play purchase token @purpose Transaction purpose
data AssignGooglePlayTransaction = AssignGooglePlayTransaction
  { -- |
    purpose :: Maybe StorePaymentPurpose.StorePaymentPurpose,
    -- |
    purchase_token :: Maybe String,
    -- |
    store_product_id :: Maybe String,
    -- |
    package_name :: Maybe String
  }
  deriving (Eq)

instance Show AssignGooglePlayTransaction where
  show
    AssignGooglePlayTransaction
      { purpose = purpose_,
        purchase_token = purchase_token_,
        store_product_id = store_product_id_,
        package_name = package_name_
      } =
      "AssignGooglePlayTransaction"
        ++ U.cc
          [ U.p "purpose" purpose_,
            U.p "purchase_token" purchase_token_,
            U.p "store_product_id" store_product_id_,
            U.p "package_name" package_name_
          ]

instance T.ToJSON AssignGooglePlayTransaction where
  toJSON
    AssignGooglePlayTransaction
      { purpose = purpose_,
        purchase_token = purchase_token_,
        store_product_id = store_product_id_,
        package_name = package_name_
      } =
      A.object
        [ "@type" A..= T.String "assignGooglePlayTransaction",
          "purpose" A..= purpose_,
          "purchase_token" A..= purchase_token_,
          "store_product_id" A..= store_product_id_,
          "package_name" A..= package_name_
        ]
