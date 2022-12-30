{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the editable username of the current user
data SetUsername = SetUsername
  { -- | The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
    username :: Maybe String
  }
  deriving (Eq)

instance Show SetUsername where
  show
    SetUsername
      { username = username_
      } =
      "SetUsername"
        ++ U.cc
          [ U.p "username" username_
          ]

instance T.ToJSON SetUsername where
  toJSON
    SetUsername
      { username = username_
      } =
      A.object
        [ "@type" A..= T.String "setUsername",
          "username" A..= username_
        ]
