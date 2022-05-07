{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputCredentials as InputCredentials
import qualified Utils as U

-- |
-- Sends a filled-out payment form to the bot for final verification @chat_id Chat identifier of the Invoice message @message_id Message identifier
data SendPaymentForm = SendPaymentForm
  { -- |
    tip_amount :: Maybe Int,
    -- | The credentials chosen by user for payment @tip_amount Chosen by the user amount of tip in the smallest units of the currency
    credentials :: Maybe InputCredentials.InputCredentials,
    -- |
    shipping_option_id :: Maybe String,
    -- |
    order_info_id :: Maybe String,
    -- | Payment form identifier returned by getPaymentForm @order_info_id Identifier returned by validateOrderInfo, or an empty string @shipping_option_id Identifier of a chosen shipping option, if applicable
    payment_form_id :: Maybe Int,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendPaymentForm where
  show
    SendPaymentForm
      { tip_amount = tip_amount,
        credentials = credentials,
        shipping_option_id = shipping_option_id,
        order_info_id = order_info_id,
        payment_form_id = payment_form_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      "SendPaymentForm"
        ++ U.cc
          [ U.p "tip_amount" tip_amount,
            U.p "credentials" credentials,
            U.p "shipping_option_id" shipping_option_id,
            U.p "order_info_id" order_info_id,
            U.p "payment_form_id" payment_form_id,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SendPaymentForm where
  toJSON
    SendPaymentForm
      { tip_amount = tip_amount,
        credentials = credentials,
        shipping_option_id = shipping_option_id,
        order_info_id = order_info_id,
        payment_form_id = payment_form_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "sendPaymentForm",
          "tip_amount" A..= tip_amount,
          "credentials" A..= credentials,
          "shipping_option_id" A..= shipping_option_id,
          "order_info_id" A..= order_info_id,
          "payment_form_id" A..= payment_form_id,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
