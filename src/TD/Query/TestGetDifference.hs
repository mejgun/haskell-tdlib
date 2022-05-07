{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestGetDifference where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Forces an updates.getDifference call to the Telegram servers; for testing only
data TestGetDifference = TestGetDifference
  {
  }
  deriving (Eq)

instance Show TestGetDifference where
  show TestGetDifference =
    "TestGetDifference"
      ++ U.cc
        []

instance T.ToJSON TestGetDifference where
  toJSON TestGetDifference =
    A.object
      [ "@type" A..= T.String "testGetDifference"
      ]
