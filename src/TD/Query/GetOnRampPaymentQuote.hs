module TD.Query.GetOnRampPaymentQuote
  (GetOnRampPaymentQuote(..)
  , defaultGetOnRampPaymentQuote
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a quote for an on-ramp payment; only for providers that support quote retrieval. Returns 'TD.Data.OnRampPaymentQuote.OnRampPaymentQuote'
data GetOnRampPaymentQuote
  = GetOnRampPaymentQuote
    { provider_id           :: Maybe T.Text -- ^ Unique identifier of the on-ramp provider
    , cryptocurrency        :: Maybe T.Text -- ^ The cryptocurrency that will be bought
    , base_currency         :: Maybe T.Text -- ^ ISO 4217 currency code of the currency that will be used for the purchase
    , cryptocurrency_amount :: Maybe T.Text -- ^ The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
    , base_currency_amount  :: Maybe T.Text -- ^ The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
    , payment_method_name   :: Maybe T.Text -- ^ Name of the chosen payment method; pass an empty string if none
    }
  deriving (Eq, Show)

instance I.ShortShow GetOnRampPaymentQuote where
  shortShow
    GetOnRampPaymentQuote
      { provider_id           = provider_id_
      , cryptocurrency        = cryptocurrency_
      , base_currency         = base_currency_
      , cryptocurrency_amount = cryptocurrency_amount_
      , base_currency_amount  = base_currency_amount_
      , payment_method_name   = payment_method_name_
      }
        = "GetOnRampPaymentQuote"
          ++ I.cc
          [ "provider_id"           `I.p` provider_id_
          , "cryptocurrency"        `I.p` cryptocurrency_
          , "base_currency"         `I.p` base_currency_
          , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
          , "base_currency_amount"  `I.p` base_currency_amount_
          , "payment_method_name"   `I.p` payment_method_name_
          ]

instance AT.ToJSON GetOnRampPaymentQuote where
  toJSON
    GetOnRampPaymentQuote
      { provider_id           = provider_id_
      , cryptocurrency        = cryptocurrency_
      , base_currency         = base_currency_
      , cryptocurrency_amount = cryptocurrency_amount_
      , base_currency_amount  = base_currency_amount_
      , payment_method_name   = payment_method_name_
      }
        = A.object
          [ "@type"                 A..= AT.String "getOnRampPaymentQuote"
          , "provider_id"           A..= provider_id_
          , "cryptocurrency"        A..= cryptocurrency_
          , "base_currency"         A..= base_currency_
          , "cryptocurrency_amount" A..= cryptocurrency_amount_
          , "base_currency_amount"  A..= base_currency_amount_
          , "payment_method_name"   A..= payment_method_name_
          ]

defaultGetOnRampPaymentQuote :: GetOnRampPaymentQuote
defaultGetOnRampPaymentQuote =
  GetOnRampPaymentQuote
    { provider_id           = Nothing
    , cryptocurrency        = Nothing
    , base_currency         = Nothing
    , cryptocurrency_amount = Nothing
    , base_currency_amount  = Nothing
    , payment_method_name   = Nothing
    }

