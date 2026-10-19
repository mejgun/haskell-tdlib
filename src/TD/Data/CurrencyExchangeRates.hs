module TD.Data.CurrencyExchangeRates
  (CurrencyExchangeRates(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CurrencyExchangeRate as CurrencyExchangeRate

data CurrencyExchangeRates
  = CurrencyExchangeRates -- ^ Represents a list of currency exchange rates
    { rates :: Maybe [CurrencyExchangeRate.CurrencyExchangeRate] -- ^ A list of currency exchange rates
    }
  deriving (Eq, Show)

instance I.ShortShow CurrencyExchangeRates where
  shortShow CurrencyExchangeRates
    { rates = rates_
    }
      = "CurrencyExchangeRates"
        ++ I.cc
        [ "rates" `I.p` rates_
        ]

instance AT.FromJSON CurrencyExchangeRates where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "currencyExchangeRates" -> parseCurrencyExchangeRates v
      _                       -> mempty
    
    where
      parseCurrencyExchangeRates :: A.Value -> AT.Parser CurrencyExchangeRates
      parseCurrencyExchangeRates = A.withObject "CurrencyExchangeRates" $ \o -> do
        rates_ <- o A..:?  "rates"
        pure $ CurrencyExchangeRates
          { rates = rates_
          }
  parseJSON _ = mempty

