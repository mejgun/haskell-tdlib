{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetApplicationDownloadLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
data GetApplicationDownloadLink = GetApplicationDownloadLink
  {
  }
  deriving (Eq)

instance Show GetApplicationDownloadLink where
  show GetApplicationDownloadLink =
    "GetApplicationDownloadLink"
      ++ U.cc
        []

instance T.ToJSON GetApplicationDownloadLink where
  toJSON GetApplicationDownloadLink =
    A.object
      [ "@type" A..= T.String "getApplicationDownloadLink"
      ]
