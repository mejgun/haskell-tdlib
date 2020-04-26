-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- |
-- 
-- Sends a code to verify a phone number to be added to a user's Telegram Passport
-- 
-- __phone_number__ The phone number of the user, in international format
-- 
-- __settings__ Settings for the authentication of the user's phone number
data SendPhoneNumberVerificationCode = 
 SendPhoneNumberVerificationCode { settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SendPhoneNumberVerificationCode where
 toJSON (SendPhoneNumberVerificationCode { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "sendPhoneNumberVerificationCode", "settings" A..= settings, "phone_number" A..= phone_number ]

instance T.FromJSON SendPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPhoneNumberVerificationCode" -> parseSendPhoneNumberVerificationCode v
   _ -> mempty
  where
   parseSendPhoneNumberVerificationCode :: A.Value -> T.Parser SendPhoneNumberVerificationCode
   parseSendPhoneNumberVerificationCode = A.withObject "SendPhoneNumberVerificationCode" $ \o -> do
    settings <- o A..:? "settings"
    phone_number <- o A..:? "phone_number"
    return $ SendPhoneNumberVerificationCode { settings = settings, phone_number = phone_number }