module TD.Data.Proxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

data Proxies
  = Proxies -- ^ Represents a list of proxy servers
    { proxies :: Maybe [Proxy.Proxy] -- ^ List of proxy servers
    }
  deriving (Eq)

instance Show Proxies where
  show Proxies
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

instance AT.ToJSON Proxies where
  toJSON Proxies
    { proxies = proxies_
    }
      = A.object
        [ "@type"   A..= AT.String "proxies"
        , "proxies" A..= proxies_
        ]
