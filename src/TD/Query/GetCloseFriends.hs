{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCloseFriends where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all close friends of the current user
data GetCloseFriends = GetCloseFriends
  {
  }
  deriving (Eq)

instance Show GetCloseFriends where
  show GetCloseFriends =
    "GetCloseFriends"
      ++ U.cc
        []

instance T.ToJSON GetCloseFriends where
  toJSON GetCloseFriends =
    A.object
      [ "@type" A..= T.String "getCloseFriends"
      ]
