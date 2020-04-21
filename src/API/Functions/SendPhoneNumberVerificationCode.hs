-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

--main = putStrLn "ok"

data SendPhoneNumberVerificationCode = 
 SendPhoneNumberVerificationCode { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String }  deriving (Show)

instance T.ToJSON SendPhoneNumberVerificationCode where
 toJSON (SendPhoneNumberVerificationCode { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "sendPhoneNumberVerificationCode", "settings" A..= settings, "phone_number" A..= phone_number ]



instance T.FromJSON SendPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPhoneNumberVerificationCode" -> parseSendPhoneNumberVerificationCode v

   _ -> mempty ""
  where
   parseSendPhoneNumberVerificationCode :: A.Value -> T.Parser SendPhoneNumberVerificationCode
   parseSendPhoneNumberVerificationCode = A.withObject "SendPhoneNumberVerificationCode" $ \o -> do
    settings <- o A..: "settings"
    phone_number <- o A..: "phone_number"
    return $ SendPhoneNumberVerificationCode { settings = settings, phone_number = phone_number }