-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendEmailAddressVerificationCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    email_address <- optional $ o A..: "email_address"
    return $ SendEmailAddressVerificationCode { email_address = email_address }