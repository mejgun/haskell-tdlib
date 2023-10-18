module TD.Query.TestCallVectorIntObject
  (TestCallVectorIntObject(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TestInt as TestInt

-- | Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.TestVectorIntObject.TestVectorIntObject'
data TestCallVectorIntObject
  = TestCallVectorIntObject
    { x :: Maybe [TestInt.TestInt] -- ^ Vector of objects to return
    }
  deriving (Eq, Show)

instance I.ShortShow TestCallVectorIntObject where
  shortShow
    TestCallVectorIntObject
      { x = x_
      }
        = "TestCallVectorIntObject"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallVectorIntObject where
  toJSON
    TestCallVectorIntObject
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallVectorIntObject"
          , "x"     A..= x_
          ]

