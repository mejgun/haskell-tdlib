{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleSupergroupIsBroadcastGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup @supergroup_id Identifier of the supergroup
data ToggleSupergroupIsBroadcastGroup = ToggleSupergroupIsBroadcastGroup
  { -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupIsBroadcastGroup where
  show
    ToggleSupergroupIsBroadcastGroup
      { supergroup_id = supergroup_id
      } =
      "ToggleSupergroupIsBroadcastGroup"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON ToggleSupergroupIsBroadcastGroup where
  toJSON
    ToggleSupergroupIsBroadcastGroup
      { supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupIsBroadcastGroup",
          "supergroup_id" A..= supergroup_id
        ]
