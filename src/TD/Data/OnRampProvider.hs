module TD.Data.OnRampProvider
  (OnRampProvider(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OnRampProvider
  = OnRampProvider -- ^ Describes an on-ramp provider
    { _id                      :: Maybe T.Text   -- ^ Unique identifier of the provider
    , name                     :: Maybe T.Text   -- ^ Name of the provider
    , cryptocurrencies         :: Maybe [T.Text] -- ^ List of cryptocurrencies supported by the provider
    , supports_base_currencies :: Maybe Bool     -- ^ True, if the provider supports base currencies and can be used in the method getOnRampProviderBaseCurrencies
    , supports_limits          :: Maybe Bool     -- ^ True, if the provider supports limits retrieval using the method getOnRampPaymentLimits
    , supports_quote           :: Maybe Bool     -- ^ True, if the provider supports quote retrieval using the method getOnRampPaymentQuote
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampProvider where
  shortShow OnRampProvider
    { _id                      = _id_
    , name                     = name_
    , cryptocurrencies         = cryptocurrencies_
    , supports_base_currencies = supports_base_currencies_
    , supports_limits          = supports_limits_
    , supports_quote           = supports_quote_
    }
      = "OnRampProvider"
        ++ I.cc
        [ "_id"                      `I.p` _id_
        , "name"                     `I.p` name_
        , "cryptocurrencies"         `I.p` cryptocurrencies_
        , "supports_base_currencies" `I.p` supports_base_currencies_
        , "supports_limits"          `I.p` supports_limits_
        , "supports_quote"           `I.p` supports_quote_
        ]

instance AT.FromJSON OnRampProvider where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampProvider" -> parseOnRampProvider v
      _                -> mempty
    
    where
      parseOnRampProvider :: A.Value -> AT.Parser OnRampProvider
      parseOnRampProvider = A.withObject "OnRampProvider" $ \o -> do
        _id_                      <- o A..:?  "id"
        name_                     <- o A..:?  "name"
        cryptocurrencies_         <- o A..:?  "cryptocurrencies"
        supports_base_currencies_ <- o A..:?  "supports_base_currencies"
        supports_limits_          <- o A..:?  "supports_limits"
        supports_quote_           <- o A..:?  "supports_quote"
        pure $ OnRampProvider
          { _id                      = _id_
          , name                     = name_
          , cryptocurrencies         = cryptocurrencies_
          , supports_base_currencies = supports_base_currencies_
          , supports_limits          = supports_limits_
          , supports_quote           = supports_quote_
          }
  parseJSON _ = mempty

