module TD.Data.BusinessLocation
  ( BusinessLocation(..)    
  , defaultBusinessLocation 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified Data.Text as T

data BusinessLocation
  = BusinessLocation -- ^ Represents a location of a business
    { location :: Maybe Location.Location -- ^ The location; may be null if not specified
    , address  :: Maybe T.Text            -- ^ Location address; 1-96 characters
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessLocation where
  shortShow BusinessLocation
    { location = location_
    , address  = address_
    }
      = "BusinessLocation"
        ++ I.cc
        [ "location" `I.p` location_
        , "address"  `I.p` address_
        ]

instance AT.FromJSON BusinessLocation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessLocation" -> parseBusinessLocation v
      _                  -> mempty
    
    where
      parseBusinessLocation :: A.Value -> AT.Parser BusinessLocation
      parseBusinessLocation = A.withObject "BusinessLocation" $ \o -> do
        location_ <- o A..:?  "location"
        address_  <- o A..:?  "address"
        pure $ BusinessLocation
          { location = location_
          , address  = address_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessLocation where
  toJSON BusinessLocation
    { location = location_
    , address  = address_
    }
      = A.object
        [ "@type"    A..= AT.String "businessLocation"
        , "location" A..= location_
        , "address"  A..= address_
        ]

defaultBusinessLocation :: BusinessLocation
defaultBusinessLocation =
  BusinessLocation
    { location = Nothing
    , address  = Nothing
    }

