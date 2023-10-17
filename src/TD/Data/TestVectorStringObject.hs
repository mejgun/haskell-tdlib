module TD.Data.TestVectorStringObject
  (TestVectorStringObject(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TestString as TestString

data TestVectorStringObject
  = TestVectorStringObject -- ^ A simple object containing a vector of objects that hold a string; for testing only
    { value :: Maybe [TestString.TestString] -- ^ Vector of objects
    }
  deriving (Eq, Show)

instance I.ShortShow TestVectorStringObject where
  shortShow TestVectorStringObject
    { value = value_
    }
      = "TestVectorStringObject"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestVectorStringObject where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testVectorStringObject" -> parseTestVectorStringObject v
      _                        -> mempty
    
    where
      parseTestVectorStringObject :: A.Value -> AT.Parser TestVectorStringObject
      parseTestVectorStringObject = A.withObject "TestVectorStringObject" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestVectorStringObject
          { value = value_
          }
  parseJSON _ = mempty

