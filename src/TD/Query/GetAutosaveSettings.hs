module TD.Query.GetAutosaveSettings
  (GetAutosaveSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns autosave settings for the current user
data GetAutosaveSettings
  = GetAutosaveSettings
  deriving (Eq)

instance Show GetAutosaveSettings where
  show
    GetAutosaveSettings
        = "GetAutosaveSettings"

instance AT.ToJSON GetAutosaveSettings where
  toJSON
    GetAutosaveSettings
        = A.object
          [ "@type" A..= AT.String "getAutosaveSettings"
          ]

