-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentsProviderStripe where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PaymentsProviderStripe = 
 PaymentsProviderStripe { need_cardholder_name :: Bool, need_postal_code :: Bool, need_country :: Bool, publishable_key :: String }  -- deriving (Show)

instance T.ToJSON PaymentsProviderStripe where
 toJSON (PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key }) =
  A.object [ "@type" A..= T.String "paymentsProviderStripe", "need_cardholder_name" A..= need_cardholder_name, "need_postal_code" A..= need_postal_code, "need_country" A..= need_country, "publishable_key" A..= publishable_key ]
-- paymentsProviderStripe PaymentsProviderStripe  { need_cardholder_name :: Bool, need_postal_code :: Bool, need_country :: Bool, publishable_key :: String } 



instance T.FromJSON PaymentsProviderStripe where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentsProviderStripe" -> parsePaymentsProviderStripe v
  where
   parsePaymentsProviderStripe :: A.Value -> T.Parser PaymentsProviderStripe
   parsePaymentsProviderStripe = A.withObject "PaymentsProviderStripe" $ \o -> do
    need_cardholder_name <- o A..: "need_cardholder_name"
    need_postal_code <- o A..: "need_postal_code"
    need_country <- o A..: "need_country"
    publishable_key <- o A..: "publishable_key"
    return $ PaymentsProviderStripe { need_cardholder_name = need_cardholder_name, need_postal_code = need_postal_code, need_country = need_country, publishable_key = publishable_key }