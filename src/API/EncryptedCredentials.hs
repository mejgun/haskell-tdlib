-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EncryptedCredentials where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains encrypted Telegram Passport data credentials 
-- 
-- __data__ The encrypted credentials
-- 
-- __hash__ The decrypted data hash
-- 
-- __secret__ Secret for data decryption, encrypted with the service's public key
data EncryptedCredentials = 
 EncryptedCredentials { secret :: Maybe String, hash :: Maybe String, _data :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON EncryptedCredentials where
 toJSON (EncryptedCredentials { secret = secret, hash = hash, _data = _data }) =
  A.object [ "@type" A..= T.String "encryptedCredentials", "secret" A..= secret, "hash" A..= hash, "data" A..= _data ]

instance T.FromJSON EncryptedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "encryptedCredentials" -> parseEncryptedCredentials v
   _ -> mempty
  where
   parseEncryptedCredentials :: A.Value -> T.Parser EncryptedCredentials
   parseEncryptedCredentials = A.withObject "EncryptedCredentials" $ \o -> do
    secret <- o A..:? "secret"
    hash <- o A..:? "hash"
    _data <- o A..:? "data"
    return $ EncryptedCredentials { secret = secret, hash = hash, _data = _data }