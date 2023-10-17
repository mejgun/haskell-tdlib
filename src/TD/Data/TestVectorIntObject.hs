module TD.Data.TestVectorIntObject
  (TestVectorIntObject(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TestInt as TestInt

data TestVectorIntObject
  = TestVectorIntObject -- ^ A simple object containing a vector of objects that hold a number; for testing only
    { value :: Maybe [TestInt.TestInt] -- ^ Vector of objects
    }
  deriving (Eq, Show)

instance I.ShortShow TestVectorIntObject where
  shortShow TestVectorIntObject
    { value = value_
    }
      = "TestVectorIntObject"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestVectorIntObject where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testVectorIntObject" -> parseTestVectorIntObject v
      _                     -> mempty
    
    where
      parseTestVectorIntObject :: A.Value -> AT.Parser TestVectorIntObject
      parseTestVectorIntObject = A.withObject "TestVectorIntObject" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestVectorIntObject
          { value = value_
          }
  parseJSON _ = mempty

