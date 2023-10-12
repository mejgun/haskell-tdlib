module TD.Query.TestReturnError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.Error as Error

data TestReturnError -- ^ Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously
  = TestReturnError
    { _error :: Maybe Error.Error -- ^ The error to be returned
    }
  deriving (Eq)

instance Show TestReturnError where
  show
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
