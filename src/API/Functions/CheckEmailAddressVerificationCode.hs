-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckEmailAddressVerificationCode = 
 CheckEmailAddressVerificationCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckEmailAddressVerificationCode where
 toJSON (CheckEmailAddressVerificationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkEmailAddressVerificationCode", "code" A..= code ]
-- checkEmailAddressVerificationCode CheckEmailAddressVerificationCode  { code :: String } 

