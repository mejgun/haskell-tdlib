module TD.Data.AutoDownloadSettingsPresets
  (AutoDownloadSettingsPresets(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings

data AutoDownloadSettingsPresets
  = AutoDownloadSettingsPresets -- ^ Contains auto-download settings presets for the current user
    { low    :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with lowest settings; expected to be used by default when roaming
    , medium :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with medium settings; expected to be used by default when using mobile data
    , high   :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with highest settings; expected to be used by default when connected on Wi-Fi
    }
  deriving (Eq, Show)

instance I.ShortShow AutoDownloadSettingsPresets where
  shortShow AutoDownloadSettingsPresets
    { low    = low_
    , medium = medium_
    , high   = high_
    }
      = "AutoDownloadSettingsPresets"
        ++ I.cc
        [ "low"    `I.p` low_
        , "medium" `I.p` medium_
        , "high"   `I.p` high_
        ]

instance AT.FromJSON AutoDownloadSettingsPresets where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "autoDownloadSettingsPresets" -> parseAutoDownloadSettingsPresets v
      _                             -> mempty
    
    where
      parseAutoDownloadSettingsPresets :: A.Value -> AT.Parser AutoDownloadSettingsPresets
      parseAutoDownloadSettingsPresets = A.withObject "AutoDownloadSettingsPresets" $ \o -> do
        low_    <- o A..:?  "low"
        medium_ <- o A..:?  "medium"
        high_   <- o A..:?  "high"
        pure $ AutoDownloadSettingsPresets
          { low    = low_
          , medium = medium_
          , high   = high_
          }
  parseJSON _ = mempty

