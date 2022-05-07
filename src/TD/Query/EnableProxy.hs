{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EnableProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization @proxy_id Proxy identifier
data EnableProxy = EnableProxy
  { -- |
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show EnableProxy where
  show
    EnableProxy
      { proxy_id = proxy_id
      } =
      "EnableProxy"
        ++ U.cc
          [ U.p "proxy_id" proxy_id
          ]

instance T.ToJSON EnableProxy where
  toJSON
    EnableProxy
      { proxy_id = proxy_id
      } =
      A.object
        [ "@type" A..= T.String "enableProxy",
          "proxy_id" A..= proxy_id
        ]
