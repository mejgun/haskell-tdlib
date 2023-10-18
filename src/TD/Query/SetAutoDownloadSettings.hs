module TD.Query.SetAutoDownloadSettings
  (SetAutoDownloadSettings(..)
  , defaultSetAutoDownloadSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings
import qualified TD.Data.NetworkType as NetworkType

-- | Sets auto-download settings. Returns 'TD.Data.Ok.Ok'
data SetAutoDownloadSettings
  = SetAutoDownloadSettings
    { settings :: Maybe AutoDownloadSettings.AutoDownloadSettings -- ^ New user auto-download settings
    , _type    :: Maybe NetworkType.NetworkType                   -- ^ Type of the network for which the new settings are relevant
    }
  deriving (Eq, Show)

instance I.ShortShow SetAutoDownloadSettings where
  shortShow
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

defaultSetAutoDownloadSettings :: SetAutoDownloadSettings
defaultSetAutoDownloadSettings =
  SetAutoDownloadSettings
    { settings = Nothing
    , _type    = Nothing
    }

