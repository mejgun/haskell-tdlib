-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputCredentials where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data InputCredentials = 
 InputCredentialsSaved { saved_credentials_id :: Maybe String }  
 | InputCredentialsNew { allow_save :: Maybe Bool, _data :: Maybe String }  
 | InputCredentialsAndroidPay { _data :: Maybe String }  
 | InputCredentialsApplePay { _data :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InputCredentials where
 toJSON (InputCredentialsSaved { saved_credentials_id = saved_credentials_id }) =
  A.object [ "@type" A..= T.String "inputCredentialsSaved", "saved_credentials_id" A..= saved_credentials_id ]

 toJSON (InputCredentialsNew { allow_save = allow_save, _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsNew", "allow_save" A..= allow_save, "data" A..= _data ]

 toJSON (InputCredentialsAndroidPay { _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsAndroidPay", "data" A..= _data ]

 toJSON (InputCredentialsApplePay { _data = _data }) =
  A.object [ "@type" A..= T.String "inputCredentialsApplePay", "data" A..= _data ]

instance T.FromJSON InputCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputCredentialsSaved" -> parseInputCredentialsSaved v
   "inputCredentialsNew" -> parseInputCredentialsNew v
   "inputCredentialsAndroidPay" -> parseInputCredentialsAndroidPay v
   "inputCredentialsApplePay" -> parseInputCredentialsApplePay v
   _ -> mempty
  where
   parseInputCredentialsSaved :: A.Value -> T.Parser InputCredentials
   parseInputCredentialsSaved = A.withObject "InputCredentialsSaved" $ \o -> do
    saved_credentials_id <- optional $ o A..: "saved_credentials_id"
    return $ InputCredentialsSaved { saved_credentials_id = saved_credentials_id }

   parseInputCredentialsNew :: A.Value -> T.Parser InputCredentials
   parseInputCredentialsNew = A.withObject "InputCredentialsNew" $ \o -> do
    allow_save <- optional $ o A..: "allow_save"
    _data <- optional $ o A..: "data"
    return $ InputCredentialsNew { allow_save = allow_save, _data = _data }

   parseInputCredentialsAndroidPay :: A.Value -> T.Parser InputCredentials
   parseInputCredentialsAndroidPay = A.withObject "InputCredentialsAndroidPay" $ \o -> do
    _data <- optional $ o A..: "data"
    return $ InputCredentialsAndroidPay { _data = _data }

   parseInputCredentialsApplePay :: A.Value -> T.Parser InputCredentials
   parseInputCredentialsApplePay = A.withObject "InputCredentialsApplePay" $ \o -> do
    _data <- optional $ o A..: "data"
    return $ InputCredentialsApplePay { _data = _data }