-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendEmailAddressVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Re-sends the code to verify an email address to be added to a user's Telegram Passport
data ResendEmailAddressVerificationCode = 

 ResendEmailAddressVerificationCode deriving (Eq)

instance Show ResendEmailAddressVerificationCode where
 show ResendEmailAddressVerificationCode {  } =
  "ResendEmailAddressVerificationCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResendEmailAddressVerificationCode where
 toJSON ResendEmailAddressVerificationCode {  } =
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
 parseJSON _ = mempty
