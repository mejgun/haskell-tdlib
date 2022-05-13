{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentsProviderStripe where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data PaymentsProviderStripe = -- | Stripe payment provider @publishable_key Stripe API publishable key @need_country True, if the user country must be provided @need_postal_code True, if the user ZIP/postal code must be provided @need_cardholder_name True, if the cardholder name must be provided
  PaymentsProviderStripe
  { -- |
    need_cardholder_name :: Maybe Bool,
    -- |
    need_postal_code :: Maybe Bool,
    -- |
    need_country :: Maybe Bool,
    -- |
    publishable_key :: Maybe String
  }
  deriving (Eq)

instance Show PaymentsProviderStripe where
  show
    PaymentsProviderStripe
      { need_cardholder_name = need_cardholder_name_,
        need_postal_code = need_postal_code_,
        need_country = need_country_,
        publishable_key = publishable_key_
      } =
      "PaymentsProviderStripe"
        ++ U.cc
          [ U.p "need_cardholder_name" need_cardholder_name_,
            U.p "need_postal_code" need_postal_code_,
            U.p "need_country" need_country_,
            U.p "publishable_key" publishable_key_
          ]

instance T.FromJSON PaymentsProviderStripe where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentsProviderStripe" -> parsePaymentsProviderStripe v
      _ -> mempty
    where
      parsePaymentsProviderStripe :: A.Value -> T.Parser PaymentsProviderStripe
      parsePaymentsProviderStripe = A.withObject "PaymentsProviderStripe" $ \o -> do
        need_cardholder_name_ <- o A..:? "need_cardholder_name"
        need_postal_code_ <- o A..:? "need_postal_code"
        need_country_ <- o A..:? "need_country"
        publishable_key_ <- o A..:? "publishable_key"
        return $ PaymentsProviderStripe {need_cardholder_name = need_cardholder_name_, need_postal_code = need_postal_code_, need_country = need_country_, publishable_key = publishable_key_}
  parseJSON _ = mempty

instance T.ToJSON PaymentsProviderStripe where
  toJSON
    PaymentsProviderStripe
      { need_cardholder_name = need_cardholder_name_,
        need_postal_code = need_postal_code_,
        need_country = need_country_,
        publishable_key = publishable_key_
      } =
      A.object
        [ "@type" A..= T.String "paymentsProviderStripe",
          "need_cardholder_name" A..= need_cardholder_name_,
          "need_postal_code" A..= need_postal_code_,
          "need_country" A..= need_country_,
          "publishable_key" A..= publishable_key_
        ]
