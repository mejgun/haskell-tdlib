-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetDatabaseEncryptionKey where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetDatabaseEncryptionKey = 
 SetDatabaseEncryptionKey { new_encryption_key :: Maybe String }  deriving (Show)

instance T.ToJSON SetDatabaseEncryptionKey where
 toJSON (SetDatabaseEncryptionKey { new_encryption_key = new_encryption_key }) =
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
    new_encryption_key <- optional $ o A..: "new_encryption_key"
    return $ SetDatabaseEncryptionKey { new_encryption_key = new_encryption_key }