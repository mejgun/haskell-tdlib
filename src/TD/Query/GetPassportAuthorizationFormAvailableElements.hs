{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPassportAuthorizationFormAvailableElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form @autorization_form_id Authorization form identifier @password The 2-step verification password of the current user
data GetPassportAuthorizationFormAvailableElements = GetPassportAuthorizationFormAvailableElements
  { -- |
    password :: Maybe String,
    -- |
    autorization_form_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPassportAuthorizationFormAvailableElements where
  show
    GetPassportAuthorizationFormAvailableElements
      { password = password_,
        autorization_form_id = autorization_form_id_
      } =
      "GetPassportAuthorizationFormAvailableElements"
        ++ U.cc
          [ U.p "password" password_,
            U.p "autorization_form_id" autorization_form_id_
          ]

instance T.ToJSON GetPassportAuthorizationFormAvailableElements where
  toJSON
    GetPassportAuthorizationFormAvailableElements
      { password = password_,
        autorization_form_id = autorization_form_id_
      } =
      A.object
        [ "@type" A..= T.String "getPassportAuthorizationFormAvailableElements",
          "password" A..= password_,
          "autorization_form_id" A..= autorization_form_id_
        ]
