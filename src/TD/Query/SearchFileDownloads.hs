{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchFileDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for files in the file download list or recently downloaded files from the list
data SearchFileDownloads = SearchFileDownloads
  { -- | The maximum number of files to be returned
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Pass true to search only for completed downloads
    only_completed :: Maybe Bool,
    -- | Pass true to search only for active downloads, including paused
    only_active :: Maybe Bool,
    -- | Query to search for; may be empty to return all downloaded files
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchFileDownloads where
  show
    SearchFileDownloads
      { limit = limit,
        offset = offset,
        only_completed = only_completed,
        only_active = only_active,
        query = query
      } =
      "SearchFileDownloads"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "only_completed" only_completed,
            U.p "only_active" only_active,
            U.p "query" query
          ]

instance T.ToJSON SearchFileDownloads where
  toJSON
    SearchFileDownloads
      { limit = limit,
        offset = offset,
        only_completed = only_completed,
        only_active = only_active,
        query = query
      } =
      A.object
        [ "@type" A..= T.String "searchFileDownloads",
          "limit" A..= limit,
          "offset" A..= offset,
          "only_completed" A..= only_completed,
          "only_active" A..= only_active,
          "query" A..= query
        ]
