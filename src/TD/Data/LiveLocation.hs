module TD.Data.LiveLocation
  ( LiveLocation(..)    
  , defaultLiveLocation 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

data LiveLocation
  = LiveLocation -- ^ A live location
    { location               :: Maybe Location.Location -- ^ The current location
    , live_period            :: Maybe Int               -- ^ Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever
    , heading                :: Maybe Int               -- ^ The direction in which the location moves, in degrees; 1-360; 0 if unknown
    , proximity_alert_radius :: Maybe Int               -- ^ The maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Can't be enabled in direct messages chats, channels and Saved Messages. Available only to the message sender
    }
  deriving (Eq, Show)

instance I.ShortShow LiveLocation where
  shortShow LiveLocation
    { location               = location_
    , live_period            = live_period_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = "LiveLocation"
        ++ I.cc
        [ "location"               `I.p` location_
        , "live_period"            `I.p` live_period_
        , "heading"                `I.p` heading_
        , "proximity_alert_radius" `I.p` proximity_alert_radius_
        ]

instance AT.FromJSON LiveLocation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "liveLocation" -> parseLiveLocation v
      _              -> mempty
    
    where
      parseLiveLocation :: A.Value -> AT.Parser LiveLocation
      parseLiveLocation = A.withObject "LiveLocation" $ \o -> do
        location_               <- o A..:?  "location"
        live_period_            <- o A..:?  "live_period"
        heading_                <- o A..:?  "heading"
        proximity_alert_radius_ <- o A..:?  "proximity_alert_radius"
        pure $ LiveLocation
          { location               = location_
          , live_period            = live_period_
          , heading                = heading_
          , proximity_alert_radius = proximity_alert_radius_
          }
  parseJSON _ = mempty

instance AT.ToJSON LiveLocation where
  toJSON LiveLocation
    { location               = location_
    , live_period            = live_period_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = A.object
        [ "@type"                  A..= AT.String "liveLocation"
        , "location"               A..= location_
        , "live_period"            A..= live_period_
        , "heading"                A..= heading_
        , "proximity_alert_radius" A..= proximity_alert_radius_
        ]

defaultLiveLocation :: LiveLocation
defaultLiveLocation =
  LiveLocation
    { location               = Nothing
    , live_period            = Nothing
    , heading                = Nothing
    , proximity_alert_radius = Nothing
    }

