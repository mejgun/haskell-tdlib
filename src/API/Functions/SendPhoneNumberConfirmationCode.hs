-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- |
-- 
-- Sends phone number confirmation code to handle links of the type internalLinkTypePhoneNumberConfirmation 
-- 
-- __hash__ Hash value from the link
-- 
-- __phone_number__ Phone number value from the link
-- 
-- __settings__ Settings for the authentication of the user's phone number; pass null to use default settings
data SendPhoneNumberConfirmationCode = 

 SendPhoneNumberConfirmationCode { settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: Maybe String, hash :: Maybe String }  deriving (Eq)

instance Show SendPhoneNumberConfirmationCode where
 show SendPhoneNumberConfirmationCode { settings=settings, phone_number=phone_number, hash=hash } =
  "SendPhoneNumberConfirmationCode" ++ cc [p "settings" settings, p "phone_number" phone_number, p "hash" hash ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendPhoneNumberConfirmationCode where
 toJSON SendPhoneNumberConfirmationCode { settings = settings, phone_number = phone_number, hash = hash } =
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
 parseJSON _ = mempty
