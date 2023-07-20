{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all contacts of the user
data GetContacts = GetContacts
  {
  }
  deriving (Eq)

instance Show GetContacts where
  show GetContacts =
    "GetContacts"
      ++ U.cc
        []

instance T.ToJSON GetContacts where
  toJSON GetContacts =
    A.object
      [ "@type" A..= T.String "getContacts"
      ]
