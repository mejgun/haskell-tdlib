{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestSquareInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the squared received number; for testing only. This is an offline method. Can be called before authorization @x Number to square
data TestSquareInt = TestSquareInt
  { -- |
    x :: Maybe Int
  }
  deriving (Eq)

instance Show TestSquareInt where
  show
    TestSquareInt
      { x = x_
      } =
      "TestSquareInt"
        ++ U.cc
          [ U.p "x" x_
          ]

instance T.ToJSON TestSquareInt where
  toJSON
    TestSquareInt
      { x = x_
      } =
      A.object
        [ "@type" A..= T.String "testSquareInt",
          "x" A..= x_
        ]
