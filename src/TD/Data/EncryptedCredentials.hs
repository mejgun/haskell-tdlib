module TD.Data.EncryptedCredentials
  (EncryptedCredentials(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data EncryptedCredentials
  = EncryptedCredentials -- ^ Contains encrypted Telegram Passport data credentials
    { _data  :: Maybe BS.ByteString -- ^ The encrypted credentials
    , hash   :: Maybe BS.ByteString -- ^ The decrypted data hash
    , secret :: Maybe BS.ByteString -- ^ Secret for data decryption, encrypted with the service's public key
    }
  deriving (Eq, Show)

instance I.ShortShow EncryptedCredentials where
  shortShow EncryptedCredentials
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
  parseJSON _ = mempty

