{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestNetwork where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
data TestNetwork = TestNetwork
  {
  }
  deriving (Eq)

instance Show TestNetwork where
  show TestNetwork =
    "TestNetwork"
      ++ U.cc
        []

instance T.ToJSON TestNetwork where
  toJSON TestNetwork =
    A.object
      [ "@type" A..= T.String "testNetwork"
      ]
