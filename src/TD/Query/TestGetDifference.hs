module TD.Query.TestGetDifference where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestGetDifference -- ^ Forces an updates.getDifference call to the Telegram servers; for testing only
  = TestGetDifference
  deriving (Eq)

instance Show TestGetDifference where
  show
    TestGetDifference
        = "TestGetDifference"

instance AT.ToJSON TestGetDifference where
  toJSON
    TestGetDifference
        = A.object
          [ "@type" A..= AT.String "testGetDifference"
          ]
