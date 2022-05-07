{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddFileToDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.
-- If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent from download using downloadFile, i.e. it continues if downloadFile is canceled or is used to download a part of the file
data AddFileToDownloads = AddFileToDownloads
  { -- | Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
    priority :: Maybe Int,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Chat identifier of the message with the file
    chat_id :: Maybe Int,
    -- | Identifier of the file to download
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddFileToDownloads where
  show
    AddFileToDownloads
      { priority = priority,
        message_id = message_id,
        chat_id = chat_id,
        file_id = file_id
      } =
      "AddFileToDownloads"
        ++ U.cc
          [ U.p "priority" priority,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id,
            U.p "file_id" file_id
          ]

instance T.ToJSON AddFileToDownloads where
  toJSON
    AddFileToDownloads
      { priority = priority,
        message_id = message_id,
        chat_id = chat_id,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "addFileToDownloads",
          "priority" A..= priority,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id,
          "file_id" A..= file_id
        ]
