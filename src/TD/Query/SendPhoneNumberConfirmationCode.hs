{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified Utils as U

-- |
-- Sends phone number confirmation code to handle links of the type internalLinkTypePhoneNumberConfirmation @hash Hash value from the link @phone_number Phone number value from the link @settings Settings for the authentication of the user's phone number; pass null to use default settings
data SendPhoneNumberConfirmationCode = SendPhoneNumberConfirmationCode
  { -- |
    settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings,
    -- |
    phone_number :: Maybe String,
    -- |
    hash :: Maybe String
  }
  deriving (Eq)

instance Show SendPhoneNumberConfirmationCode where
  show
    SendPhoneNumberConfirmationCode
      { settings = settings,
        phone_number = phone_number,
        hash = hash
      } =
      "SendPhoneNumberConfirmationCode"
        ++ U.cc
          [ U.p "settings" settings,
            U.p "phone_number" phone_number,
            U.p "hash" hash
          ]

instance T.ToJSON SendPhoneNumberConfirmationCode where
  toJSON
    SendPhoneNumberConfirmationCode
      { settings = settings,
        phone_number = phone_number,
        hash = hash
      } =
      A.object
        [ "@type" A..= T.String "sendPhoneNumberConfirmationCode",
          "settings" A..= settings,
          "phone_number" A..= phone_number,
          "hash" A..= hash
        ]
