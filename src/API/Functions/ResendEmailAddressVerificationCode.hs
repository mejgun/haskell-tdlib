-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendEmailAddressVerificationCode = 
 ResendEmailAddressVerificationCode -- deriving (Show)

instance T.ToJSON ResendEmailAddressVerificationCode where
 toJSON (ResendEmailAddressVerificationCode {  }) =
  A.object [ "@type" A..= T.String "resendEmailAddressVerificationCode" ]
-- resendEmailAddressVerificationCode ResendEmailAddressVerificationCode 

