{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetAuthenticationEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress @email_address The email address of the user
data SetAuthenticationEmailAddress = SetAuthenticationEmailAddress
  { -- |
    email_address :: Maybe String
  }
  deriving (Eq)

instance Show SetAuthenticationEmailAddress where
  show
    SetAuthenticationEmailAddress
      { email_address = email_address_
      } =
      "SetAuthenticationEmailAddress"
        ++ U.cc
          [ U.p "email_address" email_address_
          ]

instance T.ToJSON SetAuthenticationEmailAddress where
  toJSON
    SetAuthenticationEmailAddress
      { email_address = email_address_
      } =
      A.object
        [ "@type" A..= T.String "setAuthenticationEmailAddress",
          "email_address" A..= email_address_
        ]
