{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MessageCalendar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageCalendarDay as MessageCalendarDay
import qualified Utils as U

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
      { days = days,
        total_count = total_count
      } =
      "MessageCalendar"
        ++ U.cc
          [ U.p "days" days,
            U.p "total_count" total_count
          ]

instance T.FromJSON MessageCalendar where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageCalendar" -> parseMessageCalendar v
      _ -> fail ""
    where
      parseMessageCalendar :: A.Value -> T.Parser MessageCalendar
      parseMessageCalendar = A.withObject "MessageCalendar" $ \o -> do
        days_ <- o A..:? "days"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageCalendar {days = days_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON MessageCalendar where
  toJSON
    MessageCalendar
      { days = days,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "messageCalendar",
          "days" A..= days,
          "total_count" A..= total_count
        ]
