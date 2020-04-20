-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendPhoneNumberVerificationCode = 
 ResendPhoneNumberVerificationCode -- deriving (Show)

instance T.ToJSON ResendPhoneNumberVerificationCode where
 toJSON (ResendPhoneNumberVerificationCode {  }) =
  A.object [ "@type" A..= T.String "resendPhoneNumberVerificationCode" ]
-- resendPhoneNumberVerificationCode ResendPhoneNumberVerificationCode 

