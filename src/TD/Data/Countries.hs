module TD.Data.Countries
  ( Countries(..)    
  , defaultCountries 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CountryInfo as CountryInfo

data Countries
  = Countries -- ^ Contains information about countries
    { countries :: Maybe [CountryInfo.CountryInfo] -- ^ The list of countries
    }
  deriving (Eq)

instance Show Countries where
  show Countries
    { countries = countries_
    }
      = "Countries"
        ++ I.cc
        [ "countries" `I.p` countries_
        ]

instance AT.FromJSON Countries where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "countries" -> parseCountries v
      _           -> mempty
    
    where
      parseCountries :: A.Value -> AT.Parser Countries
      parseCountries = A.withObject "Countries" $ \o -> do
        countries_ <- o A..:?  "countries"
        pure $ Countries
          { countries = countries_
          }
  parseJSON _ = mempty

instance AT.ToJSON Countries where
  toJSON Countries
    { countries = countries_
    }
      = A.object
        [ "@type"     A..= AT.String "countries"
        , "countries" A..= countries_
        ]

defaultCountries :: Countries
defaultCountries =
  Countries
    { countries = Nothing
    }

