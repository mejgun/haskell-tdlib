-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

--main = putStrLn "ok"

data SendPhoneNumberVerificationCode = 
 SendPhoneNumberVerificationCode { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String }  -- deriving (Show)

instance T.ToJSON SendPhoneNumberVerificationCode where
 toJSON (SendPhoneNumberVerificationCode { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "sendPhoneNumberVerificationCode", "settings" A..= settings, "phone_number" A..= phone_number ]
-- sendPhoneNumberVerificationCode SendPhoneNumberVerificationCode  { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String } 

