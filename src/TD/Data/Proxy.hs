module TD.Data.Proxy
  (Proxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ProxyType as ProxyType

data Proxy
  = Proxy -- ^ Contains information about a proxy server
    { _id            :: Maybe Int                 -- ^ Unique identifier of the proxy
    , server         :: Maybe T.Text              -- ^ Proxy server domain or IP address
    , port           :: Maybe Int                 -- ^ Proxy server port
    , last_used_date :: Maybe Int                 -- ^ Point in time (Unix timestamp) when the proxy was last used; 0 if never
    , is_enabled     :: Maybe Bool                -- ^ True, if the proxy is enabled now
    , _type          :: Maybe ProxyType.ProxyType -- ^ Type of the proxy
    }
  deriving (Eq, Show)

instance I.ShortShow Proxy where
  shortShow Proxy
    { _id            = _id_
    , server         = server_
    , port           = port_
    , last_used_date = last_used_date_
    , is_enabled     = is_enabled_
    , _type          = _type_
    }
      = "Proxy"
        ++ I.cc
        [ "_id"            `I.p` _id_
        , "server"         `I.p` server_
        , "port"           `I.p` port_
        , "last_used_date" `I.p` last_used_date_
        , "is_enabled"     `I.p` is_enabled_
        , "_type"          `I.p` _type_
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
        _id_            <- o A..:?  "id"
        server_         <- o A..:?  "server"
        port_           <- o A..:?  "port"
        last_used_date_ <- o A..:?  "last_used_date"
        is_enabled_     <- o A..:?  "is_enabled"
        _type_          <- o A..:?  "type"
        pure $ Proxy
          { _id            = _id_
          , server         = server_
          , port           = port_
          , last_used_date = last_used_date_
          , is_enabled     = is_enabled_
          , _type          = _type_
          }
  parseJSON _ = mempty

