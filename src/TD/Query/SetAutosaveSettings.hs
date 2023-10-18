module TD.Query.SetAutosaveSettings
  (SetAutosaveSettings(..)
  , defaultSetAutosaveSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AutosaveSettingsScope as AutosaveSettingsScope
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings

-- | Sets autosave settings for the given scope. The method is guaranteed to work only after at least one call to getAutosaveSettings. Returns 'TD.Data.Ok.Ok'
data SetAutosaveSettings
  = SetAutosaveSettings
    { scope    :: Maybe AutosaveSettingsScope.AutosaveSettingsScope -- ^ Autosave settings scope
    , settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings -- ^ New autosave settings for the scope; pass null to set autosave settings to default
    }
  deriving (Eq, Show)

instance I.ShortShow SetAutosaveSettings where
  shortShow
    SetAutosaveSettings
      { scope    = scope_
      , settings = settings_
      }
        = "SetAutosaveSettings"
          ++ I.cc
          [ "scope"    `I.p` scope_
          , "settings" `I.p` settings_
          ]

instance AT.ToJSON SetAutosaveSettings where
  toJSON
    SetAutosaveSettings
      { scope    = scope_
      , settings = settings_
      }
        = A.object
          [ "@type"    A..= AT.String "setAutosaveSettings"
          , "scope"    A..= scope_
          , "settings" A..= settings_
          ]

defaultSetAutosaveSettings :: SetAutosaveSettings
defaultSetAutosaveSettings =
  SetAutosaveSettings
    { scope    = Nothing
    , settings = Nothing
    }

