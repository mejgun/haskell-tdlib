{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestCallVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization @x Vector of strings to return
data TestCallVectorString = TestCallVectorString
  { -- |
    x :: Maybe [String]
  }
  deriving (Eq)

instance Show TestCallVectorString where
  show
    TestCallVectorString
      { x = x_
      } =
      "TestCallVectorString"
        ++ U.cc
          [ U.p "x" x_
          ]

instance T.ToJSON TestCallVectorString where
  toJSON
    TestCallVectorString
      { x = x_
      } =
      A.object
        [ "@type" A..= T.String "testCallVectorString",
          "x" A..= x_
        ]
