{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Countries where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CountryInfo as CountryInfo
import qualified Utils as U

-- |
data Countries = -- | Contains information about countries @countries The list of countries
  Countries
  { -- |
    countries :: Maybe [CountryInfo.CountryInfo]
  }
  deriving (Eq)

instance Show Countries where
  show
    Countries
      { countries = countries_
      } =
      "Countries"
        ++ U.cc
          [ U.p "countries" countries_
          ]

instance T.FromJSON Countries where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "countries" -> parseCountries v
      _ -> mempty
    where
      parseCountries :: A.Value -> T.Parser Countries
      parseCountries = A.withObject "Countries" $ \o -> do
        countries_ <- o A..:? "countries"
        return $ Countries {countries = countries_}
  parseJSON _ = mempty

instance T.ToJSON Countries where
  toJSON
    Countries
      { countries = countries_
      } =
      A.object
        [ "@type" A..= T.String "countries",
          "countries" A..= countries_
        ]
