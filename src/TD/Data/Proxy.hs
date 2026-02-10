module TD.Data.Proxy
  ( Proxy(..)    
  , defaultProxy 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ProxyType as ProxyType

data Proxy
  = Proxy -- ^ Describes a proxy server
    { server :: Maybe T.Text              -- ^ Proxy server domain or IP address
    , port   :: Maybe Int                 -- ^ Proxy server port
    , _type  :: Maybe ProxyType.ProxyType -- ^ Type of the proxy
    }
  deriving (Eq, Show)

instance I.ShortShow Proxy where
  shortShow Proxy
    { server = server_
    , port   = port_
    , _type  = _type_
    }
      = "Proxy"
        ++ I.cc
        [ "server" `I.p` server_
        , "port"   `I.p` port_
        , "_type"  `I.p` _type_
        ]

instance AT.FromJSON Proxy where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "proxy" -> parseProxy v
      _       -> mempty
    
    where
      parseProxy :: A.Value -> AT.Parser Proxy
      parseProxy = A.withObject "Proxy" $ \o -> do
        server_ <- o A..:?  "server"
        port_   <- o A..:?  "port"
        _type_  <- o A..:?  "type"
        pure $ Proxy
          { server = server_
          , port   = port_
          , _type  = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON Proxy where
  toJSON Proxy
    { server = server_
    , port   = port_
    , _type  = _type_
    }
      = A.object
        [ "@type"  A..= AT.String "proxy"
        , "server" A..= server_
        , "port"   A..= port_
        , "type"   A..= _type_
        ]

defaultProxy :: Proxy
defaultProxy =
  Proxy
    { server = Nothing
    , port   = Nothing
    , _type  = Nothing
    }

