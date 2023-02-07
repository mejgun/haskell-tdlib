{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetAutosaveSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AutosaveSettingsScope as AutosaveSettingsScope
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified Utils as U

-- |
-- Sets autosave settings for the given scope. The method is guaranteed to work only after at least one call to getAutosaveSettings @scope Autosave settings scope @settings New autosave settings for the scope; pass null to set autosave settings to default
data SetAutosaveSettings = SetAutosaveSettings
  { -- |
    settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings,
    -- |
    scope :: Maybe AutosaveSettingsScope.AutosaveSettingsScope
  }
  deriving (Eq)

instance Show SetAutosaveSettings where
  show
    SetAutosaveSettings
      { settings = settings_,
        scope = scope_
      } =
      "SetAutosaveSettings"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "scope" scope_
          ]

instance T.ToJSON SetAutosaveSettings where
  toJSON
    SetAutosaveSettings
      { settings = settings_,
        scope = scope_
      } =
      A.object
        [ "@type" A..= T.String "setAutosaveSettings",
          "settings" A..= settings_,
          "scope" A..= scope_
        ]
