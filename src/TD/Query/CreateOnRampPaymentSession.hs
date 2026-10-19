module TD.Query.CreateOnRampPaymentSession
  (CreateOnRampPaymentSession(..)
  , defaultCreateOnRampPaymentSession
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a session for an on-ramp payment. Returns 'TD.Data.OnRampPaymentSession.OnRampPaymentSession'
data CreateOnRampPaymentSession
  = CreateOnRampPaymentSession
    { provider_id           :: Maybe T.Text -- ^ Unique identifier of the on-ramp provider
    , cryptocurrency        :: Maybe T.Text -- ^ The cryptocurrency that will be bought
    , address               :: Maybe T.Text -- ^ Address to which the cryptocurrency will be sent
    , payment_method_name   :: Maybe T.Text -- ^ Name of the chosen payment method; pass an empty string if none
    , base_currency         :: Maybe T.Text -- ^ ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
    , cryptocurrency_amount :: Maybe T.Text -- ^ The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
    , base_currency_amount  :: Maybe T.Text -- ^ The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
    , memo                  :: Maybe T.Text -- ^ Memo for the query; pass an empty string if none
    , theme                 :: Maybe T.Text -- ^ Preferred theme for the WebView; pass "light" for a light theme, "dark" for a dark theme, or leave empty for a default theme
    , success_return_url    :: Maybe T.Text -- ^ The URL opened on successful payment; pass an empty string if none
    , fail_return_url       :: Maybe T.Text -- ^ The URL opened on failed payment; pass an empty string if none
    }
  deriving (Eq, Show)

instance I.ShortShow CreateOnRampPaymentSession where
  shortShow
    CreateOnRampPaymentSession
      { provider_id           = provider_id_
      , cryptocurrency        = cryptocurrency_
      , address               = address_
      , payment_method_name   = payment_method_name_
      , base_currency         = base_currency_
      , cryptocurrency_amount = cryptocurrency_amount_
      , base_currency_amount  = base_currency_amount_
      , memo                  = memo_
      , theme                 = theme_
      , success_return_url    = success_return_url_
      , fail_return_url       = fail_return_url_
      }
        = "CreateOnRampPaymentSession"
          ++ I.cc
          [ "provider_id"           `I.p` provider_id_
          , "cryptocurrency"        `I.p` cryptocurrency_
          , "address"               `I.p` address_
          , "payment_method_name"   `I.p` payment_method_name_
          , "base_currency"         `I.p` base_currency_
          , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
          , "base_currency_amount"  `I.p` base_currency_amount_
          , "memo"                  `I.p` memo_
          , "theme"                 `I.p` theme_
          , "success_return_url"    `I.p` success_return_url_
          , "fail_return_url"       `I.p` fail_return_url_
          ]

instance AT.ToJSON CreateOnRampPaymentSession where
  toJSON
    CreateOnRampPaymentSession
      { provider_id           = provider_id_
      , cryptocurrency        = cryptocurrency_
      , address               = address_
      , payment_method_name   = payment_method_name_
      , base_currency         = base_currency_
      , cryptocurrency_amount = cryptocurrency_amount_
      , base_currency_amount  = base_currency_amount_
      , memo                  = memo_
      , theme                 = theme_
      , success_return_url    = success_return_url_
      , fail_return_url       = fail_return_url_
      }
        = A.object
          [ "@type"                 A..= AT.String "createOnRampPaymentSession"
          , "provider_id"           A..= provider_id_
          , "cryptocurrency"        A..= cryptocurrency_
          , "address"               A..= address_
          , "payment_method_name"   A..= payment_method_name_
          , "base_currency"         A..= base_currency_
          , "cryptocurrency_amount" A..= cryptocurrency_amount_
          , "base_currency_amount"  A..= base_currency_amount_
          , "memo"                  A..= memo_
          , "theme"                 A..= theme_
          , "success_return_url"    A..= success_return_url_
          , "fail_return_url"       A..= fail_return_url_
          ]

defaultCreateOnRampPaymentSession :: CreateOnRampPaymentSession
defaultCreateOnRampPaymentSession =
  CreateOnRampPaymentSession
    { provider_id           = Nothing
    , cryptocurrency        = Nothing
    , address               = Nothing
    , payment_method_name   = Nothing
    , base_currency         = Nothing
    , cryptocurrency_amount = Nothing
    , base_currency_amount  = Nothing
    , memo                  = Nothing
    , theme                 = Nothing
    , success_return_url    = Nothing
    , fail_return_url       = Nothing
    }

