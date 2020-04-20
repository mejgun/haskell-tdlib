-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EncryptedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data EncryptedCredentials = 
 EncryptedCredentials { secret :: String, hash :: String, _data :: String }  -- deriving (Show)

instance T.ToJSON EncryptedCredentials where
 toJSON (EncryptedCredentials { secret = secret, hash = hash, _data = _data }) =
  A.object [ "@type" A..= T.String "encryptedCredentials", "secret" A..= secret, "hash" A..= hash, "data" A..= _data ]
-- encryptedCredentials EncryptedCredentials  { secret :: String, hash :: String, _data :: String } 



instance T.FromJSON EncryptedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "encryptedCredentials" -> parseEncryptedCredentials v
  where
   parseEncryptedCredentials :: A.Value -> T.Parser EncryptedCredentials
   parseEncryptedCredentials = A.withObject "EncryptedCredentials" $ \o -> do
    secret <- o A..: "secret"
    hash <- o A..: "hash"
    _data <- o A..: "data"
    return $ EncryptedCredentials { secret = secret, hash = hash, _data = _data }