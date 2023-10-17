module TD.Data.TestVectorInt
  (TestVectorInt(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TestVectorInt
  = TestVectorInt -- ^ A simple object containing a vector of numbers; for testing only
    { value :: Maybe [Int] -- ^ Vector of numbers
    }
  deriving (Eq, Show)

instance I.ShortShow TestVectorInt where
  shortShow TestVectorInt
    { value = value_
    }
      = "TestVectorInt"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestVectorInt where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testVectorInt" -> parseTestVectorInt v
      _               -> mempty
    
    where
      parseTestVectorInt :: A.Value -> AT.Parser TestVectorInt
      parseTestVectorInt = A.withObject "TestVectorInt" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestVectorInt
          { value = value_
          }
  parseJSON _ = mempty

