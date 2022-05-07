{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the first and last name of the current user @first_name The new value of the first name for the current user; 1-64 characters @last_name The new value of the optional last name for the current user; 0-64 characters
data SetName = SetName
  { -- |
    last_name :: Maybe String,
    -- |
    first_name :: Maybe String
  }
  deriving (Eq)

instance Show SetName where
  show
    SetName
      { last_name = last_name,
        first_name = first_name
      } =
      "SetName"
        ++ U.cc
          [ U.p "last_name" last_name,
            U.p "first_name" first_name
          ]

instance T.ToJSON SetName where
  toJSON
    SetName
      { last_name = last_name,
        first_name = first_name
      } =
      A.object
        [ "@type" A..= T.String "setName",
          "last_name" A..= last_name,
          "first_name" A..= first_name
        ]
