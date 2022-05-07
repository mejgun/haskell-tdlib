{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetAuthorizationState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state. Can be called before initialization
data GetAuthorizationState = GetAuthorizationState
  {
  }
  deriving (Eq)

instance Show GetAuthorizationState where
  show GetAuthorizationState =
    "GetAuthorizationState"
      ++ U.cc
        []

instance T.ToJSON GetAuthorizationState where
  toJSON GetAuthorizationState =
    A.object
      [ "@type" A..= T.String "getAuthorizationState"
      ]
