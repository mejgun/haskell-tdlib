-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Date where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Date = 
 Date { year :: Maybe Int, month :: Maybe Int, day :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Date where
 toJSON (Date { year = year, month = month, day = day }) =
  A.object [ "@type" A..= T.String "date", "year" A..= year, "month" A..= month, "day" A..= day ]

instance T.FromJSON Date where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "date" -> parseDate v
   _ -> mempty
  where
   parseDate :: A.Value -> T.Parser Date
   parseDate = A.withObject "Date" $ \o -> do
    year <- mconcat [ o A..:? "year", readMaybe <$> (o A..: "year" :: T.Parser String)] :: T.Parser (Maybe Int)
    month <- mconcat [ o A..:? "month", readMaybe <$> (o A..: "month" :: T.Parser String)] :: T.Parser (Maybe Int)
    day <- mconcat [ o A..:? "day", readMaybe <$> (o A..: "day" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Date { year = year, month = month, day = day }