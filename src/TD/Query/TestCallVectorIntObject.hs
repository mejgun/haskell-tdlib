{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestCallVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TestInt as TestInt
import qualified Utils as U

-- |
-- Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization @x Vector of objects to return
data TestCallVectorIntObject = TestCallVectorIntObject
  { -- |
    x :: Maybe [TestInt.TestInt]
  }
  deriving (Eq)

instance Show TestCallVectorIntObject where
  show
    TestCallVectorIntObject
      { x = x_
      } =
      "TestCallVectorIntObject"
        ++ U.cc
          [ U.p "x" x_
          ]

instance T.ToJSON TestCallVectorIntObject where
  toJSON
    TestCallVectorIntObject
      { x = x_
      } =
      A.object
        [ "@type" A..= T.String "testCallVectorIntObject",
          "x" A..= x_
        ]
