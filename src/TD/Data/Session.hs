{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Session where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SessionType as SessionType
import qualified Utils as U

-- |
data Session = -- | Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order
  Session
  { -- | Region code from which the session was created, based on the IP address
    region :: Maybe String,
    -- | A two-letter country code for the country from which the session was created, based on the IP address
    country :: Maybe String,
    -- | IP address from which the session was created, in human-readable format
    ip :: Maybe String,
    -- | Point in time (Unix timestamp) when the session was last used
    last_active_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the user has logged in
    log_in_date :: Maybe Int,
    -- | Version of the operating system the application has been run or is running on, as provided by the application
    system_version :: Maybe String,
    -- | Operating system the application has been run or is running on, as provided by the application
    platform :: Maybe String,
    -- | Model of the device the application has been run or is running on, as provided by the application
    device_model :: Maybe String,
    -- | True, if the application is an official application or uses the api_id of an official application
    is_official_application :: Maybe Bool,
    -- | The version of the application, as provided by the application
    application_version :: Maybe String,
    -- | Name of the application, as provided by the application
    application_name :: Maybe String,
    -- | Telegram API identifier, as provided by the application
    api_id :: Maybe Int,
    -- | Session type based on the system and application version, which can be used to display a corresponding icon
    _type :: Maybe SessionType.SessionType,
    -- | True, if incoming calls can be accepted by the session
    can_accept_calls :: Maybe Bool,
    -- | True, if incoming secret chats can be accepted by the session
    can_accept_secret_chats :: Maybe Bool,
    -- | True, if a 2-step verification password is needed to complete authorization of the session
    is_password_pending :: Maybe Bool,
    -- | True, if this session is the current session
    is_current :: Maybe Bool,
    -- | Session identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Session where
  show
    Session
      { region = region_,
        country = country_,
        ip = ip_,
        last_active_date = last_active_date_,
        log_in_date = log_in_date_,
        system_version = system_version_,
        platform = platform_,
        device_model = device_model_,
        is_official_application = is_official_application_,
        application_version = application_version_,
        application_name = application_name_,
        api_id = api_id_,
        _type = _type_,
        can_accept_calls = can_accept_calls_,
        can_accept_secret_chats = can_accept_secret_chats_,
        is_password_pending = is_password_pending_,
        is_current = is_current_,
        _id = _id_
      } =
      "Session"
        ++ U.cc
          [ U.p "region" region_,
            U.p "country" country_,
            U.p "ip" ip_,
            U.p "last_active_date" last_active_date_,
            U.p "log_in_date" log_in_date_,
            U.p "system_version" system_version_,
            U.p "platform" platform_,
            U.p "device_model" device_model_,
            U.p "is_official_application" is_official_application_,
            U.p "application_version" application_version_,
            U.p "application_name" application_name_,
            U.p "api_id" api_id_,
            U.p "_type" _type_,
            U.p "can_accept_calls" can_accept_calls_,
            U.p "can_accept_secret_chats" can_accept_secret_chats_,
            U.p "is_password_pending" is_password_pending_,
            U.p "is_current" is_current_,
            U.p "_id" _id_
          ]

instance T.FromJSON Session where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "session" -> parseSession v
      _ -> mempty
    where
      parseSession :: A.Value -> T.Parser Session
      parseSession = A.withObject "Session" $ \o -> do
        region_ <- o A..:? "region"
        country_ <- o A..:? "country"
        ip_ <- o A..:? "ip"
        last_active_date_ <- o A..:? "last_active_date"
        log_in_date_ <- o A..:? "log_in_date"
        system_version_ <- o A..:? "system_version"
        platform_ <- o A..:? "platform"
        device_model_ <- o A..:? "device_model"
        is_official_application_ <- o A..:? "is_official_application"
        application_version_ <- o A..:? "application_version"
        application_name_ <- o A..:? "application_name"
        api_id_ <- o A..:? "api_id"
        _type_ <- o A..:? "type"
        can_accept_calls_ <- o A..:? "can_accept_calls"
        can_accept_secret_chats_ <- o A..:? "can_accept_secret_chats"
        is_password_pending_ <- o A..:? "is_password_pending"
        is_current_ <- o A..:? "is_current"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Session {region = region_, country = country_, ip = ip_, last_active_date = last_active_date_, log_in_date = log_in_date_, system_version = system_version_, platform = platform_, device_model = device_model_, is_official_application = is_official_application_, application_version = application_version_, application_name = application_name_, api_id = api_id_, _type = _type_, can_accept_calls = can_accept_calls_, can_accept_secret_chats = can_accept_secret_chats_, is_password_pending = is_password_pending_, is_current = is_current_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Session where
  toJSON
    Session
      { region = region_,
        country = country_,
        ip = ip_,
        last_active_date = last_active_date_,
        log_in_date = log_in_date_,
        system_version = system_version_,
        platform = platform_,
        device_model = device_model_,
        is_official_application = is_official_application_,
        application_version = application_version_,
        application_name = application_name_,
        api_id = api_id_,
        _type = _type_,
        can_accept_calls = can_accept_calls_,
        can_accept_secret_chats = can_accept_secret_chats_,
        is_password_pending = is_password_pending_,
        is_current = is_current_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "session",
          "region" A..= region_,
          "country" A..= country_,
          "ip" A..= ip_,
          "last_active_date" A..= last_active_date_,
          "log_in_date" A..= log_in_date_,
          "system_version" A..= system_version_,
          "platform" A..= platform_,
          "device_model" A..= device_model_,
          "is_official_application" A..= is_official_application_,
          "application_version" A..= application_version_,
          "application_name" A..= application_name_,
          "api_id" A..= api_id_,
          "type" A..= _type_,
          "can_accept_calls" A..= can_accept_calls_,
          "can_accept_secret_chats" A..= can_accept_secret_chats_,
          "is_password_pending" A..= is_password_pending_,
          "is_current" A..= is_current_,
          "id" A..= U.toS _id_
        ]
