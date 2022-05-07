{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveFileFromDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a file from the file download list @file_id Identifier of the downloaded file @delete_from_cache Pass true to delete the file from the TDLib file cache
data RemoveFileFromDownloads = RemoveFileFromDownloads
  { -- |
    delete_from_cache :: Maybe Bool,
    -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveFileFromDownloads where
  show
    RemoveFileFromDownloads
      { delete_from_cache = delete_from_cache,
        file_id = file_id
      } =
      "RemoveFileFromDownloads"
        ++ U.cc
          [ U.p "delete_from_cache" delete_from_cache,
            U.p "file_id" file_id
          ]

instance T.ToJSON RemoveFileFromDownloads where
  toJSON
    RemoveFileFromDownloads
      { delete_from_cache = delete_from_cache,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "removeFileFromDownloads",
          "delete_from_cache" A..= delete_from_cache,
          "file_id" A..= file_id
        ]
