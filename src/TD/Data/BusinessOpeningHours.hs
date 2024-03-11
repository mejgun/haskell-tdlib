module TD.Data.BusinessOpeningHours
  ( BusinessOpeningHours(..)    
  , defaultBusinessOpeningHours 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.BusinessOpeningHoursInterval as BusinessOpeningHoursInterval

data BusinessOpeningHours
  = BusinessOpeningHours -- ^ Describes opening hours of a business
    { time_zone_id  :: Maybe T.Text                                                      -- ^ Unique time zone identifier
    , opening_hours :: Maybe [BusinessOpeningHoursInterval.BusinessOpeningHoursInterval] -- ^ Intervals of the time when the business is open
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessOpeningHours where
  shortShow BusinessOpeningHours
    { time_zone_id  = time_zone_id_
    , opening_hours = opening_hours_
    }
      = "BusinessOpeningHours"
        ++ I.cc
        [ "time_zone_id"  `I.p` time_zone_id_
        , "opening_hours" `I.p` opening_hours_
        ]

instance AT.FromJSON BusinessOpeningHours where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessOpeningHours" -> parseBusinessOpeningHours v
      _                      -> mempty
    
    where
      parseBusinessOpeningHours :: A.Value -> AT.Parser BusinessOpeningHours
      parseBusinessOpeningHours = A.withObject "BusinessOpeningHours" $ \o -> do
        time_zone_id_  <- o A..:?  "time_zone_id"
        opening_hours_ <- o A..:?  "opening_hours"
        pure $ BusinessOpeningHours
          { time_zone_id  = time_zone_id_
          , opening_hours = opening_hours_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessOpeningHours where
  toJSON BusinessOpeningHours
    { time_zone_id  = time_zone_id_
    , opening_hours = opening_hours_
    }
      = A.object
        [ "@type"         A..= AT.String "businessOpeningHours"
        , "time_zone_id"  A..= time_zone_id_
        , "opening_hours" A..= opening_hours_
        ]

defaultBusinessOpeningHours :: BusinessOpeningHours
defaultBusinessOpeningHours =
  BusinessOpeningHours
    { time_zone_id  = Nothing
    , opening_hours = Nothing
    }

