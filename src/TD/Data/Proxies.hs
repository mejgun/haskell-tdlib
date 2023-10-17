module TD.Data.Proxies
  (Proxies(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

data Proxies
  = Proxies -- ^ Represents a list of proxy servers
    { proxies :: Maybe [Proxy.Proxy] -- ^ List of proxy servers
    }
  deriving (Eq, Show)

instance I.ShortShow Proxies where
  shortShow Proxies
    { proxies = proxies_
    }
      = "Proxies"
        ++ I.cc
        [ "proxies" `I.p` proxies_
        ]

instance AT.FromJSON Proxies where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "proxies" -> parseProxies v
      _         -> mempty
    
    where
      parseProxies :: A.Value -> AT.Parser Proxies
      parseProxies = A.withObject "Proxies" $ \o -> do
        proxies_ <- o A..:?  "proxies"
        pure $ Proxies
          { proxies = proxies_
          }
  parseJSON _ = mempty

