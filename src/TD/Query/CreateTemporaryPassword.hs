{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { valid_for = valid_for_,
        password = password_
      } =
      "CreateTemporaryPassword"
        ++ U.cc
          [ U.p "valid_for" valid_for_,
            U.p "password" password_
          ]

instance T.ToJSON CreateTemporaryPassword where
  toJSON
    CreateTemporaryPassword
      { valid_for = valid_for_,
        password = password_
      } =
      A.object
        [ "@type" A..= T.String "createTemporaryPassword",
          "valid_for" A..= valid_for_,
          "password" A..= password_
        ]
