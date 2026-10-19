module TD.Data.OnRampPaymentLimits
  (OnRampPaymentLimits(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OnRampPaymentLimits
  = OnRampPaymentLimits -- ^ Describes limits for an on-ramp purchase
    { payment_method            :: Maybe T.Text -- ^ The payment method to be used
    , base_currency_min_amount  :: Maybe T.Text -- ^ The minimum allowed amount of the base currency
    , base_currency_max_amount  :: Maybe T.Text -- ^ The maximum allowed amount of the base currency
    , cryptocurrency_min_amount :: Maybe T.Text -- ^ The minimum allowed amount of the bought cryptocurrency
    , cryptocurrency_max_amount :: Maybe T.Text -- ^ The maximum allowed amount of the bought cryptocurrency
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampPaymentLimits where
  shortShow OnRampPaymentLimits
    { payment_method            = payment_method_
    , base_currency_min_amount  = base_currency_min_amount_
    , base_currency_max_amount  = base_currency_max_amount_
    , cryptocurrency_min_amount = cryptocurrency_min_amount_
    , cryptocurrency_max_amount = cryptocurrency_max_amount_
    }
      = "OnRampPaymentLimits"
        ++ I.cc
        [ "payment_method"            `I.p` payment_method_
        , "base_currency_min_amount"  `I.p` base_currency_min_amount_
        , "base_currency_max_amount"  `I.p` base_currency_max_amount_
        , "cryptocurrency_min_amount" `I.p` cryptocurrency_min_amount_
        , "cryptocurrency_max_amount" `I.p` cryptocurrency_max_amount_
        ]

instance AT.FromJSON OnRampPaymentLimits where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampPaymentLimits" -> parseOnRampPaymentLimits v
      _                     -> mempty
    
    where
      parseOnRampPaymentLimits :: A.Value -> AT.Parser OnRampPaymentLimits
      parseOnRampPaymentLimits = A.withObject "OnRampPaymentLimits" $ \o -> do
        payment_method_            <- o A..:?  "payment_method"
        base_currency_min_amount_  <- o A..:?  "base_currency_min_amount"
        base_currency_max_amount_  <- o A..:?  "base_currency_max_amount"
        cryptocurrency_min_amount_ <- o A..:?  "cryptocurrency_min_amount"
        cryptocurrency_max_amount_ <- o A..:?  "cryptocurrency_max_amount"
        pure $ OnRampPaymentLimits
          { payment_method            = payment_method_
          , base_currency_min_amount  = base_currency_min_amount_
          , base_currency_max_amount  = base_currency_max_amount_
          , cryptocurrency_min_amount = cryptocurrency_min_amount_
          , cryptocurrency_max_amount = cryptocurrency_max_amount_
          }
  parseJSON _ = mempty

