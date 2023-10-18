module TD.Query.GetCountryCode
  (GetCountryCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization. Returns 'TD.Data.Text.Text'
data GetCountryCode
  = GetCountryCode
  deriving (Eq, Show)

instance I.ShortShow GetCountryCode where
  shortShow
    GetCountryCode
        = "GetCountryCode"

instance AT.ToJSON GetCountryCode where
  toJSON
    GetCountryCode
        = A.object
          [ "@type" A..= AT.String "getCountryCode"
          ]

