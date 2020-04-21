-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthorizationState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthenticationCodeInfo as AuthenticationCodeInfo
import {-# SOURCE #-} qualified API.TermsOfService as TermsOfService

data AuthorizationState = 
 AuthorizationStateWaitTdlibParameters 
 | AuthorizationStateWaitEncryptionKey { is_encrypted :: Bool }  
 | AuthorizationStateWaitPhoneNumber 
 | AuthorizationStateWaitCode { code_info :: AuthenticationCodeInfo.AuthenticationCodeInfo }  
 | AuthorizationStateWaitOtherDeviceConfirmation { link :: String }  
 | AuthorizationStateWaitRegistration { terms_of_service :: TermsOfService.TermsOfService }  
 | AuthorizationStateWaitPassword { recovery_email_address_pattern :: String, has_recovery_email_address :: Bool, password_hint :: String }  
 | AuthorizationStateReady 
 | AuthorizationStateLoggingOut 
 | AuthorizationStateClosing 
 | AuthorizationStateClosed deriving (Show)

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
    is_encrypted <- o A..: "is_encrypted"
    return $ AuthorizationStateWaitEncryptionKey { is_encrypted = is_encrypted }

   parseAuthorizationStateWaitPhoneNumber :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitPhoneNumber = A.withObject "AuthorizationStateWaitPhoneNumber" $ \o -> do
    return $ AuthorizationStateWaitPhoneNumber {  }

   parseAuthorizationStateWaitCode :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitCode = A.withObject "AuthorizationStateWaitCode" $ \o -> do
    code_info <- o A..: "code_info"
    return $ AuthorizationStateWaitCode { code_info = code_info }

   parseAuthorizationStateWaitOtherDeviceConfirmation :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitOtherDeviceConfirmation = A.withObject "AuthorizationStateWaitOtherDeviceConfirmation" $ \o -> do
    link <- o A..: "link"
    return $ AuthorizationStateWaitOtherDeviceConfirmation { link = link }

   parseAuthorizationStateWaitRegistration :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitRegistration = A.withObject "AuthorizationStateWaitRegistration" $ \o -> do
    terms_of_service <- o A..: "terms_of_service"
    return $ AuthorizationStateWaitRegistration { terms_of_service = terms_of_service }

   parseAuthorizationStateWaitPassword :: A.Value -> T.Parser AuthorizationState
   parseAuthorizationStateWaitPassword = A.withObject "AuthorizationStateWaitPassword" $ \o -> do
    recovery_email_address_pattern <- o A..: "recovery_email_address_pattern"
    has_recovery_email_address <- o A..: "has_recovery_email_address"
    password_hint <- o A..: "password_hint"
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