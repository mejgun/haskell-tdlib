module TD.Query.TestGetDifference
  (TestGetDifference(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Forces an updates.getDifference call to the Telegram servers; for testing only. Returns 'TD.Data.Ok.Ok'
data TestGetDifference
  = TestGetDifference
  deriving (Eq, Show)

instance I.ShortShow TestGetDifference where
  shortShow
    TestGetDifference
        = "TestGetDifference"

instance AT.ToJSON TestGetDifference where
  toJSON
    TestGetDifference
        = A.object
          [ "@type" A..= AT.String "testGetDifference"
          ]

