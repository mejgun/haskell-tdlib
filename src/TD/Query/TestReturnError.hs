{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestReturnError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Error as Error
import qualified Utils as U

-- |
-- Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously @error The error to be returned
data TestReturnError = TestReturnError
  { -- |
    _error :: Maybe Error.Error
  }
  deriving (Eq)

instance Show TestReturnError where
  show
    TestReturnError
      { _error = _error
      } =
      "TestReturnError"
        ++ U.cc
          [ U.p "_error" _error
          ]

instance T.ToJSON TestReturnError where
  toJSON
    TestReturnError
      { _error = _error
      } =
      A.object
        [ "@type" A..= T.String "testReturnError",
          "error" A..= _error
        ]
