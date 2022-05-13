{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetImportedContactCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the total number of imported contacts
data GetImportedContactCount = GetImportedContactCount
  {
  }
  deriving (Eq)

instance Show GetImportedContactCount where
  show GetImportedContactCount =
    "GetImportedContactCount"
      ++ U.cc
        []

instance T.ToJSON GetImportedContactCount where
  toJSON GetImportedContactCount =
    A.object
      [ "@type" A..= T.String "getImportedContactCount"
      ]
