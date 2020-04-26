-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Invoice where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LabeledPricePart as LabeledPricePart

-- |
-- 
-- Product invoice 
-- 
-- __currency__ ISO 4217 currency code
-- 
-- __price_parts__ A list of objects used to calculate the total price of the product
-- 
-- __is_test__ True, if the payment is a test payment
-- 
-- __need_name__ True, if the user's name is needed for payment
-- 
-- __need_phone_number__ True, if the user's phone number is needed for payment
-- 
-- __need_email_address__ True, if the user's email address is needed for payment
-- 
-- __need_shipping_address__ True, if the user's shipping address is needed for payment
-- 
-- __send_phone_number_to_provider__ True, if the user's phone number will be sent to the provider
-- 
-- __send_email_address_to_provider__ True, if the user's email address will be sent to the provider
-- 
-- __is_flexible__ True, if the total price depends on the shipping method
data Invoice = 
 Invoice { is_flexible :: Maybe Bool, send_email_address_to_provider :: Maybe Bool, send_phone_number_to_provider :: Maybe Bool, need_shipping_address :: Maybe Bool, need_email_address :: Maybe Bool, need_phone_number :: Maybe Bool, need_name :: Maybe Bool, is_test :: Maybe Bool, price_parts :: Maybe [LabeledPricePart.LabeledPricePart], currency :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON Invoice where
 toJSON (Invoice { is_flexible = is_flexible, send_email_address_to_provider = send_email_address_to_provider, send_phone_number_to_provider = send_phone_number_to_provider, need_shipping_address = need_shipping_address, need_email_address = need_email_address, need_phone_number = need_phone_number, need_name = need_name, is_test = is_test, price_parts = price_parts, currency = currency }) =
  A.object [ "@type" A..= T.String "invoice", "is_flexible" A..= is_flexible, "send_email_address_to_provider" A..= send_email_address_to_provider, "send_phone_number_to_provider" A..= send_phone_number_to_provider, "need_shipping_address" A..= need_shipping_address, "need_email_address" A..= need_email_address, "need_phone_number" A..= need_phone_number, "need_name" A..= need_name, "is_test" A..= is_test, "price_parts" A..= price_parts, "currency" A..= currency ]

instance T.FromJSON Invoice where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "invoice" -> parseInvoice v
   _ -> mempty
  where
   parseInvoice :: A.Value -> T.Parser Invoice
   parseInvoice = A.withObject "Invoice" $ \o -> do
    is_flexible <- o A..:? "is_flexible"
    send_email_address_to_provider <- o A..:? "send_email_address_to_provider"
    send_phone_number_to_provider <- o A..:? "send_phone_number_to_provider"
    need_shipping_address <- o A..:? "need_shipping_address"
    need_email_address <- o A..:? "need_email_address"
    need_phone_number <- o A..:? "need_phone_number"
    need_name <- o A..:? "need_name"
    is_test <- o A..:? "is_test"
    price_parts <- o A..:? "price_parts"
    currency <- o A..:? "currency"
    return $ Invoice { is_flexible = is_flexible, send_email_address_to_provider = send_email_address_to_provider, send_phone_number_to_provider = send_phone_number_to_provider, need_shipping_address = need_shipping_address, need_email_address = need_email_address, need_phone_number = need_phone_number, need_name = need_name, is_test = is_test, price_parts = price_parts, currency = currency }