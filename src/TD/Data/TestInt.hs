module TD.Data.TestInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestInt
  = TestInt -- ^ A simple object containing a number; for testing only
    { value :: Maybe Int -- ^ Number
    }
  deriving (Eq)

instance Show TestInt where
  show TestInt
    { value = value_
    }
      = "TestInt"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestInt where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testInt" -> parseTestInt v
      _         -> mempty
    
    where
      parseTestInt :: A.Value -> AT.Parser TestInt
      parseTestInt = A.withObject "TestInt" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestInt
          { value = value_
          }

instance AT.ToJSON TestInt where
  toJSON TestInt
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "testInt"
        , "value" A..= value_
        ]
