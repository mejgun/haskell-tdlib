-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Session where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about one session in a Telegram application used by the current user. Sessions should be shown to the user in the returned order
-- 
-- __id__ Session identifier
-- 
-- __is_current__ True, if this session is the current session
-- 
-- __is_password_pending__ True, if a password is needed to complete authorization of the session
-- 
-- __api_id__ Telegram API identifier, as provided by the application
-- 
-- __application_name__ Name of the application, as provided by the application
-- 
-- __application_version__ The version of the application, as provided by the application
-- 
-- __is_official_application__ True, if the application is an official application or uses the api_id of an official application
-- 
-- __device_model__ Model of the device the application has been run or is running on, as provided by the application
-- 
-- __platform__ Operating system the application has been run or is running on, as provided by the application
-- 
-- __system_version__ Version of the operating system the application has been run or is running on, as provided by the application
-- 
-- __log_in_date__ Point in time (Unix timestamp) when the user has logged in
-- 
-- __last_active_date__ Point in time (Unix timestamp) when the session was last used
-- 
-- __ip__ IP address from which the session was created, in human-readable format
-- 
-- __country__ A two-letter country code for the country from which the session was created, based on the IP address
-- 
-- __region__ Region code from which the session was created, based on the IP address
data Session = 
 Session { region :: Maybe String, country :: Maybe String, ip :: Maybe String, last_active_date :: Maybe Int, log_in_date :: Maybe Int, system_version :: Maybe String, platform :: Maybe String, device_model :: Maybe String, is_official_application :: Maybe Bool, application_version :: Maybe String, application_name :: Maybe String, api_id :: Maybe Int, is_password_pending :: Maybe Bool, is_current :: Maybe Bool, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Session where
 toJSON (Session { region = region, country = country, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, system_version = system_version, platform = platform, device_model = device_model, is_official_application = is_official_application, application_version = application_version, application_name = application_name, api_id = api_id, is_password_pending = is_password_pending, is_current = is_current, _id = _id }) =
  A.object [ "@type" A..= T.String "session", "region" A..= region, "country" A..= country, "ip" A..= ip, "last_active_date" A..= last_active_date, "log_in_date" A..= log_in_date, "system_version" A..= system_version, "platform" A..= platform, "device_model" A..= device_model, "is_official_application" A..= is_official_application, "application_version" A..= application_version, "application_name" A..= application_name, "api_id" A..= api_id, "is_password_pending" A..= is_password_pending, "is_current" A..= is_current, "id" A..= _id ]

instance T.FromJSON Session where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "session" -> parseSession v
   _ -> mempty
  where
   parseSession :: A.Value -> T.Parser Session
   parseSession = A.withObject "Session" $ \o -> do
    region <- o A..:? "region"
    country <- o A..:? "country"
    ip <- o A..:? "ip"
    last_active_date <- mconcat [ o A..:? "last_active_date", readMaybe <$> (o A..: "last_active_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    log_in_date <- mconcat [ o A..:? "log_in_date", readMaybe <$> (o A..: "log_in_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    system_version <- o A..:? "system_version"
    platform <- o A..:? "platform"
    device_model <- o A..:? "device_model"
    is_official_application <- o A..:? "is_official_application"
    application_version <- o A..:? "application_version"
    application_name <- o A..:? "application_name"
    api_id <- mconcat [ o A..:? "api_id", readMaybe <$> (o A..: "api_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_password_pending <- o A..:? "is_password_pending"
    is_current <- o A..:? "is_current"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Session { region = region, country = country, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, system_version = system_version, platform = platform, device_model = device_model, is_official_application = is_official_application, application_version = application_version, application_name = application_name, api_id = api_id, is_password_pending = is_password_pending, is_current = is_current, _id = _id }