{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DisableAllSupergroupUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel
data DisableAllSupergroupUsernames = DisableAllSupergroupUsernames
  { -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show DisableAllSupergroupUsernames where
  show
    DisableAllSupergroupUsernames
      { supergroup_id = supergroup_id_
      } =
      "DisableAllSupergroupUsernames"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON DisableAllSupergroupUsernames where
  toJSON
    DisableAllSupergroupUsernames
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "disableAllSupergroupUsernames",
          "supergroup_id" A..= supergroup_id_
        ]
