{-# LANGUAGE OverloadedStrings #-}

module TD.Query.PingProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization @proxy_id Proxy identifier. Use 0 to ping a Telegram server without a proxy
data PingProxy = PingProxy
  { -- |
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show PingProxy where
  show
    PingProxy
      { proxy_id = proxy_id
      } =
      "PingProxy"
        ++ U.cc
          [ U.p "proxy_id" proxy_id
          ]

instance T.ToJSON PingProxy where
  toJSON
    PingProxy
      { proxy_id = proxy_id
      } =
      A.object
        [ "@type" A..= T.String "pingProxy",
          "proxy_id" A..= proxy_id
        ]
