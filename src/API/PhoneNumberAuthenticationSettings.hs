-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhoneNumberAuthenticationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains settings for the authentication of the user's phone number
-- 
-- __allow_flash_call__ Pass true if the authentication code may be sent via flash call to the specified phone number
-- 
-- __is_current_phone_number__ Pass true if the authenticated phone number is used on the current device
-- 
-- __allow_sms_retriever_api__ For official applications only. True, if the app can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
data PhoneNumberAuthenticationSettings = 
 PhoneNumberAuthenticationSettings { allow_sms_retriever_api :: Maybe Bool, is_current_phone_number :: Maybe Bool, allow_flash_call :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON PhoneNumberAuthenticationSettings where
 toJSON (PhoneNumberAuthenticationSettings { allow_sms_retriever_api = allow_sms_retriever_api, is_current_phone_number = is_current_phone_number, allow_flash_call = allow_flash_call }) =
  A.object [ "@type" A..= T.String "phoneNumberAuthenticationSettings", "allow_sms_retriever_api" A..= allow_sms_retriever_api, "is_current_phone_number" A..= is_current_phone_number, "allow_flash_call" A..= allow_flash_call ]

instance T.FromJSON PhoneNumberAuthenticationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "phoneNumberAuthenticationSettings" -> parsePhoneNumberAuthenticationSettings v
   _ -> mempty
  where
   parsePhoneNumberAuthenticationSettings :: A.Value -> T.Parser PhoneNumberAuthenticationSettings
   parsePhoneNumberAuthenticationSettings = A.withObject "PhoneNumberAuthenticationSettings" $ \o -> do
    allow_sms_retriever_api <- o A..:? "allow_sms_retriever_api"
    is_current_phone_number <- o A..:? "is_current_phone_number"
    allow_flash_call <- o A..:? "allow_flash_call"
    return $ PhoneNumberAuthenticationSettings { allow_sms_retriever_api = allow_sms_retriever_api, is_current_phone_number = is_current_phone_number, allow_flash_call = allow_flash_call }