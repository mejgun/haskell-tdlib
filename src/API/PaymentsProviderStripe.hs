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

