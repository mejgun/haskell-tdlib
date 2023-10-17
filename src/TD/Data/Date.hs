module TD.Data.Date
  ( Date(..)    
  , defaultDate 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Date
  = Date -- ^ Represents a date according to the Gregorian calendar
    { day   :: Maybe Int -- ^ Day of the month; 1-31
    , month :: Maybe Int -- ^ Month; 1-12
    , year  :: Maybe Int -- ^ Year; 1-9999
    }
  deriving (Eq, Show)

instance I.ShortShow Date where
  shortShow Date
    { day   = day_
    , month = month_
    , year  = year_
    }
      = "Date"
        ++ I.cc
        [ "day"   `I.p` day_
        , "month" `I.p` month_
        , "year"  `I.p` year_
        ]

instance AT.FromJSON Date where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "date" -> parseDate v
      _      -> mempty
    
    where
      parseDate :: A.Value -> AT.Parser Date
      parseDate = A.withObject "Date" $ \o -> do
        day_   <- o A..:?  "day"
        month_ <- o A..:?  "month"
        year_  <- o A..:?  "year"
        pure $ Date
          { day   = day_
          , month = month_
          , year  = year_
          }
  parseJSON _ = mempty

instance AT.ToJSON Date where
  toJSON Date
    { day   = day_
    , month = month_
    , year  = year_
    }
      = A.object
        [ "@type" A..= AT.String "date"
        , "day"   A..= day_
        , "month" A..= month_
        , "year"  A..= year_
        ]

defaultDate :: Date
defaultDate =
  Date
    { day   = Nothing
    , month = Nothing
    , year  = Nothing
    }

