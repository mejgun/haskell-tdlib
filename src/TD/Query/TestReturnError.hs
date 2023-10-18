module TD.Query.TestReturnError
  (TestReturnError(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Error as Error

-- | Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously. Returns 'TD.Data.Error.Error'
data TestReturnError
  = TestReturnError
    { _error :: Maybe Error.Error -- ^ The error to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow TestReturnError where
  shortShow
    TestReturnError
      { _error = _error_
      }
        = "TestReturnError"
          ++ I.cc
          [ "_error" `I.p` _error_
          ]

instance AT.ToJSON TestReturnError where
  toJSON
    TestReturnError
      { _error = _error_
      }
        = A.object
          [ "@type" A..= AT.String "testReturnError"
          , "error" A..= _error_
          ]

