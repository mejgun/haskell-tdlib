module TD.Query.ImportMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputFile as InputFile

data ImportMessages -- ^ Imports messages exported from another app
  = ImportMessages
    { chat_id        :: Maybe Int                   -- ^ Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
    , message_file   :: Maybe InputFile.InputFile   -- ^ File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
    , attached_files :: Maybe [InputFile.InputFile] -- ^ Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
    }
  deriving (Eq)

instance Show ImportMessages where
  show
    ImportMessages
      { chat_id        = chat_id_
      , message_file   = message_file_
      , attached_files = attached_files_
      }
        = "ImportMessages"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "message_file"   `I.p` message_file_
          , "attached_files" `I.p` attached_files_
          ]

instance AT.ToJSON ImportMessages where
  toJSON
    ImportMessages
      { chat_id        = chat_id_
      , message_file   = message_file_
      , attached_files = attached_files_
      }
        = A.object
          [ "@type"          A..= AT.String "importMessages"
          , "chat_id"        A..= chat_id_
          , "message_file"   A..= message_file_
          , "attached_files" A..= attached_files_
          ]
