{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the current state of 2-step verification
data GetPasswordState = GetPasswordState
  {
  }
  deriving (Eq)

instance Show GetPasswordState where
  show GetPasswordState =
    "GetPasswordState"
      ++ U.cc
        []

instance T.ToJSON GetPasswordState where
  toJSON GetPasswordState =
    A.object
      [ "@type" A..= T.String "getPasswordState"
      ]
