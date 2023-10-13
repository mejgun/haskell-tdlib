module TD.Query.TestCallEmpty
  (TestCallEmpty(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Does nothing; for testing only. This is an offline method. Can be called before authorization
data TestCallEmpty
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

