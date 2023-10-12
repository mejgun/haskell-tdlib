module TD.Query.TestCallString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestCallString -- ^ Returns the received string; for testing only. This is an offline method. Can be called before authorization
  = TestCallString
    { x :: Maybe T.Text -- ^ String to return
    }
  deriving (Eq)

instance Show TestCallString where
  show
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
