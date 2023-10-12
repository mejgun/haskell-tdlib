module TD.Query.TestNetwork where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestNetwork -- ^ Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
  = TestNetwork
  deriving (Eq)

instance Show TestNetwork where
  show
    TestNetwork
        = "TestNetwork"

instance AT.ToJSON TestNetwork where
  toJSON
    TestNetwork
        = A.object
          [ "@type" A..= AT.String "testNetwork"
          ]
