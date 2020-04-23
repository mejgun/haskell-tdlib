-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DateRange where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DateRange = 
 DateRange { end_date :: Maybe Int, start_date :: Maybe Int }  deriving (Show)

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
    end_date <- optional $ o A..: "end_date"
    start_date <- optional $ o A..: "start_date"
    return $ DateRange { end_date = end_date, start_date = start_date }