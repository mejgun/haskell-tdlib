-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TdlibParameters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains parameters for TDLib initialization
-- 
-- __use_test_dc__ If set to true, the Telegram test environment will be used instead of the production environment
-- 
-- __database_directory__ The path to the directory for the persistent database; if empty, the current working directory will be used
-- 
-- __files_directory__ The path to the directory for storing files; if empty, database_directory will be used
-- 
-- __use_file_database__ If set to true, information about downloaded and uploaded files will be saved between application restarts
-- 
-- __use_chat_info_database__ If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
-- 
-- __use_message_database__ If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
-- 
-- __use_secret_chats__ If set to true, support for secret chats will be enabled
-- 
-- __api_id__ Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
-- 
-- __api_hash__ Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
-- 
-- __system_language_code__ IETF language tag of the user's operating system language; must be non-empty
-- 
-- __device_model__ Model of the device the application is being run on; must be non-empty
-- 
-- __system_version__ Version of the operating system the application is being run on; must be non-empty
-- 
-- __application_version__ Application version; must be non-empty
-- 
-- __enable_storage_optimizer__ If set to true, old files will automatically be deleted
-- 
-- __ignore_file_names__ If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
data TdlibParameters = 
 TdlibParameters { ignore_file_names :: Maybe Bool, enable_storage_optimizer :: Maybe Bool, application_version :: Maybe String, system_version :: Maybe String, device_model :: Maybe String, system_language_code :: Maybe String, api_hash :: Maybe String, api_id :: Maybe Int, use_secret_chats :: Maybe Bool, use_message_database :: Maybe Bool, use_chat_info_database :: Maybe Bool, use_file_database :: Maybe Bool, files_directory :: Maybe String, database_directory :: Maybe String, use_test_dc :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON TdlibParameters where
 toJSON (TdlibParameters { ignore_file_names = ignore_file_names, enable_storage_optimizer = enable_storage_optimizer, application_version = application_version, system_version = system_version, device_model = device_model, system_language_code = system_language_code, api_hash = api_hash, api_id = api_id, use_secret_chats = use_secret_chats, use_message_database = use_message_database, use_chat_info_database = use_chat_info_database, use_file_database = use_file_database, files_directory = files_directory, database_directory = database_directory, use_test_dc = use_test_dc }) =
  A.object [ "@type" A..= T.String "tdlibParameters", "ignore_file_names" A..= ignore_file_names, "enable_storage_optimizer" A..= enable_storage_optimizer, "application_version" A..= application_version, "system_version" A..= system_version, "device_model" A..= device_model, "system_language_code" A..= system_language_code, "api_hash" A..= api_hash, "api_id" A..= api_id, "use_secret_chats" A..= use_secret_chats, "use_message_database" A..= use_message_database, "use_chat_info_database" A..= use_chat_info_database, "use_file_database" A..= use_file_database, "files_directory" A..= files_directory, "database_directory" A..= database_directory, "use_test_dc" A..= use_test_dc ]

instance T.FromJSON TdlibParameters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "tdlibParameters" -> parseTdlibParameters v
   _ -> mempty
  where
   parseTdlibParameters :: A.Value -> T.Parser TdlibParameters
   parseTdlibParameters = A.withObject "TdlibParameters" $ \o -> do
    ignore_file_names <- o A..:? "ignore_file_names"
    enable_storage_optimizer <- o A..:? "enable_storage_optimizer"
    application_version <- o A..:? "application_version"
    system_version <- o A..:? "system_version"
    device_model <- o A..:? "device_model"
    system_language_code <- o A..:? "system_language_code"
    api_hash <- o A..:? "api_hash"
    api_id <- mconcat [ o A..:? "api_id", readMaybe <$> (o A..: "api_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    use_secret_chats <- o A..:? "use_secret_chats"
    use_message_database <- o A..:? "use_message_database"
    use_chat_info_database <- o A..:? "use_chat_info_database"
    use_file_database <- o A..:? "use_file_database"
    files_directory <- o A..:? "files_directory"
    database_directory <- o A..:? "database_directory"
    use_test_dc <- o A..:? "use_test_dc"
    return $ TdlibParameters { ignore_file_names = ignore_file_names, enable_storage_optimizer = enable_storage_optimizer, application_version = application_version, system_version = system_version, device_model = device_model, system_language_code = system_language_code, api_hash = api_hash, api_id = api_id, use_secret_chats = use_secret_chats, use_message_database = use_message_database, use_chat_info_database = use_chat_info_database, use_file_database = use_file_database, files_directory = files_directory, database_directory = database_directory, use_test_dc = use_test_dc }