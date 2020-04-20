-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhoneNumberAuthenticationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PhoneNumberAuthenticationSettings = 
 PhoneNumberAuthenticationSettings { allow_sms_retriever_api :: Bool, is_current_phone_number :: Bool, allow_flash_call :: Bool }  -- deriving (Show)

instance T.ToJSON PhoneNumberAuthenticationSettings where
 toJSON (PhoneNumberAuthenticationSettings { allow_sms_retriever_api = allow_sms_retriever_api, is_current_phone_number = is_current_phone_number, allow_flash_call = allow_flash_call }) =
  A.object [ "@type" A..= T.String "phoneNumberAuthenticationSettings", "allow_sms_retriever_api" A..= allow_sms_retriever_api, "is_current_phone_number" A..= is_current_phone_number, "allow_flash_call" A..= allow_flash_call ]
-- phoneNumberAuthenticationSettings PhoneNumberAuthenticationSettings  { allow_sms_retriever_api :: Bool, is_current_phone_number :: Bool, allow_flash_call :: Bool } 

