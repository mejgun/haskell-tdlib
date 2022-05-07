{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleSupergroupIsAllHistoryAvailable where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether the message history of a supergroup is available to new members; requires can_change_info administrator right @supergroup_id The identifier of the supergroup @is_all_history_available The new value of is_all_history_available
data ToggleSupergroupIsAllHistoryAvailable = ToggleSupergroupIsAllHistoryAvailable
  { -- |
    is_all_history_available :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupIsAllHistoryAvailable where
  show
    ToggleSupergroupIsAllHistoryAvailable
      { is_all_history_available = is_all_history_available,
        supergroup_id = supergroup_id
      } =
      "ToggleSupergroupIsAllHistoryAvailable"
        ++ U.cc
          [ U.p "is_all_history_available" is_all_history_available,
            U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON ToggleSupergroupIsAllHistoryAvailable where
  toJSON
    ToggleSupergroupIsAllHistoryAvailable
      { is_all_history_available = is_all_history_available,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupIsAllHistoryAvailable",
          "is_all_history_available" A..= is_all_history_available,
          "supergroup_id" A..= supergroup_id
        ]
