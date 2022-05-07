{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreateTemporaryPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new temporary password for processing payments @password Persistent user password @valid_for Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
data CreateTemporaryPassword = CreateTemporaryPassword
  { -- |
    valid_for :: Maybe Int,
    -- |
    password :: Maybe String
  }
  deriving (Eq)

instance Show CreateTemporaryPassword where
  show
    CreateTemporaryPassword
      { valid_for = valid_for,
        password = password
      } =
      "CreateTemporaryPassword"
        ++ U.cc
          [ U.p "valid_for" valid_for,
            U.p "password" password
          ]

instance T.ToJSON CreateTemporaryPassword where
  toJSON
    CreateTemporaryPassword
      { valid_for = valid_for,
        password = password
      } =
      A.object
        [ "@type" A..= T.String "createTemporaryPassword",
          "valid_for" A..= valid_for,
          "password" A..= password
        ]
