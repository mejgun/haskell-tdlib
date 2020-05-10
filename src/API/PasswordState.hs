-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo

-- |
-- 
-- Represents the current state of 2-step verification 
-- 
-- __has_password__ True, if a 2-step verification password is set
-- 
-- __password_hint__ Hint for the password; may be empty
-- 
-- __has_recovery_email_address__ True, if a recovery email is set
-- 
-- __has_passport_data__ True, if some Telegram Passport elements were saved
-- 
-- __recovery_email_address_code_info__ Information about the recovery email address to which the confirmation email was sent; may be null
data PasswordState = 

 PasswordState { recovery_email_address_code_info :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo, has_passport_data :: Maybe Bool, has_recovery_email_address :: Maybe Bool, password_hint :: Maybe String, has_password :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON PasswordState where
 toJSON (PasswordState { recovery_email_address_code_info = recovery_email_address_code_info, has_passport_data = has_passport_data, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint, has_password = has_password }) =
  A.object [ "@type" A..= T.String "passwordState", "recovery_email_address_code_info" A..= recovery_email_address_code_info, "has_passport_data" A..= has_passport_data, "has_recovery_email_address" A..= has_recovery_email_address, "password_hint" A..= password_hint, "has_password" A..= has_password ]

instance T.FromJSON PasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passwordState" -> parsePasswordState v
   _ -> mempty
  where
   parsePasswordState :: A.Value -> T.Parser PasswordState
   parsePasswordState = A.withObject "PasswordState" $ \o -> do
    recovery_email_address_code_info <- o A..:? "recovery_email_address_code_info"
    has_passport_data <- o A..:? "has_passport_data"
    has_recovery_email_address <- o A..:? "has_recovery_email_address"
    password_hint <- o A..:? "password_hint"
    has_password <- o A..:? "has_password"
    return $ PasswordState { recovery_email_address_code_info = recovery_email_address_code_info, has_passport_data = has_passport_data, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint, has_password = has_password }