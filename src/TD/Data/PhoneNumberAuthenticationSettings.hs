{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PhoneNumberAuthenticationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data PhoneNumberAuthenticationSettings = -- | Contains settings for the authentication of the user's phone number
  PhoneNumberAuthenticationSettings
  { -- | List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions
    authentication_tokens :: Maybe [String],
    -- | For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
    allow_sms_retriever_api :: Maybe Bool,
    -- | Pass true if the authenticated phone number is used on the current device
    is_current_phone_number :: Maybe Bool,
    -- | Pass true if the authentication code may be sent via a missed call to the specified phone number
    allow_missed_call :: Maybe Bool,
    -- | Pass true if the authentication code may be sent via a flash call to the specified phone number
    allow_flash_call :: Maybe Bool
  }
  deriving (Eq)

instance Show PhoneNumberAuthenticationSettings where
  show
    PhoneNumberAuthenticationSettings
      { authentication_tokens = authentication_tokens_,
        allow_sms_retriever_api = allow_sms_retriever_api_,
        is_current_phone_number = is_current_phone_number_,
        allow_missed_call = allow_missed_call_,
        allow_flash_call = allow_flash_call_
      } =
      "PhoneNumberAuthenticationSettings"
        ++ U.cc
          [ U.p "authentication_tokens" authentication_tokens_,
            U.p "allow_sms_retriever_api" allow_sms_retriever_api_,
            U.p "is_current_phone_number" is_current_phone_number_,
            U.p "allow_missed_call" allow_missed_call_,
            U.p "allow_flash_call" allow_flash_call_
          ]

instance T.FromJSON PhoneNumberAuthenticationSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "phoneNumberAuthenticationSettings" -> parsePhoneNumberAuthenticationSettings v
      _ -> mempty
    where
      parsePhoneNumberAuthenticationSettings :: A.Value -> T.Parser PhoneNumberAuthenticationSettings
      parsePhoneNumberAuthenticationSettings = A.withObject "PhoneNumberAuthenticationSettings" $ \o -> do
        authentication_tokens_ <- o A..:? "authentication_tokens"
        allow_sms_retriever_api_ <- o A..:? "allow_sms_retriever_api"
        is_current_phone_number_ <- o A..:? "is_current_phone_number"
        allow_missed_call_ <- o A..:? "allow_missed_call"
        allow_flash_call_ <- o A..:? "allow_flash_call"
        return $ PhoneNumberAuthenticationSettings {authentication_tokens = authentication_tokens_, allow_sms_retriever_api = allow_sms_retriever_api_, is_current_phone_number = is_current_phone_number_, allow_missed_call = allow_missed_call_, allow_flash_call = allow_flash_call_}
  parseJSON _ = mempty

instance T.ToJSON PhoneNumberAuthenticationSettings where
  toJSON
    PhoneNumberAuthenticationSettings
      { authentication_tokens = authentication_tokens_,
        allow_sms_retriever_api = allow_sms_retriever_api_,
        is_current_phone_number = is_current_phone_number_,
        allow_missed_call = allow_missed_call_,
        allow_flash_call = allow_flash_call_
      } =
      A.object
        [ "@type" A..= T.String "phoneNumberAuthenticationSettings",
          "authentication_tokens" A..= authentication_tokens_,
          "allow_sms_retriever_api" A..= allow_sms_retriever_api_,
          "is_current_phone_number" A..= is_current_phone_number_,
          "allow_missed_call" A..= allow_missed_call_,
          "allow_flash_call" A..= allow_flash_call_
        ]
