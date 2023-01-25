{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupHasHiddenMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers. Can be called only if supergroupFullInfo.can_hide_members == true
data ToggleSupergroupHasHiddenMembers = ToggleSupergroupHasHiddenMembers
  { -- | New value of has_hidden_members
    has_hidden_members :: Maybe Bool,
    -- | Identifier of the supergroup
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupHasHiddenMembers where
  show
    ToggleSupergroupHasHiddenMembers
      { has_hidden_members = has_hidden_members_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupHasHiddenMembers"
        ++ U.cc
          [ U.p "has_hidden_members" has_hidden_members_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupHasHiddenMembers where
  toJSON
    ToggleSupergroupHasHiddenMembers
      { has_hidden_members = has_hidden_members_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupHasHiddenMembers",
          "has_hidden_members" A..= has_hidden_members_,
          "supergroup_id" A..= supergroup_id_
        ]
