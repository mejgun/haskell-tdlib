{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Location where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Location = -- | Describes a location on planet Earth
  Location
  { -- | The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
    horizontal_accuracy :: Maybe Float,
    -- | Longitude of the location, in degrees; as defined by the sender
    longitude :: Maybe Float,
    -- | Latitude of the location in degrees; as defined by the sender
    latitude :: Maybe Float
  }
  deriving (Eq)

instance Show Location where
  show
    Location
      { horizontal_accuracy = horizontal_accuracy_,
        longitude = longitude_,
        latitude = latitude_
      } =
      "Location"
        ++ U.cc
          [ U.p "horizontal_accuracy" horizontal_accuracy_,
            U.p "longitude" longitude_,
            U.p "latitude" latitude_
          ]

instance T.FromJSON Location where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "location" -> parseLocation v
      _ -> mempty
    where
      parseLocation :: A.Value -> T.Parser Location
      parseLocation = A.withObject "Location" $ \o -> do
        horizontal_accuracy_ <- o A..:? "horizontal_accuracy"
        longitude_ <- o A..:? "longitude"
        latitude_ <- o A..:? "latitude"
        return $ Location {horizontal_accuracy = horizontal_accuracy_, longitude = longitude_, latitude = latitude_}
  parseJSON _ = mempty

instance T.ToJSON Location where
  toJSON
    Location
      { horizontal_accuracy = horizontal_accuracy_,
        longitude = longitude_,
        latitude = latitude_
      } =
      A.object
        [ "@type" A..= T.String "location",
          "horizontal_accuracy" A..= horizontal_accuracy_,
          "longitude" A..= longitude_,
          "latitude" A..= latitude_
        ]
