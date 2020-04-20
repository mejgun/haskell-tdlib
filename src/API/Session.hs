-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Session where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Session = 
 Session { region :: String, country :: String, ip :: String, last_active_date :: Int, log_in_date :: Int, system_version :: String, platform :: String, device_model :: String, is_official_application :: Bool, application_version :: String, application_name :: String, api_id :: Int, is_password_pending :: Bool, is_current :: Bool, _id :: Int }  -- deriving (Show)

instance T.ToJSON Session where
 toJSON (Session { region = region, country = country, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, system_version = system_version, platform = platform, device_model = device_model, is_official_application = is_official_application, application_version = application_version, application_name = application_name, api_id = api_id, is_password_pending = is_password_pending, is_current = is_current, _id = _id }) =
  A.object [ "@type" A..= T.String "session", "region" A..= region, "country" A..= country, "ip" A..= ip, "last_active_date" A..= last_active_date, "log_in_date" A..= log_in_date, "system_version" A..= system_version, "platform" A..= platform, "device_model" A..= device_model, "is_official_application" A..= is_official_application, "application_version" A..= application_version, "application_name" A..= application_name, "api_id" A..= api_id, "is_password_pending" A..= is_password_pending, "is_current" A..= is_current, "id" A..= _id ]
-- session Session  { region :: String, country :: String, ip :: String, last_active_date :: Int, log_in_date :: Int, system_version :: String, platform :: String, device_model :: String, is_official_application :: Bool, application_version :: String, application_name :: String, api_id :: Int, is_password_pending :: Bool, is_current :: Bool, _id :: Int } 

