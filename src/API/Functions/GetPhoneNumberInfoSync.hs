-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPhoneNumberInfoSync where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing localization to the specified language if properly localized country information is expected. Can be called synchronously
-- 
-- __language_code__ A two-letter ISO 639-1 country code for country information localization
-- 
-- __phone_number_prefix__ The phone number prefix
data GetPhoneNumberInfoSync = 

 GetPhoneNumberInfoSync { phone_number_prefix :: Maybe String, language_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetPhoneNumberInfoSync where
 toJSON (GetPhoneNumberInfoSync { phone_number_prefix = phone_number_prefix, language_code = language_code }) =
  A.object [ "@type" A..= T.String "getPhoneNumberInfoSync", "phone_number_prefix" A..= phone_number_prefix, "language_code" A..= language_code ]

instance T.FromJSON GetPhoneNumberInfoSync where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPhoneNumberInfoSync" -> parseGetPhoneNumberInfoSync v
   _ -> mempty
  where
   parseGetPhoneNumberInfoSync :: A.Value -> T.Parser GetPhoneNumberInfoSync
   parseGetPhoneNumberInfoSync = A.withObject "GetPhoneNumberInfoSync" $ \o -> do
    phone_number_prefix <- o A..:? "phone_number_prefix"
    language_code <- o A..:? "language_code"
    return $ GetPhoneNumberInfoSync { phone_number_prefix = phone_number_prefix, language_code = language_code }