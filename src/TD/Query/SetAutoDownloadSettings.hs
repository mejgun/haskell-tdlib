{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetAutoDownloadSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AutoDownloadSettings as AutoDownloadSettings
import qualified TD.Data.NetworkType as NetworkType
import qualified Utils as U

-- |
-- Sets auto-download settings @settings New user auto-download settings @type Type of the network for which the new settings are relevant
data SetAutoDownloadSettings = SetAutoDownloadSettings
  { -- |
    _type :: Maybe NetworkType.NetworkType,
    -- |
    settings :: Maybe AutoDownloadSettings.AutoDownloadSettings
  }
  deriving (Eq)

instance Show SetAutoDownloadSettings where
  show
    SetAutoDownloadSettings
      { _type = _type,
        settings = settings
      } =
      "SetAutoDownloadSettings"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "settings" settings
          ]

instance T.ToJSON SetAutoDownloadSettings where
  toJSON
    SetAutoDownloadSettings
      { _type = _type,
        settings = settings
      } =
      A.object
        [ "@type" A..= T.String "setAutoDownloadSettings",
          "type" A..= _type,
          "settings" A..= settings
        ]
