{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Venue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified Utils as U

data Venue = -- | Describes a venue @location Venue location; as defined by the sender @title Venue name; as defined by the sender @address Venue address; as defined by the sender @provider Provider of the venue database; as defined by the sender. Currently, only "foursquare" and "gplaces" (Google Places) need to be supported
  Venue
  { -- |
    _type :: Maybe String,
    -- | Identifier of the venue in the provider database; as defined by the sender @type Type of the venue in the provider database; as defined by the sender
    _id :: Maybe String,
    -- |
    provider :: Maybe String,
    -- |
    address :: Maybe String,
    -- |
    title :: Maybe String,
    -- |
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show Venue where
  show
    Venue
      { _type = _type_,
        _id = _id_,
        provider = provider_,
        address = address_,
        title = title_,
        location = location_
      } =
      "Venue"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "_id" _id_,
            U.p "provider" provider_,
            U.p "address" address_,
            U.p "title" title_,
            U.p "location" location_
          ]

instance T.FromJSON Venue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "venue" -> parseVenue v
      _ -> mempty
    where
      parseVenue :: A.Value -> T.Parser Venue
      parseVenue = A.withObject "Venue" $ \o -> do
        _type_ <- o A..:? "type"
        _id_ <- o A..:? "id"
        provider_ <- o A..:? "provider"
        address_ <- o A..:? "address"
        title_ <- o A..:? "title"
        location_ <- o A..:? "location"
        return $ Venue {_type = _type_, _id = _id_, provider = provider_, address = address_, title = title_, location = location_}
  parseJSON _ = mempty

instance T.ToJSON Venue where
  toJSON
    Venue
      { _type = _type_,
        _id = _id_,
        provider = provider_,
        address = address_,
        title = title_,
        location = location_
      } =
      A.object
        [ "@type" A..= T.String "venue",
          "type" A..= _type_,
          "id" A..= _id_,
          "provider" A..= provider_,
          "address" A..= address_,
          "title" A..= title_,
          "location" A..= location_
        ]
