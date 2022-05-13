{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestCallString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the received string; for testing only. This is an offline method. Can be called before authorization @x String to return
data TestCallString = TestCallString
  { -- |
    x :: Maybe String
  }
  deriving (Eq)

instance Show TestCallString where
  show
    TestCallString
      { x = x_
      } =
      "TestCallString"
        ++ U.cc
          [ U.p "x" x_
          ]

instance T.ToJSON TestCallString where
  toJSON
    TestCallString
      { x = x_
      } =
      A.object
        [ "@type" A..= T.String "testCallString",
          "x" A..= x_
        ]
