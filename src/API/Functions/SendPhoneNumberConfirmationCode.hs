-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

--main = putStrLn "ok"

data SendPhoneNumberConfirmationCode = 
 SendPhoneNumberConfirmationCode { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String, hash :: String }  -- deriving (Show)

instance T.ToJSON SendPhoneNumberConfirmationCode where
 toJSON (SendPhoneNumberConfirmationCode { settings = settings, phone_number = phone_number, hash = hash }) =
  A.object [ "@type" A..= T.String "sendPhoneNumberConfirmationCode", "settings" A..= settings, "phone_number" A..= phone_number, "hash" A..= hash ]
-- sendPhoneNumberConfirmationCode SendPhoneNumberConfirmationCode  { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String, hash :: String } 

