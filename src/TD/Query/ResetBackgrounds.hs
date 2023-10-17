module TD.Query.ResetBackgrounds
  (ResetBackgrounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resets list of installed backgrounds to its default value
data ResetBackgrounds
  = ResetBackgrounds
  deriving (Eq, Show)

instance I.ShortShow ResetBackgrounds where
  shortShow
    ResetBackgrounds
        = "ResetBackgrounds"

instance AT.ToJSON ResetBackgrounds where
  toJSON
    ResetBackgrounds
        = A.object
          [ "@type" A..= AT.String "resetBackgrounds"
          ]

