module TD.Data.LocationAddress
  ( LocationAddress(..)    
  , defaultLocationAddress 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data LocationAddress
  = LocationAddress -- ^ Describes an address of a location
    { country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code
    , state        :: Maybe T.Text -- ^ State, if applicable; empty if unknown
    , city         :: Maybe T.Text -- ^ City; empty if unknown
    , street       :: Maybe T.Text -- ^ The address; empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow LocationAddress where
  shortShow LocationAddress
    { country_code = country_code_
    , state        = state_
    , city         = city_
    , street       = street_
    }
      = "LocationAddress"
        ++ I.cc
        [ "country_code" `I.p` country_code_
        , "state"        `I.p` state_
        , "city"         `I.p` city_
        , "street"       `I.p` street_
        ]

instance AT.FromJSON LocationAddress where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "locationAddress" -> parseLocationAddress v
      _                 -> mempty
    
    where
      parseLocationAddress :: A.Value -> AT.Parser LocationAddress
      parseLocationAddress = A.withObject "LocationAddress" $ \o -> do
        country_code_ <- o A..:?  "country_code"
        state_        <- o A..:?  "state"
        city_         <- o A..:?  "city"
        street_       <- o A..:?  "street"
        pure $ LocationAddress
          { country_code = country_code_
          , state        = state_
          , city         = city_
          , street       = street_
          }
  parseJSON _ = mempty

instance AT.ToJSON LocationAddress where
  toJSON LocationAddress
    { country_code = country_code_
    , state        = state_
    , city         = city_
    , street       = street_
    }
      = A.object
        [ "@type"        A..= AT.String "locationAddress"
        , "country_code" A..= country_code_
        , "state"        A..= state_
        , "city"         A..= city_
        , "street"       A..= street_
        ]

defaultLocationAddress :: LocationAddress
defaultLocationAddress =
  LocationAddress
    { country_code = Nothing
    , state        = Nothing
    , city         = Nothing
    , street       = Nothing
    }

