module TD.Query.TestCallVectorInt(TestCallVectorInt(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TestCallVectorInt -- ^ Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization
  = TestCallVectorInt
    { x :: Maybe [Int] -- ^ Vector of numbers to return
    }
  deriving (Eq)

instance Show TestCallVectorInt where
  show
    TestCallVectorInt
      { x = x_
      }
        = "TestCallVectorInt"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallVectorInt where
  toJSON
    TestCallVectorInt
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallVectorInt"
          , "x"     A..= x_
          ]
