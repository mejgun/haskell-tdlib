module TD.Query.TestCallEmpty
  (TestCallEmpty(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Does nothing; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data TestCallEmpty
  = TestCallEmpty
  deriving (Eq, Show)

instance I.ShortShow TestCallEmpty where
  shortShow
    TestCallEmpty
        = "TestCallEmpty"

instance AT.ToJSON TestCallEmpty where
  toJSON
    TestCallEmpty
        = A.object
          [ "@type" A..= AT.String "testCallEmpty"
          ]

