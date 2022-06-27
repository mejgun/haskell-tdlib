{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ValidateOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputInvoice as InputInvoice
import qualified TD.Data.OrderInfo as OrderInfo
import qualified Utils as U

-- |
-- Validates the order information provided by a user and returns the available shipping options for a flexible invoice
data ValidateOrderInfo = ValidateOrderInfo
  { -- | Pass true to save the order information
    allow_save :: Maybe Bool,
    -- | The order information, provided by the user; pass null if empty
    order_info :: Maybe OrderInfo.OrderInfo,
    -- | The invoice
    input_invoice :: Maybe InputInvoice.InputInvoice
  }
  deriving (Eq)

instance Show ValidateOrderInfo where
  show
    ValidateOrderInfo
      { allow_save = allow_save_,
        order_info = order_info_,
        input_invoice = input_invoice_
      } =
      "ValidateOrderInfo"
        ++ U.cc
          [ U.p "allow_save" allow_save_,
            U.p "order_info" order_info_,
            U.p "input_invoice" input_invoice_
          ]

instance T.ToJSON ValidateOrderInfo where
  toJSON
    ValidateOrderInfo
      { allow_save = allow_save_,
        order_info = order_info_,
        input_invoice = input_invoice_
      } =
      A.object
        [ "@type" A..= T.String "validateOrderInfo",
          "allow_save" A..= allow_save_,
          "order_info" A..= order_info_,
          "input_invoice" A..= input_invoice_
        ]
