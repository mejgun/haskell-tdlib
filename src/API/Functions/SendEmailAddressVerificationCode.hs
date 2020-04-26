-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendEmailAddressVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Sends a code to verify an email address to be added to a user's Telegram Passport 
-- 
-- __email_address__ Email address
data SendEmailAddressVerificationCode = 
 SendEmailAddressVerificationCode { email_address :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SendEmailAddressVerificationCode where
 toJSON (SendEmailAddressVerificationCode { email_address = email_address }) =
  A.object [ "@type" A..= T.String "sendEmailAddressVerificationCode", "email_address" A..= email_address ]

instance T.FromJSON SendEmailAddressVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendEmailAddressVerificationCode" -> parseSendEmailAddressVerificationCode v
   _ -> mempty
  where
   parseSendEmailAddressVerificationCode :: A.Value -> T.Parser SendEmailAddressVerificationCode
   parseSendEmailAddressVerificationCode = A.withObject "SendEmailAddressVerificationCode" $ \o -> do
    email_address <- o A..:? "email_address"
    return $ SendEmailAddressVerificationCode { email_address = email_address }