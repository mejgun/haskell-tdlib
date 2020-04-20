-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAuthenticationPhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

--main = putStrLn "ok"

data SetAuthenticationPhoneNumber = 
 SetAuthenticationPhoneNumber { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String }  -- deriving (Show)

instance T.ToJSON SetAuthenticationPhoneNumber where
 toJSON (SetAuthenticationPhoneNumber { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "setAuthenticationPhoneNumber", "settings" A..= settings, "phone_number" A..= phone_number ]
-- setAuthenticationPhoneNumber SetAuthenticationPhoneNumber  { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String } 

