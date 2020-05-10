-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangePhoneNumber where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- |
-- 
-- Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code
-- 
-- __phone_number__ The new phone number of the user in international format
-- 
-- __settings__ Settings for the authentication of the user's phone number
data ChangePhoneNumber = 

 ChangePhoneNumber { settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ChangePhoneNumber where
 toJSON (ChangePhoneNumber { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "changePhoneNumber", "settings" A..= settings, "phone_number" A..= phone_number ]

instance T.FromJSON ChangePhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changePhoneNumber" -> parseChangePhoneNumber v
   _ -> mempty
  where
   parseChangePhoneNumber :: A.Value -> T.Parser ChangePhoneNumber
   parseChangePhoneNumber = A.withObject "ChangePhoneNumber" $ \o -> do
    settings <- o A..:? "settings"
    phone_number <- o A..:? "phone_number"
    return $ ChangePhoneNumber { settings = settings, phone_number = phone_number }