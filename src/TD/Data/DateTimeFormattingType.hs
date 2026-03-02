module TD.Data.DateTimeFormattingType
  (DateTimeFormattingType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DateTimePartPrecision as DateTimePartPrecision

-- | Describes date and time formatting
data DateTimeFormattingType
  = DateTimeFormattingTypeRelative -- ^ The time must be shown relative to the current time ([in ] X seconds, minutes, hours, days, months, years [ago])
  | DateTimeFormattingTypeAbsolute -- ^ The date and time must be shown as absolute timestamps
    { time_precision   :: Maybe DateTimePartPrecision.DateTimePartPrecision -- ^ The precision with which hours, minutes and seconds are shown
    , date_precision   :: Maybe DateTimePartPrecision.DateTimePartPrecision -- ^ The precision with which the date is shown
    , show_day_of_week :: Maybe Bool                                        -- ^ True, if the day of week must be shown
    }
  deriving (Eq, Show)

instance I.ShortShow DateTimeFormattingType where
  shortShow DateTimeFormattingTypeRelative
      = "DateTimeFormattingTypeRelative"
  shortShow DateTimeFormattingTypeAbsolute
    { time_precision   = time_precision_
    , date_precision   = date_precision_
    , show_day_of_week = show_day_of_week_
    }
      = "DateTimeFormattingTypeAbsolute"
        ++ I.cc
        [ "time_precision"   `I.p` time_precision_
        , "date_precision"   `I.p` date_precision_
        , "show_day_of_week" `I.p` show_day_of_week_
        ]

instance AT.FromJSON DateTimeFormattingType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "dateTimeFormattingTypeRelative" -> pure DateTimeFormattingTypeRelative
      "dateTimeFormattingTypeAbsolute" -> parseDateTimeFormattingTypeAbsolute v
      _                                -> mempty
    
    where
      parseDateTimeFormattingTypeAbsolute :: A.Value -> AT.Parser DateTimeFormattingType
      parseDateTimeFormattingTypeAbsolute = A.withObject "DateTimeFormattingTypeAbsolute" $ \o -> do
        time_precision_   <- o A..:?  "time_precision"
        date_precision_   <- o A..:?  "date_precision"
        show_day_of_week_ <- o A..:?  "show_day_of_week"
        pure $ DateTimeFormattingTypeAbsolute
          { time_precision   = time_precision_
          , date_precision   = date_precision_
          , show_day_of_week = show_day_of_week_
          }
  parseJSON _ = mempty

instance AT.ToJSON DateTimeFormattingType where
  toJSON DateTimeFormattingTypeRelative
      = A.object
        [ "@type" A..= AT.String "dateTimeFormattingTypeRelative"
        ]
  toJSON DateTimeFormattingTypeAbsolute
    { time_precision   = time_precision_
    , date_precision   = date_precision_
    , show_day_of_week = show_day_of_week_
    }
      = A.object
        [ "@type"            A..= AT.String "dateTimeFormattingTypeAbsolute"
        , "time_precision"   A..= time_precision_
        , "date_precision"   A..= date_precision_
        , "show_day_of_week" A..= show_day_of_week_
        ]

