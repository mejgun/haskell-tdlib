{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentProvider where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about a payment provider
data PaymentProvider
  = -- | Smart Glocal payment provider @public_token Public payment token
    PaymentProviderSmartGlocal
      { -- |
        public_token :: Maybe String
      }
  | -- | Stripe payment provider
    PaymentProviderStripe
      { -- | True, if the cardholder name must be provided
        need_cardholder_name :: Maybe Bool,
        -- | True, if the user ZIP/postal code must be provided
        need_postal_code :: Maybe Bool,
        -- | True, if the user country must be provided
        need_country :: Maybe Bool,
        -- | Stripe API publishable key
        publishable_key :: Maybe String
      }
  | -- | Some other payment provider, for which a web payment form must be shown @url Payment form URL
    PaymentProviderOther
      { -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show PaymentProvider where
  show
    PaymentProviderSmartGlocal
      { public_token = public_token_
      } =
      "PaymentProviderSmartGlocal"
        ++ U.cc
          [ U.p "public_token" public_token_
          ]
  show
    PaymentProviderStripe
      { need_cardholder_name = need_cardholder_name_,
        need_postal_code = need_postal_code_,
        need_country = need_country_,
        publishable_key = publishable_key_
      } =
      "PaymentProviderStripe"
        ++ U.cc
          [ U.p "need_cardholder_name" need_cardholder_name_,
            U.p "need_postal_code" need_postal_code_,
            U.p "need_country" need_country_,
            U.p "publishable_key" publishable_key_
          ]
  show
    PaymentProviderOther
      { url = url_
      } =
      "PaymentProviderOther"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.FromJSON PaymentProvider where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentProviderSmartGlocal" -> parsePaymentProviderSmartGlocal v
      "paymentProviderStripe" -> parsePaymentProviderStripe v
      "paymentProviderOther" -> parsePaymentProviderOther v
      _ -> mempty
    where
      parsePaymentProviderSmartGlocal :: A.Value -> T.Parser PaymentProvider
      parsePaymentProviderSmartGlocal = A.withObject "PaymentProviderSmartGlocal" $ \o -> do
        public_token_ <- o A..:? "public_token"
        return $ PaymentProviderSmartGlocal {public_token = public_token_}

      parsePaymentProviderStripe :: A.Value -> T.Parser PaymentProvider
      parsePaymentProviderStripe = A.withObject "PaymentProviderStripe" $ \o -> do
        need_cardholder_name_ <- o A..:? "need_cardholder_name"
        need_postal_code_ <- o A..:? "need_postal_code"
        need_country_ <- o A..:? "need_country"
        publishable_key_ <- o A..:? "publishable_key"
        return $ PaymentProviderStripe {need_cardholder_name = need_cardholder_name_, need_postal_code = need_postal_code_, need_country = need_country_, publishable_key = publishable_key_}

      parsePaymentProviderOther :: A.Value -> T.Parser PaymentProvider
      parsePaymentProviderOther = A.withObject "PaymentProviderOther" $ \o -> do
        url_ <- o A..:? "url"
        return $ PaymentProviderOther {url = url_}
  parseJSON _ = mempty

instance T.ToJSON PaymentProvider where
  toJSON
    PaymentProviderSmartGlocal
      { public_token = public_token_
      } =
      A.object
        [ "@type" A..= T.String "paymentProviderSmartGlocal",
          "public_token" A..= public_token_
        ]
  toJSON
    PaymentProviderStripe
      { need_cardholder_name = need_cardholder_name_,
        need_postal_code = need_postal_code_,
        need_country = need_country_,
        publishable_key = publishable_key_
      } =
      A.object
        [ "@type" A..= T.String "paymentProviderStripe",
          "need_cardholder_name" A..= need_cardholder_name_,
          "need_postal_code" A..= need_postal_code_,
          "need_country" A..= need_country_,
          "publishable_key" A..= publishable_key_
        ]
  toJSON
    PaymentProviderOther
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "paymentProviderOther",
          "url" A..= url_
        ]
