{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputCredentials as InputCredentials
import qualified TD.Data.InputInvoice as InputInvoice
import qualified Utils as U

-- |
-- Sends a filled-out payment form to the bot for final verification
data SendPaymentForm = SendPaymentForm
  { -- | Chosen by the user amount of tip in the smallest units of the currency
    tip_amount :: Maybe Int,
    -- | The credentials chosen by user for payment
    credentials :: Maybe InputCredentials.InputCredentials,
    -- | Identifier of a chosen shipping option, if applicable
    shipping_option_id :: Maybe String,
    -- | Identifier returned by validateOrderInfo, or an empty string
    order_info_id :: Maybe String,
    -- | Payment form identifier returned by getPaymentForm
    payment_form_id :: Maybe Int,
    -- | The invoice
    input_invoice :: Maybe InputInvoice.InputInvoice
  }
  deriving (Eq)

instance Show SendPaymentForm where
  show
    SendPaymentForm
      { tip_amount = tip_amount_,
        credentials = credentials_,
        shipping_option_id = shipping_option_id_,
        order_info_id = order_info_id_,
        payment_form_id = payment_form_id_,
        input_invoice = input_invoice_
      } =
      "SendPaymentForm"
        ++ U.cc
          [ U.p "tip_amount" tip_amount_,
            U.p "credentials" credentials_,
            U.p "shipping_option_id" shipping_option_id_,
            U.p "order_info_id" order_info_id_,
            U.p "payment_form_id" payment_form_id_,
            U.p "input_invoice" input_invoice_
          ]

instance T.ToJSON SendPaymentForm where
  toJSON
    SendPaymentForm
      { tip_amount = tip_amount_,
        credentials = credentials_,
        shipping_option_id = shipping_option_id_,
        order_info_id = order_info_id_,
        payment_form_id = payment_form_id_,
        input_invoice = input_invoice_
      } =
      A.object
        [ "@type" A..= T.String "sendPaymentForm",
          "tip_amount" A..= tip_amount_,
          "credentials" A..= credentials_,
          "shipping_option_id" A..= shipping_option_id_,
          "order_info_id" A..= order_info_id_,
          "payment_form_id" A..= U.toS payment_form_id_,
          "input_invoice" A..= input_invoice_
        ]
