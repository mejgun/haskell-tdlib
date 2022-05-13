{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified Utils as U

-- |
-- Sends a code to verify a phone number to be added to a user's Telegram Passport
data SendPhoneNumberVerificationCode = SendPhoneNumberVerificationCode
  { -- |
    settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings,
    -- | The phone number of the user, in international format @settings Settings for the authentication of the user's phone number; pass null to use default settings
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show SendPhoneNumberVerificationCode where
  show
    SendPhoneNumberVerificationCode
      { settings = settings_,
        phone_number = phone_number_
      } =
      "SendPhoneNumberVerificationCode"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "phone_number" phone_number_
          ]

instance T.ToJSON SendPhoneNumberVerificationCode where
  toJSON
    SendPhoneNumberVerificationCode
      { settings = settings_,
        phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "sendPhoneNumberVerificationCode",
          "settings" A..= settings_,
          "phone_number" A..= phone_number_
        ]
