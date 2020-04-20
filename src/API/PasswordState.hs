-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo

--main = putStrLn "ok"

data PasswordState = 
 PasswordState { recovery_email_address_code_info :: EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo, has_passport_data :: Bool, has_recovery_email_address :: Bool, password_hint :: String, has_password :: Bool }  -- deriving (Show)

instance T.ToJSON PasswordState where
 toJSON (PasswordState { recovery_email_address_code_info = recovery_email_address_code_info, has_passport_data = has_passport_data, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint, has_password = has_password }) =
  A.object [ "@type" A..= T.String "passwordState", "recovery_email_address_code_info" A..= recovery_email_address_code_info, "has_passport_data" A..= has_passport_data, "has_recovery_email_address" A..= has_recovery_email_address, "password_hint" A..= password_hint, "has_password" A..= has_password ]
-- passwordState PasswordState  { recovery_email_address_code_info :: EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo, has_passport_data :: Bool, has_recovery_email_address :: Bool, password_hint :: String, has_password :: Bool } 

