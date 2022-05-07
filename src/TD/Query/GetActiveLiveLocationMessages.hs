{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetActiveLiveLocationMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all active live locations that need to be updated by the application. The list is persistent across application restarts only if the message database is used
data GetActiveLiveLocationMessages = GetActiveLiveLocationMessages
  {
  }
  deriving (Eq)

instance Show GetActiveLiveLocationMessages where
  show GetActiveLiveLocationMessages =
    "GetActiveLiveLocationMessages"
      ++ U.cc
        []

instance T.ToJSON GetActiveLiveLocationMessages where
  toJSON GetActiveLiveLocationMessages =
    A.object
      [ "@type" A..= T.String "getActiveLiveLocationMessages"
      ]
