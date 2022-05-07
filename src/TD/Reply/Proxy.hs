{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Proxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ProxyType as ProxyType
import qualified Utils as U

data Proxy = -- | Contains information about a proxy server @id Unique identifier of the proxy @server Proxy server IP address @port Proxy server port @last_used_date Point in time (Unix timestamp) when the proxy was last used; 0 if never @is_enabled True, if the proxy is enabled now @type Type of the proxy
  Proxy
  { -- |
    _type :: Maybe ProxyType.ProxyType,
    -- |
    is_enabled :: Maybe Bool,
    -- |
    last_used_date :: Maybe Int,
    -- |
    port :: Maybe Int,
    -- |
    server :: Maybe String,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Proxy where
  show
    Proxy
      { _type = _type,
        is_enabled = is_enabled,
        last_used_date = last_used_date,
        port = port,
        server = server,
        _id = _id
      } =
      "Proxy"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "is_enabled" is_enabled,
            U.p "last_used_date" last_used_date,
            U.p "port" port,
            U.p "server" server,
            U.p "_id" _id
          ]

instance T.FromJSON Proxy where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "proxy" -> parseProxy v
      _ -> fail ""
    where
      parseProxy :: A.Value -> T.Parser Proxy
      parseProxy = A.withObject "Proxy" $ \o -> do
        _type_ <- o A..:? "type"
        is_enabled_ <- o A..:? "is_enabled"
        last_used_date_ <- mconcat [o A..:? "last_used_date", U.rm <$> (o A..: "last_used_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        port_ <- mconcat [o A..:? "port", U.rm <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
        server_ <- o A..:? "server"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Proxy {_type = _type_, is_enabled = is_enabled_, last_used_date = last_used_date_, port = port_, server = server_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON Proxy where
  toJSON
    Proxy
      { _type = _type,
        is_enabled = is_enabled,
        last_used_date = last_used_date,
        port = port,
        server = server,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "proxy",
          "type" A..= _type,
          "is_enabled" A..= is_enabled,
          "last_used_date" A..= last_used_date,
          "port" A..= port,
          "server" A..= server,
          "id" A..= _id
        ]
