{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetFileMimeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously @file_name The name of the file or path to the file
data GetFileMimeType = GetFileMimeType
  { -- |
    file_name :: Maybe String
  }
  deriving (Eq)

instance Show GetFileMimeType where
  show
    GetFileMimeType
      { file_name = file_name
      } =
      "GetFileMimeType"
        ++ U.cc
          [ U.p "file_name" file_name
          ]

instance T.ToJSON GetFileMimeType where
  toJSON
    GetFileMimeType
      { file_name = file_name
      } =
      A.object
        [ "@type" A..= T.String "getFileMimeType",
          "file_name" A..= file_name
        ]
