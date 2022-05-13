{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ImportMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Imports messages exported from another app
data ImportMessages = ImportMessages
  { -- | Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
    attached_files :: Maybe [InputFile.InputFile],
    -- | File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
    message_file :: Maybe InputFile.InputFile,
    -- | Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ImportMessages where
  show
    ImportMessages
      { attached_files = attached_files_,
        message_file = message_file_,
        chat_id = chat_id_
      } =
      "ImportMessages"
        ++ U.cc
          [ U.p "attached_files" attached_files_,
            U.p "message_file" message_file_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ImportMessages where
  toJSON
    ImportMessages
      { attached_files = attached_files_,
        message_file = message_file_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "importMessages",
          "attached_files" A..= attached_files_,
          "message_file" A..= message_file_,
          "chat_id" A..= chat_id_
        ]
