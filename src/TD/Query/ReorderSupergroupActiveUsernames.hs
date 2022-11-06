{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderSupergroupActiveUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes order of active usernames of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel @usernames The new order of active usernames. All currently active usernames must be specified
data ReorderSupergroupActiveUsernames = ReorderSupergroupActiveUsernames
  { -- |
    usernames :: Maybe [String],
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReorderSupergroupActiveUsernames where
  show
    ReorderSupergroupActiveUsernames
      { usernames = usernames_,
        supergroup_id = supergroup_id_
      } =
      "ReorderSupergroupActiveUsernames"
        ++ U.cc
          [ U.p "usernames" usernames_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ReorderSupergroupActiveUsernames where
  toJSON
    ReorderSupergroupActiveUsernames
      { usernames = usernames_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "reorderSupergroupActiveUsernames",
          "usernames" A..= usernames_,
          "supergroup_id" A..= supergroup_id_
        ]
