{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetDatabaseEncryptionKey where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain @new_encryption_key New encryption key
data SetDatabaseEncryptionKey = SetDatabaseEncryptionKey
  { -- |
    new_encryption_key :: Maybe String
  }
  deriving (Eq)

instance Show SetDatabaseEncryptionKey where
  show
    SetDatabaseEncryptionKey
      { new_encryption_key = new_encryption_key
      } =
      "SetDatabaseEncryptionKey"
        ++ U.cc
          [ U.p "new_encryption_key" new_encryption_key
          ]

instance T.ToJSON SetDatabaseEncryptionKey where
  toJSON
    SetDatabaseEncryptionKey
      { new_encryption_key = new_encryption_key
      } =
      A.object
        [ "@type" A..= T.String "setDatabaseEncryptionKey",
          "new_encryption_key" A..= new_encryption_key
        ]
