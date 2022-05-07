{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Venue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Location as Location
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
      { _type = _type,
        _id = _id,
        provider = provider,
        address = address,
        title = title,
        location = location
      } =
      "Venue"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "_id" _id,
            U.p "provider" provider,
            U.p "address" address,
            U.p "title" title,
            U.p "location" location
          ]

instance T.FromJSON Venue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "venue" -> parseVenue v
      _ -> fail ""
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
  parseJSON _ = fail ""

instance T.ToJSON Venue where
  toJSON
    Venue
      { _type = _type,
        _id = _id,
        provider = provider,
        address = address,
        title = title,
        location = location
      } =
      A.object
        [ "@type" A..= T.String "venue",
          "type" A..= _type,
          "id" A..= _id,
          "provider" A..= provider,
          "address" A..= address,
          "title" A..= title,
          "location" A..= location
        ]
