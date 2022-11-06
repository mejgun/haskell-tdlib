{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderActiveUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes order of active usernames of the current user @usernames The new order of active usernames. All currently active usernames must be specified
data ReorderActiveUsernames = ReorderActiveUsernames
  { -- |
    usernames :: Maybe [String]
  }
  deriving (Eq)

instance Show ReorderActiveUsernames where
  show
    ReorderActiveUsernames
      { usernames = usernames_
      } =
      "ReorderActiveUsernames"
        ++ U.cc
          [ U.p "usernames" usernames_
          ]

instance T.ToJSON ReorderActiveUsernames where
  toJSON
    ReorderActiveUsernames
      { usernames = usernames_
      } =
      A.object
        [ "@type" A..= T.String "reorderActiveUsernames",
          "usernames" A..= usernames_
        ]
