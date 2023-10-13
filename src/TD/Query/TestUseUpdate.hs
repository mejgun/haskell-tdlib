module TD.Query.TestUseUpdate
  (TestUseUpdate(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
data TestUseUpdate
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

