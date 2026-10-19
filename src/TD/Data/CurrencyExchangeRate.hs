module TD.Data.CurrencyExchangeRate
  (CurrencyExchangeRate(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CurrencyExchangeRate
  = CurrencyExchangeRate -- ^ Describes exchange rate of a currency to USD
    { currency :: Maybe T.Text -- ^ ISO 4217 currency code of the payment currency
    , rate     :: Maybe Double -- ^ Exchange rate of the currency to USD
    }
  deriving (Eq, Show)

instance I.ShortShow CurrencyExchangeRate where
  shortShow CurrencyExchangeRate
    { currency = currency_
    , rate     = rate_
    }
      = "CurrencyExchangeRate"
        ++ I.cc
        [ "currency" `I.p` currency_
        , "rate"     `I.p` rate_
        ]

instance AT.FromJSON CurrencyExchangeRate where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "currencyExchangeRate" -> parseCurrencyExchangeRate v
      _                      -> mempty
    
    where
      parseCurrencyExchangeRate :: A.Value -> AT.Parser CurrencyExchangeRate
      parseCurrencyExchangeRate = A.withObject "CurrencyExchangeRate" $ \o -> do
        currency_ <- o A..:?  "currency"
        rate_     <- o A..:?  "rate"
        pure $ CurrencyExchangeRate
          { currency = currency_
          , rate     = rate_
          }
  parseJSON _ = mempty

