-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PasswordState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo

data PasswordState = 
 PasswordState { recovery_email_address_code_info :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo, has_passport_data :: Maybe Bool, has_recovery_email_address :: Maybe Bool, password_hint :: Maybe String, has_password :: Maybe Bool }  deriving (Show)

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
    recovery_email_address_code_info <- optional $ o A..: "recovery_email_address_code_info"
    has_passport_data <- optional $ o A..: "has_passport_data"
    has_recovery_email_address <- optional $ o A..: "has_recovery_email_address"
    password_hint <- optional $ o A..: "password_hint"
    has_password <- optional $ o A..: "has_password"
    return $ PasswordState { recovery_email_address_code_info = recovery_email_address_code_info, has_passport_data = has_passport_data, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint, has_password = has_password }