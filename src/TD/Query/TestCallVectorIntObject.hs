module TD.Query.TestCallVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.TestInt as TestInt

data TestCallVectorIntObject -- ^ Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization
  = TestCallVectorIntObject
    { x :: Maybe [TestInt.TestInt] -- ^ Vector of objects to return
    }
  deriving (Eq)

instance Show TestCallVectorIntObject where
  show
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
