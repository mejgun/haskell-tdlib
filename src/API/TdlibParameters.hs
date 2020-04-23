-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TdlibParameters where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TdlibParameters = 
 TdlibParameters { ignore_file_names :: Maybe Bool, enable_storage_optimizer :: Maybe Bool, application_version :: Maybe String, system_version :: Maybe String, device_model :: Maybe String, system_language_code :: Maybe String, api_hash :: Maybe String, api_id :: Maybe Int, use_secret_chats :: Maybe Bool, use_message_database :: Maybe Bool, use_chat_info_database :: Maybe Bool, use_file_database :: Maybe Bool, files_directory :: Maybe String, database_directory :: Maybe String, use_test_dc :: Maybe Bool }  deriving (Show)

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
    ignore_file_names <- optional $ o A..: "ignore_file_names"
    enable_storage_optimizer <- optional $ o A..: "enable_storage_optimizer"
    application_version <- optional $ o A..: "application_version"
    system_version <- optional $ o A..: "system_version"
    device_model <- optional $ o A..: "device_model"
    system_language_code <- optional $ o A..: "system_language_code"
    api_hash <- optional $ o A..: "api_hash"
    api_id <- optional $ o A..: "api_id"
    use_secret_chats <- optional $ o A..: "use_secret_chats"
    use_message_database <- optional $ o A..: "use_message_database"
    use_chat_info_database <- optional $ o A..: "use_chat_info_database"
    use_file_database <- optional $ o A..: "use_file_database"
    files_directory <- optional $ o A..: "files_directory"
    database_directory <- optional $ o A..: "database_directory"
    use_test_dc <- optional $ o A..: "use_test_dc"
    return $ TdlibParameters { ignore_file_names = ignore_file_names, enable_storage_optimizer = enable_storage_optimizer, application_version = application_version, system_version = system_version, device_model = device_model, system_language_code = system_language_code, api_hash = api_hash, api_id = api_id, use_secret_chats = use_secret_chats, use_message_database = use_message_database, use_chat_info_database = use_chat_info_database, use_file_database = use_file_database, files_directory = files_directory, database_directory = database_directory, use_test_dc = use_test_dc }