{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupJoinByRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right @supergroup_id Identifier of the channel @join_by_request New value of join_by_request
data ToggleSupergroupJoinByRequest = ToggleSupergroupJoinByRequest
  { -- |
    join_by_request :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupJoinByRequest where
  show
    ToggleSupergroupJoinByRequest
      { join_by_request = join_by_request_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupJoinByRequest"
        ++ U.cc
          [ U.p "join_by_request" join_by_request_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupJoinByRequest where
  toJSON
    ToggleSupergroupJoinByRequest
      { join_by_request = join_by_request_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupJoinByRequest",
          "join_by_request" A..= join_by_request_,
          "supergroup_id" A..= supergroup_id_
        ]
