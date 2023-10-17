module TD.Data.CallServer
  (CallServer(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.CallServerType as CallServerType

data CallServer
  = CallServer -- ^ Describes a server for relaying call data
    { _id          :: Maybe Int                           -- ^ Server identifier
    , ip_address   :: Maybe T.Text                        -- ^ Server IPv4 address
    , ipv6_address :: Maybe T.Text                        -- ^ Server IPv6 address
    , port         :: Maybe Int                           -- ^ Server port number
    , _type        :: Maybe CallServerType.CallServerType -- ^ Server type
    }
  deriving (Eq, Show)

instance I.ShortShow CallServer where
  shortShow CallServer
    { _id          = _id_
    , ip_address   = ip_address_
    , ipv6_address = ipv6_address_
    , port         = port_
    , _type        = _type_
    }
      = "CallServer"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "ip_address"   `I.p` ip_address_
        , "ipv6_address" `I.p` ipv6_address_
        , "port"         `I.p` port_
        , "_type"        `I.p` _type_
        ]

instance AT.FromJSON CallServer where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callServer" -> parseCallServer v
      _            -> mempty
    
    where
      parseCallServer :: A.Value -> AT.Parser CallServer
      parseCallServer = A.withObject "CallServer" $ \o -> do
        _id_          <- fmap I.readInt64 <$> o A..:?  "id"
        ip_address_   <- o A..:?                       "ip_address"
        ipv6_address_ <- o A..:?                       "ipv6_address"
        port_         <- o A..:?                       "port"
        _type_        <- o A..:?                       "type"
        pure $ CallServer
          { _id          = _id_
          , ip_address   = ip_address_
          , ipv6_address = ipv6_address_
          , port         = port_
          , _type        = _type_
          }
  parseJSON _ = mempty

