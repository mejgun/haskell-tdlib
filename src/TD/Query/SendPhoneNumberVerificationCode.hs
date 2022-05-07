{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
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
      { settings = settings,
        phone_number = phone_number
      } =
      "SendPhoneNumberVerificationCode"
        ++ U.cc
          [ U.p "settings" settings,
            U.p "phone_number" phone_number
          ]

instance T.ToJSON SendPhoneNumberVerificationCode where
  toJSON
    SendPhoneNumberVerificationCode
      { settings = settings,
        phone_number = phone_number
      } =
      A.object
        [ "@type" A..= T.String "sendPhoneNumberVerificationCode",
          "settings" A..= settings,
          "phone_number" A..= phone_number
        ]
