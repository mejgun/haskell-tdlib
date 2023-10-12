module TD.Query.SetAutoDownloadSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings
import qualified TD.Data.NetworkType as NetworkType

data SetAutoDownloadSettings -- ^ Sets auto-download settings
  = SetAutoDownloadSettings
    { settings :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ New user auto-download settings
    , _type    :: Maybe NetworkType.NetworkType                   -- ^ Type of the network for which the new settings are relevant
    }
  deriving (Eq)

instance Show SetAutoDownloadSettings where
  show
    SetAutoDownloadSettings
      { settings = settings_
      , _type    = _type_
      }
        = "SetAutoDownloadSettings"
          ++ I.cc
          [ "settings" `I.p` settings_
          , "_type"    `I.p` _type_
          ]

instance AT.ToJSON SetAutoDownloadSettings where
  toJSON
    SetAutoDownloadSettings
      { settings = settings_
      , _type    = _type_
      }
        = A.object
          [ "@type"    A..= AT.String "setAutoDownloadSettings"
          , "settings" A..= settings_
          , "type"     A..= _type_
          ]
