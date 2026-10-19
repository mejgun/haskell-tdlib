module TD.Query.GetOnRampPaymentAvailability
  (GetOnRampPaymentAvailability(..)
  , defaultGetOnRampPaymentAvailability
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the available on-ramp payment methods based on the current user location. Returns 'TD.Data.OnRampPaymentAvailability.OnRampPaymentAvailability'
data GetOnRampPaymentAvailability
  = GetOnRampPaymentAvailability
    { provider_id    :: Maybe T.Text -- ^ Unique identifier of the on-ramp provider
    , cryptocurrency :: Maybe T.Text -- ^ The cryptocurrency that will be bought
    , base_currency  :: Maybe T.Text -- ^ ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow GetOnRampPaymentAvailability where
  shortShow
    GetOnRampPaymentAvailability
      { provider_id    = provider_id_
      , cryptocurrency = cryptocurrency_
      , base_currency  = base_currency_
      }
        = "GetOnRampPaymentAvailability"
          ++ I.cc
          [ "provider_id"    `I.p` provider_id_
          , "cryptocurrency" `I.p` cryptocurrency_
          , "base_currency"  `I.p` base_currency_
          ]

instance AT.ToJSON GetOnRampPaymentAvailability where
  toJSON
    GetOnRampPaymentAvailability
      { provider_id    = provider_id_
      , cryptocurrency = cryptocurrency_
      , base_currency  = base_currency_
      }
        = A.object
          [ "@type"          A..= AT.String "getOnRampPaymentAvailability"
          , "provider_id"    A..= provider_id_
          , "cryptocurrency" A..= cryptocurrency_
          , "base_currency"  A..= base_currency_
          ]

defaultGetOnRampPaymentAvailability :: GetOnRampPaymentAvailability
defaultGetOnRampPaymentAvailability =
  GetOnRampPaymentAvailability
    { provider_id    = Nothing
    , cryptocurrency = Nothing
    , base_currency  = Nothing
    }

