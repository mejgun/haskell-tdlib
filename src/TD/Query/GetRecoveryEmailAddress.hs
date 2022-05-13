{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user @password The password for the current user
data GetRecoveryEmailAddress = GetRecoveryEmailAddress
  { -- |
    password :: Maybe String
  }
  deriving (Eq)

instance Show GetRecoveryEmailAddress where
  show
    GetRecoveryEmailAddress
      { password = password_
      } =
      "GetRecoveryEmailAddress"
        ++ U.cc
          [ U.p "password" password_
          ]

instance T.ToJSON GetRecoveryEmailAddress where
  toJSON
    GetRecoveryEmailAddress
      { password = password_
      } =
      A.object
        [ "@type" A..= T.String "getRecoveryEmailAddress",
          "password" A..= password_
        ]
