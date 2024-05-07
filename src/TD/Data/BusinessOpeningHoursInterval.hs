module TD.Data.BusinessOpeningHoursInterval
  ( BusinessOpeningHoursInterval(..)    
  , defaultBusinessOpeningHoursInterval 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data BusinessOpeningHoursInterval
  = BusinessOpeningHoursInterval -- ^ Describes an interval of time when the business is open
    { start_minute :: Maybe Int -- ^ The minute's sequence number in a week, starting on Monday, marking the start of the time interval during which the business is open; 0-7*24*60
    , end_minute   :: Maybe Int -- ^ The minute's sequence number in a week, starting on Monday, marking the end of the time interval during which the business is open; 1-8*24*60
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessOpeningHoursInterval where
  shortShow BusinessOpeningHoursInterval
    { start_minute = start_minute_
    , end_minute   = end_minute_
    }
      = "BusinessOpeningHoursInterval"
        ++ I.cc
        [ "start_minute" `I.p` start_minute_
        , "end_minute"   `I.p` end_minute_
        ]

instance AT.FromJSON BusinessOpeningHoursInterval where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessOpeningHoursInterval" -> parseBusinessOpeningHoursInterval v
      _                              -> mempty
    
    where
      parseBusinessOpeningHoursInterval :: A.Value -> AT.Parser BusinessOpeningHoursInterval
      parseBusinessOpeningHoursInterval = A.withObject "BusinessOpeningHoursInterval" $ \o -> do
        start_minute_ <- o A..:?  "start_minute"
        end_minute_   <- o A..:?  "end_minute"
        pure $ BusinessOpeningHoursInterval
          { start_minute = start_minute_
          , end_minute   = end_minute_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessOpeningHoursInterval where
  toJSON BusinessOpeningHoursInterval
    { start_minute = start_minute_
    , end_minute   = end_minute_
    }
      = A.object
        [ "@type"        A..= AT.String "businessOpeningHoursInterval"
        , "start_minute" A..= start_minute_
        , "end_minute"   A..= end_minute_
        ]

defaultBusinessOpeningHoursInterval :: BusinessOpeningHoursInterval
defaultBusinessOpeningHoursInterval =
  BusinessOpeningHoursInterval
    { start_minute = Nothing
    , end_minute   = Nothing
    }

