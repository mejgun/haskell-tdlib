module TD.Query.TestCallBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestCallBytes -- ^ Returns the received bytes; for testing only. This is an offline method. Can be called before authorization
  = TestCallBytes
    { x :: Maybe BS.ByteString -- ^ Bytes to return
    }
  deriving (Eq)

instance Show TestCallBytes where
  show
    TestCallBytes
      { x = x_
      }
        = "TestCallBytes"
          ++ I.cc
          [ "x" `I.p` x_
          ]

instance AT.ToJSON TestCallBytes where
  toJSON
    TestCallBytes
      { x = x_
      }
        = A.object
          [ "@type" A..= AT.String "testCallBytes"
          , "x"     A..= fmap I.writeBytes  x_
          ]
