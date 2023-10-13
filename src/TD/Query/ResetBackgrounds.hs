module TD.Query.ResetBackgrounds
  (ResetBackgrounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Resets list of installed backgrounds to its default value
data ResetBackgrounds
  = ResetBackgrounds
  deriving (Eq)

instance Show ResetBackgrounds where
  show
    ResetBackgrounds
        = "ResetBackgrounds"

instance AT.ToJSON ResetBackgrounds where
  toJSON
    ResetBackgrounds
        = A.object
          [ "@type" A..= AT.String "resetBackgrounds"
          ]

