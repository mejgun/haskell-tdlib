module TD.Data.EncryptedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data EncryptedCredentials
  = EncryptedCredentials -- ^ Contains encrypted Telegram Passport data credentials
    { _data  :: Maybe BS.ByteString -- ^ The encrypted credentials
    , hash   :: Maybe BS.ByteString -- ^ The decrypted data hash
    , secret :: Maybe BS.ByteString -- ^ Secret for data decryption, encrypted with the service's public key
    }
  deriving (Eq)

instance Show EncryptedCredentials where
  show EncryptedCredentials
    { _data  = _data_
    , hash   = hash_
    , secret = secret_
    }
      = "EncryptedCredentials"
        ++ I.cc
        [ "_data"  `I.p` _data_
        , "hash"   `I.p` hash_
        , "secret" `I.p` secret_
        ]

instance AT.FromJSON EncryptedCredentials where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "encryptedCredentials" -> parseEncryptedCredentials v
      _                      -> mempty
    
    where
      parseEncryptedCredentials :: A.Value -> AT.Parser EncryptedCredentials
      parseEncryptedCredentials = A.withObject "EncryptedCredentials" $ \o -> do
        _data_  <- fmap I.readBytes <$> o A..:?  "data"
        hash_   <- fmap I.readBytes <$> o A..:?  "hash"
        secret_ <- fmap I.readBytes <$> o A..:?  "secret"
        pure $ EncryptedCredentials
          { _data  = _data_
          , hash   = hash_
          , secret = secret_
          }

instance AT.ToJSON EncryptedCredentials where
  toJSON EncryptedCredentials
    { _data  = _data_
    , hash   = hash_
    , secret = secret_
    }
      = A.object
        [ "@type"  A..= AT.String "encryptedCredentials"
        , "data"   A..= I.toB _data_
        , "hash"   A..= I.toB hash_
        , "secret" A..= I.toB secret_
        ]
