-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DateRange where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a date range 
-- 
-- __start_date__ Point in time (Unix timestamp) at which the date range begins
-- 
-- __end_date__ Point in time (Unix timestamp) at which the date range ends
data DateRange = 

 DateRange { end_date :: Maybe Int, start_date :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DateRange where
 toJSON (DateRange { end_date = end_date, start_date = start_date }) =
  A.object [ "@type" A..= T.String "dateRange", "end_date" A..= end_date, "start_date" A..= start_date ]

instance T.FromJSON DateRange where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "dateRange" -> parseDateRange v
   _ -> mempty
  where
   parseDateRange :: A.Value -> T.Parser DateRange
   parseDateRange = A.withObject "DateRange" $ \o -> do
    end_date <- mconcat [ o A..:? "end_date", readMaybe <$> (o A..: "end_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    start_date <- mconcat [ o A..:? "start_date", readMaybe <$> (o A..: "start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DateRange { end_date = end_date, start_date = start_date }