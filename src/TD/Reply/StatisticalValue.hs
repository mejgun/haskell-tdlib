{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.StatisticalValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data StatisticalValue = -- | A value with information about its recent changes @value The current value @previous_value The value for the previous day @growth_rate_percentage The growth rate of the value, as a percentage
  StatisticalValue
  { -- |
    growth_rate_percentage :: Maybe Float,
    -- |
    previous_value :: Maybe Float,
    -- |
    value :: Maybe Float
  }
  deriving (Eq)

instance Show StatisticalValue where
  show
    StatisticalValue
      { growth_rate_percentage = growth_rate_percentage,
        previous_value = previous_value,
        value = value
      } =
      "StatisticalValue"
        ++ U.cc
          [ U.p "growth_rate_percentage" growth_rate_percentage,
            U.p "previous_value" previous_value,
            U.p "value" value
          ]

instance T.FromJSON StatisticalValue where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "statisticalValue" -> parseStatisticalValue v
      _ -> fail ""
    where
      parseStatisticalValue :: A.Value -> T.Parser StatisticalValue
      parseStatisticalValue = A.withObject "StatisticalValue" $ \o -> do
        growth_rate_percentage_ <- o A..:? "growth_rate_percentage"
        previous_value_ <- o A..:? "previous_value"
        value_ <- o A..:? "value"
        return $ StatisticalValue {growth_rate_percentage = growth_rate_percentage_, previous_value = previous_value_, value = value_}
  parseJSON _ = fail ""

instance T.ToJSON StatisticalValue where
  toJSON
    StatisticalValue
      { growth_rate_percentage = growth_rate_percentage,
        previous_value = previous_value,
        value = value
      } =
      A.object
        [ "@type" A..= T.String "statisticalValue",
          "growth_rate_percentage" A..= growth_rate_percentage,
          "previous_value" A..= previous_value,
          "value" A..= value
        ]
