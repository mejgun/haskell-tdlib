module TD.Query.ResetInstalledBackgrounds
  (ResetInstalledBackgrounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resets list of installed backgrounds to its default value. Returns 'TD.Data.Ok.Ok'
data ResetInstalledBackgrounds
  = ResetInstalledBackgrounds
  deriving (Eq, Show)

instance I.ShortShow ResetInstalledBackgrounds where
  shortShow
    ResetInstalledBackgrounds
        = "ResetInstalledBackgrounds"

instance AT.ToJSON ResetInstalledBackgrounds where
  toJSON
    ResetInstalledBackgrounds
        = A.object
          [ "@type" A..= AT.String "resetInstalledBackgrounds"
          ]

