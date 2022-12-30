{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ChangePhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified Utils as U

-- |
-- Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code
data ChangePhoneNumber = ChangePhoneNumber
  { -- | Settings for the authentication of the user's phone number; pass null to use default settings
    settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings,
    -- | The new phone number of the user in international format
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show ChangePhoneNumber where
  show
    ChangePhoneNumber
      { settings = settings_,
        phone_number = phone_number_
      } =
      "ChangePhoneNumber"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "phone_number" phone_number_
          ]

instance T.ToJSON ChangePhoneNumber where
  toJSON
    ChangePhoneNumber
      { settings = settings_,
        phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "changePhoneNumber",
          "settings" A..= settings_,
          "phone_number" A..= phone_number_
        ]
