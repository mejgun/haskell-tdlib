module TD.Query.TestCallVectorStringObject
  (TestCallVectorStringObject(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TestString as TestString

-- | Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.TestVectorStringObject.TestVectorStringObject'
data TestCallVectorStringObject
  = TestCallVectorStringObject
    { x :: Maybe [TestString.TestString] -- ^ Vector of objects to return
    }
  deriving (Eq, Show)

instance I.ShortShow TestCallVectorStringObject where
  shortShow
    TestCallVectorStringObject
      { x = x_
      }
        = "TestCallVectorStringObject"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallVectorStringObject where
  toJSON
    TestCallVectorStringObject
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallVectorStringObject"
          , "x"     A..= x_
          ]

