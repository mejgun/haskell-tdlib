{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetFileDownloadedPrefixSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns file downloaded prefix size from a given offset, in bytes @file_id Identifier of the file @offset Offset from which downloaded prefix size needs to be calculated
data GetFileDownloadedPrefixSize = GetFileDownloadedPrefixSize
  { -- |
    offset :: Maybe Int,
    -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetFileDownloadedPrefixSize where
  show
    GetFileDownloadedPrefixSize
      { offset = offset,
        file_id = file_id
      } =
      "GetFileDownloadedPrefixSize"
        ++ U.cc
          [ U.p "offset" offset,
            U.p "file_id" file_id
          ]

instance T.ToJSON GetFileDownloadedPrefixSize where
  toJSON
    GetFileDownloadedPrefixSize
      { offset = offset,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "getFileDownloadedPrefixSize",
          "offset" A..= offset,
          "file_id" A..= file_id
        ]
