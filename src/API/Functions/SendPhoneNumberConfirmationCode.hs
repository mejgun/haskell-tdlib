-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

data SendPhoneNumberConfirmationCode = 
 SendPhoneNumberConfirmationCode { settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: Maybe String, hash :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SendPhoneNumberConfirmationCode where
 toJSON (SendPhoneNumberConfirmationCode { settings = settings, phone_number = phone_number, hash = hash }) =
  A.object [ "@type" A..= T.String "sendPhoneNumberConfirmationCode", "settings" A..= settings, "phone_number" A..= phone_number, "hash" A..= hash ]

instance T.FromJSON SendPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPhoneNumberConfirmationCode" -> parseSendPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseSendPhoneNumberConfirmationCode :: A.Value -> T.Parser SendPhoneNumberConfirmationCode
   parseSendPhoneNumberConfirmationCode = A.withObject "SendPhoneNumberConfirmationCode" $ \o -> do
    settings <- o A..:? "settings"
    phone_number <- o A..:? "phone_number"
    hash <- o A..:? "hash"
    return $ SendPhoneNumberConfirmationCode { settings = settings, phone_number = phone_number, hash = hash }