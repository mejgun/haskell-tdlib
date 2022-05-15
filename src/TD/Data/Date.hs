{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Date where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Date = -- | Represents a date according to the Gregorian calendar @day Day of the month; 1-31 @month Month; 1-12 @year Year; 1-9999
  Date
  { -- |
    year :: Maybe Int,
    -- |
    month :: Maybe Int,
    -- |
    day :: Maybe Int
  }
  deriving (Eq)

instance Show Date where
  show
    Date
      { year = year_,
        month = month_,
        day = day_
      } =
      "Date"
        ++ U.cc
          [ U.p "year" year_,
            U.p "month" month_,
            U.p "day" day_
          ]

instance T.FromJSON Date where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "date" -> parseDate v
      _ -> mempty
    where
      parseDate :: A.Value -> T.Parser Date
      parseDate = A.withObject "Date" $ \o -> do
        year_ <- o A..:? "year"
        month_ <- o A..:? "month"
        day_ <- o A..:? "day"
        return $ Date {year = year_, month = month_, day = day_}
  parseJSON _ = mempty

instance T.ToJSON Date where
  toJSON
    Date
      { year = year_,
        month = month_,
        day = day_
      } =
      A.object
        [ "@type" A..= T.String "date",
          "year" A..= year_,
          "month" A..= month_,
          "day" A..= day_
        ]
