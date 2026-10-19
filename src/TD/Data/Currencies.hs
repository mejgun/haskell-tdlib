module TD.Data.Currencies
  (Currencies(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Currencies
  = Currencies -- ^ Represents a list of currencies
    { currencies :: Maybe [T.Text] -- ^ A list of ISO 4217 currency codes
    }
  deriving (Eq, Show)

instance I.ShortShow Currencies where
  shortShow Currencies
    { currencies = currencies_
    }
      = "Currencies"
        ++ I.cc
        [ "currencies" `I.p` currencies_
        ]

instance AT.FromJSON Currencies where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "currencies" -> parseCurrencies v
      _            -> mempty
    
    where
      parseCurrencies :: A.Value -> AT.Parser Currencies
      parseCurrencies = A.withObject "Currencies" $ \o -> do
        currencies_ <- o A..:?  "currencies"
        pure $ Currencies
          { currencies = currencies_
          }
  parseJSON _ = mempty

