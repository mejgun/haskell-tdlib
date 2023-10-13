module TD.Query.GetSavedAnimations
  (GetSavedAnimations(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns saved animations
data GetSavedAnimations
  = GetSavedAnimations
  deriving (Eq)

instance Show GetSavedAnimations where
  show
    GetSavedAnimations
        = "GetSavedAnimations"

instance AT.ToJSON GetSavedAnimations where
  toJSON
    GetSavedAnimations
        = A.object
          [ "@type" A..= AT.String "getSavedAnimations"
          ]

