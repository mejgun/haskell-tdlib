module TD.Query.AddFileToDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data AddFileToDownloads -- ^ Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates. If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent from download using downloadFile, i.e. it continues if downloadFile is canceled or is used to download a part of the file
  = AddFileToDownloads
    { file_id    :: Maybe Int -- ^ Identifier of the file to download
    , chat_id    :: Maybe Int -- ^ Chat identifier of the message with the file
    , message_id :: Maybe Int -- ^ Message identifier
    , priority   :: Maybe Int -- ^ Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
    }
  deriving (Eq)

instance Show AddFileToDownloads where
  show
    AddFileToDownloads
      { file_id    = file_id_
      , chat_id    = chat_id_
      , message_id = message_id_
      , priority   = priority_
      }
        = "AddFileToDownloads"
          ++ I.cc
          [ "file_id"    `I.p` file_id_
          , "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "priority"   `I.p` priority_
          ]

instance AT.ToJSON AddFileToDownloads where
  toJSON
    AddFileToDownloads
      { file_id    = file_id_
      , chat_id    = chat_id_
      , message_id = message_id_
      , priority   = priority_
      }
        = A.object
          [ "@type"      A..= AT.String "addFileToDownloads"
          , "file_id"    A..= file_id_
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "priority"   A..= priority_
          ]
