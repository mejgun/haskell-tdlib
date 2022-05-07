{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetProxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of proxies that are currently set up. Can be called before authorization
data GetProxies = GetProxies
  {
  }
  deriving (Eq)

instance Show GetProxies where
  show GetProxies =
    "GetProxies"
      ++ U.cc
        []

instance T.ToJSON GetProxies where
  toJSON GetProxies =
    A.object
      [ "@type" A..= T.String "getProxies"
      ]
