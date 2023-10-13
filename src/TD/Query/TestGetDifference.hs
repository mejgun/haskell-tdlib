module TD.Query.TestGetDifference
  (TestGetDifference(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Forces an updates.getDifference call to the Telegram servers; for testing only
data TestGetDifference
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

