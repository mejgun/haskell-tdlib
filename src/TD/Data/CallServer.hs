{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallServerType as CallServerType
import qualified Utils as U

-- |
data CallServer = -- | Describes a server for relaying call data @id Server identifier @ip_address Server IPv4 address @ipv6_address Server IPv6 address @port Server port number @type Server type
  CallServer
  { -- |
    _type :: Maybe CallServerType.CallServerType,
    -- |
    port :: Maybe Int,
    -- |
    ipv6_address :: Maybe String,
    -- |
    ip_address :: Maybe String,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show CallServer where
  show
    CallServer
      { _type = _type_,
        port = port_,
        ipv6_address = ipv6_address_,
        ip_address = ip_address_,
        _id = _id_
      } =
      "CallServer"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "port" port_,
            U.p "ipv6_address" ipv6_address_,
            U.p "ip_address" ip_address_,
            U.p "_id" _id_
          ]

instance T.FromJSON CallServer where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callServer" -> parseCallServer v
      _ -> mempty
    where
      parseCallServer :: A.Value -> T.Parser CallServer
      parseCallServer = A.withObject "CallServer" $ \o -> do
        _type_ <- o A..:? "type"
        port_ <- o A..:? "port"
        ipv6_address_ <- o A..:? "ipv6_address"
        ip_address_ <- o A..:? "ip_address"
        _id_ <- U.rm <$> (o A..: "id" :: T.Parser String) :: T.Parser (Maybe Int)
        return $ CallServer {_type = _type_, port = port_, ipv6_address = ipv6_address_, ip_address = ip_address_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON CallServer where
  toJSON
    CallServer
      { _type = _type_,
        port = port_,
        ipv6_address = ipv6_address_,
        ip_address = ip_address_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "callServer",
          "type" A..= _type_,
          "port" A..= port_,
          "ipv6_address" A..= ipv6_address_,
          "ip_address" A..= ip_address_,
          "id" A..= _id_
        ]
