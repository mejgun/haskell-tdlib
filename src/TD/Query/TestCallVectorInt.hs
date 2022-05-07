{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestCallVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization @x Vector of numbers to return
data TestCallVectorInt = TestCallVectorInt
  { -- |
    x :: Maybe [Int]
  }
  deriving (Eq)

instance Show TestCallVectorInt where
  show
    TestCallVectorInt
      { x = x
      } =
      "TestCallVectorInt"
        ++ U.cc
          [ U.p "x" x
          ]

instance T.ToJSON TestCallVectorInt where
  toJSON
    TestCallVectorInt
      { x = x
      } =
      A.object
        [ "@type" A..= T.String "testCallVectorInt",
          "x" A..= x
        ]
