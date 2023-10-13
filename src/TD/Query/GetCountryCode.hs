module TD.Query.GetCountryCode
  (GetCountryCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetCountryCode -- ^ Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
  = GetCountryCode
  deriving (Eq)

instance Show GetCountryCode where
  show
    GetCountryCode
        = "GetCountryCode"

instance AT.ToJSON GetCountryCode where
  toJSON
    GetCountryCode
        = A.object
          [ "@type" A..= AT.String "getCountryCode"
          ]

