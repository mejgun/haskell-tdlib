{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CancelPreliminaryUploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUploadFile. For other files the behavior is undefined @file_id Identifier of the file to stop uploading
data CancelPreliminaryUploadFile = CancelPreliminaryUploadFile
  { -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show CancelPreliminaryUploadFile where
  show
    CancelPreliminaryUploadFile
      { file_id = file_id_
      } =
      "CancelPreliminaryUploadFile"
        ++ U.cc
          [ U.p "file_id" file_id_
          ]

instance T.ToJSON CancelPreliminaryUploadFile where
  toJSON
    CancelPreliminaryUploadFile
      { file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "cancelPreliminaryUploadFile",
          "file_id" A..= file_id_
        ]
