-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetDatabaseEncryptionKey where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetDatabaseEncryptionKey = 
 SetDatabaseEncryptionKey { new_encryption_key :: String }  -- deriving (Show)

instance T.ToJSON SetDatabaseEncryptionKey where
 toJSON (SetDatabaseEncryptionKey { new_encryption_key = new_encryption_key }) =
  A.object [ "@type" A..= T.String "setDatabaseEncryptionKey", "new_encryption_key" A..= new_encryption_key ]
-- setDatabaseEncryptionKey SetDatabaseEncryptionKey  { new_encryption_key :: String } 

