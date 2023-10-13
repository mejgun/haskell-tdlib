module TD.Data.DateRange
  ( DateRange(..)    
  , defaultDateRange 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data DateRange
  = DateRange -- ^ Represents a date range
    { start_date :: Maybe Int -- ^ Point in time (Unix timestamp) at which the date range begins
    , end_date   :: Maybe Int -- ^ Point in time (Unix timestamp) at which the date range ends
    }
  deriving (Eq)

instance Show DateRange where
  show DateRange
    { start_date = start_date_
    , end_date   = end_date_
    }
      = "DateRange"
        ++ I.cc
        [ "start_date" `I.p` start_date_
        , "end_date"   `I.p` end_date_
        ]

instance AT.FromJSON DateRange where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "dateRange" -> parseDateRange v
      _           -> mempty
    
    where
      parseDateRange :: A.Value -> AT.Parser DateRange
      parseDateRange = A.withObject "DateRange" $ \o -> do
        start_date_ <- o A..:?  "start_date"
        end_date_   <- o A..:?  "end_date"
        pure $ DateRange
          { start_date = start_date_
          , end_date   = end_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON DateRange where
  toJSON DateRange
    { start_date = start_date_
    , end_date   = end_date_
    }
      = A.object
        [ "@type"      A..= AT.String "dateRange"
        , "start_date" A..= start_date_
        , "end_date"   A..= end_date_
        ]

defaultDateRange :: DateRange
defaultDateRange =
  DateRange
    { start_date = Nothing
    , end_date   = Nothing
    }

