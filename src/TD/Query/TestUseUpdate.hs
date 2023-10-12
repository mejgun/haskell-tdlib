module TD.Query.TestUseUpdate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestUseUpdate -- ^ Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
  = TestUseUpdate
  deriving (Eq)

instance Show TestUseUpdate where
  show
    TestUseUpdate
        = "TestUseUpdate"

instance AT.ToJSON TestUseUpdate where
  toJSON
    TestUseUpdate
        = A.object
          [ "@type" A..= AT.String "testUseUpdate"
          ]
