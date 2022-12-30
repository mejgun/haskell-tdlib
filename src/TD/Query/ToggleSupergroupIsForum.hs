{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupIsForum where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion supergroups can't be converted to forums @supergroup_id Identifier of the supergroup @is_forum New value of is_forum
data ToggleSupergroupIsForum = ToggleSupergroupIsForum
  { -- |
    is_forum :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupIsForum where
  show
    ToggleSupergroupIsForum
      { is_forum = is_forum_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupIsForum"
        ++ U.cc
          [ U.p "is_forum" is_forum_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupIsForum where
  toJSON
    ToggleSupergroupIsForum
      { is_forum = is_forum_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupIsForum",
          "is_forum" A..= is_forum_,
          "supergroup_id" A..= supergroup_id_
        ]
