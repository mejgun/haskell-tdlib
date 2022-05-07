{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DownloadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
data DownloadFile = DownloadFile
  { -- | Pass true to return response only after the file download has succeeded, has failed, has been canceled, or a new downloadFile request with different offset/limit parameters was sent; pass false to return file state immediately, just after the download has been started
    synchronous :: Maybe Bool,
    -- | Number of bytes which need to be downloaded starting from the "offset" position before the download will automatically be canceled; use 0 to download without a limit
    limit :: Maybe Int,
    -- | The starting position from which the file needs to be downloaded
    offset :: Maybe Int,
    -- | Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
    priority :: Maybe Int,
    -- | Identifier of the file to download
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show DownloadFile where
  show
    DownloadFile
      { synchronous = synchronous,
        limit = limit,
        offset = offset,
        priority = priority,
        file_id = file_id
      } =
      "DownloadFile"
        ++ U.cc
          [ U.p "synchronous" synchronous,
            U.p "limit" limit,
            U.p "offset" offset,
            U.p "priority" priority,
            U.p "file_id" file_id
          ]

instance T.ToJSON DownloadFile where
  toJSON
    DownloadFile
      { synchronous = synchronous,
        limit = limit,
        offset = offset,
        priority = priority,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "downloadFile",
          "synchronous" A..= synchronous,
          "limit" A..= limit,
          "offset" A..= offset,
          "priority" A..= priority,
          "file_id" A..= file_id
        ]
