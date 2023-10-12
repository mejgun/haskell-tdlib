module TD.Data.TestString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestString
  = TestString -- ^ A simple object containing a string; for testing only
    { value :: Maybe T.Text -- ^ String
    }
  deriving (Eq)

instance Show TestString where
  show TestString
    { value = value_
    }
      = "TestString"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestString where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testString" -> parseTestString v
      _            -> mempty
    
    where
      parseTestString :: A.Value -> AT.Parser TestString
      parseTestString = A.withObject "TestString" $ \o -> do
        value_ <- o A..:?  "value"
        pure $ TestString
          { value = value_
          }

instance AT.ToJSON TestString where
  toJSON TestString
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "testString"
        , "value" A..= value_
        ]
