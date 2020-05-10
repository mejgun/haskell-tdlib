-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentReceipt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.Invoice as Invoice

-- |
-- 
-- Contains information about a successful payment 
-- 
-- __date__ Point in time (Unix timestamp) when the payment was made
-- 
-- __payments_provider_user_id__ User identifier of the payment provider bot
-- 
-- __invoice__ Contains information about the invoice
-- 
-- __order_info__ Contains order information; may be null
-- 
-- __shipping_option__ Chosen shipping option; may be null
-- 
-- __credentials_title__ Title of the saved credentials
data PaymentReceipt = 

 PaymentReceipt { credentials_title :: Maybe String, shipping_option :: Maybe ShippingOption.ShippingOption, order_info :: Maybe OrderInfo.OrderInfo, invoice :: Maybe Invoice.Invoice, payments_provider_user_id :: Maybe Int, date :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PaymentReceipt where
 toJSON (PaymentReceipt { credentials_title = credentials_title, shipping_option = shipping_option, order_info = order_info, invoice = invoice, payments_provider_user_id = payments_provider_user_id, date = date }) =
  A.object [ "@type" A..= T.String "paymentReceipt", "credentials_title" A..= credentials_title, "shipping_option" A..= shipping_option, "order_info" A..= order_info, "invoice" A..= invoice, "payments_provider_user_id" A..= payments_provider_user_id, "date" A..= date ]

instance T.FromJSON PaymentReceipt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentReceipt" -> parsePaymentReceipt v
   _ -> mempty
  where
   parsePaymentReceipt :: A.Value -> T.Parser PaymentReceipt
   parsePaymentReceipt = A.withObject "PaymentReceipt" $ \o -> do
    credentials_title <- o A..:? "credentials_title"
    shipping_option <- o A..:? "shipping_option"
    order_info <- o A..:? "order_info"
    invoice <- o A..:? "invoice"
    payments_provider_user_id <- mconcat [ o A..:? "payments_provider_user_id", readMaybe <$> (o A..: "payments_provider_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PaymentReceipt { credentials_title = credentials_title, shipping_option = shipping_option, order_info = order_info, invoice = invoice, payments_provider_user_id = payments_provider_user_id, date = date }