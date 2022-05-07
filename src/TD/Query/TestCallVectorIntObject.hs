{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestCallVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.TestInt as TestInt
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
      { x = x
      } =
      "TestCallVectorIntObject"
        ++ U.cc
          [ U.p "x" x
          ]

instance T.ToJSON TestCallVectorIntObject where
  toJSON
    TestCallVectorIntObject
      { x = x
      } =
      A.object
        [ "@type" A..= T.String "testCallVectorIntObject",
          "x" A..= x
        ]
