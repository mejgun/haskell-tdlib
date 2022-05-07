{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes a file from the TDLib file cache @file_id Identifier of the file to delete
data DeleteFile = DeleteFile
  { -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteFile where
  show
    DeleteFile
      { file_id = file_id
      } =
      "DeleteFile"
        ++ U.cc
          [ U.p "file_id" file_id
          ]

instance T.ToJSON DeleteFile where
  toJSON
    DeleteFile
      { file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "deleteFile",
          "file_id" A..= file_id
        ]
