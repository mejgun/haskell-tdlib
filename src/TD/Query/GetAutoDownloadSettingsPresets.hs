module TD.Query.GetAutoDownloadSettingsPresets
  (GetAutoDownloadSettingsPresets(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns auto-download settings presets for the current user. Returns 'TD.Data.AutoDownloadSettingsPresets.AutoDownloadSettingsPresets'
data GetAutoDownloadSettingsPresets
  = GetAutoDownloadSettingsPresets
  deriving (Eq, Show)

instance I.ShortShow GetAutoDownloadSettingsPresets where
  shortShow
    GetAutoDownloadSettingsPresets
        = "GetAutoDownloadSettingsPresets"

instance AT.ToJSON GetAutoDownloadSettingsPresets where
  toJSON
    GetAutoDownloadSettingsPresets
        = A.object
          [ "@type" A..= AT.String "getAutoDownloadSettingsPresets"
          ]

