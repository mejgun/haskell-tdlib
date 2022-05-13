{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRemoteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FileType as FileType
import qualified Utils as U

-- |
-- Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user.
-- For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
data GetRemoteFile = GetRemoteFile
  { -- |
    file_type :: Maybe FileType.FileType,
    -- | Remote identifier of the file to get @file_type File type; pass null if unknown
    remote_file_id :: Maybe String
  }
  deriving (Eq)

instance Show GetRemoteFile where
  show
    GetRemoteFile
      { file_type = file_type_,
        remote_file_id = remote_file_id_
      } =
      "GetRemoteFile"
        ++ U.cc
          [ U.p "file_type" file_type_,
            U.p "remote_file_id" remote_file_id_
          ]

instance T.ToJSON GetRemoteFile where
  toJSON
    GetRemoteFile
      { file_type = file_type_,
        remote_file_id = remote_file_id_
      } =
      A.object
        [ "@type" A..= T.String "getRemoteFile",
          "file_type" A..= file_type_,
          "remote_file_id" A..= remote_file_id_
        ]
