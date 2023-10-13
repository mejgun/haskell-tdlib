module TD.Query.GetCountries
  (GetCountries(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetCountries -- ^ Returns information about existing countries. Can be called before authorization
  = GetCountries
  deriving (Eq)

instance Show GetCountries where
  show
    GetCountries
        = "GetCountries"

instance AT.ToJSON GetCountries where
  toJSON
    GetCountries
        = A.object
          [ "@type" A..= AT.String "getCountries"
          ]

