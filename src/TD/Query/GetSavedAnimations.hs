module TD.Query.GetSavedAnimations
  (GetSavedAnimations(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns saved animations. Returns 'TD.Data.Animations.Animations'
data GetSavedAnimations
  = GetSavedAnimations
  deriving (Eq, Show)

instance I.ShortShow GetSavedAnimations where
  shortShow
    GetSavedAnimations
        = "GetSavedAnimations"

instance AT.ToJSON GetSavedAnimations where
  toJSON
    GetSavedAnimations
        = A.object
          [ "@type" A..= AT.String "getSavedAnimations"
          ]

