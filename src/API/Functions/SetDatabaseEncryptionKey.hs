-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetDatabaseEncryptionKey where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain 
-- 
-- __new_encryption_key__ New encryption key
data SetDatabaseEncryptionKey = 

 SetDatabaseEncryptionKey { new_encryption_key :: Maybe String }  deriving (Eq)

instance Show SetDatabaseEncryptionKey where
 show SetDatabaseEncryptionKey { new_encryption_key=new_encryption_key } =
  "SetDatabaseEncryptionKey" ++ U.cc [U.p "new_encryption_key" new_encryption_key ]

instance T.ToJSON SetDatabaseEncryptionKey where
 toJSON SetDatabaseEncryptionKey { new_encryption_key = new_encryption_key } =
  A.object [ "@type" A..= T.String "setDatabaseEncryptionKey", "new_encryption_key" A..= new_encryption_key ]

instance T.FromJSON SetDatabaseEncryptionKey where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setDatabaseEncryptionKey" -> parseSetDatabaseEncryptionKey v
   _ -> mempty
  where
   parseSetDatabaseEncryptionKey :: A.Value -> T.Parser SetDatabaseEncryptionKey
   parseSetDatabaseEncryptionKey = A.withObject "SetDatabaseEncryptionKey" $ \o -> do
    new_encryption_key <- o A..:? "new_encryption_key"
    return $ SetDatabaseEncryptionKey { new_encryption_key = new_encryption_key }
 parseJSON _ = mempty
