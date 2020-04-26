-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SavedCredentials as SavedCredentials
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.PaymentsProviderStripe as PaymentsProviderStripe
import {-# SOURCE #-} qualified API.Invoice as Invoice

-- |
-- 
-- Contains information about an invoice payment form 
-- 
-- __invoice__ Full information of the invoice
-- 
-- __url__ Payment form URL
-- 
-- __payments_provider__ Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
-- 
-- __saved_order_info__ Saved server-side order information; may be null
-- 
-- __saved_credentials__ Contains information about saved card credentials; may be null
-- 
-- __can_save_credentials__ True, if the user can choose to save credentials
-- 
-- __need_password__ True, if the user will be able to save credentials protected by a password they set up
data PaymentForm = 
 PaymentForm { need_password :: Maybe Bool, can_save_credentials :: Maybe Bool, saved_credentials :: Maybe SavedCredentials.SavedCredentials, saved_order_info :: Maybe OrderInfo.OrderInfo, payments_provider :: Maybe PaymentsProviderStripe.PaymentsProviderStripe, url :: Maybe String, invoice :: Maybe Invoice.Invoice }  deriving (Show, Eq)

instance T.ToJSON PaymentForm where
 toJSON (PaymentForm { need_password = need_password, can_save_credentials = can_save_credentials, saved_credentials = saved_credentials, saved_order_info = saved_order_info, payments_provider = payments_provider, url = url, invoice = invoice }) =
  A.object [ "@type" A..= T.String "paymentForm", "need_password" A..= need_password, "can_save_credentials" A..= can_save_credentials, "saved_credentials" A..= saved_credentials, "saved_order_info" A..= saved_order_info, "payments_provider" A..= payments_provider, "url" A..= url, "invoice" A..= invoice ]

instance T.FromJSON PaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentForm" -> parsePaymentForm v
   _ -> mempty
  where
   parsePaymentForm :: A.Value -> T.Parser PaymentForm
   parsePaymentForm = A.withObject "PaymentForm" $ \o -> do
    need_password <- o A..:? "need_password"
    can_save_credentials <- o A..:? "can_save_credentials"
    saved_credentials <- o A..:? "saved_credentials"
    saved_order_info <- o A..:? "saved_order_info"
    payments_provider <- o A..:? "payments_provider"
    url <- o A..:? "url"
    invoice <- o A..:? "invoice"
    return $ PaymentForm { need_password = need_password, can_save_credentials = can_save_credentials, saved_credentials = saved_credentials, saved_order_info = saved_order_info, payments_provider = payments_provider, url = url, invoice = invoice }