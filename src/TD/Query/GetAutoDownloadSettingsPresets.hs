module TD.Query.GetAutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetAutoDownloadSettingsPresets -- ^ Returns auto-download settings presets for the current user
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
