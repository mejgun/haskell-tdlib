{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Proxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProxyType as ProxyType
import qualified Utils as U

-- |
data Proxy = -- | Contains information about a proxy server
  Proxy
  { -- | Type of the proxy
    _type :: Maybe ProxyType.ProxyType,
    -- | True, if the proxy is enabled now
    is_enabled :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the proxy was last used; 0 if never
    last_used_date :: Maybe Int,
    -- | Proxy server port
    port :: Maybe Int,
    -- | Proxy server domain or IP address
    server :: Maybe String,
    -- | Unique identifier of the proxy
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Proxy where
  show
    Proxy
      { _type = _type_,
        is_enabled = is_enabled_,
        last_used_date = last_used_date_,
        port = port_,
        server = server_,
        _id = _id_
      } =
      "Proxy"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "is_enabled" is_enabled_,
            U.p "last_used_date" last_used_date_,
            U.p "port" port_,
            U.p "server" server_,
            U.p "_id" _id_
          ]

instance T.FromJSON Proxy where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "proxy" -> parseProxy v
      _ -> mempty
    where
      parseProxy :: A.Value -> T.Parser Proxy
      parseProxy = A.withObject "Proxy" $ \o -> do
        _type_ <- o A..:? "type"
        is_enabled_ <- o A..:? "is_enabled"
        last_used_date_ <- o A..:? "last_used_date"
        port_ <- o A..:? "port"
        server_ <- o A..:? "server"
        _id_ <- o A..:? "id"
        return $ Proxy {_type = _type_, is_enabled = is_enabled_, last_used_date = last_used_date_, port = port_, server = server_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Proxy where
  toJSON
    Proxy
      { _type = _type_,
        is_enabled = is_enabled_,
        last_used_date = last_used_date_,
        port = port_,
        server = server_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "proxy",
          "type" A..= _type_,
          "is_enabled" A..= is_enabled_,
          "last_used_date" A..= last_used_date_,
          "port" A..= port_,
          "server" A..= server_,
          "id" A..= _id_
        ]
