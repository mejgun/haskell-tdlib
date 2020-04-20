-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TdlibParameters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TdlibParameters = 
 TdlibParameters { ignore_file_names :: Bool, enable_storage_optimizer :: Bool, application_version :: String, system_version :: String, device_model :: String, system_language_code :: String, api_hash :: String, api_id :: Int, use_secret_chats :: Bool, use_message_database :: Bool, use_chat_info_database :: Bool, use_file_database :: Bool, files_directory :: String, database_directory :: String, use_test_dc :: Bool }  -- deriving (Show)

instance T.ToJSON TdlibParameters where
 toJSON (TdlibParameters { ignore_file_names = ignore_file_names, enable_storage_optimizer = enable_storage_optimizer, application_version = application_version, system_version = system_version, device_model = device_model, system_language_code = system_language_code, api_hash = api_hash, api_id = api_id, use_secret_chats = use_secret_chats, use_message_database = use_message_database, use_chat_info_database = use_chat_info_database, use_file_database = use_file_database, files_directory = files_directory, database_directory = database_directory, use_test_dc = use_test_dc }) =
  A.object [ "@type" A..= T.String "tdlibParameters", "ignore_file_names" A..= ignore_file_names, "enable_storage_optimizer" A..= enable_storage_optimizer, "application_version" A..= application_version, "system_version" A..= system_version, "device_model" A..= device_model, "system_language_code" A..= system_language_code, "api_hash" A..= api_hash, "api_id" A..= api_id, "use_secret_chats" A..= use_secret_chats, "use_message_database" A..= use_message_database, "use_chat_info_database" A..= use_chat_info_database, "use_file_database" A..= use_file_database, "files_directory" A..= files_directory, "database_directory" A..= database_directory, "use_test_dc" A..= use_test_dc ]
-- tdlibParameters TdlibParameters  { ignore_file_names :: Bool, enable_storage_optimizer :: Bool, application_version :: String, system_version :: String, device_model :: String, system_language_code :: String, api_hash :: String, api_id :: Int, use_secret_chats :: Bool, use_message_database :: Bool, use_chat_info_database :: Bool, use_file_database :: Bool, files_directory :: String, database_directory :: String, use_test_dc :: Bool } 



instance T.FromJSON TdlibParameters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "tdlibParameters" -> parseTdlibParameters v
  where
   parseTdlibParameters :: A.Value -> T.Parser TdlibParameters
   parseTdlibParameters = A.withObject "TdlibParameters" $ \o -> do
    ignore_file_names <- o A..: "ignore_file_names"
    enable_storage_optimizer <- o A..: "enable_storage_optimizer"
    application_version <- o A..: "application_version"
    system_version <- o A..: "system_version"
    device_model <- o A..: "device_model"
    system_language_code <- o A..: "system_language_code"
    api_hash <- o A..: "api_hash"
    api_id <- o A..: "api_id"
    use_secret_chats <- o A..: "use_secret_chats"
    use_message_database <- o A..: "use_message_database"
    use_chat_info_database <- o A..: "use_chat_info_database"
    use_file_database <- o A..: "use_file_database"
    files_directory <- o A..: "files_directory"
    database_directory <- o A..: "database_directory"
    use_test_dc <- o A..: "use_test_dc"
    return $ TdlibParameters { ignore_file_names = ignore_file_names, enable_storage_optimizer = enable_storage_optimizer, application_version = application_version, system_version = system_version, device_model = device_model, system_language_code = system_language_code, api_hash = api_hash, api_id = api_id, use_secret_chats = use_secret_chats, use_message_database = use_message_database, use_chat_info_database = use_chat_info_database, use_file_database = use_file_database, files_directory = files_directory, database_directory = database_directory, use_test_dc = use_test_dc }