-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DateRange where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DateRange = 
 DateRange { end_date :: Int, start_date :: Int }  -- deriving (Show)

instance T.ToJSON DateRange where
 toJSON (DateRange { end_date = end_date, start_date = start_date }) =
  A.object [ "@type" A..= T.String "dateRange", "end_date" A..= end_date, "start_date" A..= start_date ]
-- dateRange DateRange  { end_date :: Int, start_date :: Int } 

