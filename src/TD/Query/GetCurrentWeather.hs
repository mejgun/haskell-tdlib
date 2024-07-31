module TD.Query.GetCurrentWeather
  (GetCurrentWeather(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

-- | Returns the current weather in the given location. Returns 'TD.Data.CurrentWeather.CurrentWeather'
data GetCurrentWeather
  = GetCurrentWeather
    { location :: Maybe Location.Location -- ^ The location
    }
  deriving (Eq, Show)

instance I.ShortShow GetCurrentWeather where
  shortShow
    GetCurrentWeather
      { location = location_
      }
        = "GetCurrentWeather"
          ++ I.cc
          [ "location" `I.p` location_
          ]

instance AT.ToJSON GetCurrentWeather where
  toJSON
    GetCurrentWeather
      { location = location_
      }
        = A.object
          [ "@type"    A..= AT.String "getCurrentWeather"
          , "location" A..= location_
          ]

