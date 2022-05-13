{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveAllFilesFromDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes all files from the file download list
data RemoveAllFilesFromDownloads = RemoveAllFilesFromDownloads
  { -- | Pass true to delete the file from the TDLib file cache
    delete_from_cache :: Maybe Bool,
    -- | Pass true to remove only completed downloads
    only_completed :: Maybe Bool,
    -- | Pass true to remove only active downloads, including paused
    only_active :: Maybe Bool
  }
  deriving (Eq)

instance Show RemoveAllFilesFromDownloads where
  show
    RemoveAllFilesFromDownloads
      { delete_from_cache = delete_from_cache_,
        only_completed = only_completed_,
        only_active = only_active_
      } =
      "RemoveAllFilesFromDownloads"
        ++ U.cc
          [ U.p "delete_from_cache" delete_from_cache_,
            U.p "only_completed" only_completed_,
            U.p "only_active" only_active_
          ]

instance T.ToJSON RemoveAllFilesFromDownloads where
  toJSON
    RemoveAllFilesFromDownloads
      { delete_from_cache = delete_from_cache_,
        only_completed = only_completed_,
        only_active = only_active_
      } =
      A.object
        [ "@type" A..= T.String "removeAllFilesFromDownloads",
          "delete_from_cache" A..= delete_from_cache_,
          "only_completed" A..= only_completed_,
          "only_active" A..= only_active_
        ]
