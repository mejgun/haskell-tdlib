{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetUserLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link, which can be used to get information about the current user
data GetUserLink = GetUserLink
  {
  }
  deriving (Eq)

instance Show GetUserLink where
  show GetUserLink =
    "GetUserLink"
      ++ U.cc
        []

instance T.ToJSON GetUserLink where
  toJSON GetUserLink =
    A.object
      [ "@type" A..= T.String "getUserLink"
      ]
