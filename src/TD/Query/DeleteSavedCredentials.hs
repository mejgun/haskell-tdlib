{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteSavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes saved credentials for all payment provider bots
data DeleteSavedCredentials = DeleteSavedCredentials
  {
  }
  deriving (Eq)

instance Show DeleteSavedCredentials where
  show DeleteSavedCredentials =
    "DeleteSavedCredentials"
      ++ U.cc
        []

instance T.ToJSON DeleteSavedCredentials where
  toJSON DeleteSavedCredentials =
    A.object
      [ "@type" A..= T.String "deleteSavedCredentials"
      ]
