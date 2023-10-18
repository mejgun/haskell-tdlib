module TD.Query.GetAutosaveSettings
  (GetAutosaveSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns autosave settings for the current user. Returns 'TD.Data.AutosaveSettings.AutosaveSettings'
data GetAutosaveSettings
  = GetAutosaveSettings
  deriving (Eq, Show)

instance I.ShortShow GetAutosaveSettings where
  shortShow
    GetAutosaveSettings
        = "GetAutosaveSettings"

instance AT.ToJSON GetAutosaveSettings where
  toJSON
    GetAutosaveSettings
        = A.object
          [ "@type" A..= AT.String "getAutosaveSettings"
          ]

