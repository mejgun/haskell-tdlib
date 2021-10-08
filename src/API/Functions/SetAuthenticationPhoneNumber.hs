-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAuthenticationPhoneNumber where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PhoneNumberAuthenticationSettings as PhoneNumberAuthenticationSettings

-- |
-- 
-- Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
-- 
-- -or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
-- 
-- __phone_number__ The phone number of the user, in international format
-- 
-- __settings__ Settings for the authentication of the user's phone number; pass null to use default settings
data SetAuthenticationPhoneNumber = 

 SetAuthenticationPhoneNumber { settings :: Maybe PhoneNumberAuthenticationSettings.PhoneNumberAuthenticationSettings, phone_number :: Maybe String }  deriving (Eq)

instance Show SetAuthenticationPhoneNumber where
 show SetAuthenticationPhoneNumber { settings=settings, phone_number=phone_number } =
  "SetAuthenticationPhoneNumber" ++ cc [p "settings" settings, p "phone_number" phone_number ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetAuthenticationPhoneNumber where
 toJSON SetAuthenticationPhoneNumber { settings = settings, phone_number = phone_number } =
  A.object [ "@type" A..= T.String "setAuthenticationPhoneNumber", "settings" A..= settings, "phone_number" A..= phone_number ]

instance T.FromJSON SetAuthenticationPhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAuthenticationPhoneNumber" -> parseSetAuthenticationPhoneNumber v
   _ -> mempty
  where
   parseSetAuthenticationPhoneNumber :: A.Value -> T.Parser SetAuthenticationPhoneNumber
   parseSetAuthenticationPhoneNumber = A.withObject "SetAuthenticationPhoneNumber" $ \o -> do
    settings <- o A..:? "settings"
    phone_number <- o A..:? "phone_number"
    return $ SetAuthenticationPhoneNumber { settings = settings, phone_number = phone_number }
 parseJSON _ = mempty
