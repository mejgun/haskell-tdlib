{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.CallServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.CallServerType as CallServerType
import qualified Utils as U

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
      { _type = _type,
        port = port,
        ipv6_address = ipv6_address,
        ip_address = ip_address,
        _id = _id
      } =
      "CallServer"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "port" port,
            U.p "ipv6_address" ipv6_address,
            U.p "ip_address" ip_address,
            U.p "_id" _id
          ]

instance T.FromJSON CallServer where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callServer" -> parseCallServer v
      _ -> fail ""
    where
      parseCallServer :: A.Value -> T.Parser CallServer
      parseCallServer = A.withObject "CallServer" $ \o -> do
        _type_ <- o A..:? "type"
        port_ <- mconcat [o A..:? "port", U.rm <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
        ipv6_address_ <- o A..:? "ipv6_address"
        ip_address_ <- o A..:? "ip_address"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ CallServer {_type = _type_, port = port_, ipv6_address = ipv6_address_, ip_address = ip_address_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON CallServer where
  toJSON
    CallServer
      { _type = _type,
        port = port,
        ipv6_address = ipv6_address,
        ip_address = ip_address,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "callServer",
          "type" A..= _type,
          "port" A..= port,
          "ipv6_address" A..= ipv6_address,
          "ip_address" A..= ip_address,
          "id" A..= _id
        ]
