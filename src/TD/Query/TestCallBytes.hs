{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestCallBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the received bytes; for testing only. This is an offline method. Can be called before authorization @x Bytes to return
data TestCallBytes = TestCallBytes
  { -- |
    x :: Maybe String
  }
  deriving (Eq)

instance Show TestCallBytes where
  show
    TestCallBytes
      { x = x
      } =
      "TestCallBytes"
        ++ U.cc
          [ U.p "x" x
          ]

instance T.ToJSON TestCallBytes where
  toJSON
    TestCallBytes
      { x = x
      } =
      A.object
        [ "@type" A..= T.String "testCallBytes",
          "x" A..= x
        ]
