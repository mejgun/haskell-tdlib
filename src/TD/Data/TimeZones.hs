module TD.Data.TimeZones
  (TimeZones(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TimeZone as TimeZone

data TimeZones
  = TimeZones -- ^ Contains a list of time zones
    { time_zones :: Maybe [TimeZone.TimeZone] -- ^ A list of time zones
    }
  deriving (Eq, Show)

instance I.ShortShow TimeZones where
  shortShow TimeZones
    { time_zones = time_zones_
    }
      = "TimeZones"
        ++ I.cc
        [ "time_zones" `I.p` time_zones_
        ]

instance AT.FromJSON TimeZones where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "timeZones" -> parseTimeZones v
      _           -> mempty
    
    where
      parseTimeZones :: A.Value -> AT.Parser TimeZones
      parseTimeZones = A.withObject "TimeZones" $ \o -> do
        time_zones_ <- o A..:?  "time_zones"
        pure $ TimeZones
          { time_zones = time_zones_
          }
  parseJSON _ = mempty

