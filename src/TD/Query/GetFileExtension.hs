{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetFileExtension where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously @mime_type The MIME type of the file
data GetFileExtension = GetFileExtension
  { -- |
    mime_type :: Maybe String
  }
  deriving (Eq)

instance Show GetFileExtension where
  show
    GetFileExtension
      { mime_type = mime_type_
      } =
      "GetFileExtension"
        ++ U.cc
          [ U.p "mime_type" mime_type_
          ]

instance T.ToJSON GetFileExtension where
  toJSON
    GetFileExtension
      { mime_type = mime_type_
      } =
      A.object
        [ "@type" A..= T.String "getFileExtension",
          "mime_type" A..= mime_type_
        ]
