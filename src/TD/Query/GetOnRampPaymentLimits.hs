module TD.Query.GetOnRampPaymentLimits
  (GetOnRampPaymentLimits(..)
  , defaultGetOnRampPaymentLimits
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the limits for an on-ramp payment; only for providers that support limits retrieval. Returns 'TD.Data.OnRampPaymentLimits.OnRampPaymentLimits'
data GetOnRampPaymentLimits
  = GetOnRampPaymentLimits
    { provider_id         :: Maybe T.Text -- ^ Unique identifier of the on-ramp provider
    , cryptocurrency      :: Maybe T.Text -- ^ The cryptocurrency that will be bought
    , base_currency       :: Maybe T.Text -- ^ ISO 4217 currency code of the currency that will be used for the purchase
    , payment_method_name :: Maybe T.Text -- ^ Name of the chosen payment method; pass an empty string if none
    }
  deriving (Eq, Show)

instance I.ShortShow GetOnRampPaymentLimits where
  shortShow
    GetOnRampPaymentLimits
      { provider_id         = provider_id_
      , cryptocurrency      = cryptocurrency_
      , base_currency       = base_currency_
      , payment_method_name = payment_method_name_
      }
        = "GetOnRampPaymentLimits"
          ++ I.cc
          [ "provider_id"         `I.p` provider_id_
          , "cryptocurrency"      `I.p` cryptocurrency_
          , "base_currency"       `I.p` base_currency_
          , "payment_method_name" `I.p` payment_method_name_
          ]

instance AT.ToJSON GetOnRampPaymentLimits where
  toJSON
    GetOnRampPaymentLimits
      { provider_id         = provider_id_
      , cryptocurrency      = cryptocurrency_
      , base_currency       = base_currency_
      , payment_method_name = payment_method_name_
      }
        = A.object
          [ "@type"               A..= AT.String "getOnRampPaymentLimits"
          , "provider_id"         A..= provider_id_
          , "cryptocurrency"      A..= cryptocurrency_
          , "base_currency"       A..= base_currency_
          , "payment_method_name" A..= payment_method_name_
          ]

defaultGetOnRampPaymentLimits :: GetOnRampPaymentLimits
defaultGetOnRampPaymentLimits =
  GetOnRampPaymentLimits
    { provider_id         = Nothing
    , cryptocurrency      = Nothing
    , base_currency       = Nothing
    , payment_method_name = Nothing
    }

