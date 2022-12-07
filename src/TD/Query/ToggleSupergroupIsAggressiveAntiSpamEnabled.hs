{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupIsAggressiveAntiSpamEnabled where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether aggressive anti-spam checks are enabled in the supergroup; requires can_delete_messages administrator right. Can be called only if the supergroup has at least getOption("aggressive_anti_spam_supergroup_member_count_min") members @supergroup_id The identifier of the supergroup, which isn't a broadcast group @is_aggressive_anti_spam_enabled The new value of is_aggressive_anti_spam_enabled
data ToggleSupergroupIsAggressiveAntiSpamEnabled = ToggleSupergroupIsAggressiveAntiSpamEnabled
  { -- |
    is_aggressive_anti_spam_enabled :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupIsAggressiveAntiSpamEnabled where
  show
    ToggleSupergroupIsAggressiveAntiSpamEnabled
      { is_aggressive_anti_spam_enabled = is_aggressive_anti_spam_enabled_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupIsAggressiveAntiSpamEnabled"
        ++ U.cc
          [ U.p "is_aggressive_anti_spam_enabled" is_aggressive_anti_spam_enabled_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupIsAggressiveAntiSpamEnabled where
  toJSON
    ToggleSupergroupIsAggressiveAntiSpamEnabled
      { is_aggressive_anti_spam_enabled = is_aggressive_anti_spam_enabled_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupIsAggressiveAntiSpamEnabled",
          "is_aggressive_anti_spam_enabled" A..= is_aggressive_anti_spam_enabled_,
          "supergroup_id" A..= supergroup_id_
        ]
