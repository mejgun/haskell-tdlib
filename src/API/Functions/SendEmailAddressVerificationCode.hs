-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendEmailAddressVerificationCode = 
 SendEmailAddressVerificationCode { email_address :: String }  -- deriving (Show)

instance T.ToJSON SendEmailAddressVerificationCode where
 toJSON (SendEmailAddressVerificationCode { email_address = email_address }) =
  A.object [ "@type" A..= T.String "sendEmailAddressVerificationCode", "email_address" A..= email_address ]
-- sendEmailAddressVerificationCode SendEmailAddressVerificationCode  { email_address :: String } 



instance T.FromJSON SendEmailAddressVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendEmailAddressVerificationCode" -> parseSendEmailAddressVerificationCode v
  where
   parseSendEmailAddressVerificationCode :: A.Value -> T.Parser SendEmailAddressVerificationCode
   parseSendEmailAddressVerificationCode = A.withObject "SendEmailAddressVerificationCode" $ \o -> do
    email_address <- o A..: "email_address"
    return $ SendEmailAddressVerificationCode { email_address = email_address }