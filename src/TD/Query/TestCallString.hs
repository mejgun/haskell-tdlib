module TD.Query.TestCallString
  (TestCallString(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the received string; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.TestString.TestString'
data TestCallString
  = TestCallString
    { x :: Maybe T.Text -- ^ String to return
    }
  deriving (Eq, Show)

instance I.ShortShow TestCallString where
  shortShow
    TestCallString
      { x = x_
      }
        = "TestCallString"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallString where
  toJSON
    TestCallString
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallString"
          , "x"     A..= x_
          ]

