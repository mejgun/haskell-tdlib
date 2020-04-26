-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckDatabaseEncryptionKey where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey 
-- 
-- __encryption_key__ Encryption key to check or set up
data CheckDatabaseEncryptionKey = 
 CheckDatabaseEncryptionKey { encryption_key :: Maybe String }  deriving (Show, Eq)

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
    encryption_key <- o A..:? "encryption_key"
    return $ CheckDatabaseEncryptionKey { encryption_key = encryption_key }