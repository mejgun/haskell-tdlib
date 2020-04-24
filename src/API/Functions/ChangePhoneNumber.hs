-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangePhoneNumber where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

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
    settings <- optional $ o A..: "settings"
    phone_number <- optional $ o A..: "phone_number"
    return $ ChangePhoneNumber { settings = settings, phone_number = phone_number }