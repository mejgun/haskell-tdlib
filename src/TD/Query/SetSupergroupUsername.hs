{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetSupergroupUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the username of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel @username New value of the username. Use an empty string to remove the username
data SetSupergroupUsername = SetSupergroupUsername
  { -- |
    username :: Maybe String,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetSupergroupUsername where
  show
    SetSupergroupUsername
      { username = username,
        supergroup_id = supergroup_id
      } =
      "SetSupergroupUsername"
        ++ U.cc
          [ U.p "username" username,
            U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON SetSupergroupUsername where
  toJSON
    SetSupergroupUsername
      { username = username,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "setSupergroupUsername",
          "username" A..= username,
          "supergroup_id" A..= supergroup_id
        ]
