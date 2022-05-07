{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DisableProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Disables the currently enabled proxy. Can be called before authorization
data DisableProxy = DisableProxy
  {
  }
  deriving (Eq)

instance Show DisableProxy where
  show DisableProxy =
    "DisableProxy"
      ++ U.cc
        []

instance T.ToJSON DisableProxy where
  toJSON DisableProxy =
    A.object
      [ "@type" A..= T.String "disableProxy"
      ]
