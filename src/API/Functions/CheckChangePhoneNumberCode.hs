-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChangePhoneNumberCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Checks the authentication code sent to confirm a new phone number of the user 
-- 
-- __code__ Verification code received by SMS, phone call or flash call
data CheckChangePhoneNumberCode = 

 CheckChangePhoneNumberCode { code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CheckChangePhoneNumberCode where
 toJSON (CheckChangePhoneNumberCode { code = code }) =
  A.object [ "@type" A..= T.String "checkChangePhoneNumberCode", "code" A..= code ]

instance T.FromJSON CheckChangePhoneNumberCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChangePhoneNumberCode" -> parseCheckChangePhoneNumberCode v
   _ -> mempty
  where
   parseCheckChangePhoneNumberCode :: A.Value -> T.Parser CheckChangePhoneNumberCode
   parseCheckChangePhoneNumberCode = A.withObject "CheckChangePhoneNumberCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckChangePhoneNumberCode { code = code }