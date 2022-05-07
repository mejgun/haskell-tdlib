{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Countries where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.CountryInfo as CountryInfo
import qualified Utils as U

data Countries = -- | Contains information about countries @countries The list of countries
  Countries
  { -- |
    countries :: Maybe [CountryInfo.CountryInfo]
  }
  deriving (Eq)

instance Show Countries where
  show
    Countries
      { countries = countries
      } =
      "Countries"
        ++ U.cc
          [ U.p "countries" countries
          ]

instance T.FromJSON Countries where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "countries" -> parseCountries v
      _ -> fail ""
    where
      parseCountries :: A.Value -> T.Parser Countries
      parseCountries = A.withObject "Countries" $ \o -> do
        countries_ <- o A..:? "countries"
        return $ Countries {countries = countries_}
  parseJSON _ = fail ""

instance T.ToJSON Countries where
  toJSON
    Countries
      { countries = countries
      } =
      A.object
        [ "@type" A..= T.String "countries",
          "countries" A..= countries
        ]
