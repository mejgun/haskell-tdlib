module TD.Query.DownloadFile
  (DownloadFile(..)
  , defaultDownloadFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates. Returns 'TD.Data.File.File'
data DownloadFile
  = DownloadFile
    { file_id     :: Maybe Int  -- ^ Identifier of the file to download
    , priority    :: Maybe Int  -- ^ Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
    , offset      :: Maybe Int  -- ^ The starting position from which the file needs to be downloaded
    , limit       :: Maybe Int  -- ^ Number of bytes which need to be downloaded starting from the "offset" position before the download will automatically be canceled; use 0 to download without a limit
    , synchronous :: Maybe Bool -- ^ Pass true to return response only after the file download has succeeded, has failed, has been canceled, or a new downloadFile request with different offset/limit parameters was sent; pass false to return file state immediately, just after the download has been started
    }
  deriving (Eq, Show)

instance I.ShortShow DownloadFile where
  shortShow
    DownloadFile
      { file_id     = file_id_
      , priority    = priority_
      , offset      = offset_
      , limit       = limit_
      , synchronous = synchronous_
      }
        = "DownloadFile"
          ++ I.cc
          [ "file_id"     `I.p` file_id_
          , "priority"    `I.p` priority_
          , "offset"      `I.p` offset_
          , "limit"       `I.p` limit_
          , "synchronous" `I.p` synchronous_
          ]

instance AT.ToJSON DownloadFile where
  toJSON
    DownloadFile
      { file_id     = file_id_
      , priority    = priority_
      , offset      = offset_
      , limit       = limit_
      , synchronous = synchronous_
      }
        = A.object
          [ "@type"       A..= AT.String "downloadFile"
          , "file_id"     A..= file_id_
          , "priority"    A..= priority_
          , "offset"      A..= offset_
          , "limit"       A..= limit_
          , "synchronous" A..= synchronous_
          ]

defaultDownloadFile :: DownloadFile
defaultDownloadFile =
  DownloadFile
    { file_id     = Nothing
    , priority    = Nothing
    , offset      = Nothing
    , limit       = Nothing
    , synchronous = Nothing
    }

