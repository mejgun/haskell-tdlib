-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendEmailAddressVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Re-sends the code to verify an email address to be added to a user's Telegram Passport
data ResendEmailAddressVerificationCode = 

 ResendEmailAddressVerificationCode deriving (Show, Eq)

instance T.ToJSON ResendEmailAddressVerificationCode where
 toJSON (ResendEmailAddressVerificationCode {  }) =
  A.object [ "@type" A..= T.String "resendEmailAddressVerificationCode" ]

instance T.FromJSON ResendEmailAddressVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendEmailAddressVerificationCode" -> parseResendEmailAddressVerificationCode v
   _ -> mempty
  where
   parseResendEmailAddressVerificationCode :: A.Value -> T.Parser ResendEmailAddressVerificationCode
   parseResendEmailAddressVerificationCode = A.withObject "ResendEmailAddressVerificationCode" $ \o -> do
    return $ ResendEmailAddressVerificationCode {  }