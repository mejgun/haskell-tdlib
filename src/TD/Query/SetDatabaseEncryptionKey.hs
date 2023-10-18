module TD.Query.SetDatabaseEncryptionKey
  (SetDatabaseEncryptionKey(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain. Returns 'TD.Data.Ok.Ok'
data SetDatabaseEncryptionKey
  = SetDatabaseEncryptionKey
    { new_encryption_key :: Maybe BS.ByteString -- ^ New encryption key
    }
  deriving (Eq, Show)

instance I.ShortShow SetDatabaseEncryptionKey where
  shortShow
    SetDatabaseEncryptionKey
      { new_encryption_key = new_encryption_key_
      }
        = "SetDatabaseEncryptionKey"
          ++ I.cc
          [ "new_encryption_key" `I.p` new_encryption_key_
          ]

instance AT.ToJSON SetDatabaseEncryptionKey where
  toJSON
    SetDatabaseEncryptionKey
      { new_encryption_key = new_encryption_key_
      }
        = A.object
          [ "@type"              A..= AT.String "setDatabaseEncryptionKey"
          , "new_encryption_key" A..= fmap I.writeBytes  new_encryption_key_
          ]

