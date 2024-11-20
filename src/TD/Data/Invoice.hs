module TD.Data.Invoice
  ( Invoice(..)    
  , defaultInvoice 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.LabeledPricePart as LabeledPricePart

data Invoice
  = Invoice -- ^ Product invoice
    { currency                               :: Maybe T.Text                              -- ^ ISO 4217 currency code
    , price_parts                            :: Maybe [LabeledPricePart.LabeledPricePart] -- ^ A list of objects used to calculate the total price of the product
    , subscription_period                    :: Maybe Int                                 -- ^ The number of seconds between consecutive Telegram Star debiting for subscription invoices; 0 if the invoice doesn't create subscription
    , max_tip_amount                         :: Maybe Int                                 -- ^ The maximum allowed amount of tip in the smallest units of the currency
    , suggested_tip_amounts                  :: Maybe [Int]                               -- ^ Suggested amounts of tip in the smallest units of the currency
    , recurring_payment_terms_of_service_url :: Maybe T.Text                              -- ^ An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay
    , terms_of_service_url                   :: Maybe T.Text                              -- ^ An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay
    , is_test                                :: Maybe Bool                                -- ^ True, if the payment is a test payment
    , need_name                              :: Maybe Bool                                -- ^ True, if the user's name is needed for payment
    , need_phone_number                      :: Maybe Bool                                -- ^ True, if the user's phone number is needed for payment
    , need_email_address                     :: Maybe Bool                                -- ^ True, if the user's email address is needed for payment
    , need_shipping_address                  :: Maybe Bool                                -- ^ True, if the user's shipping address is needed for payment
    , send_phone_number_to_provider          :: Maybe Bool                                -- ^ True, if the user's phone number will be sent to the provider
    , send_email_address_to_provider         :: Maybe Bool                                -- ^ True, if the user's email address will be sent to the provider
    , is_flexible                            :: Maybe Bool                                -- ^ True, if the total price depends on the shipping method
    }
  deriving (Eq, Show)

instance I.ShortShow Invoice where
  shortShow Invoice
    { currency                               = currency_
    , price_parts                            = price_parts_
    , subscription_period                    = subscription_period_
    , max_tip_amount                         = max_tip_amount_
    , suggested_tip_amounts                  = suggested_tip_amounts_
    , recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_
    , terms_of_service_url                   = terms_of_service_url_
    , is_test                                = is_test_
    , need_name                              = need_name_
    , need_phone_number                      = need_phone_number_
    , need_email_address                     = need_email_address_
    , need_shipping_address                  = need_shipping_address_
    , send_phone_number_to_provider          = send_phone_number_to_provider_
    , send_email_address_to_provider         = send_email_address_to_provider_
    , is_flexible                            = is_flexible_
    }
      = "Invoice"
        ++ I.cc
        [ "currency"                               `I.p` currency_
        , "price_parts"                            `I.p` price_parts_
        , "subscription_period"                    `I.p` subscription_period_
        , "max_tip_amount"                         `I.p` max_tip_amount_
        , "suggested_tip_amounts"                  `I.p` suggested_tip_amounts_
        , "recurring_payment_terms_of_service_url" `I.p` recurring_payment_terms_of_service_url_
        , "terms_of_service_url"                   `I.p` terms_of_service_url_
        , "is_test"                                `I.p` is_test_
        , "need_name"                              `I.p` need_name_
        , "need_phone_number"                      `I.p` need_phone_number_
        , "need_email_address"                     `I.p` need_email_address_
        , "need_shipping_address"                  `I.p` need_shipping_address_
        , "send_phone_number_to_provider"          `I.p` send_phone_number_to_provider_
        , "send_email_address_to_provider"         `I.p` send_email_address_to_provider_
        , "is_flexible"                            `I.p` is_flexible_
        ]

instance AT.FromJSON Invoice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "invoice" -> parseInvoice v
      _         -> mempty
    
    where
      parseInvoice :: A.Value -> AT.Parser Invoice
      parseInvoice = A.withObject "Invoice" $ \o -> do
        currency_                               <- o A..:?  "currency"
        price_parts_                            <- o A..:?  "price_parts"
        subscription_period_                    <- o A..:?  "subscription_period"
        max_tip_amount_                         <- o A..:?  "max_tip_amount"
        suggested_tip_amounts_                  <- o A..:?  "suggested_tip_amounts"
        recurring_payment_terms_of_service_url_ <- o A..:?  "recurring_payment_terms_of_service_url"
        terms_of_service_url_                   <- o A..:?  "terms_of_service_url"
        is_test_                                <- o A..:?  "is_test"
        need_name_                              <- o A..:?  "need_name"
        need_phone_number_                      <- o A..:?  "need_phone_number"
        need_email_address_                     <- o A..:?  "need_email_address"
        need_shipping_address_                  <- o A..:?  "need_shipping_address"
        send_phone_number_to_provider_          <- o A..:?  "send_phone_number_to_provider"
        send_email_address_to_provider_         <- o A..:?  "send_email_address_to_provider"
        is_flexible_                            <- o A..:?  "is_flexible"
        pure $ Invoice
          { currency                               = currency_
          , price_parts                            = price_parts_
          , subscription_period                    = subscription_period_
          , max_tip_amount                         = max_tip_amount_
          , suggested_tip_amounts                  = suggested_tip_amounts_
          , recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_
          , terms_of_service_url                   = terms_of_service_url_
          , is_test                                = is_test_
          , need_name                              = need_name_
          , need_phone_number                      = need_phone_number_
          , need_email_address                     = need_email_address_
          , need_shipping_address                  = need_shipping_address_
          , send_phone_number_to_provider          = send_phone_number_to_provider_
          , send_email_address_to_provider         = send_email_address_to_provider_
          , is_flexible                            = is_flexible_
          }
  parseJSON _ = mempty

instance AT.ToJSON Invoice where
  toJSON Invoice
    { currency                               = currency_
    , price_parts                            = price_parts_
    , subscription_period                    = subscription_period_
    , max_tip_amount                         = max_tip_amount_
    , suggested_tip_amounts                  = suggested_tip_amounts_
    , recurring_payment_terms_of_service_url = recurring_payment_terms_of_service_url_
    , terms_of_service_url                   = terms_of_service_url_
    , is_test                                = is_test_
    , need_name                              = need_name_
    , need_phone_number                      = need_phone_number_
    , need_email_address                     = need_email_address_
    , need_shipping_address                  = need_shipping_address_
    , send_phone_number_to_provider          = send_phone_number_to_provider_
    , send_email_address_to_provider         = send_email_address_to_provider_
    , is_flexible                            = is_flexible_
    }
      = A.object
        [ "@type"                                  A..= AT.String "invoice"
        , "currency"                               A..= currency_
        , "price_parts"                            A..= price_parts_
        , "subscription_period"                    A..= subscription_period_
        , "max_tip_amount"                         A..= max_tip_amount_
        , "suggested_tip_amounts"                  A..= suggested_tip_amounts_
        , "recurring_payment_terms_of_service_url" A..= recurring_payment_terms_of_service_url_
        , "terms_of_service_url"                   A..= terms_of_service_url_
        , "is_test"                                A..= is_test_
        , "need_name"                              A..= need_name_
        , "need_phone_number"                      A..= need_phone_number_
        , "need_email_address"                     A..= need_email_address_
        , "need_shipping_address"                  A..= need_shipping_address_
        , "send_phone_number_to_provider"          A..= send_phone_number_to_provider_
        , "send_email_address_to_provider"         A..= send_email_address_to_provider_
        , "is_flexible"                            A..= is_flexible_
        ]

defaultInvoice :: Invoice
defaultInvoice =
  Invoice
    { currency                               = Nothing
    , price_parts                            = Nothing
    , subscription_period                    = Nothing
    , max_tip_amount                         = Nothing
    , suggested_tip_amounts                  = Nothing
    , recurring_payment_terms_of_service_url = Nothing
    , terms_of_service_url                   = Nothing
    , is_test                                = Nothing
    , need_name                              = Nothing
    , need_phone_number                      = Nothing
    , need_email_address                     = Nothing
    , need_shipping_address                  = Nothing
    , send_phone_number_to_provider          = Nothing
    , send_email_address_to_provider         = Nothing
    , is_flexible                            = Nothing
    }

