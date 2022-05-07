{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetApplicationConfig where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns application config, provided by the server. Can be called before authorization
data GetApplicationConfig = GetApplicationConfig
  {
  }
  deriving (Eq)

instance Show GetApplicationConfig where
  show GetApplicationConfig =
    "GetApplicationConfig"
      ++ U.cc
        []

instance T.ToJSON GetApplicationConfig where
  toJSON GetApplicationConfig =
    A.object
      [ "@type" A..= T.String "getApplicationConfig"
      ]
