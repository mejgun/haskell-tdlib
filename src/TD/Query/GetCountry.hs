module TD.Query.GetCountry
  (GetCountry(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about an existing country. Can be called before authorization. Returns 'TD.Data.CountryInfo.CountryInfo'
data GetCountry
  = GetCountry
    { country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code
    }
  deriving (Eq, Show)

instance I.ShortShow GetCountry where
  shortShow
    GetCountry
      { country_code = country_code_
      }
        = "GetCountry"
          ++ I.cc
          [ "country_code" `I.p` country_code_
          ]

instance AT.ToJSON GetCountry where
  toJSON
    GetCountry
      { country_code = country_code_
      }
        = A.object
          [ "@type"        A..= AT.String "getCountry"
          , "country_code" A..= country_code_
          ]

