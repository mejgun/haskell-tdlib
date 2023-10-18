module TD.Query.GetCountries
  (GetCountries(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about existing countries. Can be called before authorization. Returns 'TD.Data.Countries.Countries'
data GetCountries
  = GetCountries
  deriving (Eq, Show)

instance I.ShortShow GetCountries where
  shortShow
    GetCountries
        = "GetCountries"

instance AT.ToJSON GetCountries where
  toJSON
    GetCountries
        = A.object
          [ "@type" A..= AT.String "getCountries"
          ]

