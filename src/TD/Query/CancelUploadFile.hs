{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CancelUploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined @file_id Identifier of the file to stop uploading
data CancelUploadFile = CancelUploadFile
  { -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show CancelUploadFile where
  show
    CancelUploadFile
      { file_id = file_id_
      } =
      "CancelUploadFile"
        ++ U.cc
          [ U.p "file_id" file_id_
          ]

instance T.ToJSON CancelUploadFile where
  toJSON
    CancelUploadFile
      { file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "cancelUploadFile",
          "file_id" A..= file_id_
        ]
