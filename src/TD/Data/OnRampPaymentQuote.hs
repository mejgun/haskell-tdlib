module TD.Data.OnRampPaymentQuote
  (OnRampPaymentQuote(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OnRampPaymentQuote
  = OnRampPaymentQuote -- ^ Describes a quote for an on-ramp purchase
    { payment_method        :: Maybe T.Text -- ^ The payment method to be used
    , expiration_date       :: Maybe Int    -- ^ Point in time (Unix timestamp) when the quote will expire
    , base_currency_amount  :: Maybe T.Text -- ^ Paid amount of the base currency
    , cryptocurrency_amount :: Maybe T.Text -- ^ Purchased amount of the cryptocurrency
    , cryptocurrency_price  :: Maybe T.Text -- ^ The price of the cryptocurrency
    , fee_amount            :: Maybe T.Text -- ^ Fee amount
    , extra_fee_amount      :: Maybe T.Text -- ^ Extra fee amount
    , network_fee_amount    :: Maybe T.Text -- ^ Network fee amount
    , total_amount          :: Maybe T.Text -- ^ Total paid amount
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampPaymentQuote where
  shortShow OnRampPaymentQuote
    { payment_method        = payment_method_
    , expiration_date       = expiration_date_
    , base_currency_amount  = base_currency_amount_
    , cryptocurrency_amount = cryptocurrency_amount_
    , cryptocurrency_price  = cryptocurrency_price_
    , fee_amount            = fee_amount_
    , extra_fee_amount      = extra_fee_amount_
    , network_fee_amount    = network_fee_amount_
    , total_amount          = total_amount_
    }
      = "OnRampPaymentQuote"
        ++ I.cc
        [ "payment_method"        `I.p` payment_method_
        , "expiration_date"       `I.p` expiration_date_
        , "base_currency_amount"  `I.p` base_currency_amount_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "cryptocurrency_price"  `I.p` cryptocurrency_price_
        , "fee_amount"            `I.p` fee_amount_
        , "extra_fee_amount"      `I.p` extra_fee_amount_
        , "network_fee_amount"    `I.p` network_fee_amount_
        , "total_amount"          `I.p` total_amount_
        ]

instance AT.FromJSON OnRampPaymentQuote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampPaymentQuote" -> parseOnRampPaymentQuote v
      _                    -> mempty
    
    where
      parseOnRampPaymentQuote :: A.Value -> AT.Parser OnRampPaymentQuote
      parseOnRampPaymentQuote = A.withObject "OnRampPaymentQuote" $ \o -> do
        payment_method_        <- o A..:?  "payment_method"
        expiration_date_       <- o A..:?  "expiration_date"
        base_currency_amount_  <- o A..:?  "base_currency_amount"
        cryptocurrency_amount_ <- o A..:?  "cryptocurrency_amount"
        cryptocurrency_price_  <- o A..:?  "cryptocurrency_price"
        fee_amount_            <- o A..:?  "fee_amount"
        extra_fee_amount_      <- o A..:?  "extra_fee_amount"
        network_fee_amount_    <- o A..:?  "network_fee_amount"
        total_amount_          <- o A..:?  "total_amount"
        pure $ OnRampPaymentQuote
          { payment_method        = payment_method_
          , expiration_date       = expiration_date_
          , base_currency_amount  = base_currency_amount_
          , cryptocurrency_amount = cryptocurrency_amount_
          , cryptocurrency_price  = cryptocurrency_price_
          , fee_amount            = fee_amount_
          , extra_fee_amount      = extra_fee_amount_
          , network_fee_amount    = network_fee_amount_
          , total_amount          = total_amount_
          }
  parseJSON _ = mempty

