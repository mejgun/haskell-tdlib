module TD.Data.BusinessAwayMessageSchedule
  (BusinessAwayMessageSchedule(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes conditions for sending of away messages by a Telegram Business account
data BusinessAwayMessageSchedule
  = BusinessAwayMessageScheduleAlways -- ^ Send away messages always
  | BusinessAwayMessageScheduleOutsideOfOpeningHours -- ^ Send away messages outside of the business opening hours
  | BusinessAwayMessageScheduleCustom -- ^ Send away messages only in the specified time span
    { start_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the away messages will start to be sent
    , end_date   :: Maybe Int -- ^ Point in time (Unix timestamp) when the away messages will stop to be sent
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessAwayMessageSchedule where
  shortShow BusinessAwayMessageScheduleAlways
      = "BusinessAwayMessageScheduleAlways"
  shortShow BusinessAwayMessageScheduleOutsideOfOpeningHours
      = "BusinessAwayMessageScheduleOutsideOfOpeningHours"
  shortShow BusinessAwayMessageScheduleCustom
    { start_date = start_date_
    , end_date   = end_date_
    }
      = "BusinessAwayMessageScheduleCustom"
        ++ I.cc
        [ "start_date" `I.p` start_date_
        , "end_date"   `I.p` end_date_
        ]

instance AT.FromJSON BusinessAwayMessageSchedule where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessAwayMessageScheduleAlways"                -> pure BusinessAwayMessageScheduleAlways
      "businessAwayMessageScheduleOutsideOfOpeningHours" -> pure BusinessAwayMessageScheduleOutsideOfOpeningHours
      "businessAwayMessageScheduleCustom"                -> parseBusinessAwayMessageScheduleCustom v
      _                                                  -> mempty
    
    where
      parseBusinessAwayMessageScheduleCustom :: A.Value -> AT.Parser BusinessAwayMessageSchedule
      parseBusinessAwayMessageScheduleCustom = A.withObject "BusinessAwayMessageScheduleCustom" $ \o -> do
        start_date_ <- o A..:?  "start_date"
        end_date_   <- o A..:?  "end_date"
        pure $ BusinessAwayMessageScheduleCustom
          { start_date = start_date_
          , end_date   = end_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessAwayMessageSchedule where
  toJSON BusinessAwayMessageScheduleAlways
      = A.object
        [ "@type" A..= AT.String "businessAwayMessageScheduleAlways"
        ]
  toJSON BusinessAwayMessageScheduleOutsideOfOpeningHours
      = A.object
        [ "@type" A..= AT.String "businessAwayMessageScheduleOutsideOfOpeningHours"
        ]
  toJSON BusinessAwayMessageScheduleCustom
    { start_date = start_date_
    , end_date   = end_date_
    }
      = A.object
        [ "@type"      A..= AT.String "businessAwayMessageScheduleCustom"
        , "start_date" A..= start_date_
        , "end_date"   A..= end_date_
        ]

