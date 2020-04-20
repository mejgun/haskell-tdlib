-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthorizationState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AuthenticationCodeInfo as AuthenticationCodeInfo
import {-# SOURCE #-} qualified API.TermsOfService as TermsOfService

--main = putStrLn "ok"

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
 | AuthorizationStateClosed -- deriving (Show)

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
-- authorizationStateWaitTdlibParameters AuthorizationState 

-- authorizationStateWaitEncryptionKey AuthorizationState  { is_encrypted :: Bool } 

-- authorizationStateWaitPhoneNumber AuthorizationState 

-- authorizationStateWaitCode AuthorizationState  { code_info :: AuthenticationCodeInfo.AuthenticationCodeInfo } 

-- authorizationStateWaitOtherDeviceConfirmation AuthorizationState  { link :: String } 

-- authorizationStateWaitRegistration AuthorizationState  { terms_of_service :: TermsOfService.TermsOfService } 

-- authorizationStateWaitPassword AuthorizationState  { recovery_email_address_pattern :: String, has_recovery_email_address :: Bool, password_hint :: String } 

-- authorizationStateReady AuthorizationState 

-- authorizationStateLoggingOut AuthorizationState 

-- authorizationStateClosing AuthorizationState 

-- authorizationStateClosed AuthorizationState 

