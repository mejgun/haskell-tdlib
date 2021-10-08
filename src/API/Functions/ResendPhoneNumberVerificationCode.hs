-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberVerificationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Re-sends the code to verify a phone number to be added to a user's Telegram Passport
data ResendPhoneNumberVerificationCode = 

 ResendPhoneNumberVerificationCode deriving (Eq)

instance Show ResendPhoneNumberVerificationCode where
 show ResendPhoneNumberVerificationCode {  } =
  "ResendPhoneNumberVerificationCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResendPhoneNumberVerificationCode where
 toJSON ResendPhoneNumberVerificationCode {  } =
  A.object [ "@type" A..= T.String "resendPhoneNumberVerificationCode" ]

instance T.FromJSON ResendPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendPhoneNumberVerificationCode" -> parseResendPhoneNumberVerificationCode v
   _ -> mempty
  where
   parseResendPhoneNumberVerificationCode :: A.Value -> T.Parser ResendPhoneNumberVerificationCode
   parseResendPhoneNumberVerificationCode = A.withObject "ResendPhoneNumberVerificationCode" $ \o -> do
    return $ ResendPhoneNumberVerificationCode {  }
 parseJSON _ = mempty
