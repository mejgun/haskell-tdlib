-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentsProviderStripe where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Stripe payment provider 
-- 
-- __publishable_key__ Stripe API publishable key
-- 
-- __need_country__ True, if the user country must be provided
-- 
-- __need_postal_code__ True, if the user ZIP/postal code must be provided
-- 
-- __need_cardholder_name__ True, if the cardholder name must be provided
data PaymentsProviderStripe = 

 PaymentsProviderStripe { need_cardholder_name :: Maybe Bool, need_postal_code :: Maybe Bool, need_country :: Maybe Bool, publishable_key :: Maybe String }  deriving (Eq)

instance Show PaymentsProviderStripe where
 show PaymentsProviderStripe { need_cardholder_name=need_cardholder_name, need_postal_code=need_postal_code, need_country=need_country, publishable_key=publishable_key } =
  "PaymentsProviderStripe" ++ U.cc [U.p "need_cardholder_name" need_cardholder_name, U.p "need_postal_code" need_postal_code, U.p "need_country" need_country, U.p "publishable_key" publishable_key ]

instance T.ToJSON PaymentsProviderStripe where
 toJSON PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key } =
  A.object [ "@type" A..= T.String "paymentsProviderStripe", "need_cardholder_name" A..= need_cardholder_name, "need_postal_code" A..= need_postal_code, "need_country" A..= need_country, "publishable_key" A..= publishable_key ]

instance T.FromJSON PaymentsProviderStripe where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentsProviderStripe" -> parsePaymentsProviderStripe v
   _ -> mempty
  where
   parsePaymentsProviderStripe :: A.Value -> T.Parser PaymentsProviderStripe
   parsePaymentsProviderStripe = A.withObject "PaymentsProviderStripe" $ \o -> do
    need_cardholder_name <- o A..:? "need_cardholder_name"
    need_postal_code <- o A..:? "need_postal_code"
    need_country <- o A..:? "need_country"
    publishable_key <- o A..:? "publishable_key"
    return $ PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key }
 parseJSON _ = mempty
