module TD.Query.GetOnRampProviderBaseCurrencies
  (GetOnRampProviderBaseCurrencies(..)
  , defaultGetOnRampProviderBaseCurrencies
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the list of fiat currencies supported by an on-ramp provider for the given cryptocurrency. Returns 'TD.Data.Currencies.Currencies'
data GetOnRampProviderBaseCurrencies
  = GetOnRampProviderBaseCurrencies
    { provider_id    :: Maybe T.Text -- ^ Unique identifier of the on-ramp provider; only for providers that support base currencies
    , cryptocurrency :: Maybe T.Text -- ^ The cryptocurrency that will be bought
    }
  deriving (Eq, Show)

instance I.ShortShow GetOnRampProviderBaseCurrencies where
  shortShow
    GetOnRampProviderBaseCurrencies
      { provider_id    = provider_id_
      , cryptocurrency = cryptocurrency_
      }
        = "GetOnRampProviderBaseCurrencies"
          ++ I.cc
          [ "provider_id"    `I.p` provider_id_
          , "cryptocurrency" `I.p` cryptocurrency_
          ]

instance AT.ToJSON GetOnRampProviderBaseCurrencies where
  toJSON
    GetOnRampProviderBaseCurrencies
      { provider_id    = provider_id_
      , cryptocurrency = cryptocurrency_
      }
        = A.object
          [ "@type"          A..= AT.String "getOnRampProviderBaseCurrencies"
          , "provider_id"    A..= provider_id_
          , "cryptocurrency" A..= cryptocurrency_
          ]

defaultGetOnRampProviderBaseCurrencies :: GetOnRampProviderBaseCurrencies
defaultGetOnRampProviderBaseCurrencies =
  GetOnRampProviderBaseCurrencies
    { provider_id    = Nothing
    , cryptocurrency = Nothing
    }

