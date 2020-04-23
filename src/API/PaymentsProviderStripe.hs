-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentsProviderStripe where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PaymentsProviderStripe = 
 PaymentsProviderStripe { need_cardholder_name :: Maybe Bool, need_postal_code :: Maybe Bool, need_country :: Maybe Bool, publishable_key :: Maybe String }  deriving (Show)

instance T.ToJSON PaymentsProviderStripe where
 toJSON (PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key }) =
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
    need_cardholder_name <- optional $ o A..: "need_cardholder_name"
    need_postal_code <- optional $ o A..: "need_postal_code"
    need_country <- optional $ o A..: "need_country"
    publishable_key <- optional $ o A..: "publishable_key"
    return $ PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key }