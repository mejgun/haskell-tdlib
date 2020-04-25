-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckPhoneNumberVerificationCode = 
 CheckPhoneNumberVerificationCode { code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CheckPhoneNumberVerificationCode where
 toJSON (CheckPhoneNumberVerificationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkPhoneNumberVerificationCode", "code" A..= code ]

instance T.FromJSON CheckPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPhoneNumberVerificationCode" -> parseCheckPhoneNumberVerificationCode v
   _ -> mempty
  where
   parseCheckPhoneNumberVerificationCode :: A.Value -> T.Parser CheckPhoneNumberVerificationCode
   parseCheckPhoneNumberVerificationCode = A.withObject "CheckPhoneNumberVerificationCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckPhoneNumberVerificationCode { code = code }