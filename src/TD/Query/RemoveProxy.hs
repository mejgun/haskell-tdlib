{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a proxy server. Can be called before authorization @proxy_id Proxy identifier
data RemoveProxy = RemoveProxy
  { -- |
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveProxy where
  show
    RemoveProxy
      { proxy_id = proxy_id_
      } =
      "RemoveProxy"
        ++ U.cc
          [ U.p "proxy_id" proxy_id_
          ]

instance T.ToJSON RemoveProxy where
  toJSON
    RemoveProxy
      { proxy_id = proxy_id_
      } =
      A.object
        [ "@type" A..= T.String "removeProxy",
          "proxy_id" A..= proxy_id_
        ]
