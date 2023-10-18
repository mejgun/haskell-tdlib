module TD.Query.ToggleSupergroupHasAggressiveAntiSpamEnabled
  (ToggleSupergroupHasAggressiveAntiSpamEnabled(..)
  , defaultToggleSupergroupHasAggressiveAntiSpamEnabled
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether aggressive anti-spam checks are enabled in the supergroup. Can be called only if supergroupFullInfo.can_toggle_aggressive_anti_spam == true. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupHasAggressiveAntiSpamEnabled
  = ToggleSupergroupHasAggressiveAntiSpamEnabled
    { supergroup_id                    :: Maybe Int  -- ^ The identifier of the supergroup, which isn't a broadcast group
    , has_aggressive_anti_spam_enabled :: Maybe Bool -- ^ The new value of has_aggressive_anti_spam_enabled
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupHasAggressiveAntiSpamEnabled where
  shortShow
    ToggleSupergroupHasAggressiveAntiSpamEnabled
      { supergroup_id                    = supergroup_id_
      , has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
      }
        = "ToggleSupergroupHasAggressiveAntiSpamEnabled"
          ++ I.cc
          [ "supergroup_id"                    `I.p` supergroup_id_
          , "has_aggressive_anti_spam_enabled" `I.p` has_aggressive_anti_spam_enabled_
          ]

instance AT.ToJSON ToggleSupergroupHasAggressiveAntiSpamEnabled where
  toJSON
    ToggleSupergroupHasAggressiveAntiSpamEnabled
      { supergroup_id                    = supergroup_id_
      , has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
      }
        = A.object
          [ "@type"                            A..= AT.String "toggleSupergroupHasAggressiveAntiSpamEnabled"
          , "supergroup_id"                    A..= supergroup_id_
          , "has_aggressive_anti_spam_enabled" A..= has_aggressive_anti_spam_enabled_
          ]

defaultToggleSupergroupHasAggressiveAntiSpamEnabled :: ToggleSupergroupHasAggressiveAntiSpamEnabled
defaultToggleSupergroupHasAggressiveAntiSpamEnabled =
  ToggleSupergroupHasAggressiveAntiSpamEnabled
    { supergroup_id                    = Nothing
    , has_aggressive_anti_spam_enabled = Nothing
    }

