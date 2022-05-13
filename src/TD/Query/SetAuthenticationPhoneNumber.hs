{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetAuthenticationPhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings
import qualified Utils as U

-- |
-- Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
-- or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
data SetAuthenticationPhoneNumber = SetAuthenticationPhoneNumber
  { -- |
    settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings,
    -- | The phone number of the user, in international format @settings Settings for the authentication of the user's phone number; pass null to use default settings
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show SetAuthenticationPhoneNumber where
  show
    SetAuthenticationPhoneNumber
      { settings = settings_,
        phone_number = phone_number_
      } =
      "SetAuthenticationPhoneNumber"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "phone_number" phone_number_
          ]

instance T.ToJSON SetAuthenticationPhoneNumber where
  toJSON
    SetAuthenticationPhoneNumber
      { settings = settings_,
        phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "setAuthenticationPhoneNumber",
          "settings" A..= settings_,
          "phone_number" A..= phone_number_
        ]
