module TD.Data.CountryInfo
  (CountryInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CountryInfo
  = CountryInfo -- ^ Contains information about a country
    { country_code  :: Maybe T.Text   -- ^ A two-letter ISO 3166-1 alpha-2 country code
    , name          :: Maybe T.Text   -- ^ Native name of the country
    , english_name  :: Maybe T.Text   -- ^ English name of the country
    , is_hidden     :: Maybe Bool     -- ^ True, if the country must be hidden from the list of all countries
    , calling_codes :: Maybe [T.Text] -- ^ List of country calling codes
    }
  deriving (Eq, Show)

instance I.ShortShow CountryInfo where
  shortShow CountryInfo
    { country_code  = country_code_
    , name          = name_
    , english_name  = english_name_
    , is_hidden     = is_hidden_
    , calling_codes = calling_codes_
    }
      = "CountryInfo"
        ++ I.cc
        [ "country_code"  `I.p` country_code_
        , "name"          `I.p` name_
        , "english_name"  `I.p` english_name_
        , "is_hidden"     `I.p` is_hidden_
        , "calling_codes" `I.p` calling_codes_
        ]

instance AT.FromJSON CountryInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "countryInfo" -> parseCountryInfo v
      _             -> mempty
    
    where
      parseCountryInfo :: A.Value -> AT.Parser CountryInfo
      parseCountryInfo = A.withObject "CountryInfo" $ \o -> do
        country_code_  <- o A..:?  "country_code"
        name_          <- o A..:?  "name"
        english_name_  <- o A..:?  "english_name"
        is_hidden_     <- o A..:?  "is_hidden"
        calling_codes_ <- o A..:?  "calling_codes"
        pure $ CountryInfo
          { country_code  = country_code_
          , name          = name_
          , english_name  = english_name_
          , is_hidden     = is_hidden_
          , calling_codes = calling_codes_
          }
  parseJSON _ = mempty

