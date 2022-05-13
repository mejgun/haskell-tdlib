{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetTemporaryPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about the current temporary password
data GetTemporaryPasswordState = GetTemporaryPasswordState
  {
  }
  deriving (Eq)

instance Show GetTemporaryPasswordState where
  show GetTemporaryPasswordState =
    "GetTemporaryPasswordState"
      ++ U.cc
        []

instance T.ToJSON GetTemporaryPasswordState where
  toJSON GetTemporaryPasswordState =
    A.object
      [ "@type" A..= T.String "getTemporaryPasswordState"
      ]
