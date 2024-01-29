module TD.Query.SetTdlibParameters
  (SetTdlibParameters(..)
  , defaultSetTdlibParameters
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters. Returns 'TD.Data.Ok.Ok'
data SetTdlibParameters
  = SetTdlibParameters
    { use_test_dc             :: Maybe Bool          -- ^ Pass true to use Telegram test environment instead of the production environment
    , database_directory      :: Maybe T.Text        -- ^ The path to the directory for the persistent database; if empty, the current working directory will be used
    , files_directory         :: Maybe T.Text        -- ^ The path to the directory for storing files; if empty, database_directory will be used
    , database_encryption_key :: Maybe BS.ByteString -- ^ Encryption key for the database. If the encryption key is invalid, then an error with code 401 will be returned
    , use_file_database       :: Maybe Bool          -- ^ Pass true to keep information about downloaded and uploaded files between application restarts
    , use_chat_info_database  :: Maybe Bool          -- ^ Pass true to keep cache of users, basic groups, supergroups, channels and secret chats between restarts. Implies use_file_database
    , use_message_database    :: Maybe Bool          -- ^ Pass true to keep cache of chats and messages between restarts. Implies use_chat_info_database
    , use_secret_chats        :: Maybe Bool          -- ^ Pass true to enable support for secret chats
    , api_id                  :: Maybe Int           -- ^ Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
    , api_hash                :: Maybe T.Text        -- ^ Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
    , system_language_code    :: Maybe T.Text        -- ^ IETF language tag of the user's operating system language; must be non-empty
    , device_model            :: Maybe T.Text        -- ^ Model of the device the application is being run on; must be non-empty
    , system_version          :: Maybe T.Text        -- ^ Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib
    , application_version     :: Maybe T.Text        -- ^ Application version; must be non-empty
    }
  deriving (Eq, Show)

instance I.ShortShow SetTdlibParameters where
  shortShow
    SetTdlibParameters
      { use_test_dc             = use_test_dc_
      , database_directory      = database_directory_
      , files_directory         = files_directory_
      , database_encryption_key = database_encryption_key_
      , use_file_database       = use_file_database_
      , use_chat_info_database  = use_chat_info_database_
      , use_message_database    = use_message_database_
      , use_secret_chats        = use_secret_chats_
      , api_id                  = api_id_
      , api_hash                = api_hash_
      , system_language_code    = system_language_code_
      , device_model            = device_model_
      , system_version          = system_version_
      , application_version     = application_version_
      }
        = "SetTdlibParameters"
          ++ I.cc
          [ "use_test_dc"             `I.p` use_test_dc_
          , "database_directory"      `I.p` database_directory_
          , "files_directory"         `I.p` files_directory_
          , "database_encryption_key" `I.p` database_encryption_key_
          , "use_file_database"       `I.p` use_file_database_
          , "use_chat_info_database"  `I.p` use_chat_info_database_
          , "use_message_database"    `I.p` use_message_database_
          , "use_secret_chats"        `I.p` use_secret_chats_
          , "api_id"                  `I.p` api_id_
          , "api_hash"                `I.p` api_hash_
          , "system_language_code"    `I.p` system_language_code_
          , "device_model"            `I.p` device_model_
          , "system_version"          `I.p` system_version_
          , "application_version"     `I.p` application_version_
          ]

instance AT.ToJSON SetTdlibParameters where
  toJSON
    SetTdlibParameters
      { use_test_dc             = use_test_dc_
      , database_directory      = database_directory_
      , files_directory         = files_directory_
      , database_encryption_key = database_encryption_key_
      , use_file_database       = use_file_database_
      , use_chat_info_database  = use_chat_info_database_
      , use_message_database    = use_message_database_
      , use_secret_chats        = use_secret_chats_
      , api_id                  = api_id_
      , api_hash                = api_hash_
      , system_language_code    = system_language_code_
      , device_model            = device_model_
      , system_version          = system_version_
      , application_version     = application_version_
      }
        = A.object
          [ "@type"                   A..= AT.String "setTdlibParameters"
          , "use_test_dc"             A..= use_test_dc_
          , "database_directory"      A..= database_directory_
          , "files_directory"         A..= files_directory_
          , "database_encryption_key" A..= fmap I.writeBytes  database_encryption_key_
          , "use_file_database"       A..= use_file_database_
          , "use_chat_info_database"  A..= use_chat_info_database_
          , "use_message_database"    A..= use_message_database_
          , "use_secret_chats"        A..= use_secret_chats_
          , "api_id"                  A..= api_id_
          , "api_hash"                A..= api_hash_
          , "system_language_code"    A..= system_language_code_
          , "device_model"            A..= device_model_
          , "system_version"          A..= system_version_
          , "application_version"     A..= application_version_
          ]

defaultSetTdlibParameters :: SetTdlibParameters
defaultSetTdlibParameters =
  SetTdlibParameters
    { use_test_dc             = Nothing
    , database_directory      = Nothing
    , files_directory         = Nothing
    , database_encryption_key = Nothing
    , use_file_database       = Nothing
    , use_chat_info_database  = Nothing
    , use_message_database    = Nothing
    , use_secret_chats        = Nothing
    , api_id                  = Nothing
    , api_hash                = Nothing
    , system_language_code    = Nothing
    , device_model            = Nothing
    , system_version          = Nothing
    , application_version     = Nothing
    }

