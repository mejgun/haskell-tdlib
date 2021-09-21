-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticalValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- A value with information about its recent changes 
-- 
-- __value__ The current value
-- 
-- __previous_value__ The value for the previous day
-- 
-- __growth_rate_percentage__ The growth rate of the value, as a percentage
data StatisticalValue = 

 StatisticalValue { growth_rate_percentage :: Maybe Float, previous_value :: Maybe Float, value :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON StatisticalValue where
 toJSON (StatisticalValue { growth_rate_percentage = growth_rate_percentage, previous_value = previous_value, value = value }) =
  A.object [ "@type" A..= T.String "statisticalValue", "growth_rate_percentage" A..= growth_rate_percentage, "previous_value" A..= previous_value, "value" A..= value ]

instance T.FromJSON StatisticalValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "statisticalValue" -> parseStatisticalValue v
   _ -> mempty
  where
   parseStatisticalValue :: A.Value -> T.Parser StatisticalValue
   parseStatisticalValue = A.withObject "StatisticalValue" $ \o -> do
    growth_rate_percentage <- o A..:? "growth_rate_percentage"
    previous_value <- o A..:? "previous_value"
    value <- o A..:? "value"
    return $ StatisticalValue { growth_rate_percentage = growth_rate_percentage, previous_value = previous_value, value = value }