module TD.Data.TestVectorInt
  ( TestVectorInt(..)    
  , defaultTestVectorInt 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TestVectorInt
  = TestVectorInt -- ^ A simple object containing a vector of numbers; for testing only
    { value :: Maybe [Int] -- ^ Vector of numbers
    }
  deriving (Eq)

instance Show TestVectorInt where
  show TestVectorInt
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

instance AT.ToJSON TestVectorInt where
  toJSON TestVectorInt
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "testVectorInt"
        , "value" A..= value_
        ]

defaultTestVectorInt :: TestVectorInt
defaultTestVectorInt =
  TestVectorInt
    { value = Nothing
    }

