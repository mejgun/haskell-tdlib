{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPassportAuthorizationFormAvailableElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form
data GetPassportAuthorizationFormAvailableElements = GetPassportAuthorizationFormAvailableElements
  { -- | The 2-step verification password of the current user
    password :: Maybe String,
    -- | Authorization form identifier
    authorization_form_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPassportAuthorizationFormAvailableElements where
  show
    GetPassportAuthorizationFormAvailableElements
      { password = password_,
        authorization_form_id = authorization_form_id_
      } =
      "GetPassportAuthorizationFormAvailableElements"
        ++ U.cc
          [ U.p "password" password_,
            U.p "authorization_form_id" authorization_form_id_
          ]

instance T.ToJSON GetPassportAuthorizationFormAvailableElements where
  toJSON
    GetPassportAuthorizationFormAvailableElements
      { password = password_,
        authorization_form_id = authorization_form_id_
      } =
      A.object
        [ "@type" A..= T.String "getPassportAuthorizationFormAvailableElements",
          "password" A..= password_,
          "authorization_form_id" A..= authorization_form_id_
        ]
