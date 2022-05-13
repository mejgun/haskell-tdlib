{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestCallEmpty where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Does nothing; for testing only. This is an offline method. Can be called before authorization
data TestCallEmpty = TestCallEmpty
  {
  }
  deriving (Eq)

instance Show TestCallEmpty where
  show TestCallEmpty =
    "TestCallEmpty"
      ++ U.cc
        []

instance T.ToJSON TestCallEmpty where
  toJSON TestCallEmpty =
    A.object
      [ "@type" A..= T.String "testCallEmpty"
      ]
