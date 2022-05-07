{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendPassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PassportElementType as PassportElementType
import qualified Utils as U

-- |
-- Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused
data SendPassportAuthorizationForm = SendPassportAuthorizationForm
  { -- |
    types :: Maybe [PassportElementType.PassportElementType],
    -- | Authorization form identifier @types Types of Telegram Passport elements chosen by user to complete the authorization form
    autorization_form_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendPassportAuthorizationForm where
  show
    SendPassportAuthorizationForm
      { types = types,
        autorization_form_id = autorization_form_id
      } =
      "SendPassportAuthorizationForm"
        ++ U.cc
          [ U.p "types" types,
            U.p "autorization_form_id" autorization_form_id
          ]

instance T.ToJSON SendPassportAuthorizationForm where
  toJSON
    SendPassportAuthorizationForm
      { types = types,
        autorization_form_id = autorization_form_id
      } =
      A.object
        [ "@type" A..= T.String "sendPassportAuthorizationForm",
          "types" A..= types,
          "autorization_form_id" A..= autorization_form_id
        ]
