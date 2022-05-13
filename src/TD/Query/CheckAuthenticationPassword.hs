{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword @password The password to check
data CheckAuthenticationPassword = CheckAuthenticationPassword
  { -- |
    password :: Maybe String
  }
  deriving (Eq)

instance Show CheckAuthenticationPassword where
  show
    CheckAuthenticationPassword
      { password = password_
      } =
      "CheckAuthenticationPassword"
        ++ U.cc
          [ U.p "password" password_
          ]

instance T.ToJSON CheckAuthenticationPassword where
  toJSON
    CheckAuthenticationPassword
      { password = password_
      } =
      A.object
        [ "@type" A..= T.String "checkAuthenticationPassword",
          "password" A..= password_
        ]
