{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a file; this is an offline request @file_id Identifier of the file to get
data GetFile = GetFile
  { -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetFile where
  show
    GetFile
      { file_id = file_id
      } =
      "GetFile"
        ++ U.cc
          [ U.p "file_id" file_id
          ]

instance T.ToJSON GetFile where
  toJSON
    GetFile
      { file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "getFile",
          "file_id" A..= file_id
        ]
