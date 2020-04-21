-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckPhoneNumberConfirmationCode = 
 CheckPhoneNumberConfirmationCode { code :: String }  deriving (Show)

instance T.ToJSON CheckPhoneNumberConfirmationCode where
 toJSON (CheckPhoneNumberConfirmationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkPhoneNumberConfirmationCode", "code" A..= code ]

instance T.FromJSON CheckPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPhoneNumberConfirmationCode" -> parseCheckPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseCheckPhoneNumberConfirmationCode :: A.Value -> T.Parser CheckPhoneNumberConfirmationCode
   parseCheckPhoneNumberConfirmationCode = A.withObject "CheckPhoneNumberConfirmationCode" $ \o -> do
    code <- o A..: "code"
    return $ CheckPhoneNumberConfirmationCode { code = code }