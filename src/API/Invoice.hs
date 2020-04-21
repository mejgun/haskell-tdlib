-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Invoice where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LabeledPricePart as LabeledPricePart

--main = putStrLn "ok"

data Invoice = 
 Invoice { is_flexible :: Bool, send_email_address_to_provider :: Bool, send_phone_number_to_provider :: Bool, need_shipping_address :: Bool, need_email_address :: Bool, need_phone_number :: Bool, need_name :: Bool, is_test :: Bool, price_parts :: [LabeledPricePart.LabeledPricePart], currency :: String }  deriving (Show)

instance T.ToJSON Invoice where
 toJSON (Invoice { is_flexible = is_flexible, send_email_address_to_provider = send_email_address_to_provider, send_phone_number_to_provider = send_phone_number_to_provider, need_shipping_address = need_shipping_address, need_email_address = need_email_address, need_phone_number = need_phone_number, need_name = need_name, is_test = is_test, price_parts = price_parts, currency = currency }) =
  A.object [ "@type" A..= T.String "invoice", "is_flexible" A..= is_flexible, "send_email_address_to_provider" A..= send_email_address_to_provider, "send_phone_number_to_provider" A..= send_phone_number_to_provider, "need_shipping_address" A..= need_shipping_address, "need_email_address" A..= need_email_address, "need_phone_number" A..= need_phone_number, "need_name" A..= need_name, "is_test" A..= is_test, "price_parts" A..= price_parts, "currency" A..= currency ]



instance T.FromJSON Invoice where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "invoice" -> parseInvoice v

   _ -> mempty ""
  where
   parseInvoice :: A.Value -> T.Parser Invoice
   parseInvoice = A.withObject "Invoice" $ \o -> do
    is_flexible <- o A..: "is_flexible"
    send_email_address_to_provider <- o A..: "send_email_address_to_provider"
    send_phone_number_to_provider <- o A..: "send_phone_number_to_provider"
    need_shipping_address <- o A..: "need_shipping_address"
    need_email_address <- o A..: "need_email_address"
    need_phone_number <- o A..: "need_phone_number"
    need_name <- o A..: "need_name"
    is_test <- o A..: "is_test"
    price_parts <- o A..: "price_parts"
    currency <- o A..: "currency"
    return $ Invoice { is_flexible = is_flexible, send_email_address_to_provider = send_email_address_to_provider, send_phone_number_to_provider = send_phone_number_to_provider, need_shipping_address = need_shipping_address, need_email_address = need_email_address, need_phone_number = need_phone_number, need_name = need_name, is_test = is_test, price_parts = price_parts, currency = currency }