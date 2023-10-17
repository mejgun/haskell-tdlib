module TD.Data.Session
  (Session(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SessionType as SessionType
import qualified Data.Text as T

data Session
  = Session -- ^ Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order
    { _id                     :: Maybe Int                     -- ^ Session identifier
    , is_current              :: Maybe Bool                    -- ^ True, if this session is the current session
    , is_password_pending     :: Maybe Bool                    -- ^ True, if a 2-step verification password is needed to complete authorization of the session
    , is_unconfirmed          :: Maybe Bool                    -- ^ True, if the session wasn't confirmed from another session
    , can_accept_secret_chats :: Maybe Bool                    -- ^ True, if incoming secret chats can be accepted by the session
    , can_accept_calls        :: Maybe Bool                    -- ^ True, if incoming calls can be accepted by the session
    , _type                   :: Maybe SessionType.SessionType -- ^ Session type based on the system and application version, which can be used to display a corresponding icon
    , api_id                  :: Maybe Int                     -- ^ Telegram API identifier, as provided by the application
    , application_name        :: Maybe T.Text                  -- ^ Name of the application, as provided by the application
    , application_version     :: Maybe T.Text                  -- ^ The version of the application, as provided by the application
    , is_official_application :: Maybe Bool                    -- ^ True, if the application is an official application or uses the api_id of an official application
    , device_model            :: Maybe T.Text                  -- ^ Model of the device the application has been run or is running on, as provided by the application
    , platform                :: Maybe T.Text                  -- ^ Operating system the application has been run or is running on, as provided by the application
    , system_version          :: Maybe T.Text                  -- ^ Version of the operating system the application has been run or is running on, as provided by the application
    , log_in_date             :: Maybe Int                     -- ^ Point in time (Unix timestamp) when the user has logged in
    , last_active_date        :: Maybe Int                     -- ^ Point in time (Unix timestamp) when the session was last used
    , ip_address              :: Maybe T.Text                  -- ^ IP address from which the session was created, in human-readable format
    , location                :: Maybe T.Text                  -- ^ A human-readable description of the location from which the session was created, based on the IP address
    }
  deriving (Eq, Show)

instance I.ShortShow Session where
  shortShow Session
    { _id                     = _id_
    , is_current              = is_current_
    , is_password_pending     = is_password_pending_
    , is_unconfirmed          = is_unconfirmed_
    , can_accept_secret_chats = can_accept_secret_chats_
    , can_accept_calls        = can_accept_calls_
    , _type                   = _type_
    , api_id                  = api_id_
    , application_name        = application_name_
    , application_version     = application_version_
    , is_official_application = is_official_application_
    , device_model            = device_model_
    , platform                = platform_
    , system_version          = system_version_
    , log_in_date             = log_in_date_
    , last_active_date        = last_active_date_
    , ip_address              = ip_address_
    , location                = location_
    }
      = "Session"
        ++ I.cc
        [ "_id"                     `I.p` _id_
        , "is_current"              `I.p` is_current_
        , "is_password_pending"     `I.p` is_password_pending_
        , "is_unconfirmed"          `I.p` is_unconfirmed_
        , "can_accept_secret_chats" `I.p` can_accept_secret_chats_
        , "can_accept_calls"        `I.p` can_accept_calls_
        , "_type"                   `I.p` _type_
        , "api_id"                  `I.p` api_id_
        , "application_name"        `I.p` application_name_
        , "application_version"     `I.p` application_version_
        , "is_official_application" `I.p` is_official_application_
        , "device_model"            `I.p` device_model_
        , "platform"                `I.p` platform_
        , "system_version"          `I.p` system_version_
        , "log_in_date"             `I.p` log_in_date_
        , "last_active_date"        `I.p` last_active_date_
        , "ip_address"              `I.p` ip_address_
        , "location"                `I.p` location_
        ]

instance AT.FromJSON Session where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "session" -> parseSession v
      _         -> mempty
    
    where
      parseSession :: A.Value -> AT.Parser Session
      parseSession = A.withObject "Session" $ \o -> do
        _id_                     <- fmap I.readInt64 <$> o A..:?  "id"
        is_current_              <- o A..:?                       "is_current"
        is_password_pending_     <- o A..:?                       "is_password_pending"
        is_unconfirmed_          <- o A..:?                       "is_unconfirmed"
        can_accept_secret_chats_ <- o A..:?                       "can_accept_secret_chats"
        can_accept_calls_        <- o A..:?                       "can_accept_calls"
        _type_                   <- o A..:?                       "type"
        api_id_                  <- o A..:?                       "api_id"
        application_name_        <- o A..:?                       "application_name"
        application_version_     <- o A..:?                       "application_version"
        is_official_application_ <- o A..:?                       "is_official_application"
        device_model_            <- o A..:?                       "device_model"
        platform_                <- o A..:?                       "platform"
        system_version_          <- o A..:?                       "system_version"
        log_in_date_             <- o A..:?                       "log_in_date"
        last_active_date_        <- o A..:?                       "last_active_date"
        ip_address_              <- o A..:?                       "ip_address"
        location_                <- o A..:?                       "location"
        pure $ Session
          { _id                     = _id_
          , is_current              = is_current_
          , is_password_pending     = is_password_pending_
          , is_unconfirmed          = is_unconfirmed_
          , can_accept_secret_chats = can_accept_secret_chats_
          , can_accept_calls        = can_accept_calls_
          , _type                   = _type_
          , api_id                  = api_id_
          , application_name        = application_name_
          , application_version     = application_version_
          , is_official_application = is_official_application_
          , device_model            = device_model_
          , platform                = platform_
          , system_version          = system_version_
          , log_in_date             = log_in_date_
          , last_active_date        = last_active_date_
          , ip_address              = ip_address_
          , location                = location_
          }
  parseJSON _ = mempty

