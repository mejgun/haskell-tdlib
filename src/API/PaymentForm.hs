-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SavedCredentials as SavedCredentials
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.PaymentsProviderStripe as PaymentsProviderStripe
import {-# SOURCE #-} qualified API.Invoice as Invoice

--main = putStrLn "ok"

data PaymentForm = 
 PaymentForm { need_password :: Bool, can_save_credentials :: Bool, saved_credentials :: SavedCredentials.SavedCredentials, saved_order_info :: OrderInfo.OrderInfo, payments_provider :: PaymentsProviderStripe.PaymentsProviderStripe, url :: String, invoice :: Invoice.Invoice }  -- deriving (Show)

instance T.ToJSON PaymentForm where
 toJSON (PaymentForm { need_password = need_password, can_save_credentials = can_save_credentials, saved_credentials = saved_credentials, saved_order_info = saved_order_info, payments_provider = payments_provider, url = url, invoice = invoice }) =
  A.object [ "@type" A..= T.String "paymentForm", "need_password" A..= need_password, "can_save_credentials" A..= can_save_credentials, "saved_credentials" A..= saved_credentials, "saved_order_info" A..= saved_order_info, "payments_provider" A..= payments_provider, "url" A..= url, "invoice" A..= invoice ]
-- paymentForm PaymentForm  { need_password :: Bool, can_save_credentials :: Bool, saved_credentials :: SavedCredentials.SavedCredentials, saved_order_info :: OrderInfo.OrderInfo, payments_provider :: PaymentsProviderStripe.PaymentsProviderStripe, url :: String, invoice :: Invoice.Invoice } 

