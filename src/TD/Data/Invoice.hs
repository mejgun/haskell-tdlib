{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Invoice where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LabeledPricePart as LabeledPricePart
import qualified Utils as U

-- |
data Invoice = -- | Product invoice
  Invoice
  { -- | True, if the total price depends on the shipping method
    is_flexible :: Maybe Bool,
    -- | True, if the user's email address will be sent to the provider
    send_email_address_to_provider :: Maybe Bool,
    -- | True, if the user's phone number will be sent to the provider
    send_phone_number_to_provider :: Maybe Bool,
    -- | True, if the user's shipping address is needed for payment
    need_shipping_address :: Maybe Bool,
    -- | True, if the user's email address is needed for payment
    need_email_address :: Maybe Bool,
    -- | True, if the user's phone number is needed for payment
    need_phone_number :: Maybe Bool,
    -- | True, if the user's name is needed for payment
    need_name :: Maybe Bool,
    -- | True, if the payment is a test payment
    is_test :: Maybe Bool,
    -- | An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay
    terms_of_service_url :: Maybe String,
    -- | An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay
    recurring_payment_terms_of_service_url :: Maybe String,
    -- | Suggested amounts of tip in the smallest units of the currency
    suggested_tip_amounts :: Maybe [Int],
    -- | The maximum allowed amount of tip in the smallest units of the currency
    max_tip_amount :: Maybe Int,
    -- | A list of objects used to calculate the total price of the product
    price_parts :: Maybe [LabeledPricePart.LabeledPricePart],
    -- | ISO 4217 currency code
    currency :: Maybe String
  }
  deriving (Eq)

instance Show Invoice where
  show
    Invoice
      { is_flexible = is_flexible_,
        send_email_address_to_provider = send_email_address_to_provider_,
        send_phone_number_to_provider = send_phone_number_to_provider_,
        need_shipping_address = need_shipping_address_,
        need_email_address = need_email_address_,
        need_phone_number = need_phone_number_,
        need_name = need_name_,
        is_test = is_test_,
        terms_of_service_url = terms_of_service_url_,
        recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_,
        suggested_tip_amounts = suggested_tip_amounts_,
        max_tip_amount = max_tip_amount_,
        price_parts = price_parts_,
        currency = currency_
      } =
      "Invoice"
        ++ U.cc
          [ U.p "is_flexible" is_flexible_,
            U.p "send_email_address_to_provider" send_email_address_to_provider_,
            U.p "send_phone_number_to_provider" send_phone_number_to_provider_,
            U.p "need_shipping_address" need_shipping_address_,
            U.p "need_email_address" need_email_address_,
            U.p "need_phone_number" need_phone_number_,
            U.p "need_name" need_name_,
            U.p "is_test" is_test_,
            U.p "terms_of_service_url" terms_of_service_url_,
            U.p "recurring_payment_terms_of_service_url" recurring_payment_terms_of_service_url_,
            U.p "suggested_tip_amounts" suggested_tip_amounts_,
            U.p "max_tip_amount" max_tip_amount_,
            U.p "price_parts" price_parts_,
            U.p "currency" currency_
          ]

instance T.FromJSON Invoice where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "invoice" -> parseInvoice v
      _ -> mempty
    where
      parseInvoice :: A.Value -> T.Parser Invoice
      parseInvoice = A.withObject "Invoice" $ \o -> do
        is_flexible_ <- o A..:? "is_flexible"
        send_email_address_to_provider_ <- o A..:? "send_email_address_to_provider"
        send_phone_number_to_provider_ <- o A..:? "send_phone_number_to_provider"
        need_shipping_address_ <- o A..:? "need_shipping_address"
        need_email_address_ <- o A..:? "need_email_address"
        need_phone_number_ <- o A..:? "need_phone_number"
        need_name_ <- o A..:? "need_name"
        is_test_ <- o A..:? "is_test"
        terms_of_service_url_ <- o A..:? "terms_of_service_url"
        recurring_payment_terms_of_service_url_ <- o A..:? "recurring_payment_terms_of_service_url"
        suggested_tip_amounts_ <- o A..:? "suggested_tip_amounts"
        max_tip_amount_ <- o A..:? "max_tip_amount"
        price_parts_ <- o A..:? "price_parts"
        currency_ <- o A..:? "currency"
        return $ Invoice {is_flexible = is_flexible_, send_email_address_to_provider = send_email_address_to_provider_, send_phone_number_to_provider = send_phone_number_to_provider_, need_shipping_address = need_shipping_address_, need_email_address = need_email_address_, need_phone_number = need_phone_number_, need_name = need_name_, is_test = is_test_, terms_of_service_url = terms_of_service_url_, recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_, suggested_tip_amounts = suggested_tip_amounts_, max_tip_amount = max_tip_amount_, price_parts = price_parts_, currency = currency_}
  parseJSON _ = mempty

instance T.ToJSON Invoice where
  toJSON
    Invoice
      { is_flexible = is_flexible_,
        send_email_address_to_provider = send_email_address_to_provider_,
        send_phone_number_to_provider = send_phone_number_to_provider_,
        need_shipping_address = need_shipping_address_,
        need_email_address = need_email_address_,
        need_phone_number = need_phone_number_,
        need_name = need_name_,
        is_test = is_test_,
        terms_of_service_url = terms_of_service_url_,
        recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_,
        suggested_tip_amounts = suggested_tip_amounts_,
        max_tip_amount = max_tip_amount_,
        price_parts = price_parts_,
        currency = currency_
      } =
      A.object
        [ "@type" A..= T.String "invoice",
          "is_flexible" A..= is_flexible_,
          "send_email_address_to_provider" A..= send_email_address_to_provider_,
          "send_phone_number_to_provider" A..= send_phone_number_to_provider_,
          "need_shipping_address" A..= need_shipping_address_,
          "need_email_address" A..= need_email_address_,
          "need_phone_number" A..= need_phone_number_,
          "need_name" A..= need_name_,
          "is_test" A..= is_test_,
          "terms_of_service_url" A..= terms_of_service_url_,
          "recurring_payment_terms_of_service_url" A..= recurring_payment_terms_of_service_url_,
          "suggested_tip_amounts" A..= suggested_tip_amounts_,
          "max_tip_amount" A..= max_tip_amount_,
          "price_parts" A..= price_parts_,
          "currency" A..= currency_
        ]
