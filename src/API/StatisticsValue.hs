-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticsValue where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data StatisticsValue = 
 StatisticsValue { growth_rate_percentage :: Maybe Float, previous_value :: Maybe Float, value :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON StatisticsValue where
 toJSON (StatisticsValue { growth_rate_percentage = growth_rate_percentage, previous_value = previous_value, value = value }) =
  A.object [ "@type" A..= T.String "statisticsValue", "growth_rate_percentage" A..= growth_rate_percentage, "previous_value" A..= previous_value, "value" A..= value ]

instance T.FromJSON StatisticsValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "statisticsValue" -> parseStatisticsValue v
   _ -> mempty
  where
   parseStatisticsValue :: A.Value -> T.Parser StatisticsValue
   parseStatisticsValue = A.withObject "StatisticsValue" $ \o -> do
    growth_rate_percentage <- optional $ o A..: "growth_rate_percentage"
    previous_value <- optional $ o A..: "previous_value"
    value <- optional $ o A..: "value"
    return $ StatisticsValue { growth_rate_percentage = growth_rate_percentage, previous_value = previous_value, value = value }