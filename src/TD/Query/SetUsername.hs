{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the username of the current user @username The new value of the username. Use an empty string to remove the username
data SetUsername = SetUsername
  { -- |
    username :: Maybe String
  }
  deriving (Eq)

instance Show SetUsername where
  show
    SetUsername
      { username = username
      } =
      "SetUsername"
        ++ U.cc
          [ U.p "username" username
          ]

instance T.ToJSON SetUsername where
  toJSON
    SetUsername
      { username = username
      } =
      A.object
        [ "@type" A..= T.String "setUsername",
          "username" A..= username
        ]
