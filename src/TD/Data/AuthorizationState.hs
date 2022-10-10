{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AuthorizationState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AuthenticationCodeInfo as AuthenticationCodeInfo
import qualified TD.Data.EmailAddressAuthenticationCodeInfo as EmailAddressAuthenticationCodeInfo
import qualified TD.Data.TermsOfService as TermsOfService
import qualified Utils as U

-- | Represents the current authorization state of the TDLib client
data AuthorizationState
  = -- | Initializetion parameters are needed. Call `setTdlibParameters` to provide them
    AuthorizationStateWaitTdlibParameters
  | -- | TDLib needs the user's phone number to authorize. Call `setAuthenticationPhoneNumber` to provide the phone number, or use `requestQrCodeAuthentication`, or `checkAuthenticationBotToken` for other authentication options
    AuthorizationStateWaitPhoneNumber
  | -- | TDLib needs the user's email address to authorize. Call `setAuthenticationEmailAddress` to provide the email address, or directly call `checkAuthenticationEmailCode` with Apple ID/Google ID token if allowed
    AuthorizationStateWaitEmailAddress
      { -- |
        allow_google_id :: Maybe Bool,
        -- | True, if authorization through Apple ID is allowed @allow_google_id True, if authorization through Google ID is allowed
        allow_apple_id :: Maybe Bool
      }
  | -- | TDLib needs the user's authentication code sent to an email address to authorize. Call `checkAuthenticationEmailCode` to provide the code
    AuthorizationStateWaitEmailCode
      { -- | Point in time (Unix timestamp) when the user will be able to authorize with a code sent to the user's phone number; 0 if unknown
        next_phone_number_authorization_date :: Maybe Int,
        -- | Information about the sent authentication code
        code_info :: Maybe EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo,
        -- |
        allow_google_id :: Maybe Bool,
        -- | True, if authorization through Apple ID is allowed @allow_google_id True, if authorization through Google ID is allowed
        allow_apple_id :: Maybe Bool
      }
  | -- | TDLib needs the user's authentication code to authorize @code_info Information about the authorization code that was sent
    AuthorizationStateWaitCode
      { -- |
        _code_info :: Maybe AuthenticationCodeInfo.AuthenticationCodeInfo
      }
  | -- | The user needs to confirm authorization on another logged in device by scanning a QR code with the provided link @link A tg:// URL for the QR code. The link will be updated frequently
    AuthorizationStateWaitOtherDeviceConfirmation
      { -- |
        link :: Maybe String
      }
  | -- | The user is unregistered and need to accept terms of service and enter their first name and last name to finish registration @terms_of_service Telegram terms of service
    AuthorizationStateWaitRegistration
      { -- |
        terms_of_service :: Maybe TermsOfService.TermsOfService
      }
  | -- | The user has been authorized, but needs to enter a 2-step verification password to start using the application @password_hint Hint for the password; may be empty @has_recovery_email_address True, if a recovery email address has been set up
    AuthorizationStateWaitPassword
      { -- | Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
        recovery_email_address_pattern :: Maybe String,
        -- |
        has_recovery_email_address :: Maybe Bool,
        -- |
        password_hint :: Maybe String
      }
  | -- | The user has been successfully authorized. TDLib is now ready to answer queries
    AuthorizationStateReady
  | -- | The user is currently logging out
    AuthorizationStateLoggingOut
  | -- | TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
    AuthorizationStateClosing
  | -- | TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to
    -- with error code 500. To continue working, one must create a new instance of the TDLib client
    AuthorizationStateClosed
  deriving (Eq)

instance Show AuthorizationState where
  show AuthorizationStateWaitTdlibParameters =
    "AuthorizationStateWaitTdlibParameters"
      ++ U.cc
        []
  show AuthorizationStateWaitPhoneNumber =
    "AuthorizationStateWaitPhoneNumber"
      ++ U.cc
        []
  show
    AuthorizationStateWaitEmailAddress
      { allow_google_id = allow_google_id_,
        allow_apple_id = allow_apple_id_
      } =
      "AuthorizationStateWaitEmailAddress"
        ++ U.cc
          [ U.p "allow_google_id" allow_google_id_,
            U.p "allow_apple_id" allow_apple_id_
          ]
  show
    AuthorizationStateWaitEmailCode
      { next_phone_number_authorization_date = next_phone_number_authorization_date_,
        code_info = code_info_,
        allow_google_id = allow_google_id_,
        allow_apple_id = allow_apple_id_
      } =
      "AuthorizationStateWaitEmailCode"
        ++ U.cc
          [ U.p "next_phone_number_authorization_date" next_phone_number_authorization_date_,
            U.p "code_info" code_info_,
            U.p "allow_google_id" allow_google_id_,
            U.p "allow_apple_id" allow_apple_id_
          ]
  show
    AuthorizationStateWaitCode
      { _code_info = _code_info_
      } =
      "AuthorizationStateWaitCode"
        ++ U.cc
          [ U.p "_code_info" _code_info_
          ]
  show
    AuthorizationStateWaitOtherDeviceConfirmation
      { link = link_
      } =
      "AuthorizationStateWaitOtherDeviceConfirmation"
        ++ U.cc
          [ U.p "link" link_
          ]
  show
    AuthorizationStateWaitRegistration
      { terms_of_service = terms_of_service_
      } =
      "AuthorizationStateWaitRegistration"
        ++ U.cc
          [ U.p "terms_of_service" terms_of_service_
          ]
  show
    AuthorizationStateWaitPassword
      { recovery_email_address_pattern = recovery_email_address_pattern_,
        has_recovery_email_address = has_recovery_email_address_,
        password_hint = password_hint_
      } =
      "AuthorizationStateWaitPassword"
        ++ U.cc
          [ U.p "recovery_email_address_pattern" recovery_email_address_pattern_,
            U.p "has_recovery_email_address" has_recovery_email_address_,
            U.p "password_hint" password_hint_
          ]
  show AuthorizationStateReady =
    "AuthorizationStateReady"
      ++ U.cc
        []
  show AuthorizationStateLoggingOut =
    "AuthorizationStateLoggingOut"
      ++ U.cc
        []
  show AuthorizationStateClosing =
    "AuthorizationStateClosing"
      ++ U.cc
        []
  show AuthorizationStateClosed =
    "AuthorizationStateClosed"
      ++ U.cc
        []

instance T.FromJSON AuthorizationState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "authorizationStateWaitTdlibParameters" -> parseAuthorizationStateWaitTdlibParameters v
      "authorizationStateWaitPhoneNumber" -> parseAuthorizationStateWaitPhoneNumber v
      "authorizationStateWaitEmailAddress" -> parseAuthorizationStateWaitEmailAddress v
      "authorizationStateWaitEmailCode" -> parseAuthorizationStateWaitEmailCode v
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
      parseAuthorizationStateWaitTdlibParameters = A.withObject "AuthorizationStateWaitTdlibParameters" $ \_ -> return AuthorizationStateWaitTdlibParameters

      parseAuthorizationStateWaitPhoneNumber :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitPhoneNumber = A.withObject "AuthorizationStateWaitPhoneNumber" $ \_ -> return AuthorizationStateWaitPhoneNumber

      parseAuthorizationStateWaitEmailAddress :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitEmailAddress = A.withObject "AuthorizationStateWaitEmailAddress" $ \o -> do
        allow_google_id_ <- o A..:? "allow_google_id"
        allow_apple_id_ <- o A..:? "allow_apple_id"
        return $ AuthorizationStateWaitEmailAddress {allow_google_id = allow_google_id_, allow_apple_id = allow_apple_id_}

      parseAuthorizationStateWaitEmailCode :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitEmailCode = A.withObject "AuthorizationStateWaitEmailCode" $ \o -> do
        next_phone_number_authorization_date_ <- o A..:? "next_phone_number_authorization_date"
        code_info_ <- o A..:? "code_info"
        allow_google_id_ <- o A..:? "allow_google_id"
        allow_apple_id_ <- o A..:? "allow_apple_id"
        return $ AuthorizationStateWaitEmailCode {next_phone_number_authorization_date = next_phone_number_authorization_date_, code_info = code_info_, allow_google_id = allow_google_id_, allow_apple_id = allow_apple_id_}

      parseAuthorizationStateWaitCode :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitCode = A.withObject "AuthorizationStateWaitCode" $ \o -> do
        _code_info_ <- o A..:? "code_info"
        return $ AuthorizationStateWaitCode {_code_info = _code_info_}

      parseAuthorizationStateWaitOtherDeviceConfirmation :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitOtherDeviceConfirmation = A.withObject "AuthorizationStateWaitOtherDeviceConfirmation" $ \o -> do
        link_ <- o A..:? "link"
        return $ AuthorizationStateWaitOtherDeviceConfirmation {link = link_}

      parseAuthorizationStateWaitRegistration :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitRegistration = A.withObject "AuthorizationStateWaitRegistration" $ \o -> do
        terms_of_service_ <- o A..:? "terms_of_service"
        return $ AuthorizationStateWaitRegistration {terms_of_service = terms_of_service_}

      parseAuthorizationStateWaitPassword :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateWaitPassword = A.withObject "AuthorizationStateWaitPassword" $ \o -> do
        recovery_email_address_pattern_ <- o A..:? "recovery_email_address_pattern"
        has_recovery_email_address_ <- o A..:? "has_recovery_email_address"
        password_hint_ <- o A..:? "password_hint"
        return $ AuthorizationStateWaitPassword {recovery_email_address_pattern = recovery_email_address_pattern_, has_recovery_email_address = has_recovery_email_address_, password_hint = password_hint_}

      parseAuthorizationStateReady :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateReady = A.withObject "AuthorizationStateReady" $ \_ -> return AuthorizationStateReady

      parseAuthorizationStateLoggingOut :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateLoggingOut = A.withObject "AuthorizationStateLoggingOut" $ \_ -> return AuthorizationStateLoggingOut

      parseAuthorizationStateClosing :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateClosing = A.withObject "AuthorizationStateClosing" $ \_ -> return AuthorizationStateClosing

      parseAuthorizationStateClosed :: A.Value -> T.Parser AuthorizationState
      parseAuthorizationStateClosed = A.withObject "AuthorizationStateClosed" $ \_ -> return AuthorizationStateClosed
  parseJSON _ = mempty

instance T.ToJSON AuthorizationState where
  toJSON AuthorizationStateWaitTdlibParameters =
    A.object
      [ "@type" A..= T.String "authorizationStateWaitTdlibParameters"
      ]
  toJSON AuthorizationStateWaitPhoneNumber =
    A.object
      [ "@type" A..= T.String "authorizationStateWaitPhoneNumber"
      ]
  toJSON
    AuthorizationStateWaitEmailAddress
      { allow_google_id = allow_google_id_,
        allow_apple_id = allow_apple_id_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitEmailAddress",
          "allow_google_id" A..= allow_google_id_,
          "allow_apple_id" A..= allow_apple_id_
        ]
  toJSON
    AuthorizationStateWaitEmailCode
      { next_phone_number_authorization_date = next_phone_number_authorization_date_,
        code_info = code_info_,
        allow_google_id = allow_google_id_,
        allow_apple_id = allow_apple_id_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitEmailCode",
          "next_phone_number_authorization_date" A..= next_phone_number_authorization_date_,
          "code_info" A..= code_info_,
          "allow_google_id" A..= allow_google_id_,
          "allow_apple_id" A..= allow_apple_id_
        ]
  toJSON
    AuthorizationStateWaitCode
      { _code_info = _code_info_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitCode",
          "code_info" A..= _code_info_
        ]
  toJSON
    AuthorizationStateWaitOtherDeviceConfirmation
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitOtherDeviceConfirmation",
          "link" A..= link_
        ]
  toJSON
    AuthorizationStateWaitRegistration
      { terms_of_service = terms_of_service_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitRegistration",
          "terms_of_service" A..= terms_of_service_
        ]
  toJSON
    AuthorizationStateWaitPassword
      { recovery_email_address_pattern = recovery_email_address_pattern_,
        has_recovery_email_address = has_recovery_email_address_,
        password_hint = password_hint_
      } =
      A.object
        [ "@type" A..= T.String "authorizationStateWaitPassword",
          "recovery_email_address_pattern" A..= recovery_email_address_pattern_,
          "has_recovery_email_address" A..= has_recovery_email_address_,
          "password_hint" A..= password_hint_
        ]
  toJSON AuthorizationStateReady =
    A.object
      [ "@type" A..= T.String "authorizationStateReady"
      ]
  toJSON AuthorizationStateLoggingOut =
    A.object
      [ "@type" A..= T.String "authorizationStateLoggingOut"
      ]
  toJSON AuthorizationStateClosing =
    A.object
      [ "@type" A..= T.String "authorizationStateClosing"
      ]
  toJSON AuthorizationStateClosed =
    A.object
      [ "@type" A..= T.String "authorizationStateClosed"
      ]
