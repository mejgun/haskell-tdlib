module TD.Data.MessageCalendar
  (MessageCalendar(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageCalendarDay as MessageCalendarDay

data MessageCalendar
  = MessageCalendar -- ^ Contains information about found messages, split by days according to the option "utc_time_offset"
    { total_count :: Maybe Int                                     -- ^ Total number of found messages
    , days        :: Maybe [MessageCalendarDay.MessageCalendarDay] -- ^ Information about messages sent
    }
  deriving (Eq, Show)

instance I.ShortShow MessageCalendar where
  shortShow MessageCalendar
    { total_count = total_count_
    , days        = days_
    }
      = "MessageCalendar"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "days"        `I.p` days_
        ]

instance AT.FromJSON MessageCalendar where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageCalendar" -> parseMessageCalendar v
      _                 -> mempty
    
    where
      parseMessageCalendar :: A.Value -> AT.Parser MessageCalendar
      parseMessageCalendar = A.withObject "MessageCalendar" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        days_        <- o A..:?  "days"
        pure $ MessageCalendar
          { total_count = total_count_
          , days        = days_
          }
  parseJSON _ = mempty

