{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.DateRange where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data DateRange = -- | Represents a date range @start_date Point in time (Unix timestamp) at which the date range begins @end_date Point in time (Unix timestamp) at which the date range ends
  DateRange
  { -- |
    end_date :: Maybe Int,
    -- |
    start_date :: Maybe Int
  }
  deriving (Eq)

instance Show DateRange where
  show
    DateRange
      { end_date = end_date,
        start_date = start_date
      } =
      "DateRange"
        ++ U.cc
          [ U.p "end_date" end_date,
            U.p "start_date" start_date
          ]

instance T.FromJSON DateRange where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "dateRange" -> parseDateRange v
      _ -> fail ""
    where
      parseDateRange :: A.Value -> T.Parser DateRange
      parseDateRange = A.withObject "DateRange" $ \o -> do
        end_date_ <- mconcat [o A..:? "end_date", U.rm <$> (o A..: "end_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        start_date_ <- mconcat [o A..:? "start_date", U.rm <$> (o A..: "start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ DateRange {end_date = end_date_, start_date = start_date_}
  parseJSON _ = fail ""

instance T.ToJSON DateRange where
  toJSON
    DateRange
      { end_date = end_date,
        start_date = start_date
      } =
      A.object
        [ "@type" A..= T.String "dateRange",
          "end_date" A..= end_date,
          "start_date" A..= start_date
        ]
