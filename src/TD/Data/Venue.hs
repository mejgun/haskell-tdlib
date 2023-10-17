module TD.Data.Venue
  ( Venue(..)    
  , defaultVenue 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified Data.Text as T

data Venue
  = Venue -- ^ Describes a venue
    { location :: Maybe Location.Location -- ^ Venue location; as defined by the sender
    , title    :: Maybe T.Text            -- ^ Venue name; as defined by the sender
    , address  :: Maybe T.Text            -- ^ Venue address; as defined by the sender
    , provider :: Maybe T.Text            -- ^ Provider of the venue database; as defined by the sender. Currently, only "foursquare" and "gplaces" (Google Places) need to be supported
    , _id      :: Maybe T.Text            -- ^ Identifier of the venue in the provider database; as defined by the sender
    , _type    :: Maybe T.Text            -- ^ Type of the venue in the provider database; as defined by the sender
    }
  deriving (Eq, Show)

instance I.ShortShow Venue where
  shortShow Venue
    { location = location_
    , title    = title_
    , address  = address_
    , provider = provider_
    , _id      = _id_
    , _type    = _type_
    }
      = "Venue"
        ++ I.cc
        [ "location" `I.p` location_
        , "title"    `I.p` title_
        , "address"  `I.p` address_
        , "provider" `I.p` provider_
        , "_id"      `I.p` _id_
        , "_type"    `I.p` _type_
        ]

instance AT.FromJSON Venue where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "venue" -> parseVenue v
      _       -> mempty
    
    where
      parseVenue :: A.Value -> AT.Parser Venue
      parseVenue = A.withObject "Venue" $ \o -> do
        location_ <- o A..:?  "location"
        title_    <- o A..:?  "title"
        address_  <- o A..:?  "address"
        provider_ <- o A..:?  "provider"
        _id_      <- o A..:?  "id"
        _type_    <- o A..:?  "type"
        pure $ Venue
          { location = location_
          , title    = title_
          , address  = address_
          , provider = provider_
          , _id      = _id_
          , _type    = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON Venue where
  toJSON Venue
    { location = location_
    , title    = title_
    , address  = address_
    , provider = provider_
    , _id      = _id_
    , _type    = _type_
    }
      = A.object
        [ "@type"    A..= AT.String "venue"
        , "location" A..= location_
        , "title"    A..= title_
        , "address"  A..= address_
        , "provider" A..= provider_
        , "id"       A..= _id_
        , "type"     A..= _type_
        ]

defaultVenue :: Venue
defaultVenue =
  Venue
    { location = Nothing
    , title    = Nothing
    , address  = Nothing
    , provider = Nothing
    , _id      = Nothing
    , _type    = Nothing
    }

