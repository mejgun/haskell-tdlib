{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Date where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { year = year,
        month = month,
        day = day
      } =
      "Date"
        ++ U.cc
          [ U.p "year" year,
            U.p "month" month,
            U.p "day" day
          ]

instance T.FromJSON Date where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "date" -> parseDate v
      _ -> fail ""
    where
      parseDate :: A.Value -> T.Parser Date
      parseDate = A.withObject "Date" $ \o -> do
        year_ <- mconcat [o A..:? "year", U.rm <$> (o A..: "year" :: T.Parser String)] :: T.Parser (Maybe Int)
        month_ <- mconcat [o A..:? "month", U.rm <$> (o A..: "month" :: T.Parser String)] :: T.Parser (Maybe Int)
        day_ <- mconcat [o A..:? "day", U.rm <$> (o A..: "day" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Date {year = year_, month = month_, day = day_}
  parseJSON _ = fail ""

instance T.ToJSON Date where
  toJSON
    Date
      { year = year,
        month = month,
        day = day
      } =
      A.object
        [ "@type" A..= T.String "date",
          "year" A..= year,
          "month" A..= month,
          "day" A..= day
        ]
