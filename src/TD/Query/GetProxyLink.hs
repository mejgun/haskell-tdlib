{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetProxyLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization @proxy_id Proxy identifier
data GetProxyLink = GetProxyLink
  { -- |
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetProxyLink where
  show
    GetProxyLink
      { proxy_id = proxy_id
      } =
      "GetProxyLink"
        ++ U.cc
          [ U.p "proxy_id" proxy_id
          ]

instance T.ToJSON GetProxyLink where
  toJSON
    GetProxyLink
      { proxy_id = proxy_id
      } =
      A.object
        [ "@type" A..= T.String "getProxyLink",
          "proxy_id" A..= proxy_id
        ]
