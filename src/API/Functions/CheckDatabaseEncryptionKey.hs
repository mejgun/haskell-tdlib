-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckDatabaseEncryptionKey where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckDatabaseEncryptionKey = 
 CheckDatabaseEncryptionKey { encryption_key :: Maybe String }  deriving (Show)

instance T.ToJSON CheckDatabaseEncryptionKey where
 toJSON (CheckDatabaseEncryptionKey { encryption_key = encryption_key }) =
  A.object [ "@type" A..= T.String "checkDatabaseEncryptionKey", "encryption_key" A..= encryption_key ]

instance T.FromJSON CheckDatabaseEncryptionKey where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkDatabaseEncryptionKey" -> parseCheckDatabaseEncryptionKey v
   _ -> mempty
  where
   parseCheckDatabaseEncryptionKey :: A.Value -> T.Parser CheckDatabaseEncryptionKey
   parseCheckDatabaseEncryptionKey = A.withObject "CheckDatabaseEncryptionKey" $ \o -> do
    encryption_key <- optional $ o A..: "encryption_key"
    return $ CheckDatabaseEncryptionKey { encryption_key = encryption_key }