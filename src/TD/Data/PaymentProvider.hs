module TD.Data.PaymentProvider where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data PaymentProvider -- ^ Contains information about a payment provider
  = PaymentProviderSmartGlocal -- ^ Smart Glocal payment provider
    { public_token :: Maybe T.Text -- ^ Public payment token
    }
  | PaymentProviderStripe -- ^ Stripe payment provider
    { publishable_key      :: Maybe T.Text -- ^ Stripe API publishable key
    , need_country         :: Maybe Bool   -- ^ True, if the user country must be provided
    , need_postal_code     :: Maybe Bool   -- ^ True, if the user ZIP/postal code must be provided
    , need_cardholder_name :: Maybe Bool   -- ^ True, if the cardholder name must be provided
    }
  | PaymentProviderOther -- ^ Some other payment provider, for which a web payment form must be shown
    { url :: Maybe T.Text -- ^ Payment form URL
    }
  deriving (Eq)

instance Show PaymentProvider where
  show PaymentProviderSmartGlocal
    { public_token = public_token_
    }
      = "PaymentProviderSmartGlocal"
        ++ I.cc
        [ "public_token" `I.p` public_token_
        ]
  show PaymentProviderStripe
    { publishable_key      = publishable_key_
    , need_country         = need_country_
    , need_postal_code     = need_postal_code_
    , need_cardholder_name = need_cardholder_name_
    }
      = "PaymentProviderStripe"
        ++ I.cc
        [ "publishable_key"      `I.p` publishable_key_
        , "need_country"         `I.p` need_country_
        , "need_postal_code"     `I.p` need_postal_code_
        , "need_cardholder_name" `I.p` need_cardholder_name_
        ]
  show PaymentProviderOther
    { url = url_
    }
      = "PaymentProviderOther"
        ++ I.cc
        [ "url" `I.p` url_
        ]

instance AT.FromJSON PaymentProvider where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentProviderSmartGlocal" -> parsePaymentProviderSmartGlocal v
      "paymentProviderStripe"      -> parsePaymentProviderStripe v
      "paymentProviderOther"       -> parsePaymentProviderOther v
      _                            -> mempty
    
    where
      parsePaymentProviderSmartGlocal :: A.Value -> AT.Parser PaymentProvider
      parsePaymentProviderSmartGlocal = A.withObject "PaymentProviderSmartGlocal" $ \o -> do
        public_token_ <- o A..:?  "public_token"
        pure $ PaymentProviderSmartGlocal
          { public_token = public_token_
          }
      parsePaymentProviderStripe :: A.Value -> AT.Parser PaymentProvider
      parsePaymentProviderStripe = A.withObject "PaymentProviderStripe" $ \o -> do
        publishable_key_      <- o A..:?  "publishable_key"
        need_country_         <- o A..:?  "need_country"
        need_postal_code_     <- o A..:?  "need_postal_code"
        need_cardholder_name_ <- o A..:?  "need_cardholder_name"
        pure $ PaymentProviderStripe
          { publishable_key      = publishable_key_
          , need_country         = need_country_
          , need_postal_code     = need_postal_code_
          , need_cardholder_name = need_cardholder_name_
          }
      parsePaymentProviderOther :: A.Value -> AT.Parser PaymentProvider
      parsePaymentProviderOther = A.withObject "PaymentProviderOther" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ PaymentProviderOther
          { url = url_
          }

instance AT.ToJSON PaymentProvider where
  toJSON PaymentProviderSmartGlocal
    { public_token = public_token_
    }
      = A.object
        [ "@type"        A..= AT.String "paymentProviderSmartGlocal"
        , "public_token" A..= public_token_
        ]
  toJSON PaymentProviderStripe
    { publishable_key      = publishable_key_
    , need_country         = need_country_
    , need_postal_code     = need_postal_code_
    , need_cardholder_name = need_cardholder_name_
    }
      = A.object
        [ "@type"                A..= AT.String "paymentProviderStripe"
        , "publishable_key"      A..= publishable_key_
        , "need_country"         A..= need_country_
        , "need_postal_code"     A..= need_postal_code_
        , "need_cardholder_name" A..= need_cardholder_name_
        ]
  toJSON PaymentProviderOther
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "paymentProviderOther"
        , "url"   A..= url_
        ]
