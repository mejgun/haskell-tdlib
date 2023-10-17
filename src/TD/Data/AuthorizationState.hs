module TD.Data.AuthorizationState
  (AuthorizationState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified TD.Data.EmailAddressResetState as EmailAddressResetState
import qualified TD.Data.AuthenticationCodeInfo as AuthenticationCodeInfo
import qualified Data.Text as T
import qualified TD.Data.TermsOfService as TermsOfService

-- | Represents the current authorization state of the TDLib client
data AuthorizationState
  = AuthorizationStateWaitTdlibParameters -- ^ Initialization parameters are needed. Call setTdlibParameters to provide them
  | AuthorizationStateWaitPhoneNumber -- ^ TDLib needs the user's phone number to authorize. Call setAuthenticationPhoneNumber to provide the phone number, or use requestQrCodeAuthentication or checkAuthenticationBotToken for other authentication options
  | AuthorizationStateWaitEmailAddress -- ^ TDLib needs the user's email address to authorize. Call setAuthenticationEmailAddress to provide the email address, or directly call checkAuthenticationEmailCode with Apple ID/Google ID token if allowed
    { allow_apple_id  :: Maybe Bool -- ^ True, if authorization through Apple ID is allowed
    , allow_google_id :: Maybe Bool -- ^ True, if authorization through Google ID is allowed
    }
  | AuthorizationStateWaitEmailCode -- ^ TDLib needs the user's authentication code sent to an email address to authorize. Call checkAuthenticationEmailCode to provide the code
    { allow_apple_id            :: Maybe Bool                                                                  -- ^ True, if authorization through Apple ID is allowed
    , allow_google_id           :: Maybe Bool                                                                  -- ^ True, if authorization through Google ID is allowed
    , code_info                 :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo -- ^ Information about the sent authentication code
    , email_address_reset_state :: Maybe EmailAddressResetState.EmailAddressResetState                         -- ^ Reset state of the email address; may be null if the email address can't be reset
    }
  | AuthorizationStateWaitCode -- ^ TDLib needs the user's authentication code to authorize. Call checkAuthenticationCode to check the code
    { _code_info :: Maybe AuthenticationCodeInfo.AuthenticationCodeInfo -- ^ Information about the authorization code that was sent
    }
  | AuthorizationStateWaitOtherDeviceConfirmation -- ^ The user needs to confirm authorization on another logged in device by scanning a QR code with the provided link
    { link :: Maybe T.Text -- ^ A tg:// URL for the QR code. The link will be updated frequently
    }
  | AuthorizationStateWaitRegistration -- ^ The user is unregistered and need to accept terms of service and enter their first name and last name to finish registration. Call registerUser to accept the terms of service and provide the data
    { terms_of_service :: Maybe TermsOfService.TermsOfService -- ^ Telegram terms of service
    }
  | AuthorizationStateWaitPassword -- ^ The user has been authorized, but needs to enter a 2-step verification password to start using the application. Call checkAuthenticationPassword to provide the password, or requestAuthenticationPasswordRecovery to recover the password, or deleteAccount to delete the account after a week
    { password_hint                  :: Maybe T.Text -- ^ Hint for the password; may be empty
    , has_recovery_email_address     :: Maybe Bool   -- ^ True, if a recovery email address has been set up
    , has_passport_data              :: Maybe Bool   -- ^ True, if some Telegram Passport elements were saved
    , recovery_email_address_pattern :: Maybe T.Text -- ^ Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
    }
  | AuthorizationStateReady -- ^ The user has been successfully authorized. TDLib is now ready to answer general requests
  | AuthorizationStateLoggingOut -- ^ The user is currently logging out
  | AuthorizationStateClosing -- ^ TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
  | AuthorizationStateClosed -- ^ TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to with error code 500. To continue working, one must create a new instance of the TDLib client
  deriving (Eq, Show)

instance I.ShortShow AuthorizationState where
  shortShow AuthorizationStateWaitTdlibParameters
      = "AuthorizationStateWaitTdlibParameters"
  shortShow AuthorizationStateWaitPhoneNumber
      = "AuthorizationStateWaitPhoneNumber"
  shortShow AuthorizationStateWaitEmailAddress
    { allow_apple_id  = allow_apple_id_
    , allow_google_id = allow_google_id_
    }
      = "AuthorizationStateWaitEmailAddress"
        ++ I.cc
        [ "allow_apple_id"  `I.p` allow_apple_id_
        , "allow_google_id" `I.p` allow_google_id_
        ]
  shortShow AuthorizationStateWaitEmailCode
    { allow_apple_id            = allow_apple_id_
    , allow_google_id           = allow_google_id_
    , code_info                 = code_info_
    , email_address_reset_state = email_address_reset_state_
    }
      = "AuthorizationStateWaitEmailCode"
        ++ I.cc
        [ "allow_apple_id"            `I.p` allow_apple_id_
        , "allow_google_id"           `I.p` allow_google_id_
        , "code_info"                 `I.p` code_info_
        , "email_address_reset_state" `I.p` email_address_reset_state_
        ]
  shortShow AuthorizationStateWaitCode
    { _code_info = _code_info_
    }
      = "AuthorizationStateWaitCode"
        ++ I.cc
        [ "_code_info" `I.p` _code_info_
        ]
  shortShow AuthorizationStateWaitOtherDeviceConfirmation
    { link = link_
    }
      = "AuthorizationStateWaitOtherDeviceConfirmation"
        ++ I.cc
        [ "link" `I.p` link_
        ]
  shortShow AuthorizationStateWaitRegistration
    { terms_of_service = terms_of_service_
    }
      = "AuthorizationStateWaitRegistration"
        ++ I.cc
        [ "terms_of_service" `I.p` terms_of_service_
        ]
  shortShow AuthorizationStateWaitPassword
    { password_hint                  = password_hint_
    , has_recovery_email_address     = has_recovery_email_address_
    , has_passport_data              = has_passport_data_
    , recovery_email_address_pattern = recovery_email_address_pattern_
    }
      = "AuthorizationStateWaitPassword"
        ++ I.cc
        [ "password_hint"                  `I.p` password_hint_
        , "has_recovery_email_address"     `I.p` has_recovery_email_address_
        , "has_passport_data"              `I.p` has_passport_data_
        , "recovery_email_address_pattern" `I.p` recovery_email_address_pattern_
        ]
  shortShow AuthorizationStateReady
      = "AuthorizationStateReady"
  shortShow AuthorizationStateLoggingOut
      = "AuthorizationStateLoggingOut"
  shortShow AuthorizationStateClosing
      = "AuthorizationStateClosing"
  shortShow AuthorizationStateClosed
      = "AuthorizationStateClosed"

instance AT.FromJSON AuthorizationState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "authorizationStateWaitTdlibParameters"         -> pure AuthorizationStateWaitTdlibParameters
      "authorizationStateWaitPhoneNumber"             -> pure AuthorizationStateWaitPhoneNumber
      "authorizationStateWaitEmailAddress"            -> parseAuthorizationStateWaitEmailAddress v
      "authorizationStateWaitEmailCode"               -> parseAuthorizationStateWaitEmailCode v
      "authorizationStateWaitCode"                    -> parseAuthorizationStateWaitCode v
      "authorizationStateWaitOtherDeviceConfirmation" -> parseAuthorizationStateWaitOtherDeviceConfirmation v
      "authorizationStateWaitRegistration"            -> parseAuthorizationStateWaitRegistration v
      "authorizationStateWaitPassword"                -> parseAuthorizationStateWaitPassword v
      "authorizationStateReady"                       -> pure AuthorizationStateReady
      "authorizationStateLoggingOut"                  -> pure AuthorizationStateLoggingOut
      "authorizationStateClosing"                     -> pure AuthorizationStateClosing
      "authorizationStateClosed"                      -> pure AuthorizationStateClosed
      _                                               -> mempty
    
    where
      parseAuthorizationStateWaitEmailAddress :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitEmailAddress = A.withObject "AuthorizationStateWaitEmailAddress" $ \o -> do
        allow_apple_id_  <- o A..:?  "allow_apple_id"
        allow_google_id_ <- o A..:?  "allow_google_id"
        pure $ AuthorizationStateWaitEmailAddress
          { allow_apple_id  = allow_apple_id_
          , allow_google_id = allow_google_id_
          }
      parseAuthorizationStateWaitEmailCode :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitEmailCode = A.withObject "AuthorizationStateWaitEmailCode" $ \o -> do
        allow_apple_id_            <- o A..:?  "allow_apple_id"
        allow_google_id_           <- o A..:?  "allow_google_id"
        code_info_                 <- o A..:?  "code_info"
        email_address_reset_state_ <- o A..:?  "email_address_reset_state"
        pure $ AuthorizationStateWaitEmailCode
          { allow_apple_id            = allow_apple_id_
          , allow_google_id           = allow_google_id_
          , code_info                 = code_info_
          , email_address_reset_state = email_address_reset_state_
          }
      parseAuthorizationStateWaitCode :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitCode = A.withObject "AuthorizationStateWaitCode" $ \o -> do
        _code_info_ <- o A..:?  "code_info"
        pure $ AuthorizationStateWaitCode
          { _code_info = _code_info_
          }
      parseAuthorizationStateWaitOtherDeviceConfirmation :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitOtherDeviceConfirmation = A.withObject "AuthorizationStateWaitOtherDeviceConfirmation" $ \o -> do
        link_ <- o A..:?  "link"
        pure $ AuthorizationStateWaitOtherDeviceConfirmation
          { link = link_
          }
      parseAuthorizationStateWaitRegistration :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitRegistration = A.withObject "AuthorizationStateWaitRegistration" $ \o -> do
        terms_of_service_ <- o A..:?  "terms_of_service"
        pure $ AuthorizationStateWaitRegistration
          { terms_of_service = terms_of_service_
          }
      parseAuthorizationStateWaitPassword :: A.Value -> AT.Parser AuthorizationState
      parseAuthorizationStateWaitPassword = A.withObject "AuthorizationStateWaitPassword" $ \o -> do
        password_hint_                  <- o A..:?  "password_hint"
        has_recovery_email_address_     <- o A..:?  "has_recovery_email_address"
        has_passport_data_              <- o A..:?  "has_passport_data"
        recovery_email_address_pattern_ <- o A..:?  "recovery_email_address_pattern"
        pure $ AuthorizationStateWaitPassword
          { password_hint                  = password_hint_
          , has_recovery_email_address     = has_recovery_email_address_
          , has_passport_data              = has_passport_data_
          , recovery_email_address_pattern = recovery_email_address_pattern_
          }
  parseJSON _ = mempty

