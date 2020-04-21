-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangePhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

--main = putStrLn "ok"

data ChangePhoneNumber = 
 ChangePhoneNumber { settings :: PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: String }  deriving (Show)

instance T.ToJSON ChangePhoneNumber where
 toJSON (ChangePhoneNumber { settings = settings, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "changePhoneNumber", "settings" A..= settings, "phone_number" A..= phone_number ]



instance T.FromJSON ChangePhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changePhoneNumber" -> parseChangePhoneNumber v

   _ -> mempty ""
  where
   parseChangePhoneNumber :: A.Value -> T.Parser ChangePhoneNumber
   parseChangePhoneNumber = A.withObject "ChangePhoneNumber" $ \o -> do
    settings <- o A..: "settings"
    phone_number <- o A..: "phone_number"
    return $ ChangePhoneNumber { settings = settings, phone_number = phone_number }