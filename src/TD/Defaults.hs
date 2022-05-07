module TD.Defaults where

-- import qualified TD.Query.SendMessage     as SendMessage
-- import qualified TD.Reply.FormattedText as FormattedText
-- import qualified TD.Reply.InputMessageContent as InputMessageContent
import qualified TD.Reply.TdlibParameters as TdlibParameters

defaultTdlibParameters :: TdlibParameters.TdlibParameters
defaultTdlibParameters =
  TdlibParameters.TdlibParameters
    { TdlibParameters.ignore_file_names = Just True,
      TdlibParameters.enable_storage_optimizer = Just True,
      TdlibParameters.application_version = Just "0.1.0.0",
      TdlibParameters.system_version = Just "Unknown",
      TdlibParameters.device_model = Just "Server",
      TdlibParameters.system_language_code = Just "en",
      TdlibParameters.api_hash = Just "a3406de8d171bb422bb6ddf3bbd800e2",
      TdlibParameters.api_id = Just 94575,
      TdlibParameters.use_secret_chats = Just False,
      TdlibParameters.use_message_database = Just False,
      TdlibParameters.use_chat_info_database = Just False,
      TdlibParameters.use_file_database = Just False,
      TdlibParameters.files_directory = Just "tdlib_files",
      TdlibParameters.database_directory = Just "tdlib_db",
      TdlibParameters.use_test_dc = Just False
    }
