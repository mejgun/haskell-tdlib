-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhoneNumberInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CountryInfo as CountryInfo

-- |
-- 
-- Contains information about a phone number
-- 
-- __country__ Information about the country to which the phone number belongs; may be null
-- 
-- __country_calling_code__ The part of the phone number denoting country calling code or its part
-- 
-- __formatted_phone_number__ The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
data PhoneNumberInfo = 

 PhoneNumberInfo { formatted_phone_number :: Maybe String, country_calling_code :: Maybe String, country :: Maybe CountryInfo.CountryInfo }  deriving (Show, Eq)

instance T.ToJSON PhoneNumberInfo where
 toJSON (PhoneNumberInfo { formatted_phone_number = formatted_phone_number, country_calling_code = country_calling_code, country = country }) =
  A.object [ "@type" A..= T.String "phoneNumberInfo", "formatted_phone_number" A..= formatted_phone_number, "country_calling_code" A..= country_calling_code, "country" A..= country ]

instance T.FromJSON PhoneNumberInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "phoneNumberInfo" -> parsePhoneNumberInfo v
   _ -> mempty
  where
   parsePhoneNumberInfo :: A.Value -> T.Parser PhoneNumberInfo
   parsePhoneNumberInfo = A.withObject "PhoneNumberInfo" $ \o -> do
    formatted_phone_number <- o A..:? "formatted_phone_number"
    country_calling_code <- o A..:? "country_calling_code"
    country <- o A..:? "country"
    return $ PhoneNumberInfo { formatted_phone_number = formatted_phone_number, country_calling_code = country_calling_code, country = country }