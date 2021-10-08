-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendEmailAddressVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Sends a code to verify an email address to be added to a user's Telegram Passport 
-- 
-- __email_address__ Email address
data SendEmailAddressVerificationCode = 

 SendEmailAddressVerificationCode { email_address :: Maybe String }  deriving (Eq)

instance Show SendEmailAddressVerificationCode where
 show SendEmailAddressVerificationCode { email_address=email_address } =
  "SendEmailAddressVerificationCode" ++ cc [p "email_address" email_address ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendEmailAddressVerificationCode where
 toJSON SendEmailAddressVerificationCode { email_address = email_address } =
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
 parseJSON _ = mempty
