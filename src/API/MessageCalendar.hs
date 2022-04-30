-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageCalendar where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageCalendarDay as MessageCalendarDay

-- |
-- 
-- Contains information about found messages, split by days according to the option "utc_time_offset" 
-- 
-- __total_count__ Total number of found messages
-- 
-- __days__ Information about messages sent
data MessageCalendar = 

 MessageCalendar { days :: Maybe [MessageCalendarDay.MessageCalendarDay], total_count :: Maybe Int }  deriving (Eq)

instance Show MessageCalendar where
 show MessageCalendar { days=days, total_count=total_count } =
  "MessageCalendar" ++ U.cc [U.p "days" days, U.p "total_count" total_count ]

instance T.ToJSON MessageCalendar where
 toJSON MessageCalendar { days = days, total_count = total_count } =
  A.object [ "@type" A..= T.String "messageCalendar", "days" A..= days, "total_count" A..= total_count ]

instance T.FromJSON MessageCalendar where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageCalendar" -> parseMessageCalendar v
   _ -> mempty
  where
   parseMessageCalendar :: A.Value -> T.Parser MessageCalendar
   parseMessageCalendar = A.withObject "MessageCalendar" $ \o -> do
    days <- o A..:? "days"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageCalendar { days = days, total_count = total_count }
 parseJSON _ = mempty
