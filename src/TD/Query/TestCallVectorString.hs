module TD.Query.TestCallVectorString
  (TestCallVectorString(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.TestVectorString.TestVectorString'
data TestCallVectorString
  = TestCallVectorString
    { x :: Maybe [T.Text] -- ^ Vector of strings to return
    }
  deriving (Eq, Show)

instance I.ShortShow TestCallVectorString where
  shortShow
    TestCallVectorString
      { x = x_
      }
        = "TestCallVectorString"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallVectorString where
  toJSON
    TestCallVectorString
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallVectorString"
          , "x"     A..= x_
          ]

