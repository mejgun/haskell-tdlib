{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestCallVectorStringObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TestString as TestString
import qualified Utils as U

-- |
-- Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization @x Vector of objects to return
data TestCallVectorStringObject = TestCallVectorStringObject
  { -- |
    x :: Maybe [TestString.TestString]
  }
  deriving (Eq)

instance Show TestCallVectorStringObject where
  show
    TestCallVectorStringObject
      { x = x
      } =
      "TestCallVectorStringObject"
        ++ U.cc
          [ U.p "x" x
          ]

instance T.ToJSON TestCallVectorStringObject where
  toJSON
    TestCallVectorStringObject
      { x = x
      } =
      A.object
        [ "@type" A..= T.String "testCallVectorStringObject",
          "x" A..= x
        ]
