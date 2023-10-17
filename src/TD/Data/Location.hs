module TD.Data.Location
  ( Location(..)    
  , defaultLocation 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Location
  = Location -- ^ Describes a location on planet Earth
    { latitude            :: Maybe Double -- ^ Latitude of the location in degrees; as defined by the sender
    , longitude           :: Maybe Double -- ^ Longitude of the location, in degrees; as defined by the sender
    , horizontal_accuracy :: Maybe Double -- ^ The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow Location where
  shortShow Location
    { latitude            = latitude_
    , longitude           = longitude_
    , horizontal_accuracy = horizontal_accuracy_
    }
      = "Location"
        ++ I.cc
        [ "latitude"            `I.p` latitude_
        , "longitude"           `I.p` longitude_
        , "horizontal_accuracy" `I.p` horizontal_accuracy_
        ]

instance AT.FromJSON Location where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "location" -> parseLocation v
      _          -> mempty
    
    where
      parseLocation :: A.Value -> AT.Parser Location
      parseLocation = A.withObject "Location" $ \o -> do
        latitude_            <- o A..:?  "latitude"
        longitude_           <- o A..:?  "longitude"
        horizontal_accuracy_ <- o A..:?  "horizontal_accuracy"
        pure $ Location
          { latitude            = latitude_
          , longitude           = longitude_
          , horizontal_accuracy = horizontal_accuracy_
          }
  parseJSON _ = mempty

instance AT.ToJSON Location where
  toJSON Location
    { latitude            = latitude_
    , longitude           = longitude_
    , horizontal_accuracy = horizontal_accuracy_
    }
      = A.object
        [ "@type"               A..= AT.String "location"
        , "latitude"            A..= latitude_
        , "longitude"           A..= longitude_
        , "horizontal_accuracy" A..= horizontal_accuracy_
        ]

defaultLocation :: Location
defaultLocation =
  Location
    { latitude            = Nothing
    , longitude           = Nothing
    , horizontal_accuracy = Nothing
    }

