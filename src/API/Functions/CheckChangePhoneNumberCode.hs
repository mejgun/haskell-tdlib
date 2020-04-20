-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChangePhoneNumberCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckChangePhoneNumberCode = 
 CheckChangePhoneNumberCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckChangePhoneNumberCode where
 toJSON (CheckChangePhoneNumberCode { code = code }) =
  A.object [ "@type" A..= T.String "checkChangePhoneNumberCode", "code" A..= code ]
-- checkChangePhoneNumberCode CheckChangePhoneNumberCode  { code :: String } 

