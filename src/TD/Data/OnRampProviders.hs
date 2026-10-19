module TD.Data.OnRampProviders
  (OnRampProviders(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.OnRampProvider as OnRampProvider

data OnRampProviders
  = OnRampProviders -- ^ Represents a list of on-ramp providers
    { providers :: Maybe [OnRampProvider.OnRampProvider] -- ^ A list of providers
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampProviders where
  shortShow OnRampProviders
    { providers = providers_
    }
      = "OnRampProviders"
        ++ I.cc
        [ "providers" `I.p` providers_
        ]

instance AT.FromJSON OnRampProviders where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampProviders" -> parseOnRampProviders v
      _                 -> mempty
    
    where
      parseOnRampProviders :: A.Value -> AT.Parser OnRampProviders
      parseOnRampProviders = A.withObject "OnRampProviders" $ \o -> do
        providers_ <- o A..:?  "providers"
        pure $ OnRampProviders
          { providers = providers_
          }
  parseJSON _ = mempty

