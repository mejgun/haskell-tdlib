{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetTdlibParameters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters
data SetTdlibParameters = SetTdlibParameters
  { -- | Pass true to ignore original file names for downloaded files. Otherwise, downloaded files are saved under names as close as possible to the original name
    ignore_file_names :: Maybe Bool,
    -- | Pass true to automatically delete old files in background
    enable_storage_optimizer :: Maybe Bool,
    -- | Application version; must be non-empty
    application_version :: Maybe String,
    -- | Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib
    system_version :: Maybe String,
    -- | Model of the device the application is being run on; must be non-empty
    device_model :: Maybe String,
    -- | IETF language tag of the user's operating system language; must be non-empty
    system_language_code :: Maybe String,
    -- | Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
    api_hash :: Maybe String,
    -- | Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
    api_id :: Maybe Int,
    -- | Pass true to enable support for secret chats
    use_secret_chats :: Maybe Bool,
    -- | Pass true to keep cache of chats and messages between restarts. Implies use_chat_info_database
    use_message_database :: Maybe Bool,
    -- | Pass true to keep cache of users, basic groups, supergroups, channels and secret chats between restarts. Implies use_file_database
    use_chat_info_database :: Maybe Bool,
    -- | Pass true to keep information about downloaded and uploaded files between application restarts
    use_file_database :: Maybe Bool,
    -- | Encryption key for the database
    database_encryption_key :: Maybe String,
    -- | The path to the directory for storing files; if empty, database_directory will be used
    files_directory :: Maybe String,
    -- | The path to the directory for the persistent database; if empty, the current working directory will be used
    database_directory :: Maybe String,
    -- | Pass true to use Telegram test environment instead of the production environment
    use_test_dc :: Maybe Bool
  }
  deriving (Eq)

instance Show SetTdlibParameters where
  show
    SetTdlibParameters
      { ignore_file_names = ignore_file_names_,
        enable_storage_optimizer = enable_storage_optimizer_,
        application_version = application_version_,
        system_version = system_version_,
        device_model = device_model_,
        system_language_code = system_language_code_,
        api_hash = api_hash_,
        api_id = api_id_,
        use_secret_chats = use_secret_chats_,
        use_message_database = use_message_database_,
        use_chat_info_database = use_chat_info_database_,
        use_file_database = use_file_database_,
        database_encryption_key = database_encryption_key_,
        files_directory = files_directory_,
        database_directory = database_directory_,
        use_test_dc = use_test_dc_
      } =
      "SetTdlibParameters"
        ++ U.cc
          [ U.p "ignore_file_names" ignore_file_names_,
            U.p "enable_storage_optimizer" enable_storage_optimizer_,
            U.p "application_version" application_version_,
            U.p "system_version" system_version_,
            U.p "device_model" device_model_,
            U.p "system_language_code" system_language_code_,
            U.p "api_hash" api_hash_,
            U.p "api_id" api_id_,
            U.p "use_secret_chats" use_secret_chats_,
            U.p "use_message_database" use_message_database_,
            U.p "use_chat_info_database" use_chat_info_database_,
            U.p "use_file_database" use_file_database_,
            U.p "database_encryption_key" database_encryption_key_,
            U.p "files_directory" files_directory_,
            U.p "database_directory" database_directory_,
            U.p "use_test_dc" use_test_dc_
          ]

instance T.ToJSON SetTdlibParameters where
  toJSON
    SetTdlibParameters
      { ignore_file_names = ignore_file_names_,
        enable_storage_optimizer = enable_storage_optimizer_,
        application_version = application_version_,
        system_version = system_version_,
        device_model = device_model_,
        system_language_code = system_language_code_,
        api_hash = api_hash_,
        api_id = api_id_,
        use_secret_chats = use_secret_chats_,
        use_message_database = use_message_database_,
        use_chat_info_database = use_chat_info_database_,
        use_file_database = use_file_database_,
        database_encryption_key = database_encryption_key_,
        files_directory = files_directory_,
        database_directory = database_directory_,
        use_test_dc = use_test_dc_
      } =
      A.object
        [ "@type" A..= T.String "setTdlibParameters",
          "ignore_file_names" A..= ignore_file_names_,
          "enable_storage_optimizer" A..= enable_storage_optimizer_,
          "application_version" A..= application_version_,
          "system_version" A..= system_version_,
          "device_model" A..= device_model_,
          "system_language_code" A..= system_language_code_,
          "api_hash" A..= api_hash_,
          "api_id" A..= api_id_,
          "use_secret_chats" A..= use_secret_chats_,
          "use_message_database" A..= use_message_database_,
          "use_chat_info_database" A..= use_chat_info_database_,
          "use_file_database" A..= use_file_database_,
          "database_encryption_key" A..= database_encryption_key_,
          "files_directory" A..= files_directory_,
          "database_directory" A..= database_directory_,
          "use_test_dc" A..= use_test_dc_
        ]
