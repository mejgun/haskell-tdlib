module TD.Query.GetPreferredCountryLanguage
  (GetPreferredCountryLanguage(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown. Returns 'TD.Data.Text.Text'
data GetPreferredCountryLanguage
  = GetPreferredCountryLanguage
    { country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code
    }
  deriving (Eq, Show)

instance I.ShortShow GetPreferredCountryLanguage where
  shortShow
    GetPreferredCountryLanguage
      { country_code = country_code_
      }
        = "GetPreferredCountryLanguage"
          ++ I.cc
          [ "country_code" `I.p` country_code_
          ]

instance AT.ToJSON GetPreferredCountryLanguage where
  toJSON
    GetPreferredCountryLanguage
      { country_code = country_code_
      }
        = A.object
          [ "@type"        A..= AT.String "getPreferredCountryLanguage"
          , "country_code" A..= country_code_
          ]

