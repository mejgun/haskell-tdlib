module TD.Data.PhoneNumberAuthenticationSettings
  ( PhoneNumberAuthenticationSettings(..)    
  , defaultPhoneNumberAuthenticationSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FirebaseAuthenticationSettings as FirebaseAuthenticationSettings
import qualified Data.Text as T

data PhoneNumberAuthenticationSettings
  = PhoneNumberAuthenticationSettings -- ^ Contains settings for the authentication of the user's phone number
    { allow_flash_call                 :: Maybe Bool                                                          -- ^ Pass true if the authentication code may be sent via a flash call to the specified phone number
    , allow_missed_call                :: Maybe Bool                                                          -- ^ Pass true if the authentication code may be sent via a missed call to the specified phone number
    , is_current_phone_number          :: Maybe Bool                                                          -- ^ Pass true if the authenticated phone number is used on the current device
    , has_unknown_phone_number         :: Maybe Bool                                                          -- ^ Pass true if there is a SIM card in the current device, but it is not possible to check whether phone number matches
    , allow_sms_retriever_api          :: Maybe Bool                                                          -- ^ For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
    , firebase_authentication_settings :: Maybe FirebaseAuthenticationSettings.FirebaseAuthenticationSettings -- ^ For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication
    , authentication_tokens            :: Maybe [T.Text]                                                      -- ^ List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions
    }
  deriving (Eq, Show)

instance I.ShortShow PhoneNumberAuthenticationSettings where
  shortShow PhoneNumberAuthenticationSettings
    { allow_flash_call                 = allow_flash_call_
    , allow_missed_call                = allow_missed_call_
    , is_current_phone_number          = is_current_phone_number_
    , has_unknown_phone_number         = has_unknown_phone_number_
    , allow_sms_retriever_api          = allow_sms_retriever_api_
    , firebase_authentication_settings = firebase_authentication_settings_
    , authentication_tokens            = authentication_tokens_
    }
      = "PhoneNumberAuthenticationSettings"
        ++ I.cc
        [ "allow_flash_call"                 `I.p` allow_flash_call_
        , "allow_missed_call"                `I.p` allow_missed_call_
        , "is_current_phone_number"          `I.p` is_current_phone_number_
        , "has_unknown_phone_number"         `I.p` has_unknown_phone_number_
        , "allow_sms_retriever_api"          `I.p` allow_sms_retriever_api_
        , "firebase_authentication_settings" `I.p` firebase_authentication_settings_
        , "authentication_tokens"            `I.p` authentication_tokens_
        ]

instance AT.FromJSON PhoneNumberAuthenticationSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "phoneNumberAuthenticationSettings" -> parsePhoneNumberAuthenticationSettings v
      _                                   -> mempty
    
    where
      parsePhoneNumberAuthenticationSettings :: A.Value -> AT.Parser PhoneNumberAuthenticationSettings
      parsePhoneNumberAuthenticationSettings = A.withObject "PhoneNumberAuthenticationSettings" $ \o -> do
        allow_flash_call_                 <- o A..:?  "allow_flash_call"
        allow_missed_call_                <- o A..:?  "allow_missed_call"
        is_current_phone_number_          <- o A..:?  "is_current_phone_number"
        has_unknown_phone_number_         <- o A..:?  "has_unknown_phone_number"
        allow_sms_retriever_api_          <- o A..:?  "allow_sms_retriever_api"
        firebase_authentication_settings_ <- o A..:?  "firebase_authentication_settings"
        authentication_tokens_            <- o A..:?  "authentication_tokens"
        pure $ PhoneNumberAuthenticationSettings
          { allow_flash_call                 = allow_flash_call_
          , allow_missed_call                = allow_missed_call_
          , is_current_phone_number          = is_current_phone_number_
          , has_unknown_phone_number         = has_unknown_phone_number_
          , allow_sms_retriever_api          = allow_sms_retriever_api_
          , firebase_authentication_settings = firebase_authentication_settings_
          , authentication_tokens            = authentication_tokens_
          }
  parseJSON _ = mempty

instance AT.ToJSON PhoneNumberAuthenticationSettings where
  toJSON PhoneNumberAuthenticationSettings
    { allow_flash_call                 = allow_flash_call_
    , allow_missed_call                = allow_missed_call_
    , is_current_phone_number          = is_current_phone_number_
    , has_unknown_phone_number         = has_unknown_phone_number_
    , allow_sms_retriever_api          = allow_sms_retriever_api_
    , firebase_authentication_settings = firebase_authentication_settings_
    , authentication_tokens            = authentication_tokens_
    }
      = A.object
        [ "@type"                            A..= AT.String "phoneNumberAuthenticationSettings"
        , "allow_flash_call"                 A..= allow_flash_call_
        , "allow_missed_call"                A..= allow_missed_call_
        , "is_current_phone_number"          A..= is_current_phone_number_
        , "has_unknown_phone_number"         A..= has_unknown_phone_number_
        , "allow_sms_retriever_api"          A..= allow_sms_retriever_api_
        , "firebase_authentication_settings" A..= firebase_authentication_settings_
        , "authentication_tokens"            A..= authentication_tokens_
        ]

defaultPhoneNumberAuthenticationSettings :: PhoneNumberAuthenticationSettings
defaultPhoneNumberAuthenticationSettings =
  PhoneNumberAuthenticationSettings
    { allow_flash_call                 = Nothing
    , allow_missed_call                = Nothing
    , is_current_phone_number          = Nothing
    , has_unknown_phone_number         = Nothing
    , allow_sms_retriever_api          = Nothing
    , firebase_authentication_settings = Nothing
    , authentication_tokens            = Nothing
    }

