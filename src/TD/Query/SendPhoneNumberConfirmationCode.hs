{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified Utils as U

-- |
-- Sends phone number confirmation code to handle links of the type internalLinkTypePhoneNumberConfirmation
data SendPhoneNumberConfirmationCode = SendPhoneNumberConfirmationCode
  { -- | Settings for the authentication of the user's phone number; pass null to use default settings
    settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings,
    -- | Phone number value from the link
    phone_number :: Maybe String,
    -- | Hash value from the link
    hash :: Maybe String
  }
  deriving (Eq)

instance Show SendPhoneNumberConfirmationCode where
  show
    SendPhoneNumberConfirmationCode
      { settings = settings_,
        phone_number = phone_number_,
        hash = hash_
      } =
      "SendPhoneNumberConfirmationCode"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "phone_number" phone_number_,
            U.p "hash" hash_
          ]

instance T.ToJSON SendPhoneNumberConfirmationCode where
  toJSON
    SendPhoneNumberConfirmationCode
      { settings = settings_,
        phone_number = phone_number_,
        hash = hash_
      } =
      A.object
        [ "@type" A..= T.String "sendPhoneNumberConfirmationCode",
          "settings" A..= settings_,
          "phone_number" A..= phone_number_,
          "hash" A..= hash_
        ]
