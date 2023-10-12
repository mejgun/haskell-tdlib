module TD.Query.TestCallEmpty where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestCallEmpty -- ^ Does nothing; for testing only. This is an offline method. Can be called before authorization
  = TestCallEmpty
  deriving (Eq)

instance Show TestCallEmpty where
  show
    TestCallEmpty
        = "TestCallEmpty"

instance AT.ToJSON TestCallEmpty where
  toJSON
    TestCallEmpty
        = A.object
          [ "@type" A..= AT.String "testCallEmpty"
          ]
