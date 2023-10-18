module TD.Query.TestUseUpdate
  (TestUseUpdate(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization. Returns 'TD.Data.Update.Update'
data TestUseUpdate
  = TestUseUpdate
  deriving (Eq, Show)

instance I.ShortShow TestUseUpdate where
  shortShow
    TestUseUpdate
        = "TestUseUpdate"

instance AT.ToJSON TestUseUpdate where
  toJSON
    TestUseUpdate
        = A.object
          [ "@type" A..= AT.String "testUseUpdate"
          ]

