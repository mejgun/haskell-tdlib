-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.Invoice as Invoice

--main = putStrLn "ok"

data PaymentReceipt = 
 PaymentReceipt { credentials_title :: String, shipping_option :: ShippingOption.ShippingOption, order_info :: OrderInfo.OrderInfo, invoice :: Invoice.Invoice, payments_provider_user_id :: Int, date :: Int }  -- deriving (Show)

instance T.ToJSON PaymentReceipt where
 toJSON (PaymentReceipt { credentials_title = credentials_title, shipping_option = shipping_option, order_info = order_info, invoice = invoice, payments_provider_user_id = payments_provider_user_id, date = date }) =
  A.object [ "@type" A..= T.String "paymentReceipt", "credentials_title" A..= credentials_title, "shipping_option" A..= shipping_option, "order_info" A..= order_info, "invoice" A..= invoice, "payments_provider_user_id" A..= payments_provider_user_id, "date" A..= date ]
-- paymentReceipt PaymentReceipt  { credentials_title :: String, shipping_option :: ShippingOption.ShippingOption, order_info :: OrderInfo.OrderInfo, invoice :: Invoice.Invoice, payments_provider_user_id :: Int, date :: Int } 

