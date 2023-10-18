module TD.Query.TestNetwork
  (TestNetwork(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data TestNetwork
  = TestNetwork
  deriving (Eq, Show)

instance I.ShortShow TestNetwork where
  shortShow
    TestNetwork
        = "TestNetwork"

instance AT.ToJSON TestNetwork where
  toJSON
    TestNetwork
        = A.object
          [ "@type" A..= AT.String "testNetwork"
          ]

