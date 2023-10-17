module TD.Data.StatisticalValue
  (StatisticalValue(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StatisticalValue
  = StatisticalValue -- ^ A value with information about its recent changes
    { value                  :: Maybe Double -- ^ The current value
    , previous_value         :: Maybe Double -- ^ The value for the previous day
    , growth_rate_percentage :: Maybe Double -- ^ The growth rate of the value, as a percentage
    }
  deriving (Eq, Show)

instance I.ShortShow StatisticalValue where
  shortShow StatisticalValue
    { value                  = value_
    , previous_value         = previous_value_
    , growth_rate_percentage = growth_rate_percentage_
    }
      = "StatisticalValue"
        ++ I.cc
        [ "value"                  `I.p` value_
        , "previous_value"         `I.p` previous_value_
        , "growth_rate_percentage" `I.p` growth_rate_percentage_
        ]

instance AT.FromJSON StatisticalValue where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "statisticalValue" -> parseStatisticalValue v
      _                  -> mempty
    
    where
      parseStatisticalValue :: A.Value -> AT.Parser StatisticalValue
      parseStatisticalValue = A.withObject "StatisticalValue" $ \o -> do
        value_                  <- o A..:?  "value"
        previous_value_         <- o A..:?  "previous_value"
        growth_rate_percentage_ <- o A..:?  "growth_rate_percentage"
        pure $ StatisticalValue
          { value                  = value_
          , previous_value         = previous_value_
          , growth_rate_percentage = growth_rate_percentage_
          }
  parseJSON _ = mempty

