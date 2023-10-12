module TD.Data.AutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings

data AutoDownloadSettingsPresets
  = AutoDownloadSettingsPresets -- ^ Contains auto-download settings presets for the current user
    { low    :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with lowest settings; supposed to be used by default when roaming
    , medium :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with medium settings; supposed to be used by default when using mobile data
    , high   :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ Preset with highest settings; supposed to be used by default when connected on Wi-Fi
    }
  deriving (Eq)

instance Show AutoDownloadSettingsPresets where
  show AutoDownloadSettingsPresets
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

instance AT.ToJSON AutoDownloadSettingsPresets where
  toJSON AutoDownloadSettingsPresets
    { low    = low_
    , medium = medium_
    , high   = high_
    }
      = A.object
        [ "@type"  A..= AT.String "autoDownloadSettingsPresets"
        , "low"    A..= low_
        , "medium" A..= medium_
        , "high"   A..= high_
        ]
