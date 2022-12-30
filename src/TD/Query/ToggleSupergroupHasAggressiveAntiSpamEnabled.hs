{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupHasAggressiveAntiSpamEnabled where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether aggressive anti-spam checks are enabled in the supergroup. Can be called only if supergroupFullInfo.can_toggle_aggressive_anti_spam == true
data ToggleSupergroupHasAggressiveAntiSpamEnabled = ToggleSupergroupHasAggressiveAntiSpamEnabled
  { -- | The new value of has_aggressive_anti_spam_enabled
    has_aggressive_anti_spam_enabled :: Maybe Bool,
    -- | The identifier of the supergroup, which isn't a broadcast group
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupHasAggressiveAntiSpamEnabled where
  show
    ToggleSupergroupHasAggressiveAntiSpamEnabled
      { has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupHasAggressiveAntiSpamEnabled"
        ++ U.cc
          [ U.p "has_aggressive_anti_spam_enabled" has_aggressive_anti_spam_enabled_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupHasAggressiveAntiSpamEnabled where
  toJSON
    ToggleSupergroupHasAggressiveAntiSpamEnabled
      { has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupHasAggressiveAntiSpamEnabled",
          "has_aggressive_anti_spam_enabled" A..= has_aggressive_anti_spam_enabled_,
          "supergroup_id" A..= supergroup_id_
        ]
