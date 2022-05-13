{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestUseUpdate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
data TestUseUpdate = TestUseUpdate
  {
  }
  deriving (Eq)

instance Show TestUseUpdate where
  show TestUseUpdate =
    "TestUseUpdate"
      ++ U.cc
        []

instance T.ToJSON TestUseUpdate where
  toJSON TestUseUpdate =
    A.object
      [ "@type" A..= T.String "testUseUpdate"
      ]
