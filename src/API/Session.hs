-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Session where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    region <- optional $ o A..: "region"
    country <- optional $ o A..: "country"
    ip <- optional $ o A..: "ip"
    last_active_date <- optional $ o A..: "last_active_date"
    log_in_date <- optional $ o A..: "log_in_date"
    system_version <- optional $ o A..: "system_version"
    platform <- optional $ o A..: "platform"
    device_model <- optional $ o A..: "device_model"
    is_official_application <- optional $ o A..: "is_official_application"
    application_version <- optional $ o A..: "application_version"
    application_name <- optional $ o A..: "application_name"
    api_id <- optional $ o A..: "api_id"
    is_password_pending <- optional $ o A..: "is_password_pending"
    is_current <- optional $ o A..: "is_current"
    _id <- optional $ o A..: "id"
    return $ Session { region = region, country = country, ip = ip, last_active_date = last_active_date, log_in_date = log_in_date, system_version = system_version, platform = platform, device_model = device_model, is_official_application = is_official_application, application_version = application_version, application_name = application_name, api_id = api_id, is_password_pending = is_password_pending, is_current = is_current, _id = _id }