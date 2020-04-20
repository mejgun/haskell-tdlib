-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticsValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data StatisticsValue = 
 StatisticsValue { growth_rate_percentage :: Float, previous_value :: Float, value :: Float }  -- deriving (Show)

instance T.ToJSON StatisticsValue where
 toJSON (StatisticsValue { growth_rate_percentage = growth_rate_percentage, previous_value = previous_value, value = value }) =
  A.object [ "@type" A..= T.String "statisticsValue", "growth_rate_percentage" A..= growth_rate_percentage, "previous_value" A..= previous_value, "value" A..= value ]
-- statisticsValue StatisticsValue  { growth_rate_percentage :: Float, previous_value :: Float, value :: Float } 

