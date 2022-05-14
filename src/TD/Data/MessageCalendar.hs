{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageCalendar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageCalendarDay as MessageCalendarDay
import qualified Utils as U

-- |
data MessageCalendar = -- | Contains information about found messages, split by days according to the option "utc_time_offset" @total_count Total number of found messages @days Information about messages sent
  MessageCalendar
  { -- |
    days :: Maybe [MessageCalendarDay.MessageCalendarDay],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessageCalendar where
  show
    MessageCalendar
      { days = days_,
        total_count = total_count_
      } =
      "MessageCalendar"
        ++ U.cc
          [ U.p "days" days_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON MessageCalendar where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageCalendar" -> parseMessageCalendar v
      _ -> mempty
    where
      parseMessageCalendar :: A.Value -> T.Parser MessageCalendar
      parseMessageCalendar = A.withObject "MessageCalendar" $ \o -> do
        days_ <- o A..:? "days"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageCalendar {days = days_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON MessageCalendar where
  toJSON
    MessageCalendar
      { days = days_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "messageCalendar",
          "days" A..= days_,
          "total_count" A..= total_count_
        ]
