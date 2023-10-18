module TD.Query.GetRemoteFile
  (GetRemoteFile(..)
  , defaultGetRemoteFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FileType as FileType

-- | Returns information about a file by its remote identifier; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user. For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application. Returns 'TD.Data.File.File'
data GetRemoteFile
  = GetRemoteFile
    { remote_file_id :: Maybe T.Text            -- ^ Remote identifier of the file to get
    , file_type      :: Maybe FileType.FileType -- ^ File type; pass null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow GetRemoteFile where
  shortShow
    GetRemoteFile
      { remote_file_id = remote_file_id_
      , file_type      = file_type_
      }
        = "GetRemoteFile"
          ++ I.cc
          [ "remote_file_id" `I.p` remote_file_id_
          , "file_type"      `I.p` file_type_
          ]

instance AT.ToJSON GetRemoteFile where
  toJSON
    GetRemoteFile
      { remote_file_id = remote_file_id_
      , file_type      = file_type_
      }
        = A.object
          [ "@type"          A..= AT.String "getRemoteFile"
          , "remote_file_id" A..= remote_file_id_
          , "file_type"      A..= file_type_
          ]

defaultGetRemoteFile :: GetRemoteFile
defaultGetRemoteFile =
  GetRemoteFile
    { remote_file_id = Nothing
    , file_type      = Nothing
    }

