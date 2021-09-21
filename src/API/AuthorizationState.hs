-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthorizationState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthenticationCodeInfo as AuthenticationCodeInfo
import {-# SOURCE #-} qualified API.TermsOfService as TermsOfService

-- |
-- 
-- Represents the current authorization state of the TDLib client
data AuthorizationState = 
 -- |
 -- 
 -- TDLib needs TdlibParameters for initialization
 AuthorizationStateWaitTdlibParameters |
 -- |
 -- 
 -- TDLib needs an encryption key to decrypt the local database 
 -- 
 -- __is_encrypted__ True, if the database is currently encrypted
 AuthorizationStateWaitEncryptionKey { is_encrypted :: Maybe Bool }  |
 -- |
 -- 
 -- TDLib needs the user's phone number to authorize. Call `setAuthenticationPhoneNumber` to provide the phone number, or use `requestQrCodeAuthentication`, or `checkAuthenticationBotToken` for other authentication options
 AuthorizationStateWaitPhoneNumber |
 -- |
 -- 
 -- TDLib needs the user's authentication code to authorize 
 -- 
 -- __code_info__ Information about the authorization code that was sent
 AuthorizationStateWaitCode { code_info :: Maybe AuthenticationCodeInfo.AuthenticationCodeInfo }  |
 -- |
 -- 
 -- The user needs to confirm authorization on another logged in device by scanning a QR code with the provided link 
 -- 
 -- __link__ A tg:// URL for the QR code. The link will be updated frequently
 AuthorizationStateWaitOtherDeviceConfirmation { link :: Maybe String }  |
 -- |
 -- 
 -- The user is unregistered and need to accept terms of service and enter their first name and last name to finish registration 
 -- 
 -- __terms_of_service__ Telegram terms of service
 AuthorizationStateWaitRegistration { terms_of_service :: Maybe TermsOfService.TermsOfService }  |
 -- |
 -- 
 -- The user has been authorized, but needs to enter a password to start using the application 
 -- 
 -- __password_hint__ Hint for the password; may be empty
 -- 
 -- __has_recovery_email_address__ True, if a recovery email address has been set up
 -- 
 -- __recovery_email_address_pattern__ Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
 AuthorizationStateWaitPassword { recovery_email_address_pattern :: Maybe String, has_recovery_email_address :: Maybe Bool, password_hint :: Maybe String }  |
 -- |
 -- 
 -- The user has been successfully authorized. TDLib is now ready to answer queries
 AuthorizationStateReady |
 -- |
 -- 
 -- The user is currently logging out
 AuthorizationStateLoggingOut |
 -- |
 -- 
 -- TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
 AuthorizationStateClosing |
 -- |
 -- 
 -- TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to
 -- 
 -- -with error code 500. To continue working, one should create a new instance of the TDLib client
 AuthorizationStateClosed deriving (Show, Eq)

instance T.ToJSON AuthorizationState where
 toJSON (AuthorizationStateWaitTdlibParameters {  }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitTdlibParameters" ]

 toJSON (AuthorizationStateWaitEncryptionKey { is_encrypted = is_encrypted }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitEncryptionKey", "is_encrypted" A..= is_encrypted ]

 toJSON (AuthorizationStateWaitPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitPhoneNumber" ]

 toJSON (AuthorizationStateWaitCode { code_info = code_info }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitCode", "code_info" A..= code_info ]

 toJSON (AuthorizationStateWaitOtherDeviceConfirmation { link = link }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitOtherDeviceConfirmation", "link" A..= link ]

 toJSON (AuthorizationStateWaitRegistration { terms_of_service = terms_of_service }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitRegistration", "terms_of_service" A..= terms_of_service ]

 toJSON (AuthorizationStateWaitPassword { recovery_email_address_pattern = recovery_email_address_pattern, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint }) =
  A.object [ "@type" A..= T.String "authorizationStateWaitPassword", "recovery_email_address_pattern" A..= recovery_email_address_pattern, "has_recovery_email_address" A..= has_recovery_email_address, "password_hint" A..= password_hint ]

 toJSON (AuthorizationStateReady {  }) =
  A.object [ "@type" A..= T.String "authorizationStateReady" ]

 toJSON (AuthorizationStateLoggingOut {  }) =
  A.object [ "@type" A..= T.String "authorizationStateLoggingOut" ]

 toJSON (AuthorizationStateClosing {  }) =
  A.object [ "@type" A..= T.String "authorizationStateClosing" ]

 toJSON (AuthorizationStateClosed {  }) =
  A.object [ "@type" A..= T.String "authorizationStateClosed" ]

instance T.FromJSON AuthorizationState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authorizationStateWaitTdlibParameters" -> parseAuthorizationStateWaitTdlibParameters v
   "authorizationStateWaitEncryptionKey" -> parseAuthorizationStateWaitEncryptionKey v
   "authorizationStateWaitPhoneNumber" -> parseAuthorizationStateWaitPhoneNumber v
   "authorizationStateWaitCode" -> parseAuthorizationStateWaitCode v
   "authorizationStateWaitOtherDeviceConfirmation" -> parseAuthorizationStateWaitOtherDeviceConfirmation v
   "authorizationStateWaitRegistration" -> parseAuthorizationStateWaitRegistration v
   "authorizationStateWaitPassword" -> parseAuthorizationStateWaitPassword v
   "authorizationStateReady" -> parseAuthorizationStateReady v
   "authorizationStateLoggingOut" -> parseAuthorizationStateLoggingOut v
   "authorizationStateClosing" -> parseAuthorizationStateClosing v
   "authorizationStateClosed" -> parseAuthorizationStateClosed v
   _ -> mempty
  where
   parseAuthorizationStateWaitTdlibParameters :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitTdlibParameters = A.withObject "AuthorizationStateWaitTdlibParameters" $ \o -> do
    return $ AuthorizationStateWaitTdlibParameters {  }

   parseAuthorizationStateWaitEncryptionKey :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitEncryptionKey = A.withObject "AuthorizationStateWaitEncryptionKey" $ \o -> do
    is_encrypted <- o A..:? "is_encrypted"
    return $ AuthorizationStateWaitEncryptionKey { is_encrypted = is_encrypted }

   parseAuthorizationStateWaitPhoneNumber :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitPhoneNumber = A.withObject "AuthorizationStateWaitPhoneNumber" $ \o -> do
    return $ AuthorizationStateWaitPhoneNumber {  }

   parseAuthorizationStateWaitCode :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitCode = A.withObject "AuthorizationStateWaitCode" $ \o -> do
    code_info <- o A..:? "code_info"
    return $ AuthorizationStateWaitCode { code_info = code_info }

   parseAuthorizationStateWaitOtherDeviceConfirmation :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitOtherDeviceConfirmation = A.withObject "AuthorizationStateWaitOtherDeviceConfirmation" $ \o -> do
    link <- o A..:? "link"
    return $ AuthorizationStateWaitOtherDeviceConfirmation { link = link }

   parseAuthorizationStateWaitRegistration :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitRegistration = A.withObject "AuthorizationStateWaitRegistration" $ \o -> do
    terms_of_service <- o A..:? "terms_of_service"
    return $ AuthorizationStateWaitRegistration { terms_of_service = terms_of_service }

   parseAuthorizationStateWaitPassword :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitPassword = A.withObject "AuthorizationStateWaitPassword" $ \o -> do
    recovery_email_address_pattern <- o A..:? "recovery_email_address_pattern"
    has_recovery_email_address <- o A..:? "has_recovery_email_address"
    password_hint <- o A..:? "password_hint"
    return $ AuthorizationStateWaitPassword { recovery_email_address_pattern = recovery_email_address_pattern, has_recovery_email_address = has_recovery_email_address, password_hint = password_hint }

   parseAuthorizationStateReady :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateReady = A.withObject "AuthorizationStateReady" $ \o -> do
    return $ AuthorizationStateReady {  }

   parseAuthorizationStateLoggingOut :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateLoggingOut = A.withObject "AuthorizationStateLoggingOut" $ \o -> do
    return $ AuthorizationStateLoggingOut {  }

   parseAuthorizationStateClosing :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateClosing = A.withObject "AuthorizationStateClosing" $ \o -> do
    return $ AuthorizationStateClosing {  }

   parseAuthorizationStateClosed :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateClosed = A.withObject "AuthorizationStateClosed" $ \o -> do
    return $ AuthorizationStateClosed {  }