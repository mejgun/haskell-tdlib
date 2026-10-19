module TD.Query.GetCurrencyExchangeRates
  (GetCurrencyExchangeRates(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns exchange rates of currencies to USD. Returns 'TD.Data.CurrencyExchangeRates.CurrencyExchangeRates'
data GetCurrencyExchangeRates
  = GetCurrencyExchangeRates
  deriving (Eq, Show)

instance I.ShortShow GetCurrencyExchangeRates where
  shortShow
    GetCurrencyExchangeRates
        = "GetCurrencyExchangeRates"

instance AT.ToJSON GetCurrencyExchangeRates where
  toJSON
    GetCurrencyExchangeRates
        = A.object
          [ "@type" A..= AT.String "getCurrencyExchangeRates"
          ]

