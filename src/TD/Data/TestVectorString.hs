module TD.Data.TestVectorString
  ( TestVectorString(..)    
  , defaultTestVectorString 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TestVectorString
  = TestVectorString -- ^ A simple object containing a vector of strings; for testing only
    { value :: Maybe [T.Text] -- ^ Vector of strings
    }
  deriving (Eq)

instance Show TestVectorString where
  show TestVectorString
    { value = value_
    }
      = "TestVectorString"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestVectorString where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testVectorString" -> parseTestVectorString v
      _                  -> mempty
    
    where
      parseTestVectorString :: A.Value -> AT.Parser TestVectorString
      parseTestVectorString = A.withObject "TestVectorString" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestVectorString
          { value = value_
          }
  parseJSON _ = mempty

instance AT.ToJSON TestVectorString where
  toJSON TestVectorString
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "testVectorString"
        , "value" A..= value_
        ]

defaultTestVectorString :: TestVectorString
defaultTestVectorString =
  TestVectorString
    { value = Nothing
    }

