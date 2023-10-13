module TD.Query.GetAutoDownloadSettingsPresets
  (GetAutoDownloadSettingsPresets(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns auto-download settings presets for the current user
data GetAutoDownloadSettingsPresets
  = GetAutoDownloadSettingsPresets
  deriving (Eq)

instance Show GetAutoDownloadSettingsPresets where
  show
    GetAutoDownloadSettingsPresets
        = "GetAutoDownloadSettingsPresets"

instance AT.ToJSON GetAutoDownloadSettingsPresets where
  toJSON
    GetAutoDownloadSettingsPresets
        = A.object
          [ "@type" A..= AT.String "getAutoDownloadSettingsPresets"
          ]

