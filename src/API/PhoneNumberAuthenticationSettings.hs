-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhoneNumberAuthenticationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains settings for the authentication of the user's phone number
-- 
-- __allow_flash_call__ Pass true if the authentication code may be sent via a flash call to the specified phone number
-- 
-- __allow_missed_call__ Pass true if the authentication code may be sent via a missed call to the specified phone number
-- 
-- __is_current_phone_number__ Pass true if the authenticated phone number is used on the current device
-- 
-- __allow_sms_retriever_api__ For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
-- 
-- __authentication_tokens__ List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions
data PhoneNumberAuthenticationSettings = 

 PhoneNumberAuthenticationSettings { authentication_tokens :: Maybe [String], allow_sms_retriever_api :: Maybe Bool, is_current_phone_number :: Maybe Bool, allow_missed_call :: Maybe Bool, allow_flash_call :: Maybe Bool }  deriving (Eq)

instance Show PhoneNumberAuthenticationSettings where
 show PhoneNumberAuthenticationSettings { authentication_tokens=authentication_tokens, allow_sms_retriever_api=allow_sms_retriever_api, is_current_phone_number=is_current_phone_number, allow_missed_call=allow_missed_call, allow_flash_call=allow_flash_call } =
  "PhoneNumberAuthenticationSettings" ++ cc [p "authentication_tokens" authentication_tokens, p "allow_sms_retriever_api" allow_sms_retriever_api, p "is_current_phone_number" is_current_phone_number, p "allow_missed_call" allow_missed_call, p "allow_flash_call" allow_flash_call ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PhoneNumberAuthenticationSettings where
 toJSON PhoneNumberAuthenticationSettings { authentication_tokens = authentication_tokens, allow_sms_retriever_api = allow_sms_retriever_api, is_current_phone_number = is_current_phone_number, allow_missed_call = allow_missed_call, allow_flash_call = allow_flash_call } =
  A.object [ "@type" A..= T.String "phoneNumberAuthenticationSettings", "authentication_tokens" A..= authentication_tokens, "allow_sms_retriever_api" A..= allow_sms_retriever_api, "is_current_phone_number" A..= is_current_phone_number, "allow_missed_call" A..= allow_missed_call, "allow_flash_call" A..= allow_flash_call ]

instance T.FromJSON PhoneNumberAuthenticationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "phoneNumberAuthenticationSettings" -> parsePhoneNumberAuthenticationSettings v
   _ -> mempty
  where
   parsePhoneNumberAuthenticationSettings :: A.Value -> T.Parser PhoneNumberAuthenticationSettings
   parsePhoneNumberAuthenticationSettings = A.withObject "PhoneNumberAuthenticationSettings" $ \o -> do
    authentication_tokens <- o A..:? "authentication_tokens"
    allow_sms_retriever_api <- o A..:? "allow_sms_retriever_api"
    is_current_phone_number <- o A..:? "is_current_phone_number"
    allow_missed_call <- o A..:? "allow_missed_call"
    allow_flash_call <- o A..:? "allow_flash_call"
    return $ PhoneNumberAuthenticationSettings { authentication_tokens = authentication_tokens, allow_sms_retriever_api = allow_sms_retriever_api, is_current_phone_number = is_current_phone_number, allow_missed_call = allow_missed_call, allow_flash_call = allow_flash_call }
 parseJSON _ = mempty
