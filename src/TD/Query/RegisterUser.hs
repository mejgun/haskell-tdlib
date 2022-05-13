{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RegisterUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
data RegisterUser = RegisterUser
  { -- |
    last_name :: Maybe String,
    -- | The first name of the user; 1-64 characters @last_name The last name of the user; 0-64 characters
    first_name :: Maybe String
  }
  deriving (Eq)

instance Show RegisterUser where
  show
    RegisterUser
      { last_name = last_name_,
        first_name = first_name_
      } =
      "RegisterUser"
        ++ U.cc
          [ U.p "last_name" last_name_,
            U.p "first_name" first_name_
          ]

instance T.ToJSON RegisterUser where
  toJSON
    RegisterUser
      { last_name = last_name_,
        first_name = first_name_
      } =
      A.object
        [ "@type" A..= T.String "registerUser",
          "last_name" A..= last_name_,
          "first_name" A..= first_name_
        ]
