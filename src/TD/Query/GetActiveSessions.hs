{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetActiveSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all active sessions of the current user
data GetActiveSessions = GetActiveSessions
  {
  }
  deriving (Eq)

instance Show GetActiveSessions where
  show GetActiveSessions =
    "GetActiveSessions"
      ++ U.cc
        []

instance T.ToJSON GetActiveSessions where
  toJSON GetActiveSessions =
    A.object
      [ "@type" A..= T.String "getActiveSessions"
      ]
