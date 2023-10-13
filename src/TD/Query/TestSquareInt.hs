module TD.Query.TestSquareInt
  (TestSquareInt(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the squared received number; for testing only. This is an offline method. Can be called before authorization
data TestSquareInt
  = TestSquareInt
    { x :: Maybe Int -- ^ Number to square
    }
  deriving (Eq)

instance Show TestSquareInt where
  show
    TestSquareInt
      { x = x_
      }
        = "TestSquareInt"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestSquareInt where
  toJSON
    TestSquareInt
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testSquareInt"
          , "x"     A..= x_
          ]

