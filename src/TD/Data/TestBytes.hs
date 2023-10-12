module TD.Data.TestBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data TestBytes
  = TestBytes -- ^ A simple object containing a sequence of bytes; for testing only
    { value :: Maybe BS.ByteString -- ^ Bytes
    }
  deriving (Eq)

instance Show TestBytes where
  show TestBytes
    { value = value_
    }
      = "TestBytes"
        ++ I.cc
        [ "value" `I.p` value_
        ]

instance AT.FromJSON TestBytes where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "testBytes" -> parseTestBytes v
      _           -> mempty
    
    where
      parseTestBytes :: A.Value -> AT.Parser TestBytes
      parseTestBytes = A.withObject "TestBytes" $ \o -> do
        value_ <- fmap I.readBytes <$> o A..:?  "value"
        pure $ TestBytes
          { value = value_
          }

instance AT.ToJSON TestBytes where
  toJSON TestBytes
    { value = value_
    }
      = A.object
        [ "@type" A..= AT.String "testBytes"
        , "value" A..= fmap I.writeBytes  value_
        ]
