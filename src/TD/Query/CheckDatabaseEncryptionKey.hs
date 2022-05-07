{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckDatabaseEncryptionKey where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey @encryption_key Encryption key to check or set up
data CheckDatabaseEncryptionKey = CheckDatabaseEncryptionKey
  { -- |
    encryption_key :: Maybe String
  }
  deriving (Eq)

instance Show CheckDatabaseEncryptionKey where
  show
    CheckDatabaseEncryptionKey
      { encryption_key = encryption_key
      } =
      "CheckDatabaseEncryptionKey"
        ++ U.cc
          [ U.p "encryption_key" encryption_key
          ]

instance T.ToJSON CheckDatabaseEncryptionKey where
  toJSON
    CheckDatabaseEncryptionKey
      { encryption_key = encryption_key
      } =
      A.object
        [ "@type" A..= T.String "checkDatabaseEncryptionKey",
          "encryption_key" A..= encryption_key
        ]
