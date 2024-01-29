module TD.Query.GetCountryFlagEmoji
  (GetCountryFlagEmoji(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an emoji for the given country. Returns an empty string on failure. Can be called synchronously. Returns 'TD.Data.Text.Text'
data GetCountryFlagEmoji
  = GetCountryFlagEmoji
    { country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code as received from getCountries
    }
  deriving (Eq, Show)

instance I.ShortShow GetCountryFlagEmoji where
  shortShow
    GetCountryFlagEmoji
      { country_code = country_code_
      }
        = "GetCountryFlagEmoji"
          ++ I.cc
          [ "country_code" `I.p` country_code_
          ]

instance AT.ToJSON GetCountryFlagEmoji where
  toJSON
    GetCountryFlagEmoji
      { country_code = country_code_
      }
        = A.object
          [ "@type"        A..= AT.String "getCountryFlagEmoji"
          , "country_code" A..= country_code_
          ]

