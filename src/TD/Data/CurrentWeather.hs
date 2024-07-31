module TD.Data.CurrentWeather
  (CurrentWeather(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CurrentWeather
  = CurrentWeather -- ^ Describes the current weather
    { temperature :: Maybe Double -- ^ Temperature, in degree Celsius
    , emoji       :: Maybe T.Text -- ^ Emoji representing the weather
    }
  deriving (Eq, Show)

instance I.ShortShow CurrentWeather where
  shortShow CurrentWeather
    { temperature = temperature_
    , emoji       = emoji_
    }
      = "CurrentWeather"
        ++ I.cc
        [ "temperature" `I.p` temperature_
        , "emoji"       `I.p` emoji_
        ]

instance AT.FromJSON CurrentWeather where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "currentWeather" -> parseCurrentWeather v
      _                -> mempty
    
    where
      parseCurrentWeather :: A.Value -> AT.Parser CurrentWeather
      parseCurrentWeather = A.withObject "CurrentWeather" $ \o -> do
        temperature_ <- o A..:?  "temperature"
        emoji_       <- o A..:?  "emoji"
        pure $ CurrentWeather
          { temperature = temperature_
          , emoji       = emoji_
          }
  parseJSON _ = mempty

