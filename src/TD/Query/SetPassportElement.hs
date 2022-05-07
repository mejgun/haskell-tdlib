{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputPassportElement as InputPassportElement
import qualified Utils as U

-- |
-- Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first @element Input Telegram Passport element @password Password of the current user
data SetPassportElement = SetPassportElement
  { -- |
    password :: Maybe String,
    -- |
    element :: Maybe InputPassportElement.InputPassportElement
  }
  deriving (Eq)

instance Show SetPassportElement where
  show
    SetPassportElement
      { password = password,
        element = element
      } =
      "SetPassportElement"
        ++ U.cc
          [ U.p "password" password,
            U.p "element" element
          ]

instance T.ToJSON SetPassportElement where
  toJSON
    SetPassportElement
      { password = password,
        element = element
      } =
      A.object
        [ "@type" A..= T.String "setPassportElement",
          "password" A..= password,
          "element" A..= element
        ]
