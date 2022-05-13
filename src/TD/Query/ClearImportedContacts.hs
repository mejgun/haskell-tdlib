{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClearImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears all imported contacts, contact list remains unchanged
data ClearImportedContacts = ClearImportedContacts
  {
  }
  deriving (Eq)

instance Show ClearImportedContacts where
  show ClearImportedContacts =
    "ClearImportedContacts"
      ++ U.cc
        []

instance T.ToJSON ClearImportedContacts where
  toJSON ClearImportedContacts =
    A.object
      [ "@type" A..= T.String "clearImportedContacts"
      ]
