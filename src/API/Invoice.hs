-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Invoice where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LabeledPricePart as LabeledPricePart

data Invoice = 
 Invoice { is_flexible :: Maybe Bool, send_email_address_to_provider :: Maybe Bool, send_phone_number_to_provider :: Maybe Bool, need_shipping_address :: Maybe Bool, need_email_address :: Maybe Bool, need_phone_number :: Maybe Bool, need_name :: Maybe Bool, is_test :: Maybe Bool, price_parts :: Maybe [LabeledPricePart.LabeledPricePart], currency :: Maybe String }  deriving (Show)

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
    is_flexible <- optional $ o A..: "is_flexible"
    send_email_address_to_provider <- optional $ o A..: "send_email_address_to_provider"
    send_phone_number_to_provider <- optional $ o A..: "send_phone_number_to_provider"
    need_shipping_address <- optional $ o A..: "need_shipping_address"
    need_email_address <- optional $ o A..: "need_email_address"
    need_phone_number <- optional $ o A..: "need_phone_number"
    need_name <- optional $ o A..: "need_name"
    is_test <- optional $ o A..: "is_test"
    price_parts <- optional $ o A..: "price_parts"
    currency <- optional $ o A..: "currency"
    return $ Invoice { is_flexible = is_flexible, send_email_address_to_provider = send_email_address_to_provider, send_phone_number_to_provider = send_phone_number_to_provider, need_shipping_address = need_shipping_address, need_email_address = need_email_address, need_phone_number = need_phone_number, need_name = need_name, is_test = is_test, price_parts = price_parts, currency = currency }