{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all website where the current user used Telegram to log in
data GetConnectedWebsites = GetConnectedWebsites
  {
  }
  deriving (Eq)

instance Show GetConnectedWebsites where
  show GetConnectedWebsites =
    "GetConnectedWebsites"
      ++ U.cc
        []

instance T.ToJSON GetConnectedWebsites where
  toJSON GetConnectedWebsites =
    A.object
      [ "@type" A..= T.String "getConnectedWebsites"
      ]
