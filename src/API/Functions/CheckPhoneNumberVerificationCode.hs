-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckPhoneNumberVerificationCode = 
 CheckPhoneNumberVerificationCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckPhoneNumberVerificationCode where
 toJSON (CheckPhoneNumberVerificationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkPhoneNumberVerificationCode", "code" A..= code ]
-- checkPhoneNumberVerificationCode CheckPhoneNumberVerificationCode  { code :: String } 



instance T.FromJSON CheckPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPhoneNumberVerificationCode" -> parseCheckPhoneNumberVerificationCode v
  where
   parseCheckPhoneNumberVerificationCode :: A.Value -> T.Parser CheckPhoneNumberVerificationCode
   parseCheckPhoneNumberVerificationCode = A.withObject "CheckPhoneNumberVerificationCode" $ \o -> do
    code <- o A..: "code"
    return $ CheckPhoneNumberVerificationCode { code = code }