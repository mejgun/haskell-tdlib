module TD.Query.TestCallBytes
  (TestCallBytes(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Returns the received bytes; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.TestBytes.TestBytes'
data TestCallBytes
  = TestCallBytes
    { x :: Maybe BS.ByteString -- ^ Bytes to return
    }
  deriving (Eq, Show)

instance I.ShortShow TestCallBytes where
  shortShow
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

