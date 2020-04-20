-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data InputCredentials = 
 InputCredentialsSaved { saved_credentials_id :: String }  
 | InputCredentialsNew { allow_save :: Bool, _data :: String }  
 | InputCredentialsAndroidPay { _data :: String }  
 | InputCredentialsApplePay { _data :: String }  -- deriving (Show)

instance T.ToJSON InputCredentials where
 toJSON (InputCredentialsSaved { saved_credentials_id = saved_credentials_id }) =
  A.object [ "@type" A..= T.String "inputCredentialsSaved", "saved_credentials_id" A..= saved_credentials_id ]

 toJSON (InputCredentialsNew { allow_save = allow_save, _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsNew", "allow_save" A..= allow_save, "data" A..= _data ]

 toJSON (InputCredentialsAndroidPay { _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsAndroidPay", "data" A..= _data ]

 toJSON (InputCredentialsApplePay { _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsApplePay", "data" A..= _data ]
-- inputCredentialsSaved InputCredentials  { saved_credentials_id :: String } 

-- inputCredentialsNew InputCredentials  { allow_save :: Bool, _data :: String } 

-- inputCredentialsAndroidPay InputCredentials  { _data :: String } 

-- inputCredentialsApplePay InputCredentials  { _data :: String } 

