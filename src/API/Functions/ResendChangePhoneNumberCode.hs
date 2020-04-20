-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendChangePhoneNumberCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendChangePhoneNumberCode = 
 ResendChangePhoneNumberCode -- deriving (Show)

instance T.ToJSON ResendChangePhoneNumberCode where
 toJSON (ResendChangePhoneNumberCode {  }) =
  A.object [ "@type" A..= T.String "resendChangePhoneNumberCode" ]
-- resendChangePhoneNumberCode ResendChangePhoneNumberCode 

